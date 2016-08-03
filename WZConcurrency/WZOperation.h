//
//  WZOperation.h
//  WZConcurrency
//
//  Created by Wei Zong on 8/2/16.
//  Copyright © 2016 Wei Zong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZOperation : NSOperation {
    BOOL executing;
    BOOL finished;
}
@property (nonatomic, strong)id myData;
-(instancetype)initWithData:(id)data;
@end
