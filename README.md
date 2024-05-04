# About the project

This repository is about developing a business case for a football app in _Salesforce.com_ 

## Dependencies to run the project
```
java-v17.0.10
salesforce/cli/2.37.4 
node-v20.11.1
vscode-v1.89.0
└── Salesforce Extension Pack-v60.11.0 
Salesforce Developer Edition Login (Create here --> https://developer.salesforce.com/signup)
```

## Business case specifications

###  Data template
_Objects with __*__ before the field names indicates that it's required_ 

```
Partners__c                 (object label)            
└── Name                    (Text                   [80])
```

```
Club__c                     (object label)            
├── AvailableMoney__c       (Formula                [Currency])
├── *League__c              (Master-Detail          [League])
├── Name                    (Text                   [80])
├── Partner__c              (LookUp                 [Partner])
├── Payroll__c              (Roll-Up Summary        [SUM Player])
├── Stadium__c              (Text                   [30])
├── TotalPlayers__c         (Roll-Up Summary        [COUNT Player])
└── ValueInSponsorships__c  (Roll-Up Summary        [SUM Sponsorship])
```

```
Sponsorship__c              (object label)            
├── Amount__c               (Currency               [16,2])
├── *Club__c                (Master-Detail          [Club])
├── Name                    (Auto Number)
└── *Partner__c             (Master-Datail          [Partner])
```

```
Player__c                   (object label)            
├── Captain__c              (Checkbox)
├── *Club__c                (Master-Detail          [Club])
├── Name                    (Text                   [80])
├── Nation__c               (Text                   [30])
├── Number__c               (Text                   [2])
└── Salary__c               (Currency               [16,2])
```

```
League__c                   (object label)            
└── Name                    (Text                   [80])
```

```
Round__c                    (object label)            
├── *League__c              (Master-Detail          [League])
└── Name                    (Auto Number)
```

```
Match__c                    (object label)            
├── Host__c                 (Lookup                 [Club])
├── *League__c              (Master-Detail          [League])
├── Name                    (Auto Number)
├── Round__c                (Master-Detail          [Round])
├── Stadium__c              (Formula                [Text])
└── Visitant__c             (Lookup                 [Club])
```

### Business rules
- An app was created with the navigation tabs of all these objects
- The formula for the _Stadium__c_ field of the _Match__c_ object copy the value of the _Stadium__c_ field of the _Club__c_ object
- A club cannot have more than one captain
- A club cannot have more than one player with the same number
- Each class has coverage of 100% unit tests