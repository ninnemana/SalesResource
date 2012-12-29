//
//  UserLoginOperation.h
//  Sales Resource
//
//  Created by Alex Ninneman on 12/27/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginOperation;

@interface UserLoginOperation : LoginOperation{
    BOOL _buildErrorMessage;
    NSMutableString *_errorMessageBuilder;
}

@end
