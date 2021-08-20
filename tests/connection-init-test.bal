// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.

// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/sql;
import ballerinax/java.jdbc;
import ballerina/test;

string url = "jdbc:sqlserver://localhost:1433;";
string user = "sa";
string password = "Test123#";

@test:Config {
    groups: ["connection", "connection-init"]
}
function testWithURLParams() returns error? {
    jdbc:Client dbClient = check new (url, user, password);
    sql:Error? closeResult = dbClient.close();
    test:assertExactEquals(closeResult, (), "Initialising connection with params fails.");
}

@test:Config {
    groups: ["connection", "connection-init"]
}
function testWithConnectionPool() returns error? {
    sql:ConnectionPool connectionPool = {
        maxOpenConnections: 25,
        maxConnectionLifeTime : 15,
        minIdleConnections : 15
    };
    jdbc:Client dbClient = check new (url = url, user = user, password = password, connectionPool = connectionPool);
    sql:Error? closeResult = dbClient.close();
    test:assertExactEquals(closeResult, (), "Initialising connection with option max connection pool fails.");
    test:assertEquals(connectionPool.maxOpenConnections, 25, "Configured max connection config is wrong.");
    test:assertEquals(connectionPool.maxConnectionLifeTime, <decimal>15, "Configured max connection life time second is wrong.");
    test:assertEquals(connectionPool.minIdleConnections, 15, "Configured min idle connection is wrong.");
}

@test:Config {
    groups: ["connection", "connection-init"]
}
function testWithClosedClient1() returns error? {
    jdbc:Client dbClient = check new (url = url, user = user, password = password);
    sql:Error? closeResult = dbClient.close();
    test:assertExactEquals(closeResult, (), "Initialising connection with connection params fails.");
    sql:ExecutionResult|sql:Error result = dbClient->execute(`CREATE TABLE test (id int)`);
    if (result is sql:Error) {
        string expectedErrorMessage = "SQL Client is already closed, hence further operations are not allowed";
        test:assertTrue(result.message().startsWith(expectedErrorMessage),
            "Error message does not match, actual :\n'" + result.message() + "'\nExpected : \n" + expectedErrorMessage);
    } else {
        test:assertFail("Error expected");
    }
}

