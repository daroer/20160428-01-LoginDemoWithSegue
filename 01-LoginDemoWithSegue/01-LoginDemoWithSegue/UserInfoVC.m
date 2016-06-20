//
//  UserInfoVC.m
//  01-LoginDemoWithSegue
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "UserInfoVC.h"

@interface UserInfoVC ()
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation UserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _welcomeLabel.text = [NSString stringWithFormat:@"欢迎您,%@",_userNameString];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"changeTextForLabel"]) {
        //把个性签名传至目标视图控制器（更改个性签名控制器）
        [segue.destinationViewController setValue:_descLabel.text forKey:@"descString"];
    }
}

-(IBAction)backToUserInfo:(UIStoryboardSegue *)unwindSegue{
    if ([unwindSegue.identifier isEqualToString:@"backToUserInfo"]) {
        //1、获changeUserInfoVC中的textField的文本（sourceVC）
        UIViewController *sourceVC = unwindSegue.sourceViewController;
        NSString *text = [sourceVC valueForKeyPath:@"textField.text"];
        //2、更改userInfoVC的descLabel个性签名（destinationVC）
        self.descLabel.text = text;
    }
}

@end
