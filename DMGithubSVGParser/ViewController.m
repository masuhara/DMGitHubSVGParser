//
//  ViewController.m
//  DMGithubSVGParser
//
//  Created by Master on 2014/12/08.
//  Copyright (c) 2014年 net.masuhara. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"
#import "DMSVGParser.h"


@interface ViewController ()

@end

@implementation ViewController
{
    IBOutlet UIImageView *sampleImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadRequest
{
    // AFNetworking
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *userName = @"masuhara";
    
    // strategy of text/html
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager GET:[NSString stringWithFormat:@"https://github.com/users/%@/contributions", userName]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             // DMSVGParser
             sampleImageView.image = [DMSVGParser getSVGImage:responseObject];
             
             // Renew UI on main Thread
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 // if you want to use tableView, reload here.
                 //[_tableView reloadData];
                 [self.view setNeedsDisplay];
             });
             
         }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             
             NSLog(@"Error: %@", error.description);
         }];
}

@end
