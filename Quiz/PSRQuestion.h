//
//  PSRQuestion.h
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSRQuestion : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSArray *answers;

- (instancetype)initWithText:(NSString *)text answers:(NSArray *)answers;

@end
