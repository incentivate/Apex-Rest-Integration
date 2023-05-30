@isTest
public with sharing class ProductTestClass {
    
    @isTest
    static void TestProductAPI()
    {
        System.Test.startTest();
        APIMimicTest.CreateAPIData();
        ProductModel.InsertProductData(ProductController.GetProductInfoFromApi());
        BeerProduct__c b = [SELECT id FROM BeerProduct__c LIMIT 1 ];
        system.assert(b.id!=null);
        System.Test.stopTest();

    }
}