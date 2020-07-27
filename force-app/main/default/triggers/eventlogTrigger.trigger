trigger eventlogTrigger on Log__e (after insert) {
system.debug(trigger.new[0]);
     for(Log__e l :trigger.new){
    opportunity o =new Opportunity(name=l.num_Line__c+'',stagename='new',closedate=system.today());
    insert o;
     }
}