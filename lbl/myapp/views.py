from rest_framework.views import APIView
from rest_framework.response import Response

from decouple import config
import requests
import xml.etree.ElementTree as ET

class BusLocationView(APIView):
  def get(self, request):

    API_Key = config('API_KEY')

    # Data required to extract locations from a single route
    datafeedID = '699'
    operatorRef = 'FBRI'
    lineRef = '1'
    originRef = '0100BRA10453'

    query_params = f'operatorRef={operatorRef}&lineRef={lineRef}&originRef={originRef}'

    BODSurl = f'https://data.bus-data.dft.gov.uk/api/v1/datafeed/{datafeedID}/?{query_params}&api_key={API_Key}'

    try:
      r = requests.get(BODSurl)
      locationList = self.extractLocations(r.text)
      return Response(locationList)
    except requests.RequestException as e:
      print(e)

  # Function to extract latitude and longitude of each bus from xml format
  def extractLocations(self, data):
    root = ET.fromstring(data)
    namespace = {'':'http://www.siri.org.uk/siri'}
    locationList = []

    for activity in root.findall('.//VehicleActivity', namespace):
      vehicle_location = activity.find('.//VehicleLocation', namespace)
      if vehicle_location is not None:
        longitude = vehicle_location.find('Longitude', namespace)
        latitude = vehicle_location.find('Latitude', namespace)
        if longitude is not None and latitude is not None:
          locationList.append({
            float(longitude.text),
            float(latitude.text),
          })
    return locationList
