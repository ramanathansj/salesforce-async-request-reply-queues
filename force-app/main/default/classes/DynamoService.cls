/**
 * @description       : DyanmoDB PutRequest Callout
 * @author            : Ramanathan
 * @group             : 
 * @last modified on  : 09-28-2023
 * @last modified by  : Ramanathan
**/
global with sharing class DynamoService {
    
    @InvocableMethod(label='Dynamo Put Request' description='Invoke DynamoDB put request' category='DynamoDb')
    global static List<DynamoPutResp> putItemRequest (DynamoPutRequest[] dynamoReq) {
        Map<String, String> settings = DynamoService.getAWSConfig();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();  
        req.setEndpoint(settings.get('endpoint')); //System.URL.getOrgDomainUrl().toExternalForm()+
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader(settings.get('httpheader1'), settings.get('httpheader1value'));
        String body = JSON.serialize(dynamoReq[0]);
        System.debug(LoggingLevel.Debug, 'body === ' +body);
        req.setBody(body);
        req.setTimeout(20000);
        System.debug(LoggingLevel.Debug, 'request === ' +req);
        res = http.send(req);
        System.debug(LoggingLevel.Debug, 'response == '+res.getBody());
        DynamoPutResp dynamoRsp = new DynamoPutResp();
        dynamoRsp.response = res.getBody();
        dynamoRsp.statusCode = res.getStatusCode();
        dynamoRsp.status = res.getBody().length() < 5 ? res.getStatus() : 'FAILED';
        System.debug(LoggingLevel.Debug, 'dynamoRsp == '+dynamoRsp);
        List<DynamoPutResp> dynamoRsps = new List<DynamoPutResp> {dynamoRsp};
        return dynamoRsps;
    }

    private static Map<String, String> getAWSConfig() {
        Map<String, String> params = new Map<String, String>();
        for (DF2023App__mdt setting : [Select Id, DeveloperName, Value__c From  DF2023App__mdt where IsActive__c = TRUE]) {
            params.put(setting.DeveloperName, setting.Value__c);
        }
        return params;
    }
 }