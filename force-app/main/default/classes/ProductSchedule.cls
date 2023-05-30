global with sharing class ProductSchedule implements schedulable
{
    global void execute(SchedulableContext sc)
    {
        ProductBatch p = new ProductBatch();
        database.executeBatch(p, 10);
    }

}