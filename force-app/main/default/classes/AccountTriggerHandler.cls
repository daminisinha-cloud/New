public class AccountTriggerHandler {
    public static list<account> CreateAccounts(list<account> acc_list){
        list<account> account_list= new list<account>();
         list<contact> contact_list= new list<contact>();
        for(account acc :acc_list){
      
           if(acc.ShippingState != acc.BillingState)
              account_list.add(acc); 
           
             system.debug(acc.BillingState + 'shipping' +acc.ShippingState);
        } insert contact_list;
       
        return account_list;
        
    }
}