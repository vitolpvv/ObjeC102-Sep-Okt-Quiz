//
//  ViewController.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuizViewController.h"
#import "PSRAnswer.h"
#import "PSRQuestion.h"


@interface PSRQuizViewController ()

@end

@implementation PSRQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkSomeMethods];
    [self createModel];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)checkSomeMethods
{
    NSArray *array = @[@"asfasjfhs", @"salkhfsaio", @"dsljkhsdo"];
    NSNumber *number  = @(124);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)answerPressed:(UIButton *)sender
{
//    djklsgdfjkbdlkdfskljoloildghio rtdio 
}

- (void)createModel
{
    PSRQuestion  *question1 = [[PSRQuestion alloc] initWithText:@"some text" answers:@[@"1", @"2"]];
}

@end
