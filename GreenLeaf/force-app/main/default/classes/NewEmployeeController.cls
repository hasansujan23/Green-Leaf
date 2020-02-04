public class NewEmployeeController {
    Employee__c employee = new Employee__c();
    public String id{get;set;}
        public list<Employee__c> listEmployee{ get; set; }
    public List<Employee__c> allEmployees{get;set;}
    public Employee__c aEmployee= new Employee__c();
    
    public void getAll(){
        String query='Select Id,Name,FirstName__c,LastName__c,Email__c,Phone__c from Employee__c';
        allEmployees=Database.query(query);
    }
    
    public PageReference deleteEmployee(){
        employee=[Select Id from Employee__c where Id=:id];
        delete employee;
        return Page.index;
    }
    
    public void editEmployee(){
        //String query='Select Id,Name,FirstName__c,LastName__c,Email__c,Phone__c from Employee__c where Id=:id';
        //aEmployees=Database.query(query);
        //id='gfhf';
    }

        public NewEmployeeController() {
                listEmployee=new list<Employee__c>();
                listEmployee.add(employee);
            
        }

        Public void addEmployee() {
                Employee__c emp = new Employee__c();
                listEmployee.add(emp);
        }
        public PageReference saveEmployee() {
                for(Integer i=0; i<listEmployee.size(); i++) {
                        insert listEmployee[i];
                }
                return Page.index;  // I am returning another vf page here.
        }
}