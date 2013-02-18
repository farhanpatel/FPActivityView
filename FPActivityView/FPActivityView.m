//
//  FPActivityView.m
//  
//  Copyright (c) 2012 Farhan Patel
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "FPActivityView.h"

@interface FPActivityView ()

@property(strong)UIImageView* activityImageView;

@end


@implementation FPActivityView
@synthesize activityImageView;

- (id)initWithFrame:(CGRect)frame andActivityBar:(UIImage*)image
{
    self = [super initWithFrame:frame];
    if (self) {
        int barWidth = self.frame.size.width/3;
        activityImageView = [[UIImageView alloc] initWithFrame:CGRectMake(barWidth, 0, barWidth, frame.size.height)];
        activityImageView.image = image;
    }
    return self;
}

-(void)start {
    [activityImageView.layer removeAllAnimations];
    
    int barWidth = self.frame.size.width/3;
    
    activityImageView.transform = CGAffineTransformIdentity;
    activityImageView.frame = CGRectMake(barWidth, 0, barWidth, self.frame.size.height);
    [self addSubview:activityImageView];
    

    typedef void (^completionBlock)(BOOL);
    
    completionBlock move = ^(BOOL finished){
        [UIView animateWithDuration:1
                              delay:0.0
                            options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse
                         animations:^{
                             activityImageView.transform = CGAffineTransformMakeTranslation(-activityImageView.frame.origin.x+barWidth, 0);
                         }
                         completion:nil
         ];
    };
    
    //move to the right
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         activityImageView.transform = CGAffineTransformMakeTranslation(activityImageView.frame.origin.x, 0);
                     }
                     completion:move
     ];
}

-(void)stop {
    [activityImageView.layer removeAllAnimations];
    [activityImageView removeFromSuperview];
}



@end
