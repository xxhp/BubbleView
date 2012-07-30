//
//  BubbleFloatingView.h
//  COBubbleView
//
//  Created by Manoj Mahapatra on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleFloatingView : UIView

@property (nonatomic, assign) CGPoint destination;
@property (nonatomic, assign) CFTimeInterval speed;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, assign) UIViewAnimationOptions animationOptions;
@property (nonatomic, copy) NSString *title;

@end

BubbleFloatingView* bubbleViewWithUIImageView(UIImageView* imageView);
