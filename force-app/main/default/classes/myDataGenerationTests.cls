@istest
public class myDataGenerationTests {
@testsetup
    static void upload(){
         List<sObject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
    }
    @isTest static void testLoadAccountsFromStaticResource() {
    List<Account> accts = [SELECT ID FROM Account];
    system.assert(accts.size() == 15, 'expected 15 accounts');
    }}