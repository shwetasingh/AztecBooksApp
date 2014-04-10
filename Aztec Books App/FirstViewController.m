//
//  FirstViewController.m
//  Aztec Books App
//
//  Created by Shweta Singh on 1/20/14.
//  Copyright (c) 2014 Aztec Shops. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *sSOAPMessage = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soap:Body>"
    "<HelloWorld xmlns=\"http://tempuri.org/\">"
    "<token>dc5ab3e0-123c-463a-bd94-c6f0e0d59370</token>"
    "</HelloWorld>"
    "</soap:Body>"
    "</soap:Envelope>";
    
    NSURL *sRequestURL = [NSURL URLWithString:@"http://130.191.78.31/Service1.asmx"];
    NSMutableURLRequest *myRequest = [NSMutableURLRequest requestWithURL:sRequestURL];
    NSString *sMessageLength = [NSString stringWithFormat:@"%d", [sSOAPMessage length]];
    
    [myRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [myRequest addValue: @"http://tempuri.org/HelloWorld" forHTTPHeaderField:@"SOAPAction"];
    [myRequest addValue: sMessageLength forHTTPHeaderField:@"Content-Length"];
    [myRequest setHTTPMethod:@"POST"];
    [myRequest setHTTPBody: [sSOAPMessage dataUsingEncoding:NSUTF8StringEncoding]];

    NSLog(@"%@", myRequest);

    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:myRequest delegate:self];
    
    if( theConnection ) {
        self.webResponseData = [NSMutableData data];
    }else {
        NSLog(@"Some error occurred in Connection");
        
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//    AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
//    if (!delegate.login) {  // BOOL value to know if user is logged in or not.If user succefully logged in set value of this as YES else NO.
//        LoginViewController * lvc = [storyBoard instantiateViewControllerWithIdentifier:@"loginViewController"];
//        
//        [self presentViewController:lvc animated:YES completion:NULL];
//        
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.webResponseData  setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.webResponseData  appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Some error in your Connection. Please try again.");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Received Bytes from server: %d", [self.webResponseData length]);
    NSString *myXMLResponse = [[NSString alloc] initWithBytes: [self.webResponseData bytes] length:[self.webResponseData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",myXMLResponse);
}
@end
