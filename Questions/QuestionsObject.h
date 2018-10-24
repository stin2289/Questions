//
//  QuestionsObject.h
//  Questions
//
//  Created by Austin Marusco on 10/19/18.
//  Copyright © 2018 Austin Marusco. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionsObject : NSObject

//In place shuffle
- (void)naiveInPlaceShuffleWithArray:(NSMutableArray *)array;
- (void)inPlaceShuffleWithArray:(NSMutableArray *)array;


//Single Riffle Shuffle
- (BOOL)isRiffleWithShuffledDeck:(NSMutableArray *)shuffledDeck half1:(NSMutableArray *)half1 half2:(NSMutableArray *)half2;
- (BOOL)isRiffleWithShuffledDeckIterativeSolution:(NSArray *)shuffledDeck half1:(NSArray *)half1 half2:(NSArray *)half2;

@end

NS_ASSUME_NONNULL_END
