//
//  LoginOperation.h
//  Sales Resource
//
//  Created by Alex Ninneman on 12/22/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import <Foundation/Foundation.h>

// Base class for an object that authenticates user credentials with a server.
@class LoginOperation;

// Delegate that responds to completion of a Login attempt.
@protocol LoginOperationDelegate <NSObject>

// Invoked after a login attempt completes.
- (void)loginOperationCompleted:(LoginOperation *)loginOperation
                     withResult:(BOOL)successfulLogin
                   errorMessage:(NSString *)errorMessage;

@end

// Base class for an operation that asynchronously
// verifies user credentials against a server.
@interface LoginOperation : NSObject {
@protected
    NSString *_username;
    NSString *_password;
    
@private
    NSInvocationOperation *_invocationOperation;
    NSOperationQueue *_operationQueue;
    BOOL _result;
    NSString *_errorMessage;
}

// An object that is informed when an atempt to login completes;
@property (nonatomic, assign) id<LoginOperationDelegate> delegate;

// Returns the username that was successfully authenticated.
@property (nonatomic,copy,readonly) NSString *authenticatedUsername;

// Returns the password that was successfully authenticated.
@property (nonatomic,copy,readonly) NSString *authenticatedPassword;

// Invoke this method to start an asynchonous attempt to login.
- (void)beginAuthenticateUsername:(NSString *)username
                         password:(NSString *)password;

// Derived classes override this method to perform a synchronous/blocking
// call to a server that verifies the supplied user credentials.
// Returns YES if the authentication succeeded, or NO if it failed.
// This method executes on a worker thread.
// Do not call the base implementation.
- (BOOL)authenticateImpl:(NSString **)errorMessage;

// Invoke this method to delete the values stored by authenticatedUsername and authenticatedPassword
- (void)deleteAuthenticatedData;

@end


