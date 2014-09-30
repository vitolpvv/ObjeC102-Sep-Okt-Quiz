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

+ (instancetype)createQuizeWithQuestionsArray:(NSArray *)texts
                                 answersArray:(NSArray *)globalAnswers
                                       images:(NSArray *)images
                        correctAnswersNumbers:(NSArray *)correctAnswersIndexes {
    NSMutableArray *questions = [NSMutableArray new];
    for (int i = 0; i < correctAnswersIndexes.count; i++){
        NSMutableArray *localAnswers = [NSMutableArray new];
        for (NSString *anAnswer in globalAnswers[i]){
            [localAnswers addObject:[PSRAnswer answerWithText:anAnswer]];
        }
        [localAnswers[[(NSNumber *)correctAnswersIndexes[i] intValue]] setCorrect:YES];
        
        PSRQuestion *question = [[PSRQuestion alloc] initWithText:texts[i]
                                                            image:images[i]
                                                          answers:localAnswers];
        [questions addObject:question];
    }
    return [PSRQuize quizeWithQuestions:questions];
}

+ (instancetype)cinemaQuize
{
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
    NSArray *correctAnswersIndexes = @[@0, @0, @2, @3, @1];
    return [PSRQuize createQuizeWithQuestionsArray:texts
                                      answersArray:globalAnwers
                                            images:images
                             correctAnswersNumbers:correctAnswersIndexes];
}

+ (instancetype)animalQuize {
    NSArray *texts = @[@"Почему крокодилы, поедая мясо, «плачут»?",
                       @"Размер самого крупного паука на Земле превышает...?",
                       @"Какое животное имеет годовые кольца как у деревьев?",
                       @"Зачем совы селят в своих гнёздах змей?",
                       @"Какого цвета кожа у Белого медведя?"];
    NSArray *globalAnwers = @[@[@"Испытывают вину",
                                @"От радости - наконец-то есть,что покушать",
                                @"Выводят соли из организма"],
                              @[@"1 метр",
                                @"28 см",
                                @"50 см",
                                @"95.5 см",
                                @"1.5 метра"],
                              @[@"Черепаха",
                                @"Хамелеон",
                                @"Кольчатая змея"],
                              @[@"Чтобы отгоняли хищников",
                                @"Чтобы проводили естественный отбор и съедали слабых",
                                @"Чтобы птенцы быстрее росли и меньше болели"],
                              @[@"Белая",
                                @"Красная",
                                @"Черная",
                                @"коричневая"]];
    NSArray *images = @[[UIImage new],
                        [UIImage new],
                        [UIImage new],
                        [UIImage new],
                        [UIImage new]];
    NSArray *correctAnswersIndexes = @[@3, @2, @1, @3, @3];
    return [PSRQuize createQuizeWithQuestionsArray:texts
                                      answersArray:globalAnwers
                                            images:images
                             correctAnswersNumbers:correctAnswersIndexes];
}

@end
