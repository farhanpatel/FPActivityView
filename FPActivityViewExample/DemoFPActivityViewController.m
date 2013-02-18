//
//  DemoFPActivityViewController.m
//  FPActivityViewExample
//
//  Created by Farhan on 2013-02-17.
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

#import "DemoFPActivityViewController.h"
#import "FPActivityView.h"

@interface DemoFPActivityViewController ()

@end

@implementation DemoFPActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImage* activityImage = [[UIImage imageNamed:@"download-bar"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 1, 0, 1)];
    FPActivityView* activityView = [[FPActivityView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 4) andActivityBar:activityImage];
    [activityView start];
    [self.view addSubview:activityView];
    
    
    //Extra buttons just for the demo
    UIButton* startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2-44)];
    [startButton addTarget:activityView action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
    UIButton* stopButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    [stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [stopButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+44)];
    [stopButton addTarget:activityView action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
