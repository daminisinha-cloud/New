@istest
public class Dupliacte {
    @istest
    public static void dtest(){
         DuplicateRule dR = [select id from DuplicateRule where DeveloperName = 'Standard_Account_Duplicate_Rule' LIMIT 1];
        DuplicateRecordSet dupRS = new DuplicateRecordSet(DuplicateRuleId = dR.id);
        insert dupRS;

        Test.startTest();
        Account acc = new Account(name = 'TestAccount', phone='9898787878');
        Database.DMLOptions insertDML = new Database.DMLOptions(); 
        insertDML.DuplicateRuleHeader.AllowSave = true; 
        Database.SaveResult sr = Database.insert(acc, insertDML);
        DuplicateRecordItem dup = new DuplicateRecordItem(DuplicateRecordSetId = dupRS.id, RecordId=acc.id);
        insert dup;
        Test.stopTest();

    }
}