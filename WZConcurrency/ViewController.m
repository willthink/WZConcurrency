//
//  ViewController.m
//  WZConcurrency
//
//  Created by Wei Zong on 8/2/16.
//  Copyright © 2016 Wei Zong. All rights reserved.
//

#import "ViewController.h"
#import "WZOperation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSOperation* op = [self taskWithData:@"hello"];
    NSOperation* opBlock = [self taskBlock];
    WZOperation* wzOp = [[WZOperation alloc]init];
    [op addDependency:wzOp];
    [opBlock addDependency:op];
    NSOperationQueue* q = [[NSOperationQueue alloc]init];
    [q addOperation:op];
    [q addOperation:opBlock];
    [q addOperation:wzOp];
}

-(NSOperation*)taskWithData: (id)data {
    NSInvocationOperation* theOp = [[NSInvocationOperation alloc]initWithTarget:self
                                                                       selector:@selector(myTaskMethod:)
                                                                         object:data];
    return theOp;
}

-(NSBlockOperation*)taskBlock
{
    NSBlockOperation* theOp = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<5; i++) {
            NSLog(@"Hello NSBlockOperation %d",i);
            sleep(1);
        }
    }];
    return theOp;
}

-(void)myTaskMethod: (id)data {
    for (int i=0; i<5; i++) {
        NSLog(@"Hello NSInvocationOperation %d",i);
        sleep(1);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
