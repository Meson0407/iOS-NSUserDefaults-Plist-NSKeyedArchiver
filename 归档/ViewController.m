//
//  ViewController.m
//  归档)
//
//  Created by 薛涛 on 17/2/16.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, copy)NSString *filePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self useNSUserDefaults];
    [self usePlist];
    [self useNSKeyedArchiver];
}

#pragma mark - NSUserDefaults 存储
- (void)useNSUserDefaults {
    [self saveUserName:@"Tom" userSex:@"Man"];
}

- (void)saveUserName:(NSString *)name userSex:(NSString *)sex {
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:sex forKey:@"userSex"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// NSUserDefaults点击
- (IBAction)clickNSUserDefaults:(UIButton *)sender {
    NSString *name = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"]];
    NSString *sex  = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"userSex"]];
    [self alertController:[NSString stringWithFormat:@"%@ - %@", name, sex]];
}

#pragma mark - Plist存储
- (void)usePlist {
    NSDictionary *dictionary = @{@"city":@"Beijing", @"country":@"China"};
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    // 文件路径
    self.filePath = [path stringByAppendingPathComponent:@"userData.plist"];
    // 获取应用沙盒
    //NSString *homePath = NSHomeDirectory();
    
    [dictionary writeToFile:self.filePath atomically:YES];
}

// Plist点击
- (IBAction)clickPlist:(UIButton *)sender {
    NSDictionary *info = [NSDictionary dictionaryWithContentsOfFile:self.filePath];
    [self alertController:[NSString stringWithFormat:@"%@ - %@", info[@"country"], info[@"city"]]];
}

#pragma mark - 归档存储
- (void)useNSKeyedArchiver {
    Person *person = [[Person alloc] init];
    person.personName = @"小明";
    person.personNumber = 10025;
    NSString *tempPath = NSTemporaryDirectory();// 获取tmp目录路径
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"person.data"];// 拼接文件名
    [NSKeyedArchiver archiveRootObject:person toFile:filePath];// 归档
}

// 归档解档按钮点击
- (IBAction)clikeNSKeyedArchive:(UIButton *)sender {
    NSString *tempPath = NSTemporaryDirectory();
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"person.data"];
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    [self alertController:[NSString stringWithFormat:@"%@ - %ld", p.personName, (long)p.personNumber]];
}

#pragma mark - alertController
- (void)alertController:(NSString *)alertMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertMessage message:nil preferredStyle:1];
    [self presentViewController:alertController animated:YES completion:nil];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
