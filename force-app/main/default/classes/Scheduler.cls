public with sharing class Scheduler implements Schedulable {

    public void execute(SchedulableContext ct){
        //TODO
        Batch b = new Batch();
        Database.executeBatch(b, 200);
    }
}