/**
 * Copyright (c) 2009 Alex Fajkowski, Apparent Logic LLC
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
#import "AFItemView.h"
#import <QuartzCore/QuartzCore.h>
#import "AFOpenFlowConstants.h"


@implementation AFItemView
@synthesize number, imageView, horizontalPosition, verticalPosition, flipped, selected;

- (id)initWithFrame:(CGRect)frame {
	if (self == [super initWithFrame:frame]) {
		self.opaque = YES;
		self.backgroundColor = NULL;
		verticalPosition = 0;
		horizontalPosition = 0;
		
			// Image View
		imageView = [[UIImageView alloc] initWithFrame:frame];
		imageView.opaque = YES;
		[self addSubview:imageView];
		flipped = FALSE;
	}
	
	return self;
}

- (void)setImage:(UIImage *)newImage originalImageHeight:(CGFloat)imageHeight reflectionFraction:(CGFloat)reflectionFraction {
	[imageView setImage:newImage];
	verticalPosition = imageHeight * reflectionFraction / 2;
	originalImageHeight = imageHeight;
	self.frame = CGRectMake(0, 0, newImage.size.width, newImage.size.height);
	viewImageHeight = imageHeight;
	viewImageWidth = newImage.size.width;
	
}

- (void)setNumber:(int)newNumber {
	horizontalPosition = COVER_SPACING * newNumber;
	number = newNumber;
}

- (CGSize)calculateNewSize:(CGSize)baseImageSize boundingBox:(CGSize)boundingBox {
	CGFloat boundingRatio = boundingBox.width / boundingBox.height;
	CGFloat originalImageRatio = baseImageSize.width / baseImageSize.height;
	
	CGFloat newWidth;
	CGFloat newHeight;
	if (originalImageRatio > boundingRatio) {
		newWidth = boundingBox.width;
		newHeight = boundingBox.width * baseImageSize.height / baseImageSize.width;
	} else {
		newHeight = boundingBox.height;
		newWidth = boundingBox.height * baseImageSize.width / baseImageSize.height;
	}
	
	return CGSizeMake(newWidth, newHeight);
}


- (void)setFrame:(CGRect)newFrame {
	[super setFrame:newFrame];
	[imageView setFrame:newFrame];
}

- (void)dealloc {
	[imageView release];
	
	[super dealloc];
}

#pragma mark create_image_details

- (BOOL) createFlipView
{
	flipView = [[UILabel alloc] init];
	flipView.text = @"O hai";
	flipView.backgroundColor = [UIColor cyanColor];
	flipView.textAlignment = UITextAlignmentCenter;
	CGRect newFrame = self.superview.frame;
	newFrame.size.height = viewImageHeight;
	newFrame.size.width = viewImageWidth;
	flipView.frame = newFrame;
	return TRUE;
}

#pragma mark Animation

- (void)revertFlip
{
	if ( flipped == TRUE )
		[self flipView];
}


- (void)flipView
{
	
	if ( flipped == FALSE  && [self createFlipView])
	{	
//			//CGRect flippedViewFrame = CGRectMake(
//											 (flipView.frame.size.width-imageView.frame.size.width)/2,
//											 (flipView.frame.size.height-imageView.frame.size.height)/2,
//											 imageView.frame.size.width,
//											 imageView.frame.size.height);
			//imageView.frame = flippedViewFrame;
		
		
		
		double animationDuration = 0.8;
		
			// Animate flip of open flow image out of view
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:animationDuration];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
							   forView:self
								 cache:YES];
		[imageView removeFromSuperview];
		[UIView commitAnimations];
		
		
		
			// Animate flip of flipped view into view
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:animationDuration];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
							   forView:self
								 cache:YES];
		[self addSubview:flipView];
		[UIView commitAnimations];
		flipped = TRUE;
	}
	else 
	{
		
		double animationDuration = 0.8;
		
			// Animate flip of flipped view out of view
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:animationDuration];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
							   forView:self
								 cache:YES];
		[flipView removeFromSuperview];
		[UIView commitAnimations];
		
			// Animate flip of image view back into view
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:animationDuration];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
							   forView:self
								 cache:YES];
		[self addSubview:imageView];
		[UIView setAnimationDelegate:self.superview];
		[UIView setAnimationDidStopSelector:@selector(dismissFlippedAnimationDidStop:finished:context:)];
		[UIView commitAnimations];
		
		flipped = FALSE;
		[flipView release];
		flipView = nil;
	}
	
	
	
}


@end