//
//  PSRSelectQuizeViewController.m
//  Quiz
//
//  Created by VitaliyP on 30.09.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRSelectQuizeViewController.h"
#import "PSRQuizeHandler.h"
#import "PSRSelectQuizeCell.h"
#import "PSRQuize.h"

@interface PSRSelectQuizeViewController ()

typedef enum quizThemes {
    ANIMALS,
    CINEMA
} QUIZ_THEMES;

@property (nonatomic) int quizTheme;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation PSRSelectQuizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = @[[UIImage imageNamed:@"animal_quiz"],
                    [UIImage imageNamed:@"cinema_quiz"]];
    self.titles = @[@"Викторина о животных",
                    @"Викторина о кино"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController conformsToProtocol:@protocol(PSRQuizeHandler)]) {
        UIViewController <PSRQuizeHandler> *quizeHandler = segue.destinationViewController;
        switch (self.quizTheme) {
            case CINEMA:
                [quizeHandler handleQuize:[PSRQuize cinemaQuize] withQuestionIndex:0];
                break;
            case ANIMALS:
                [quizeHandler handleQuize:[PSRQuize animalQuize] withQuestionIndex:0];
                break;
            default:
                break;
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSRSelectQuizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    cell.quizeImage.image = self.images[indexPath.row];
    cell.quizeLabel.text = self.titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.quizTheme = (int)indexPath.row;
    [self performSegueWithIdentifier:@"quizView" sender:self];
}


@end
