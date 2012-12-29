//
//  SalesAuthentication.h
//  Sales Resource
//
//  Created by Alex Ninneman on 12/28/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RKNSJSONSerialization.h>
#import "SSKeychain.h"


@interface SalesAuthentication : NSObject
{
    NSString *Email;
    NSString *Password;
}

@property(nonatomic,retain) NSString *Email;
@property(nonatomic,retain) NSString *Password;


+ (id) getPassword;
- (void) storeEmail;
- (void) clearCredentials;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end
