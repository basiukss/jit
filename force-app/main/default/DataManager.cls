public with sharing class DataManager {
    
    @AuraEnabled
    public static String Clean() {
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        List<Case> cases = new List<Case>();
        accounts = [SELECT Id FROM Account];
        contacts = [SELECT Id FROM Contact];
        cases = [SELECT Id FROM Case];
        System.debug('Must clean'+ 
                ' Accounts:' + accounts.size() +
                ' Contacts:' + contacts.size() + 
                ' Cases:' + cases.size());
        try{                      
            delete cases;
            delete contacts;
            delete accounts;
            return 'Delete'+ 
                ' Accounts:' + accounts.size() +
                ' Contacts:' + contacts.size() + 
                ' Cases:' + cases.size();
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage()); 
            return null;
        }
    }
    @AuraEnabled
    public static String GenerateData(){
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        List<Case> cases = new List<Case>();
        Integer random = rnd(0,10);
        for(Integer i=0; i< random; i++){
            Account acc = new Account(Name = 'Account'+(i+1));
            accounts.add(acc);            
        }        
        try{                      
            insert accounts;
            System.debug('Accounts: ' + accounts.size());
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());            
        }
        
        for(Account acc : accounts){
                for(Integer j=0; j < rnd(0,10); j++){
                Contact cnt = new Contact(AccountId = acc.Id, LastName = 'Contact'+(j+1));
                contacts.add(cnt);
            }            
        }        
        try{                      
            insert contacts;
            System.debug('Contacts: ' + contacts.size());
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());            
        }
        
        for(Contact cnt : contacts){
            for(Integer y=0; y < rnd(0,10); y++){
                Case cs = new Case(ContactId = cnt.Id, Status='Working',Origin='New Contact', Comments = 'Case'+(y+1));
                cases.add(cs);
            }
        }        
        try{                      
            insert cases;
            System.debug('Cases: ' + cases.size());
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());            
        }
        return 'Insert'+ 
                ' Accounts:' + accounts.size() +
                ' Contacts:' + contacts.size() + 
                ' Cases:' + cases.size();
        
    }
    

    public static Integer rnd(Integer min, Integer max){
        max-=min;
        return (Integer) (Math.random()* ++max)+min;
    }
}