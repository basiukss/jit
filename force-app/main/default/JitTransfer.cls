@RestResource(urlMapping='/JitTransfer/*')
global with sharing class JitTransfer {
    
    @HttpGet
    global static String getRecord() {
        RestRequest request = RestContext.request;
        String accId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.Debug('GET: ' + accId);
        //List<Contact> contactList = [SELECT Id, Name FROM Contact WHERE AccountId =:result];
        //SELECT Name, (SELECT Status, Origin, Comments FROM cases), (SELECT Name FROM Contacts) FROM Account
        //List<Account> resList = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id =: accId];
        List<sObject> resList = [SELECT Id, Name, (SELECT Id, Status ,Origin FROM cases),(SELECT Id, Name FROM contacts) FROM account WHERE Id =: accId];
        return JSON.serializePretty(resList);
    }

    @HttpPost
    global static void createRecord(String res){
        System.Debug('POST: ' + res);
    }
}