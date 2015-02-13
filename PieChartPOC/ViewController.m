//
//  ViewController.m
//  PieChartPOC
//
//  Created by Rodrigo Souza Henriques on 2/13/15.
//  Copyright (c) 2015 Rodrigo Souza Henriques. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.slices = [NSMutableArray arrayWithCapacity:2];
    
    NSNumber *aprovadas = [NSNumber numberWithInteger:90];
    NSNumber *negadas = [NSNumber numberWithInteger:20];
    
    [_slices addObject:aprovadas];
    [_slices addObject:negadas];
    
    _pieChart.dataSource = self;
    _pieChart.startPieAngle = M_2_PI;
    _pieChart.animationSpeed = 1.0;
    _pieChart.labelRadius = _pieChart.pieRadius * 1.2;
    _pieChart.showPercentage = YES;
    _pieChart.backgroundColor = [UIColor whiteColor];
    _pieChart.userInteractionEnabled = YES;
    _pieChart.labelShadowColor = [UIColor grayColor];
    _pieChart.labelColor = [UIColor blackColor];
    _pieChart.labelFont = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
    
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor blackColor],
                       [UIColor grayColor],nil];
    
    _viewColorSliceOne.backgroundColor = [_sliceColors objectAtIndex:0];
    _viewColorSliceTwo.backgroundColor = [_sliceColors objectAtIndex:1];
    
    _labelSliceOne.text = @"Transações aprovadas";
    _labelSliceTwo.text = @"Transações negadas";
    
    [_pieChart reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d", index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d", index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d", index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
//    self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}


@end
