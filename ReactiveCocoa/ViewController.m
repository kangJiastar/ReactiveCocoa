//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by apple on 15/7/3.
//  Copyright (c) 2015年 cloud7. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UIButton *userName;
@property (weak, nonatomic) IBOutlet UIButton *passWord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    RAC(self.logInButton, enabled) = [RACSignal
      combineLatest:@[
                      self.usernameTextField.rac_textSignal,
                      self.passwordTextField.rac_textSignal,
                      RACObserve(LoginManager.sharedManager, loggingIn),
                      RACObserve(self, loggedIn)
                      ] reduce:^(NSString *username, NSString *password, NSNumber *loggingIn, NSNumber *loggedIn) {
                          return @(username.length > 0 && password.length > 0 && !loggingIn.boolValue && !loggedIn.boolValue);
                      }];
     */
    
  
    
    
}
@end
