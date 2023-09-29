/**
 * @description       : DynamoDB PutRequest Wrapper
 * @author            : Ramanathan
 * @group             : 
 * @last modified on  : 09-28-2023
 * @last modified by  : Ramanathan
**/
global with sharing class DynamoPutRequest {
    @InvocableVariable global String externalId;
    @InvocableVariable global String name;
    @InvocableVariable global String id;
    @InvocableVariable global String status;
    @InvocableVariable global String orderdata;
    @InvocableVariable global Id requestId;
}