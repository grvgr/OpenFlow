	//
	//  AFDemoViewItem.m
	//  AFOpenFlowDemo
	//
	//  Created by Ajey Gore on 15/04/11.
	//  Copyright 2011 ThoughtWorks. All rights reserved.
	//


#import "AFDemoViewItem.h"
#import "AFUIImageReflection.h"

@implementation AFDemoViewItem

@synthesize backView, frontView, image, label, number;

- (AFDemoViewItem*) initWithString:(NSString*) string andInt:(int) num
{
	self = [super init];
    if (self) {
        self.label = string;
        self.number = num;
        image = [[UIImage imageNamed:label] retain];
    }
	return self;
}

- (UIView *)getFrontView
{
	if (frontView == nil){
        frontView = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
		[frontView setImage:image];
		return frontView;
	}
	return frontView;
}
- (UIView *)getBackView
{
	if ( backView == nil )
	{
		backView = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, image.size.height, image.size.width)] retain];
		[backView setText:label];
		backView.backgroundColor = [UIColor whiteColor];
		[backView setTextAlignment:UITextAlignmentCenter];
	}
	return backView;
}



@end
