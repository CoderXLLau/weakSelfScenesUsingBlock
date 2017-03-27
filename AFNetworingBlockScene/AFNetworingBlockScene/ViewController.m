//
//  ViewController.m
//  AFNetworingBlockScene
//
//  Created by Jarvan on 2017/3/27.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>


#define  testURL @"http://api.map.baidu.com/telematics/v3/weather?output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //有内存泄漏的写法
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    AFHTTPSessionManager *session = [ViewController manager];
    
    [session GET:testURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功---%@", responseObject);
        self.testLabel.text=@"成功";
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

- (IBAction)popClick:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc{

    NSLog(@"ViewController Dealloc");
}




+ (AFHTTPSessionManager*) manager
{
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    
    return manager;
}


@end
