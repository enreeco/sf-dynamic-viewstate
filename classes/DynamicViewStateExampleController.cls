public class DynamicViewStateExampleController {
    public Account record{get;set;}
    public DynamicViewStateExampleController(ApexPages.StandardController controller){
        controller.addFields(new List<String>{'Name','Website', 'BillingCity'});
        this.record = (Account)controller.getRecord();
    }
    
    public PageReference saveRecord(){
        try{
            upsert this.record;
            return (new ApexPages.StandardController(this.record)).view();
        }catch(Exception ex){
            ApexPages.addMessages(ex);
        }
        return null;
    }
}