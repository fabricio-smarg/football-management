@isTest
public with sharing class PlayerTriggerTest {

    @TestSetup
    static void makeData(){
        League__c l1 = new League__c ();
        l1.Name = 'Ligue 1';
        insert l1;

        Club__c testClub = new Club__c ();
        testClub.Name = 'PSG';
        testClub.League__c = l1.Id;
        insert testClub;

        Player__c testPlayer = new Player__C ();
        testPlayer.Name = 'Lino';
        testPlayer.Club__c = testClub.Id;
        testPlayer.Captain__c = true;
        testPlayer.Number__c = '10';
        insert testPlayer;
    }

    @isTest
    static void insertNoCaptainPlayer(){
        Club__c testClub = [SELECT Id, Name FROM Club__c LIMIT 1];

        Player__c p = new Player__c ();
        p.Name = 'Rice';
        p.Club__c = testClub.Id;
        p.Captain__c = false;

        Test.startTest();
        Database.SaveResult sr = Database.insert(p, false);
        Test.stopTest();

        System.assertEquals(true, sr.isSuccess(), 'Não deveria ter bloqueado a criação!');
    }

    @isTest
    static void insertCaptainPlayer(){
        Club__c testClub = [SELECT Id, Name FROM Club__c LIMIT 1];

        Player__c p = new Player__c ();
        p.Name = 'Rice';
        p.Club__c = testClub.Id;
        p.Captain__c = true;

        Test.startTest();
        Database.SaveResult sr = Database.insert(p, false);
        Test.stopTest();

        System.assertEquals(false, sr.isSuccess(), 'Deveria ter bloqueado a criação!');
    }

    @isTest
    static void updateCaptainPlayer(){
        Club__c testClub = [SELECT Id, Name FROM Club__c LIMIT 1];

        Player__c p = new Player__c ();
        p.Name = 'Rice';
        p.Club__c = testClub.Id;
        p.Captain__c = false;
        insert p;

        Test.startTest();
        p.Captain__c = true;
        Database.SaveResult sr = Database.update(p, false);
        Test.stopTest();

        System.assertEquals(false, sr.isSuccess(), 'Deveria ter bloqueado a atualização!');
    }

    @isTest
    static void insertPlayerNoDuplicateNumber(){
        Club__c testClub = [SELECT Id, Name FROM Club__c LIMIT 1];

        Player__c p = new Player__c ();
        p.Name = 'Rice';
        p.Club__c = testClub.Id;
        p.Captain__c = false;
        p.Number__c = '99';

        Test.startTest();
        Database.SaveResult sr = Database.insert(p, false);
        Test.stopTest();

        System.assertEquals(true, sr.isSuccess(), 'Não deveria ter bloqueado a criação!');
    }
    
    @isTest
    static void insertPlayerDuplicateNumber(){
        Club__c testClub = [SELECT Id, Name FROM Club__c LIMIT 1];

        Player__c p = new Player__c ();
        p.Name = 'Rice';
        p.Club__c = testClub.Id;
        p.Captain__c = false;
        p.Number__c = '10';

        Test.startTest();
        Database.SaveResult sr = Database.insert(p, false);
        Test.stopTest();

        System.assertEquals(false, sr.isSuccess(), 'Deveria ter bloqueado a criação!');
    }

    @isTest
    static void updatePlayerDuplicateNumber(){
        Club__c testClub = [SELECT Id, Name FROM Club__c LIMIT 1];

        Player__c p = new Player__c ();
        p.Name = 'Rice';
        p.Club__c = testClub.Id;
        p.Captain__c = false;
        p.Number__c = '98';
        insert p;

        Test.startTest();
        p.Number__c = '10';
        Database.SaveResult sr = Database.update(p, false);
        Test.stopTest();

        System.assertEquals(false, sr.isSuccess(), 'Deveria ter bloqueado a atualização!');
    }
}