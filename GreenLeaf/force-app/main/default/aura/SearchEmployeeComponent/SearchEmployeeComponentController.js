({
	searchEmployee : function(component, event, helper) {
		var text=component.get('v.searchText');
        //alert(text);
        var action=component.get('c.getSearchEmployeeList');
        action.setParams({
            lastName:text
        });
        action.setCallback(this,function(response){
            var responseValue=response.getReturnValue();
            console.log('searchEmployee ',responseValue);
            component.set('v.sEmployee',responseValue);
        });
        $A.enqueueAction(action,false);
	}
})