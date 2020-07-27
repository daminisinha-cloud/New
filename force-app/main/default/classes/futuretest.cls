public class futuretest {
    
    public static void callanotherFuture(){
        list<account> al = new list<account>();
        try{
            for(Integer i=0;i<200;i++){
                
                account a = new account(name=i+'test');
                al.add(a);
                //insert a;
            }
            opportunity o =new Opportunity(name='test ',closedate=system.today());
            insert o;
        }
        catch(exception e){
            system.debug(e.getMessage());
            //Log.debug('meassage',al,a.id);
            Log__e l=new Log__e();
            l.num_Line__c=18;
            EventBus.publish(l);    
        }
    }
}