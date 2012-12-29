//
//  SalesAuthentication.m
//  Sales Resource
//
//  Created by Alex Ninneman on 12/28/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import "SalesAuthentication.h"
#import <Security/Security.h>
#import "SSKeychain.h"

@implementation SalesAuthentication

@synthesize Email, Password;

- (void) dealloc{
    [super dealloc];
}

+ (id) getPassword{
    
    NSArray *accounts = [SSKeychain accountsForService:@"Sales"];
    for(int i = 0; i < [accounts count]; i++){
        return [SSKeychain passwordForService:@"Sales" account:[accounts objectAtIndex:i]];
    }
    return nil;
}

- (void) storeEmail{
    [SSKeychain setPassword:Password forService:@"Sales" account:Email];
}

- (void) clearCredentials{
    [SSKeychain deletePasswordForService:@"Sales" account:Email];
}


+ (id) objectWithDictionary:(NSDictionary*)dictionary{
    id obj = [[[SalesAuthentication alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary{
    self=[super init];
    if(self){
        Email = [dictionary objectForKey:@"Email"];
        Password = [dictionary objectForKey:@"Password"];
    }
    return self;
}


@end
