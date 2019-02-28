@RestResource(urlMapping='/JitTransfer/*')
global with sharing class JitTransfer {
    
    @HttpGet
    global static String getRecord() {
        RestRequest request = RestContext.request;
        String result = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.Debug('GET: ' + result);
        return 'Jitterbit';
    }

    @HttpPost
    global static void createRecord(String res){
        System.Debug('POST: ' + res);
    }
}