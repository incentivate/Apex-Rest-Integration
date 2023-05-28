public with sharing class ProductModel {

    public static void InsertProductData(map<integer, map<string, string>> prodDataset){
        
        map<string, id> prodInfo = GetProductInfo();
        list<BeerProduct__c> prodList = new list<BeerProduct__c>();

        try{
            for(Integer i : prodDataset.keySet())
            {
                if(prodInfo.containskey(string.valueOf(i)))
                continue;

                map<string, string> prodKeySet = prodDataset.get(i);
                BeerProduct__c b1 = new BeerProduct__c();

                if(prodKeySet.containskey(ProductConstants.PRODUCTNAME)){
                    b1.Description__c = prodKeySet.get(ProductConstants.PRODUCTNAME);
                }
                if(prodKeySet.containskey(ProductConstants.QUANTITYSTR)){
                    b1.Quantity__c = Decimal.valueOf(prodKeySet.get(ProductConstants.QUANTITYSTR));
                }
                if(prodKeySet.containskey(ProductConstants.TYPESTR)){
                    b1.Type__c = prodKeySet.get(ProductConstants.TYPESTR);
                }

                b1.ProdId__c = String.valueOf(i);
                prodList.add(b1);
            }

            QuerySelector.InsertRecords(prodList, false);
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage());
        }
    }

    private static map<string, id> GetProductInfo()
    {
        map<string, id> prodKeySet = new map<string, id>();
        list<BeerProduct__c> prodList = QuerySelector.GetRecord(ProductConstants.PRODGETSQL);

        try
        {
            for(BeerProduct__c b : prodList)
            {
                prodKeySet.put(b.ProdId__c, b.Id);
            }

            return prodKeySet;
        }
        catch(Exception ex)
        {
            system.debug(ex.getMessage());
            return prodKeySet;
        }
    }
    


}