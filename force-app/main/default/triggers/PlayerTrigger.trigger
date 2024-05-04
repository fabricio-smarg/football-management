trigger PlayerTrigger on Player__c (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            PlayerTriggerHandler.checkClubHasCaptain(Trigger.new);
            PlayerTriggerHandler.chechClubNumberUsed(Trigger.new);
        }
        if(Trigger.isUpdate){
            PlayerTriggerHandler.checkClubHasCaptain(Trigger.new);
            PlayerTriggerHandler.chechClubNumberUsed(Trigger.new);
        }
    }
}