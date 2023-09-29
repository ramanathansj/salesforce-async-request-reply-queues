/**
 * @description       : DynamoDB Put Response
 * @author            : Ramanathan
 * @group             : 
 * @last modified on  : 09-28-2023
 * @last modified by  : Ramanathan
**/
global with sharing class DynamoPutResp {
    global DynamoPutResp() {

    }
    @InvocableVariable global String response;
    @InvocableVariable global Integer statusCode;
    @InvocableVariable global String status;
}