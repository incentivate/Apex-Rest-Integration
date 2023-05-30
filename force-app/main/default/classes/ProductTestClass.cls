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

    @isTest
    static void ProdShchedule()
    {
        system.Test.startTest();
        APIMimicTest.CreateAPIData();
        string cronExp = '0 6 * * * ?';
        integer numOfJobs = [SELECT count() from crontrigger where cronjobdetails.jobtype = '7'];
    }
}