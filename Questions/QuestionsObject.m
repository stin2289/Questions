//
//  QuestionsObject.m
//  Questions
//
//  Created by Austin Marusco on 10/19/18.
//  Copyright © 2018 Austin Marusco. All rights reserved.
//

#import "QuestionsObject.h"
#include <stdlib.h>

@implementation QuestionsObject

//In Place Shuffle

//Naive approach
- (void)naiveInPlaceShuffleWithArray:(NSMutableArray *)array {
	for (int i = 0; i < [array count]; i++) {
		NSNumber *tempValue = array[i];
		int randomIndex = arc4random_uniform([array count]);
		
		//Swap
		array[i] = array[randomIndex];
		array[randomIndex] = tempValue;
	}
}


//This is a semi-famous algorithm known as the Fisher-Yates shuffle (sometimes called the Knuth shuffle).
//You did it a little in reverse though
//Instead of indexes getting taken off the table, you take the randomIndex off the table
//But at each index, there's n! chances of a probability, which is correct
- (void)inPlaceShuffleWithArray:(NSMutableArray *)array {
	NSMutableSet *swappedIndexValues = [[NSMutableSet alloc] init];

	for (int i = 0; i < [array count]; i++) {
        if ([swappedIndexValues containsObject:@(i)] == NO) { //Can proceed to swap
			int randomIndex;
			do { //Loop until random index is not equal to previous swapped index value
				randomIndex = arc4random_uniform([array count]);
			} while([swappedIndexValues containsObject:@(randomIndex)] == YES);

			[swappedIndexValues addObject:@(randomIndex)];
			NSNumber *tempValue = array[i];

			//Swap
			array[i] = array[randomIndex];
			array[randomIndex] = tempValue;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//*
//*
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Single Riffle Shuffle

- (BOOL)isRiffleWithShuffledDeck:(NSMutableArray *)shuffledDeck half1:(NSMutableArray *)half1 half2:(NSMutableArray *)half2 {

	if ([shuffledDeck count] == 0 && [half1 count] == 0 && [half2 count] == 0) {
		return YES;
	}

	NSNumber *half1Num = nil;
	if ([half1 count] > 0) {
		half1Num = half1[0];
	}
	
	NSNumber *half2Num = nil;
	if ([half2 count] > 0) {
		half2Num = half2[0];
	}

	NSNumber *shuffledNum = nil;
	if ([shuffledDeck count] > 0) {
		shuffledNum = shuffledDeck[0];
	}

	if ([shuffledNum intValue] == [half1Num intValue] && shuffledNum != nil) {
		[shuffledDeck removeObjectAtIndex:0];
		[half1 removeObjectAtIndex:0];
		return [self isRiffleWithShuffledDeck:shuffledDeck half1:half1 half2:half2];
	} else if ([shuffledNum intValue] == [half2Num intValue] && shuffledNum != nil) {
		[shuffledDeck removeObjectAtIndex:0];
		[half2 removeObjectAtIndex:0];
		return [self isRiffleWithShuffledDeck:shuffledDeck half1:half1 half2:half2];
	} else {
		return NO;
	}
}

- (BOOL)isRiffleWithShuffledDeckIterativeSolution:(NSArray *)shuffledDeck half1:(NSArray *)half1 half2:(NSArray *)half2 {
	int half1Index = 0;
	int half2Index = 0;
	int shuffledDeckIndex = 0;

	while (shuffledDeckIndex < [shuffledDeck count]) {
		NSNumber *half1Num = nil;
		if (half1Index < [half1 count]) {
			half1Num = half1[half1Index];
        }
	
		NSNumber *half2Num = nil;
		if (half2Index < [half2 count]) {
			half2Num = half2[half2Index];
        }

		NSNumber *shuffledNum = nil;
		if (shuffledDeckIndex < [shuffledDeck count]) {
			shuffledNum = shuffledDeck[shuffledDeckIndex];
        }

		if ([shuffledNum intValue] == [half1Num intValue] && shuffledNum != nil) {
			half1Index++;
		} else if ([shuffledNum intValue] == [half2Num intValue] && shuffledNum != nil) {
			half2Index++;
		} else {
			return NO;
		}

		shuffledDeckIndex++;
	}

    if (shuffledDeckIndex == [shuffledDeck count] &&
        half1Index == [half1 count] &&
        half2Index == [half2 count]  ) {
        return YES;
    }
    
    return NO;
}





@end
