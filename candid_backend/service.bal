import ballerina/http;
import ballerina/lang.runtime;
import ballerina/log;
service /candid on new http:Listener(9090) {
    resource function get v1/pdf/[string ein](http:Request req) returns string|http:InternalServerError|error? {
        runtime:sleep(10);
        log:printInfo("CANDID " + ein);
        return http:INTERNAL_SERVER_ERROR;
    }
}