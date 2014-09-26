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
    [self showBlocks];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)checkSomeMethods
{
    NSArray *array = @[@"asfasjfhs", @"salkhfsaio", @"dsljkhsdo"];
    NSNumber *number  = @(124);
}


int squareFunction(int a){
    return a * a;
}



- (void)showBlocks
{
    int number = 5;
    
    NSString *someString = @"hello";
    
    
    
    int (^square)(int a) = ^int(int a) {
        
        NSLog(@"%@",someString);
        return a * a;
    };
    
    NSLog(@"square of %d is %d",number, square(number));
    
    NSLog(@"sque of %d is %d", 77,square(77));
    
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
