@RestResource(urlMapping='/Contact/*')
global with sharing class MyContactManeger {
    @HttpGet
    global static Contact getContact(){
        RestRequest req = RestContext.request;
        String email = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Contact con = [Select Id,FirstName,LastName,Email,Phone From Contact where Id=:email];
        return con;
    }
	/*
	 //Used for all contacts
    global static List<Contact> getAllContact(){
        List<Contact>contacts=new List<Contact>([Select Id,FirstName,LastName,Email,Phone From Contact]);
        return contacts;
    }
	*/
    
    @HttpPost
    global static Id addNewContact(String firstName,String lastName,String email,String phone){
        Contact newContact=new Contact(FirstName=firstName,LastName=lastName,Email=email,Phone=phone);
        insert newContact;
        return newContact.Id;
    }
    @HttpDelete
    global static void deleteContact(){
        RestRequest req = RestContext.request;
        //RestResponse res = RestContext.response;
        String email = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Contact con = [Select Id From Contact where Email=:email];
        delete con;
    }
    
    @HttpPut
    global static void upsertContact(String firstName,String lastName,String email,String phone,String id){
        Contact newContact=new Contact(Id=id,FirstName=firstName,LastName=lastName,Email=email,Phone=phone);
        upsert newContact;
    }
}