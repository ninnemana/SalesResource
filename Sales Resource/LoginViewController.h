//
//  LoginViewController.h
//  Sales Resource
//
//  Created by Alex Ninneman on 12/22/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginOperation.h"

@class LoginViewController;

// Describes an object that is notified when the user credentials have been authenticated.
@protocol LoginViewControllerDelegate <NSObject>

// Invoke when the user credentials have been successfully authenticated.
// Check the LoginViewController's LoginOperation to get the authenticated username and password.
- (void)loginViewControllerLoggedIn:(LoginViewController *)loginViewController;

@end

@interface LoginViewController : UIViewController <LoginOperationDelegate, UITextFieldDelegate> {
    
}

// Properties
@property (nonatomic,assign) id<LoginViewControllerDelegate>    delegate;
@property (nonatomic,retain) LoginOperation                      *loginOperation;


// Outlets
@property (nonatomic,retain) IBOutlet UITextField               *usernameTextField;
@property (nonatomic,retain) IBOutlet UITextField               *passwordTextField;
@property (nonatomic,retain) IBOutlet UIButton                  *submitButton;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView   *waitIndicator;
@property (nonatomic,retain) IBOutlet UITextView               *errorMessageTextView;

// Actions
- (IBAction)submit:(id)sender;

@end
