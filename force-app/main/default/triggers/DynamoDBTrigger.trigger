/**
 * @description       : DynamoDB Order Integration Trigger
 * @author            : Ramanathan
 * @group             : 
 * @last modified on  : 09-26-2023
 * @last modified by  : Ramanathan
**/
trigger DynamoDBTrigger on Order__c (after insert, after update) {
    List<OrderEvent__e> orderEvts = new List<OrderEvent__e>();
    List<sObject> allEvts = new List<sObject>();
    List< OutboundQueue__c> obrecords = new List< OutboundQueue__c >();
    for ( Order__c ord : Trigger.new) {
        if(ord.Status__c != null && ord.Channel__c != null && !ord.Status__c.equalsIgnoreCase('completed') && ord.Channel__c.equalsIgnoreCase('PubSub')) {
            OrderEvent__e oEvt = new OrderEvent__e(EventId__c = ord.Id, MetadataType__c = 'Order__c', Payload__c = JSON.serialize(ord));
            orderEvts.add(oEvt);
        }
        if(ord.Status__c != null && ord.Channel__c != null && ord.Status__c.equalsIgnoreCase('Pending') && ord.Channel__c.equalsIgnoreCase('Queue') ){
            OutboundQueue__c ob = new OutboundQueue__c(DataFormat__c = 'JSON', ObjectAPIName__c = 'Order__c', Payload__c = 'order test - '+System.now(), RecordId__c = ord.Id,
            Status__c='Pending', TargetSystem__c='AWS', Channel__c='Orders', ChannelType__c = 'Queue');
            obrecords.add(ob);
        }
    }
    System.debug(LoggingLevel.Debug, 'events == '+JSON.serialize(orderEvts));
    if(orderEvts.size() > 0) {
        List<Database.SaveResult> results = EventBus.publish(orderEvts);
        System.debug(LoggingLevel.Debug, 'results == '+results);
    }
    if (obrecords.size() > 0) insert obrecords;
 
}