//
//  AppDelegate.h
//  Sales Resource
//
//  Created by Alex Ninneman on 12/10/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "LoginViewController.h"

@class  FirstViewController;
@class SecondViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, LoginViewControllerDelegate>{
    
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) LoginViewController   *loginViewController;
@property (nonatomic, retain) FirstViewController   *firstViewController;
@property (nonatomic, retain) SecondViewController  *secondViewController;
@property (strong, nonatomic) UITabBarController    *tabBarController;


@end
