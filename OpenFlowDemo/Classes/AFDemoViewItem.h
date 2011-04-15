//
//  AFDemoViewItem.h
//  AFOpenFlowDemo
//
//  Created by Ajey Gore on 15/04/11.
//  Copyright 2011 ThoughtWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "AFViewItem.h"


@interface AFDemoViewItem : AFViewItem {
	
	UILabel *backView;
	UIImageView *frontView;
	UIImage *image;
	
	NSString *label;
	int		number;
	float	imageHeight;
	
	float	kReflectionFactor;

}

@property(nonatomic, retain) NSString* label;
@property(nonatomic, retain) UIImageView* frontView;
@property(nonatomic, retain) UIImage* image;
@property(nonatomic, retain) UILabel* backView;
@property int number;


- (AFDemoViewItem*) initWithString:(NSString*) string andInt:(int) num;

@end


