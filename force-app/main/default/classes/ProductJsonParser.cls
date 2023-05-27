
public with sharing class ProductJsonParser {

    public static map<Integer, map<string, string>> GetParsedJsonResult(JsonParser parser)
    {
        map<Integer, map<string, string>> prodList = new map<Integer, map<string,string>>();
        //This map holds {Type:Lager, Quantity: 10}
        map<string,string> individualValue = new map<string,string>();
        string key;
        boolean keyAdd = false;
        boolean rootKeyAdd = false; // the root key is the id in the json

        try
        {
            while(parser.nextToken() != null){
                keyAdd = false;
                rootKeyAdd = false;

                key = parser.getText();
                
                if(key==ProductConstants.PRODUCTNAME||key==ProductConstants.QUANTITYSTR||key==ProductConstants.TYPESTR)
                {
                    keyAdd = true;
                }
                else if(key==ProductConstants.IDSTR)
                {
                    rootKeyAdd = true;
                }

                parser.nextToken();

                if(keyAdd)
                {
                    individualValue.put(key, parser.getText());
                }
                if(rootKeyAdd)
                {
                    prodList.put(parser.getIntegerValue(), individualValue);
                    // If is  has an external id, reset the map and list for the next iteration
                    individualValue = new map<string,string>();
                }
            }
            system.debug('prodList... ' + prodList);
            return prodList;
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage());
            return prodList;
        }
    } // end GetParsedJsonResult()

}

/**
 * Parsed Json
 * 
 * {
  "current_page" : 1,
"data": [
  {
    "ProductName": "Porter1",
    "Quantity": 10,
    "Type": "Porter",
    "id": 1,
    "createdAt": "2021-04-04T23:20:25.000000Z",
    "updatedAt": "2021-04-04T23:21:25.000000Z"
  },
  {
    "ProductName": "Lager1",
    "Quantity": 1,
    "Type": "Lager",
    "id": 2,
    "createdAt": "2021-05-04T23:20:25.000000Z",
    "updatedAt": "2021-05-04T23:21:25.000000Z"
  },
  {
    "ProductName": "Stout1",
    "Quantity": 32,
    "Type": "Stout",
    "id": 3,
    "createdAt": "2021-03-04T23:20:25.000000Z",
    "updatedAt": "2021-03-04T23:21:25.000000Z"
  },
  {
    "Product Name": "Stout2",
    "Quantity": 44,
    "Type": "Stout",
    "id": 4,
    "createdAt": "2021-02-04T23:20:25.000000Z",
    "updatedAt": "2021-02-04T23:21:25.000000Z"
  },
  {
    "ProductName": "Lager2",
    "Quantity": 12,
    "Type": "Lager",
    "id": 5,
    "createdAt": "2021-01-04T23:20:25.000000Z",
    "updatedAt": "2021-01-04T23:21:25.000000Z"
  }
],
"from": 1

}
 * 
 */