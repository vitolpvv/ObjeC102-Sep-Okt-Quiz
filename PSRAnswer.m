//
//  PSRAnswer.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRAnswer.h"

@interface PSRAnswer ()
@property (nonatomic, strong, readwrite) NSString *text;
@end

@implementation PSRAnswer

- (instancetype)initWithText:(NSString *)text isCorrect:(BOOL)correct
{
    if (self == [super init]){
        //1 ?
        _text = [text copy];
        _correct = correct;
    }
    return self;
}

@end
