import ballerina/http;
import ballerina/log;

configurable string backendUrl = "http://localhost:9090/candid";
configurable string headerName = "API-Key";
configurable string headerValue = "test";
final http:Client candidClient = check new (backendUrl, timeout = 5);

service /api on new http:Listener(9091) {
    resource function get hello() returns http:Response|error {
        do {
            http:Response res = check candidClient->/v1/pdf/["test"]({
                headerName: headerValue
            });
            return res;
        } on fail error e {
            log:printError("API ", e);
            return e;
        }
    }
}