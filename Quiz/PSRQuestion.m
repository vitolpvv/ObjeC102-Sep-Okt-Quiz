//
//  PSRQuestion.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuestion.h"

@implementation PSRQuestion

- (instancetype)initWithText:(NSString *)text image:(UIImage *)image answers:(NSArray *)answers
{
    NSParameterAssert(text.length > 0);
    NSAssert(answers.count > 0, @"it is stupid to create queestion without answers %@",@"privet");
    if (self == [super init]){
        _text = [text copy];
//        _answers = [answers copy];
        _answers = [self shuffleAnswers:answers];
        _image = image;
    }
    return self;
}

- (NSArray *)shuffleAnswers:(NSArray *)answersArray {
    srand(time(NULL));
//    srandom(time(NULL));
    NSMutableArray *answers = [NSMutableArray arrayWithArray:answersArray];
    NSMutableArray *shuffledAnswers = [NSMutableArray new];
    while (answers.count > 0) {
        int randomIndex = rand() % answers.count;
        [shuffledAnswers addObject:[answers objectAtIndex:randomIndex]];
        [answers removeObjectAtIndex:randomIndex];
    }
    return shuffledAnswers;
}

@end
