//
//  LoginViewController.m
//  Sales Resource
//
//  Created by Alex Ninneman on 12/22/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

#pragma mark - Properties
@synthesize delegate=_delegate;
@synthesize usernameTextField=_usernameTextField;
@synthesize passwordTextField=_passwordTextField;
@synthesize submitButton=_submitButton;
@synthesize waitIndicator=_waitIndicator;
@synthesize errorMessageTextView=_errorMessageTextView;

// Custom setter, which sets the 'delegate' property of the login operation
@synthesize loginOperation=_loginOperation;
- (void) setLoginOperation:(LoginOperation *)loginOperation{
    [loginOperation retain];
    [_loginOperation release];
    _loginOperation = loginOperation;
    
    if(_loginOperation){
        _loginOperation.delegate = self;
    }
}

#pragma mark - Helper methods
- (void) releaseOutlets{
    self.usernameTextField = nil;
    self.passwordTextField = nil;
    self.submitButton = nil;
    self.waitIndicator = nil;
    self.errorMessageTextView = nil;
}

- (void)setIsWaiting:(BOOL)waiting{
    if(waiting) {
        [self.waitIndicator startAnimating];
        self.submitButton.enabled = NO;
    }else{
        [self.waitIndicator stopAnimating];
        self.submitButton.enabled = YES;
    }
}

#pragma mark - Actions
- (IBAction)submit:(id)sender{
    if(!self.loginOperation){
        return;
    }
    
    NSString *username = self.usernameTextField.text;
    if(!username || [username length] == 0){
        return;
    }
    
    NSString *password = self.passwordTextField.text;
    if(!password || [password length] == 0){
        return;
    }
    
    [self setIsWaiting:YES];
    [self.loginOperation beginAuthenticateUsername:username
                                          password:password];
}

#pragma mark - LoginOperationDelegate methods
- (void)loginOperationCompleted:(LoginOperation *)loginOperation withResult:(BOOL)successfulLogin errorMessage:(NSString *)errorMessage{
    [self setIsWaiting:NO];
    
    if(successfulLogin) {
        self.errorMessageTextView.text = nil;
        
        // Let this object's delegate know that the login was a success
        [self.delegate loginViewControllerLoggedIn:self];
        
    }else{
        self.errorMessageTextView.text = errorMessage;
    }
}

#pragma mark - UITextFieldDelegate methods
// Called when the 'return' key is pressed. Return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.usernameTextField){
        // Move the input focus to the the password field.
        [self.passwordTextField becomeFirstResponder];
    }else{
        // Simulate by clicking the submit button
        [self submit:nil];
    }
    return NO;
}

#pragma mark - View Lifecycle
- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any addition setup after the loading the view from its nib;
    
    // Get rid of any design time placeholder text.
    self.errorMessageTextView.text = nil;
    
    // Configure the animated icon that is displayed
    // while the user's credentials are being authenticated.
    self.waitIndicator.hidden = YES;
    self.waitIndicator.hidesWhenStopped = YES;
    
    // Set this object as the delegate for the text fields, so that
    // when the user hits the RETURN key we can perform custom logic.
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    // Give input focus to the username field.
    [self.usernameTextField becomeFirstResponder];
}

- (void)dealloc{
    [_usernameTextField release];
    [_passwordTextField release];
    [_submitButton release];
    [_waitIndicator release];
    [_errorMessageTextView release];
    [_loginOperation release];
    [super dealloc];
}

@end