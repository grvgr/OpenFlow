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
#import <UIKit/UIKit.h>
#import "AFViewItem.h"


@interface AFItemView : UIView {
    
    UIView			*backView;
	UIView			*frontView;
	int				number;
	CGFloat			horizontalPosition;
	CGFloat			verticalPosition;
	CGFloat			originalImageHeight;
	BOOL			selected;
	BOOL			flipped;
	CGFloat			viewImageHeight;
	CGFloat			viewImageWidth;
	
	//View item pointer for this view, this view item 
	//Provides implementation for front and back views
	AFViewItem		*viewItem;
}

@property int number;
@property BOOL selected;
@property BOOL flipped;
@property (nonatomic, readonly) CGFloat horizontalPosition, verticalPosition;
@property (nonatomic, readonly) UIView *frontView;


- (void)setImage:(UIImage *)newImage originalImageHeight:(CGFloat)imageHeight reflectionFraction:(CGFloat)reflectionFraction;
- (CGSize)calculateNewSize:(CGSize)originalImageSize boundingBox:(CGSize)boundingBox;
- (void)flipView;
- (BOOL)createbackView;
- (void)revertFlip;
- (void)updateViewItemAndUpdateImage:(AFViewItem *) newViewItem;

@end