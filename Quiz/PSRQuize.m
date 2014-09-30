//
//  PSRQuize.m
//  Quiz
//
//  Created by n.shubenkov on 26/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSRQuize.h"
#import "PSRQuestion.h"
#import "PSRAnswer.h"

@interface PSRQuize()

@property (nonatomic, strong) NSArray *questions;

@end

@implementation PSRQuize

+ (instancetype)quizeWithQuestions:(NSArray *)quiestions
{
    NSParameterAssert(quiestions.count > 0);
    PSRQuize *aQuzie = [PSRQuize new];
    aQuzie.questions = quiestions;
    aQuzie.selectedAnswers = [NSMutableArray new];
    
    return aQuzie;
}

- (NSInteger)quiestionsCount
{
    return self.questions.count;
}

- (PSRQuestion *)questionAtIndex:(NSInteger)index
{
    NSParameterAssert(self.questions.count > index);
    if (self.questions.count <= index){
        return nil;
    }
    return self.questions[index];
}

+ (PSRQuize *)cinemaQuize
{
    NSMutableArray *questions = [NSMutableArray new];
    NSArray *texts = @[@"Кто зовут эту актрису?",
                       @"Фильм снят по основам диснеевского мультфильма «Спящая красавица». В каком году состоялась премьера этого мультфильма?",
                       @"Произведения какого композитора были взяты за основу музыкального сопровождения «Спящей красавицы»?",
                       @"Какое проклятие наложила на принцессу Малефисента?",
                       @"Кому принадлежит фраза \"Ostal ovista, babe\"?"];
    NSArray *globalAnwers = @[@[@"Скарлетт Йоханссо",
                                @"Анджелина Джоли",
                                @"Дженнифер Энистон",
                                @"Натали Портман"],
                              @[@"1959",
                                @"1956",
                                @"1951",
                                @"1961"],
                              @[@"М.И. Глинка",
                                @"Ц.А. Кюи",
                                @"П.И. Чайковский",
                                @"Н.А. Римский-Корсаков"],
                              @[@"Аврора должна будет уколоть свой палец о шипы розы и умереть",
                                @"Аврора должна будет уколоть свой палец о веретено и уснуть на 100 лет",
                                @"Аврора должна будет откусить отравленное яблоко и умереть",
                                @"Аврора должна будет уколоть свой палец о веретено и умереть"],
                              @[@"Стивен Сигал",
                                @"Арнольд Шварцнеггер",
                                @"Сильвестр Сталоне",
                                @"Аркадий Укупник"]];
    NSArray *images = @[[UIImage imageNamed:@"firstsQuestion"],
                        [UIImage imageNamed:@"secondQuestion"],
                        [UIImage new],
                        [UIImage new],
                        [UIImage new]];
    int correctAnswersIndexes[5] = {0, 0, 2, 3, 1};
    for (int i = 0; i < 5; i++){
        NSMutableArray *localAnswers = [NSMutableArray new];
        for (NSString *anAnswer in globalAnwers[i]){
            [localAnswers addObject:[PSRAnswer answerWithText:anAnswer]];
        }
        [localAnswers[correctAnswersIndexes[i]] setCorrect:YES];
        
        PSRQuestion *question = [[PSRQuestion alloc] initWithText:texts[i]
                                                            image:images[i]
                                                          answers:localAnswers];
        [questions addObject:question];
    }
    return [PSRQuize quizeWithQuestions:questions];
}

@end
