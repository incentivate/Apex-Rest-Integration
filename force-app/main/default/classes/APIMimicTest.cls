@isTest
public with sharing class APIMimicTest implements HTTPCalloutMock {

        string body;
        string header;

        public HttpResponse respond(HttpRequest req)
        {
            HttpResponse res = new HttpResponse();
            res.setBody(body);
            res.setHeader('Content-Type', header);
            res.setStatusCode(200);
            return res;
        }

        public static void CreateAPIData()
        {
            StaticResourceCalloutMock mockCallout = new StaticResourceCalloutMock();
            mockCallout.setStaticResource('StaticResourceForCallout');
            mockCallout.setStatusCode(200);
            mockCallout.setHeader('Content-Type', 'application/json');
            //HTTPMockTest apiMock = new HTTPMockTest(body, 'application/json');
            system.Test.setMock(HTTPCalloutMock.class, mockCallout);
            
        }

}