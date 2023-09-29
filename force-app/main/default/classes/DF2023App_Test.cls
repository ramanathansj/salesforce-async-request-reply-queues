/**
 * @description       : Test class
 * @author            : Ramanathan
 * @group             : 
 * @last modified on  : 09-28-2023
 * @last modified by  : Ramanathan
**/

@isTest
private class DF2023App_Test {
    @testSetup static void setup() {
        Account tempAcc = new Account (Name = 'Test Account 1');
        insert tempAcc;

        Order__c ord1 = new Order__c(Account__c = tempAcc.Id, Channel__c = 'Queue', OrderType__c = 'Sales Order', PaymentTerms__c='10', PaymentType__c = 'Cash', Status__c='Pending');
        Order__c ord2 = new Order__c(Account__c = tempAcc.Id, Channel__c = 'PubSub', OrderType__c = 'Sales Order', PaymentTerms__c='10', PaymentType__c = 'Cash', Status__c='Pending');
        insert new List<Order__c> {ord1, ord2};
    }


    @isTest static void testDynamoDBCallout() {
        Order__c[] orders = [Select Id, Name, Channel__c From Order__c Limit 10];
        System.assert(orders.size() > 0);
        Test.setMock(HttpCalloutMock.class, new DynamoDBMock());
        DynamoPutRequest putreq = new DynamoPutRequest();
        putreq.externalId = orders[0].id;
        putreq.id=orders[0].id;
        putreq.name = orders[0].Name;
        putreq.orderdata = 'sample text json';
        putreq.requestId = orders[0].id;
        putreq.status = 'Pending';
        DynamoPutRequest[] putReqs = new List<DynamoPutRequest> {putreq};
        Test.startTest();
        List<DynamoPutResp> putRes = DynamoService.putItemRequest(putReqs);
        Test.stopTest();
        System.assert(putReqs != null);

    }
}