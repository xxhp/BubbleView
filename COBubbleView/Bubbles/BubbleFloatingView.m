//
//  BubbleFloatingView.m
//  COBubbleView
//
//  Created by Manoj Mahapatra on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BubbleFloatingView.h"

@interface BubbleFloatingView ()

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *imageView;

@end

@implementation BubbleFloatingView

@synthesize imageView = __imageView;
@synthesize titleLabel = __titleLabel;
@synthesize destination = __destination;
@synthesize speed = __speed;
@dynamic image;
@dynamic title;
@synthesize animationOptions;

- (void)dealloc {
    self.imageView = nil;
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (UIImage *)image {
    return self.imageView.image;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (NSString *)title {
    return self.titleLabel.text;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (UILabel *)titleLabel {
    if (!__titleLabel) {
        __titleLabel = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 10.0f, 10.0f)];
        __titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        __titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
        __titleLabel.font = [UIFont systemFontOfSize:20.0f];
        __titleLabel.backgroundColor = [UIColor clearColor];
        __titleLabel.textColor = [UIColor whiteColor];
        __titleLabel.textAlignment = UITextAlignmentCenter;
        __titleLabel.numberOfLines = 0;
        [self addSubview:__titleLabel];
    }
    
    return __titleLabel;
}


- (UIImageView *)imageView {
    if (!__imageView) {
        __imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        __imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self insertSubview:__imageView belowSubview:self.titleLabel];
    }
    
    return __imageView;
}

@end

BubbleFloatingView* bubbleViewWithUIImageView(UIImageView* imageView)
{
	BubbleFloatingView * bubbleView = [[[BubbleFloatingView alloc] initWithFrame:imageView.frame] autorelease];
    bubbleView.image = imageView.image;
	return bubbleView;
}
