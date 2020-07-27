global class SF_slack  {
    
    String errorResponse;
    Map<String,list<opportunity>> opportunityWithOwner = new Map<String,list<opportunity>>();
    
    public class Payload {
        String text;
    }
    
    global static void execute(){
       
            list<Id> oppIds = new List<Id>();
           
            Payload PayloadData = new Payload();
            Integer Count = 0;
            String title = '', text = '```"OPPORTUNITY_Name", "OPPORTUNITY_OwnerID", "ACCOUNT_Name", "OWNER_EMAIL"\n', payload = '';
            for(Opportunity opp : [Select id,Name,OwnerId,Owner.Name,Account.Name,Owner.Email from Opportunity]){
             
                   text += '"'+opp.Name+'", "'+opp.Ownerid+'", "'+opp.Account.Name+'", "'+opp.Owner.Email+'"\n';
                    Count++;
                
            }   
            
            
            if(Count > 0){
                text += '```';
                title += Count +' Opportunity with Payment have been closed lost\n'; 
                payload += title + text;
            }
            if(payload <> ''){
                system.debug(system.JSON.serialize(payload));
                Http h = new Http();
                HttpRequest req = new HttpRequest();
                req.setEndpoint('https://daminitrial.slack.com/client/T01319G012B/D013G1WF1V0');
                req.setMethod('POST');
                req.setHeader('Cache-Control', 'no-cache');
                req.setHeader('Content-Type', 'application/json');
                PayloadData.text = payload;
                string request = system.JSON.serialize(PayloadData);
                system.debug('request'+request);
                req.setBody(request);
                if(!Test.isRunningTest()){
                    HttpResponse res = h.send(req);
                    if (res.getStatusCode() <> 200) {
                        String  errorResponse = res.getBody();
                        system.debug(errorResponse);
                    }
                }
            
        }
    }
    
    
   
}