/**
 * @description       : DyanmoDB Mock Test
 * @author            : Ramanathan
 * @group             : 
 * @last modified on  : 09-27-2023
 * @last modified by  : Ramanathan
**/
@isTest
global class DynamoDBMock implements HttpCalloutMock{
    
    global HTTPResponse respond(HTTPRequest req) {
        System.assert(req.getEndpoint() !=null);
        System.assertEquals('POST', req.getMethod());
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{}');
        res.setStatusCode(200);
        res.setStatus('OK');
        return res;
    }
}