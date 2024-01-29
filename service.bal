import ballerina/http;
import ballerina/log;
import ballerinax/candid.charitycheckpdf;

final charitycheckpdf:Client charityCheckPdfClient = check new ({subscriptionKey: ""}, serviceUrl = "10.255.255.1");

service /api on new http:Listener(9091) {
    resource function get hello() returns http:Response|error {
        do {
            http:Response res = check charityCheckPdfClient->/v1/pdf/["test"]();
            return res;
        } on fail error e {
            log:printError("API ", e);
            return e;
        }
    }
}

// import ballerina/lang.runtime;

// charitycheckpdf:ApiKeysConfig keyConfig = {};
// final charitycheckpdf:Client charityClient = check new charitycheckpdf:Client(keyConfig, config = {timeout: 20});

// final http:Client charityClient = check new("http://localhost:9091", timeout = 5);

// service / on new http:Listener(9090) {
//     isolated resource function get charitysearch/charitycheckpdf/[string ein]() returns  http:Response| error {
//         // runtime:sleep(30);
//         do {
//             log:printError("Before");
//             http:Response result = check charityClient->/candidResult();
//             log:printError("After");
//             return result;
//         } on fail error err {
//             log:printError(err.message());
//             return err;
//         }
//     }
// }
