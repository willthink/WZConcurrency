//
//  WZOperation.m
//  WZConcurrency
//
//  Created by Wei Zong on 8/2/16.
//  Copyright © 2016 Wei Zong. All rights reserved.
//

#import "WZOperation.h"

@implementation WZOperation
-(instancetype)initWithData:(id)data {
    if (self = [super init]) {
        _myData = data;
        executing = NO;
        finished = NO;
    }
    return self;
}

-(void)start
{
    if ([self isCancelled]) {
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
    for (int i=0; i<5; i++) {
        NSLog(@"Hello WZOperation %d",i);
        sleep(1);
    }
    
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = NO;
    finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

-(BOOL)isExecuting
{
    return executing;
}
-(BOOL)isFinished
{
    return finished;
}
-(BOOL)isConcurrent
{
    return YES;
}

@end
