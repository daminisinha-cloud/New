public class savecontroller {
     private final opportunity oppObj;

public savecontroller(ApexPages.StandardController stdController) {
        this.oppObj = (opportunity)stdController.getRecord();
    }
     public  PageReference save(){
        oppObj.name = 'test';
         insert oppobj;
        return null;

    }
}