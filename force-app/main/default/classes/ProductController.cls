public with sharing class ProductController {

    public static map<Integer, map<string, string>> GetProductInfoFromApi(){

        httpResponse response = HTTPController.GetResult('callout:ExternalProductAPI/Product');
        
        if(response.getStatusCode() == ProductConstants.PASSSTATUS)
        {
            return ProductJsonParser.GetParsedJsonResult(Json.createParser(response.getBody() )); 
        }
        
        else return null;

    }
}