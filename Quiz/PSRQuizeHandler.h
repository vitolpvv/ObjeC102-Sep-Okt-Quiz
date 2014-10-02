//
//  PSRQuizeHandler.h
//  Quiz
//
//  Created by VitaliyP on 29.09.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PSRQuize;

@protocol PSRQuizeHandler

- (void)handleQuize:(PSRQuize *)quize withQuestionIndex:(int)index;

@end
