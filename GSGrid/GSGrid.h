//
//  GSGrid.h
//  GASP
//
//  Created by Daniel Clelland on 18/06/15.
//  Copyright (c) 2015 Protonome. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

typedef struct GSGridPoint {
    NSInteger x;
    NSInteger y;
} GSGridPoint;

typedef struct GSGridSize {
    NSInteger columns;
    NSInteger rows;
} GSGridSize;

typedef struct GSGridRect {
    GSGridPoint origin;
    GSGridSize size;
} GSGridRect;

typedef struct GSGrid {
    GSGridSize size;
    CGRect bounds;
    CGSize gutter;
} GSGrid;

GSGridPoint GSGridPointMake(NSInteger x, NSInteger y);
GSGridSize GSGridSizeMake(NSInteger columns, NSInteger rows);
GSGridRect GSGridRectMake(NSInteger x, NSInteger y, NSInteger columns, NSInteger rows);
GSGrid GSGridMake(GSGridSize size, CGRect bounds, CGSize gutter);

CGRect CGRectWithGridRectInGrid(GSGridRect rect, GSGrid grid);
CGRect CGRectWithIndexInGrid(NSUInteger index, GSGrid grid);
