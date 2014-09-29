//
//  PSRResultsViewController.m
//  Quiz
//
//  Created by VitaliyP on 29.09.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRResultsViewController.h"
#import "PSRQuizeHandler.h"
#import "PSRQuize.h"

@interface PSRResultsViewController () <PSRQuizeHandler>

@property (nonatomic, strong) NSMutableArray *correctAnswersIndex;
@property (nonatomic, strong) NSMutableArray *answersIndex;

@end

@implementation PSRResultsViewController

-(void)handleQuize:(id)quize withQuestionIndex:(int)index {
    PSRQuize *q = quize;
    for (int i = 0; i < q.quiestionsCount; i++) {
        [q questionAtIndex:(NSIndexPath)(q.selectedAnswers[i])];
    }
    q questionAtIndex:<#(NSInteger)#>
    q.quiestionsCount;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
