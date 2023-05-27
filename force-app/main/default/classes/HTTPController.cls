public with sharing class HTTPController {

    public static httpResponse GetResult(String endpoint)
    {
        try {

            http httpGet = new http();
            httpRequest request = new httpRequest();
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            httpResponse response = httpGet.send(request);

            return response; // return httpGet.send(request)

        } 
        catch (Exception ex) {
            system.System.debug(ex.getMessage());
            return null;
        }
        
        
    }
}