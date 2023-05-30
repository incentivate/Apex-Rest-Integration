global with sharing class ProductBatch implements Database.Batchable<map<Integer, map<string, string>>>, Database.AllowsCallouts{
    
    private list<map<Integer, map<string, string>>> prodList = new list<map<Integer, map<string, string>>>();

    global iterable<map<Integer, map<string, string>>> start(database.BatchableContext bc)
    {
        prodList.add(ProductController.GetProductInfoFromApi());
        return (iterable<map<Integer, map<string, string>>>) prodList;
    }

    //second param has to be a list
    global void execute(database.BatchableContext bc, list<map<Integer, map<string, string>>> lst)
    {
        if(lst.size()>0)
        {
            ProductModel.InsertProductData(lst[0]);
        }
    }

    global void finish(database.BatchableContext bc)
    {
        system.debug('batch finished');
    }

}