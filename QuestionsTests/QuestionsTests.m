//
//  QuestionsTests.m
//  QuestionsTests
//
//  Created by Austin Marusco on 10/19/18.
//  Copyright © 2018 Austin Marusco. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuestionsObject.h"

@interface QuestionsTests : XCTestCase

@end

@implementation QuestionsTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

//In place shuffle

- (void)testInPlaceSwapNaive {
    NSArray *array = @[@(1),@(2),@(3),@(4),@(5),@(6),@(7),@(8)];
    NSMutableArray *mutableArray = [array mutableCopy];
    NSLog(@"Test naive in place swap");
    NSLog(@"Original array:%@",mutableArray);
    
    QuestionsObject *questionsObject = [[QuestionsObject alloc] init];
    [questionsObject naiveInPlaceShuffleWithArray:mutableArray];
    
    NSLog(@"Post swap array:%@",mutableArray);
}

- (void)testInPlaceSwap {
    NSArray *array = @[@(1),@(2),@(3),@(4),@(5),@(6),@(7),@(8)];
    NSMutableArray *mutableArray = [array mutableCopy];
    NSLog(@"Test in place swap");
    NSLog(@"Original array:%@",mutableArray);
    
    QuestionsObject *questionsObject = [[QuestionsObject alloc] init];
    [questionsObject inPlaceShuffleWithArray:mutableArray];
    
    NSLog(@"Post swap array:%@",mutableArray);
}

//Single Riffle Shuffle

- (void)testSingleRiffleShuffTrue {
    NSMutableArray *shuffledDeck = [@[@(1),@(2),@(3),@(4)] mutableCopy];
    NSMutableArray *half1 = [@[@(1),@(3)] mutableCopy];
    NSMutableArray *half2 = [@[@(2),@(4)] mutableCopy];
    
    QuestionsObject *questionsObject = [[QuestionsObject alloc] init];
    
    XCTAssertTrue([questionsObject isRiffleWithShuffledDeck:shuffledDeck half1:half1 half2:half2]);
}

- (void)testSingleRiffleShuffFalse {
    NSMutableArray *shuffledDeck = [@[@(1),@(2),@(3),@(4)] mutableCopy];
    NSMutableArray *half1 = [@[@(3),@(2)] mutableCopy];
    NSMutableArray *half2 = [@[@(4),@(1)] mutableCopy];
    
    QuestionsObject *questionsObject = [[QuestionsObject alloc] init];
    
    XCTAssertFalse([questionsObject isRiffleWithShuffledDeck:shuffledDeck half1:half1 half2:half2]);
}

- (void)testSingleRiffleShuffIterativeSolutionTrue {
    NSArray *shuffledDeck = @[@(1),@(2),@(3),@(4)];
    NSArray *half1 = @[@(1),@(3)];
    NSArray *half2 = @[@(2),@(4)];
    
    QuestionsObject *questionsObject = [[QuestionsObject alloc] init];
    
    XCTAssertTrue([questionsObject isRiffleWithShuffledDeckIterativeSolution:shuffledDeck half1:half1 half2:half2]);
}

- (void)testSingleRiffleShuffIterativeSolutionFalse {
    NSArray *shuffledDeck = @[@(1),@(2),@(3),@(4)];
    NSArray *half1 = @[@(3),@(2)];
    NSArray *half2 = @[@(4),@(1)];
    
    QuestionsObject *questionsObject = [[QuestionsObject alloc] init];
    
    XCTAssertFalse([questionsObject isRiffleWithShuffledDeckIterativeSolution:shuffledDeck half1:half1 half2:half2]);
}

@end
