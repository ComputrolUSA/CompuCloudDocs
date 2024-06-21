
# CompuCloud Block Diagram - Main Overview

```mermaid
block-beta 
    columns 5

space:2 
    CompuCloudAPI
space:2 
    
    TagMonitor["Continuously poll PLC tags"]
space
    CCUpdateDB["CompuCloud API - Update database with tags"]
space
    DB[" Update tag tables"]

space:5 

    RequestTagValue["Request Tag Value"]
space
    CC_GetTag["CompuCloud API - Update database with tags"]
space 
    DBGetTag[" Retrieve tag value from database"]
    
    TagMonitor -- "List&lt;UpdateTags&gt;" --> CCUpdateDB 
    CCUpdateDB -- "sql update request" --> DB 


```

## Explanation of main code block functions

```mermaid
flowchart LR
    TagMonitor["<b>Tag Monitor</b>
    <br>This is a C# DotNet Worker Service.
    "]

    CompuCloudAPI["<b>CompuCloud API</b>
    <br>This is a C# Web API.
    "]

```
