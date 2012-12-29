//
//  UserLoginOperation.m
//  Sales Resource
//
//  Created by Alex Ninneman on 12/27/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//
#import <RestKit/RestKit.h>
#import "LoginOperation.h"
#import "UserLoginOperation.h"


@implementation UserLoginOperation


- (BOOL)authenticateImpl:(NSString **)errorMessage{
    BOOL SERVER_EXISTS = NO;
    
    if(SERVER_EXISTS) {
        
        // URL http://api.curtmfg.com/v3/customer/auth
        // POST DATA
        // ------------------
        // email
        // password
        RKClient *client = [RKClient clientWithBaseURLString:@"http://api.curtmfg.com"];
        RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
        RKLogInfo(@"Configured REstKit client: %@", client);
        
        
        //
        // WARNING: A production authentication service should never pass user credentials as URL query parameters over HTTP!
        //
        NSString *queryFormat = @"http://123.456.7.8:4321/authenticate?username=%@&password=%@";
        NSString *query = [NSString stringWithFormat:queryFormat, self->_username, self->_password];
        
        NSURL *url = [NSURL URLWithString:query];
        NSURLRequest *request = [NSURLRequest requestWithURL:url
                                                 cachePolicy:NSURLRequestReloadIgnoringCacheData
                                             timeoutInterval:30];
        
        NSURLResponse *responseMetadata;
        NSError *error;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&responseMetadata
                                                         error:&error];
        
        BOOL result = NO;
        if (data) {
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
            parser.delegate = self;
            
            // Prepare the objects used to extract an error message returned from the server.
            _errorMessageBuilder = [[NSMutableString alloc] init];
            _buildErrorMessage = NO;
            
            // Read the XML data returned from the authenticate service.
            [parser parse];
            
            // If there is no error message, the login was a success.
            result = [_errorMessageBuilder length] == 0;
            if (!result)
            {
                *errorMessage = [NSString stringWithString:_errorMessageBuilder];
            }
            [_errorMessageBuilder release];
            _errorMessageBuilder = nil;
            
            [parser release];
        } else {
            *errorMessage = [error localizedDescription];
        }
        
        return result;
        
    } else {
        
        // Simulate calling a server and getting a login result;
        sleep(2);
        
        BOOL result = [_username isEqualToString:@"ajn"] && [_password isEqualToString:@"ninneman"];
        if(!result){
            *errorMessage = @"Invalid credentials, try again. For help contact your system administrator.";
        }
        return result;
        
    }
}

@end
