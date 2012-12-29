//
//  AppDelegate.m
//  Sales Resource
//
//  Created by Alex Ninneman on 12/10/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//
#import <RestKit/RestKit.h>
#import "AppDelegate.h"

#import "LoginViewController.h"
#import "UserLoginOperation.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "SalesAuthentication.h"

@implementation AppDelegate


@synthesize window=_window;
@synthesize loginViewController=_loginViewController;
@synthesize tabBarController=_tabBarController;
@synthesize firstViewController=_firstViewController;
@synthesize secondViewController=_secondViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *loginViewNib = [info objectForKey:@"Login nib file base name"];
    self.loginViewController = [[[LoginViewController alloc] initWithNibName:loginViewNib bundle:nil] autorelease];
    self.loginViewController.delegate = self;
    self.loginViewController.loginOperation = [[[UserLoginOperation alloc]init]autorelease];
    

    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    UIViewController *view1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    UIViewController *view2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = @[view1, view2];

    [self.window addSubview:self.tabBarController.view];
    [self.window makeKeyAndVisible];
    
    if([SalesAuthentication getPassword] != nil){
        self.window.rootViewController = self.tabBarController;
    }else{ // Push login
        [self.loginViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self.tabBarController presentViewController:self.loginViewController animated:NO completion:nil];
    }
    
    
    
    
    
    
    
    
    return YES;
}

// Invoked when the user is successfully logged in.
- (void)loginViewControllerLoggedIn:(LoginViewController *)loginViewController{
    [self.firstViewController dismissViewControllerAnimated:YES completion:nil];
    
    LoginOperation *loginOp = loginViewController.loginOperation;
    
    NSLog(@"Logged in. User Name='%@' Password='%@'", loginOp.authenticatedUsername, loginOp.authenticatedPassword);
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    UIViewController *view1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    UIViewController *view2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = @[view1, view2];
    
    
    [self.window addSubview:self.tabBarController.view];
    [self.window makeKeyAndVisible];
    
    
//    [loginOp deleteAuthenticatedData];
    
    self.loginViewController = nil;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}


/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
