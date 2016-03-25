public class DynamicViewStateCmpController {
    public Account record{get;set;}
    public String viewState{get;set;}
    
    public ApexPages.Component getDynamicComponent() {
        

        Component.Apex.PageBlockSection result = new Component.Apex.PageBlockSection();
        result.columns = 1;
        result.title = 'Dynamic component';
		List<ApexPages.Component> sectionItems = new List<ApexPages.Component>();
        
        Component.Apex.InputField input = new Component.Apex.InputField();
        input.expressions.value = '{!record.Name}';
		result.childComponents.add(input);
		
        input = new Component.Apex.InputField();
        input.expressions.value = '{!record.Website}';
		result.childComponents.add(input);
        
        return result;
    }
}