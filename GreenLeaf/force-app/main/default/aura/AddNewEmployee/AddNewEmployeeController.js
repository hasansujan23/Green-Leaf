({
	doSave : function(component, event, helper) {
		var action=component.get('c.createEmployee');
        action.setParams({
            emp : component.get('v.CreateEmployee')
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            //alert(state);
            if(state==='SUCCESS' || state==="DRAFT"){
                var responseValue=response.getReturnValue();
                var applicationEvent = $A.get("e.c:AddNewEmployeeEvent");
                applicationEvent.setParams({"EmployeeRecord" : responseValue});
                applicationEvent.fire();
                
                var loadData=component.get('c.clearField');
          		$A.enqueueAction(loadData);
            }
            else if(state==='INCOMPLETE'){
                
            }
                else if(state==='ERROR'){
                    
                }
        },'ALL');
            $A.enqueueAction(action);
	},
    clearField : function(component, event, helper) {
        /*component.set('v.CreateEmployee.FirstName__c','');
        component.set('v.CreateEmployee.LastName__c','');
        component.set('v.CreateEmployee.Email__c','');
        component.set('v.CreateEmployee.Salary__c','');
        component.set('v.CreateEmployee.Department__c','');
        component.set('v.CreateEmployee.Address__c','');
        component.set('v.CreateEmployee.Phone__c','');
        */
        var obj={sobjectName:'Employee__c',
                 FirstName__c:'',
                 LastName__c:'',
                 Email__c:'',
                 Salary__c:'',
                 Department__c:'',
                 Address__c:'',
                 Phone__c:''};
        component.set('v.CreateEmployee',obj);
        
    }
})