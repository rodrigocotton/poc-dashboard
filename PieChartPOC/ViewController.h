//
//  ViewController.h
//  PieChartPOC
//
//  Created by Rodrigo Souza Henriques on 2/13/15.
//  Copyright (c) 2015 Rodrigo Souza Henriques. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface ViewController : UIViewController <XYPieChartDelegate, XYPieChartDataSource>

@property (strong, nonatomic) IBOutlet XYPieChart *pieChart;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;


@property (weak, nonatomic) IBOutlet UIView *viewColorSliceOne;
@property (weak, nonatomic) IBOutlet UIView *viewColorSliceTwo;

@property (weak, nonatomic) IBOutlet UILabel *labelSliceOne;
@property (weak, nonatomic) IBOutlet UILabel *labelSliceTwo;

@end

