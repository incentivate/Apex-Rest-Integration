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
    static void ProductSchedule()
    {
        system.Test.startTest();
        APIMimicTest.CreateAPIData();
        string cronExp = '0 6 * * * ?';
        system.schedule('Update schedule', cronExp, new ProductSchedule());
        integer numberOfJobs = [SELECT count() from crontrigger where cronjobdetail.jobtype = '7'];        
        system.assert(numberOfJobs>=1);
        system.Test.stopTest();
    }
}