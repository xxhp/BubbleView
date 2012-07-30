//
//  BubbleSpaceView.m
//  COBubbleView
//
//  Created by Manoj Mahapatra on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BubbleSpaceView.h"
#import <QuartzCore/QuartzCore.h>

@interface BubbleSpaceView ()

@property (nonatomic, retain) NSMutableArray* floatingViews;
@property (nonatomic, assign) BOOL animationsStarted;
@property (nonatomic, assign) BOOL animationsPaused;

@end

@implementation BubbleSpaceView

@synthesize floatingViews = __floatingViews;
@synthesize animationsStarted = __animationsStarted;
@synthesize animationsPaused = __animationsPaused;


#pragma mark - Init Methods

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        __floatingViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		self.backgroundColor = [UIColor clearColor];
		__floatingViews = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc
{
	[__floatingViews release];
	[super dealloc];
}


#pragma mark - Public Methods

#pragma mark -

- (void)addFloatingView:(BubbleFloatingView *)floatingView {
	[self.floatingViews addObject:floatingView];
    [self addSubview:floatingView];
}

- (void)animateFloatingView:(BubbleFloatingView *)view {
	if (view.isHidden) {
		view.hidden = NO;
	}
	UIViewAnimationOptions options = view.animationOptions ? view.animationOptions : (UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat);
	[UIView animateWithDuration:view.speed delay:0 options:options animations:^{
		view.center = view.destination;
	} completion:NULL];
}



- (void)startAnimations
{
    if (__animationsStarted == NO)
    {
		for (int i = 0; i < [self.floatingViews count]; i++) {
			BubbleFloatingView* nextBubble = [self.floatingViews objectAtIndex:i];
			NSTimeInterval delay = i * nextBubble.speed / [self.floatingViews count];
			[self performSelector:@selector(animateFloatingView:) withObject:nextBubble afterDelay:delay];
		}
	}
	__animationsStarted = YES;
}

- (void)reset
{
	[__floatingViews removeAllObjects];
	for(UIView *view in self.subviews)
	{
		[view removeFromSuperview];
	}
	__animationsStarted=NO;
}

@end