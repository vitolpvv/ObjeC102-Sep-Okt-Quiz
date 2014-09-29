//
//  ViewController.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuizViewController.h"
#import "PSRQuize.h"
#import "PSRAnswer.h"
#import "PSRQuestion.h"
#import "QuizeCell.h"
#import "PSRQuizeHandler.h"


@interface PSRQuizViewController () <UITableViewDataSource, UITableViewDelegate, PSRQuizeHandler>

@property (weak, nonatomic) IBOutlet UIImageView *questionImage;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITableView *answersList;

@end

@implementation PSRQuizViewController

- (void)handleQuize:(PSRQuize *)quize withQuestionIndex:(int)index {
    self.aQuize = quize;
    self.currentIndex = index;
}

- (PSRQuestion *)currentQuestion
{
    return [self.aQuize questionAtIndex:self.currentIndex];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([segue.identifier isEqualToString:@"nextQuestionView"]) {
//        PSRQuizViewController *controller = segue.destinationViewController;
//        controller.aQuize = self.aQuize;
//        controller.currentIndex = self.currentIndex + 1;
//    } else if ([segue.identifier isEqualToString:@"resultsView"]) {
//        //colculate results
//    }
    
    if ([segue.destinationViewController conformsToProtocol:@protocol(PSRQuizeHandler)]){
        UIViewController <PSRQuizeHandler> *quizeHandler = segue.destinationViewController;
        [quizeHandler handleQuize:self.aQuize
                withQuestionIndex:self.currentIndex + 1];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    [self setup];
}

- (void)setup
{
    [self setupModel];
    [self setupViews];
}


- (void)setupModel
{
    if (!self.aQuize){
        self.aQuize = [PSRQuize cinemaQuize];
    }
}

- (void)setupViews
{
    self.questionImage.image = [self currentQuestion].image;
    self.questionLabel.text =[self currentQuestion].text;
    self.answersList.delegate = self;
    self.answersList.dataSource = self;
    [self.answersList reloadData];
    NSInteger quetionsCount = self.aQuize.quiestionsCount;
    [self.navigationItem setTitle:[[NSString alloc] initWithFormat:@"Вопрос %d из %ld", self.currentIndex + 1, quetionsCount]];
}

- (void)answerPressed
{
    if (self.currentIndex < self.aQuize.quiestionsCount - 1) {
        [self performSegueWithIdentifier:@"nextQuestionView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"resultsView" sender:self];
    }
}

#pragma mark - TableView DataSourse -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self currentQuestion] answers].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    
    [self configureCell:cell
             withAnswer:[[self currentQuestion] answers][indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PSRAnswer *answer = [[[self currentQuestion] answers] objectAtIndex:indexPath.row];
    [self.aQuize.selectedAnswers addObject:answer];
    [self answerPressed];
}

- (void)configureCell:(QuizeCell  *)cell withAnswer:(PSRAnswer *)answer
{
    cell.topText.text = answer.text;
//    cell.bottomText.text = [[self.answersList indexPathForCell:cell] description];
}

@end
