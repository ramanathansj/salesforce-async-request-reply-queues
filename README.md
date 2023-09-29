# salesforce-async-request-reply-queues
Dreamforce 2023 demo of Async Request Reply Queue based pattern

Installation:

Second generation unlocked package installation link - https://login.salesforce.com/packaging/installPackage.apexp?p0=04t1Q000000wwiVQAQ

or

sf project deploy validate --source-dir force-app 

Salesforce Order integration with AWS DynamoDB

![image](https://github.com/ramanathansj/salesforce-async-request-reply-queues/assets/881993/38a09a2b-1df2-45a7-8379-73dc62bc34d9)



For queues demo,

1. Install this SFDC repo
2. Configure custom metadata settings for AWS gateway and API Key
3. Deploy https://github.com/ramanathansj/salesforce-pub-sub and run node db.js file in src folder to create dynamodb table
4. Deploy SFDC Rest client https://github.com/ramanathansj/dynamodb-sfdc-client


For PubSub demo,

1. Install this SFDC repo
2. Deploy PubSub Repo https://github.com/ramanathansj/salesforce-pub-sub
3. Enter Salesforce, AWS credentials in .env file in src folder
4. Run node db.js file in src folder to create dynamodb table
5. Run node pubsubconnect.js file in src folder to receive Salesforce Pub/Sub events
