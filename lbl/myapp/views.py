from rest_framework.views import APIView
from rest_framework.response import Response

from decouple import config
import requests
import xml.etree.ElementTree as ET

class BusLocationView(APIView):
  def get(self, request):
    
    API_Key = config('API_KEY')
    datafeedID = '699'

    operatorRef = 'FBRI'
    lineRef = '1'
    originRef = '0100BRA10453'
    query_params = 'operatorRef={operatorRef}&lineRef={lineRef}&originRef={originRef}'

    BODSurl = f'https://data.bus-data.dft.gov.uk/api/v1/datafeed/{datafeedID}/?{query_params}&api_key={API_Key}'

    r = requests.get(BODSurl)
    locationList = self.extractLocations(r.text)
    return Response({'body':locationList})
  
  def extractLocations(self, data):
    root = ET.fromstring(data)
    locationList = []
    for location in root.findall('VehicleLocation'):
      latitude = location.find('Latitude')
      longitude = location.find('Longitude')
      locationList.append({latitude, longitude})
    return locationList