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
	
	self.label = string;
	self.number = num;
	image = [[UIImage imageNamed:label] retain];
	kReflectionFactor = 0.85;;
	imageHeight = image.size.height;
	return self;
}

- (UIView *)getFrontView
{
	NSLog(@"%@ File", self.label);
	if (frontView == nil){
		frontView = [[[UIImageView alloc] initWithFrame:CGRectZero] retain] ;
		frontView.opaque = YES;
		
		UIImage *imageWithReflection = [image addImageReflection:kReflectionFactor];
		
		[frontView setImage:imageWithReflection];
		[frontView setFrame:CGRectMake(0, 0, image.size.width, imageWithReflection.size.height)];
		return frontView;
	}
	
	return frontView;
}
- (UIView *)getBackView
{
	if ( backView == nil )
	{
		backView = [[[UILabel alloc] initWithFrame:CGRectZero] retain];
		[backView setText:label];
		backView.backgroundColor = [UIColor whiteColor];
		[backView setTextAlignment:UITextAlignmentCenter];
		CGRect newFrame = CGRectMake(0, 0, imageHeight, image.size.width);
		backView.frame = newFrame;
		
	}
	return backView;
}



@end
