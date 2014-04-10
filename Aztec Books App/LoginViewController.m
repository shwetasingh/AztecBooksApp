//
//  LoginViewController.m
//  Aztec Books App
//
//  Created by Shweta Singh on 3/24/14.
//  Copyright (c) 2014 Aztec Shops. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (IBAction)login
{
    // Set login value to true
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    delegate.login = YES;
    
    // Show TabBarContoller on successful login
    UITabBarController *tabBarCtrl = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
    tabBarCtrl.selectedIndex=0;
    [self presentViewController:tabBarCtrl animated:NO completion:nil];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
