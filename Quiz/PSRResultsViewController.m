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
#import "PSRAnswer.h"

@interface PSRResultsViewController () <PSRQuizeHandler>

@property (nonatomic, weak) NSMutableArray *answers;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctAnswersCountLabel;

@end

@implementation PSRResultsViewController

-(void)handleQuize:(id)quize withQuestionIndex:(int)index {
    self.answers = [(PSRQuize *)quize selectedAnswers];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    [self showResults];
}

- (void)showResults {
    int correctAnswersCount = 0;
    for (PSRAnswer *answer in self.answers) {
        if (answer.correct) {
            correctAnswersCount++;
        }
    }
    switch (correctAnswersCount *10 / self.answers.count) {
        case 0:
            self.imageView.image = [UIImage imageNamed:@"bad"];
            self.gradeLabel.text = [NSString stringWithFormat:@"Oops! It'll be better next time."];
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            self.imageView.image = [UIImage imageNamed:@"bad"];
            self.gradeLabel.text = [NSString stringWithFormat:@"Not so bad! It'll be better next time."];
            break;
        case 6:
        case 7:
        case 8:
        case 9:
            self.imageView.image = [UIImage imageNamed:@"normal"];
            self.gradeLabel.text = [NSString stringWithFormat:@"Very good! But not ideal."];
            break;
        default:
            self.imageView.image = [UIImage imageNamed:@"Excellent"];
            self.gradeLabel.text = [[NSString alloc] initWithFormat:@"Great job! You're very smart!"];
            break;
    }
    self.correctAnswersCountLabel.text = [NSString stringWithFormat:@"Correct answers: %d", correctAnswersCount];
}

@end
