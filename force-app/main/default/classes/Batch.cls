public class Batch implements Database.Batchable<sObject>{
    public List<Club__c> start(Database.BatchableContext ct) {
		return [SELECT Name, Stadium__c, League__c FROM Club__c];
    }
    
    public void execute(Database.BatchableContext ct, List<Club__c> lstClubs) {
        // TODO
    }

    public void finish(Database.BatchableContext ct) {
        // TODO
        System.debug('O Scheduler/Batch foi executado.');
    }
}