({
	doInit : function(component, event, helper) {
		var action=component.get('c.getEmployeeList');
        action.setParams({
            
        });
        action.setCallback(this,function(response){
            var responseValue=response.getReturnValue();
            console.log('responseValue',responseValue);
            component.set('v.employeeList',responseValue);
        });
        $A.enqueueAction(action,false);
	},
    handCompEvent : function(component, event, helper) {
        //alert('Ok');
        var availableEmployee=component.get('v.employeeList');
        var newEmployeeRecord=event.getParam('EmployeeRecord');
        availableEmployee.push(newEmployeeRecord);
        component.set('v.employeeList',availableEmployee);
    },
    deleteEmployee : function(component, event, helper) {
        var eventSource=event.getSource();
        var empName=eventSource.get('v.name');
        //alert(empName);
        var action=component.get('c.getDeleteEmployee');
        action.setParams({
            empId : empName
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            var loadData=component.get('c.doInit');
            $A.enqueueAction(loadData);
        });
        $A.enqueueAction(action,false);
    },
    showEmployeeDetails : function(component, event, helper) {
        var modal = document.getElementById("MyModal");
        var eventSource=event.getSource();
        var empId=eventSource.get('v.name');
        //alert(empId);
        var action=component.get('c.getUniqueEmployee');
        action.setParams({
            id : empId
        });
        action.setCallback(this,function(response){
            var responseValue=response.getReturnValue();
            //console.log('uEmp',responseValue);
            component.set("v.uniqueEmployee",responseValue);
        });
        $A.enqueueAction(action,false);
        modal.style.display = "block";
    },
    closeModal : function(component, event, helper) {
        var modal = document.getElementById("MyModal");
         modal.style.display = "none";
    },
    updateEmployee : function(component, event, helper) {
        var modal = document.getElementById("MyModal");
        
		var action=component.get('c.getUpdateEmployee');
       
        action.setParams({
            emp : component.get('v.uniqueEmployee')
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            
            if(state==='SUCCESS' || state==="DRAFT"){
                var responseValue=response.getReturnValue();
                //alert(responseValue);
                var loadData=component.get('c.doInit');
            	$A.enqueueAction(loadData);
                modal.style.display = "none";
            }
            else if(state==='INCOMPLETE'){
                
            }
                else if(state==='ERROR'){
                    var error=response.getError();
                    console.log('Error',error);
                }
        },'ALL');
            $A.enqueueAction(action);
    }
})