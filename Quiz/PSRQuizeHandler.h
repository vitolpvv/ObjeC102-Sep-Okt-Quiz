//
//  PSRQuizeHandler.h
//  Quiz
//
//  Created by VitaliyP on 02.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSRQuizeHandler <NSObject>

- (void)handleQuize:(PSRQuize *)quize withQuestionIndex:(int)index;

@end
