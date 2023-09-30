### Dreamforce 2023 : Fundamentals for Designing Event Driven Integrations

### Installation:

Second generation unlocked package installation link - https://login.salesforce.com/packaging/installPackage.apexp?p0=04t1Q000000wwiVQAQ

or

sf project deploy start --source-dir force-app 

### Salesforce Order integration with AWS DynamoDB

![image](https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/38a09a2b-1df2-45a7-8379-73dc62bc34d9)



# For queues demo,

1. Install this SFDC repo
2. Configure custom metadata settings for AWS gateway and API Key
3. Deploy https://github.com/ramanathansj/salesforce-pub-sub and run node db.js file in src folder to create dynamodb table
4. Deploy SFDC Rest client https://github.com/ramanathansj/dynamodb-sfdc-client

### AWS Gateway Configuration - DyanmoDB Put Request 

![image](https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/aabbb69f-6934-4af8-b536-265af4f67051)

![image](https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/931f442c-cce2-4e47-aead-df32dbb29eac)

<img width="808" alt="Screen Shot 2023-09-28 at 9 10 48 PM" src="https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/c91eabcc-a265-4659-8bfe-159a43ffe0af">

### Mapping Template JSON

{
  "TableName": "ordersv1",
  "Item": {
    "externalId": {
      "S": "$input.path('$.externalId')"
    },
    "name": {
      "S": "$input.path('$.name')"
    },
    "id": {
      "S": "$input.path('$.id')"
    },
    "status": {
      "S": "Completed"
    },
    "orderdata": {
      "S": "$input.path('$.orderdata')"
    },
    "requestId": {
      "S": "$input.path('$.requestId')"
    }
  }
}

### Deploy to stage environment like dev or qa

<img width="1251" alt="image" src="https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/44988c50-bbc3-41ea-a9e6-b928bd54e5b6">

### Setup your API security key and configure in Salesforce metadata for invoking API gateway call

<img width="1280" alt="Screen Shot 2023-09-28 at 9 14 30 PM" src="https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/5e141213-d586-49f7-b0ce-036c5b0ff9e6">

### Salesforce Metadata Setup for gateway, update each one of the below settings

<img width="1071" alt="Screen Shot 2023-09-28 at 9 15 50 PM" src="https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/fac73c06-9126-49ae-a157-d7da5736ead3">


### DynamoDB Table

<img width="1308" alt="Screen Shot 2023-09-28 at 9 16 54 PM" src="https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/d88d6dcf-3cd0-4da4-b815-964eaece9cb4">

### DyanmoDB Trigger

<img width="1053" alt="Screen Shot 2023-09-28 at 9 22 55 PM" src="https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/1f99e699-18be-41cd-ae1d-b5b52fcba44b">

Make sure to deploy sfdc client repo to post event streams back to Salesforce order table, https://github.com/ramanathansj/dynamodb-sfdc-client

# For PubSub demo,

1. Install this SFDC repo
2. Deploy PubSub Repo https://github.com/ramanathansj/salesforce-pub-sub
3. Enter Salesforce, AWS credentials in .env file in src folder
5. Run node db.js file in src folder to create dynamodb table
6. Run node pubsubconnect.js file in src folder to receive Salesforce Pub/Sub events
7.  Deploy SFDC Rest client https://github.com/ramanathansj/dynamodb-sfdc-client





