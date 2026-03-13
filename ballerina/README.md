## Overview

The MSSQL driver provides a reliable and high-performance connectivity to Microsoft SQL Server databases. It enables efficient execution of SQL queries, updates, and other database operations. The driver is designed to provide a seamless experience for interacting with MSSQL, supporting various data types and advanced features of the database.

### Key Features

- High-performance and reliable database connectivity
- Support for various SQL operations (Query, Execute, Batch)
- Efficient handling of database connections and resources
- Support for database-specific data types and features
- Secure communication with TLS and authentication
- GraalVM compatible for native image builds

## Package overview

This Package bundles the latest MSSQL driver so that the mssql connector can be used in ballerina projects easily.

## Compatibility

| |     Version     |
|:---|:---------------:|
|Ballerina Language |  **2201.8.0**   |
|MSSQL Driver | **10.2.0.jre17** |

## Usage

To add the MSSQL driver dependency the project simply import the module as below,

```ballerina
import ballerina/sql;
import ballerinax/mssql;
import ballerinax/mssql.driver as _;
```

## Report issues

To report bugs, request new features, start new discussions, view project boards, etc., go to the [Ballerina standard library parent repository](https://github.com/ballerina-platform/ballerina-standard-library).


# Useful Links
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
