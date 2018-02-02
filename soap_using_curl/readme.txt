=============== using curl to invoke SOAP ==========================
1. create request.xml soap envelope
2. Invoke using curl as below
curl --header "Content-Type: text/xml;charset=UTF-8" --header "SOAPAction:urn:retrieveEnrichedDocument" --data @request.xml http://16.150.57.169/nexch/services/ZANTAZ_StoreAndRetrieveService