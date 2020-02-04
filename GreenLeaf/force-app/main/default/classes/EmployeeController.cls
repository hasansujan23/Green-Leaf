public class EmployeeController {
    
    @AuraEnabled
    public static List<Employee__c> getEmployeeList(){
        List<Employee__c> employeeList=new List<Employee__C>([Select Id,Name,FirstName__c,LastName__c,Email__c,Phone__c from Employee__c]);
        return employeeList;
    }
    
    @AuraEnabled
    public static List<Employee__c> getSearchEmployeeList(String lastName){
        String name = '%'+lastName+'%';
        List<Employee__c> employeeList=new List<Employee__C>([Select Id,Name,FirstName__c,LastName__c,Email__c,Phone__c from Employee__c where LastName__c like :name limit 10]);
        return employeeList;
    }
    
    @AuraEnabled
    public static Employee__c createEmployee(Employee__c emp){
        if(emp != null){
        insert emp;
        }    
        return emp;
    }
    
    @AuraEnabled
    public static void getDeleteEmployee(string empId){
        List<Employee__c> employeeList= new List<Employee__c>([Select Id from Employee__c where Id=:empId]);
        if(employeeList != null)
        delete employeeList;
    }
    
    @AuraEnabled
    public static Employee__c getUniqueEmployee(string id){
        Employee__c employeeList=([Select Name,FirstName__c,LastName__c,Email__c,Salary__c,Department__c,Address__c,Phone__C from Employee__c where Id=:id limit 1]);
        return employeeList;
    }
    
    @AuraEnabled
    public static String getUpdateEmployee(Employee__c emp){
        if(emp != null){
        upsert emp;
        return 'Success';
        }
        return 'failed';
    }
}