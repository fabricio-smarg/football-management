public with sharing class PlayerTriggerHandler {
    
    public static void checkClubHasCaptain(List<Player__c> triggerList){
        List<Player__c> lstPlayers = new List<Player__c>();
        lstPlayers = [SELECT Id, Name, Club__c FROM Player__c WHERE Captain__c = TRUE];

        Set<Id> idClubs = new Set<Id>();
        for(Player__c p : lstPlayers){
            idClubs.add(p.Club__c);
        }

        Set<Id> setCaptains = new Set<Id>();
        for(Player__c p : lstPlayers){
            setCaptains.add(p.Id);
        }

        for(Player__c p : triggerList){
            if((idClubs.contains(p.Club__c)) && (p.Captain__c == TRUE) && (!setCaptains.contains(p.Id))){
                p.addError('A club cannot have more than one captain');
            }
        }
    }

    public static void chechClubNumberUsed(List<Player__c> triggerList){
        Map<Id, List<String>> mapNumberByClub = new Map<Id, List<String>>();
        List<Player__c> lstPlayers = new List<Player__c>();
        lstPlayers = [SELECT Id, Number__c, Club__c FROM Player__c];

        for(Player__c p : lstPlayers){
            if(!mapNumberByClub.ContainsKey(p.Club__c)){
                List<String> tempList = new List<String>();
                tempList.add(p.Number__c);
                mapNumberByClub.put(p.Club__c, tempList);
            } else {
                List<String> tempList = mapNumberByClub.get(p.Club__c);
                tempList.add(p.Number__c);
                mapNumberByClub.put(p.Club__c, tempList);
            }
        }

        for(Player__c p : triggerList){
            if(mapNumberByClub.containsKey(p.Club__c)){
                if(mapNumberByClub.get(p.Club__c).contains(p.Number__c)){
                    p.addError('A club cannot have more than one player with this number');
                }
            }
        }
    }
}