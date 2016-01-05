//
//  ViewController.m
//  CJDownloadManager
//
//  Created by ConnorJ on 16/1/5.
//  Copyright © 2016年 ConnorJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5"]];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        dispatch_group_t group = dispatch_group_create();
        
        dispatch_queue_t sequalQueue = dispatch_queue_create("com.huangyibiao.helloworld", NULL);
        
        __block NSString *cc = @"";
        
        for (int i = 0; i < arr.count; i++) {
            dispatch_group_async(group, sequalQueue, ^{
                
                cc = [NSString stringWithFormat:@"%@+%@", cc, arr[i]];
                NSLog(@"%@, %d", cc, i);
                
            });
        }
        
        
        
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            NSLog(@"~%@~", cc);
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
