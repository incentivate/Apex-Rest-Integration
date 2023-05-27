public with sharing class QuerySelector {

    public static list<sObject> GetRecord(string sql)
    {
        return database.query(sql);
    }

    public static void InsertRecords(list<sObject> insertList, boolean partialUpdate)
    {
        List<database.SaveResult> saveResults = Database.Insert(insertList, false);

        for(database.SaveResult s : saveResults){
            if(s.isSuccess())
            {
                system.debug('success');
            }
            else
            {
                for(database.Error e : s.getErrors())
                {
                    system.debug(e.getMessage());
                }
            }
        }
        
    }
}