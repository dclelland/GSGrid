//
//  GSGrid.m
//  GASP
//
//  Created by Daniel Clelland on 18/06/15.
//  Copyright (c) 2015 Protonome. All rights reserved.
//

#import "GSGrid.h"

GSGridPoint GSGridPointMake(NSInteger x, NSInteger y)
{
    return (GSGridPoint){
        .x = x,
        .y = y
    };
}

GSGridSize GSGridSizeMake(NSInteger columns, NSInteger rows)
{
    return (GSGridSize){
        .columns = columns,
        .rows = rows
    };
}

GSGridRect GSGridRectMake(NSInteger x, NSInteger y, NSInteger columns, NSInteger rows)
{
    return (GSGridRect){
        .origin.x = x,
        .origin.y = y,
        .size.columns = columns,
        .size.rows = rows
    };
}

GSGrid GSGridMake(GSGridSize size, CGRect bounds, CGSize gutter)
{
    return (GSGrid){
        .size = size,
        .bounds = bounds,
        .gutter = gutter
    };
}

CGRect CGRectWithGridRectInGrid(GSGridRect rect, GSGrid grid)
{
    CGFloat width = (CGRectGetWidth(grid.bounds) + grid.gutter.width) / grid.size.columns;
    CGFloat height = (CGRectGetHeight(grid.bounds) + grid.gutter.height) / grid.size.rows;

    CGFloat left = round(width * rect.origin.x);
    CGFloat top = round(height * rect.origin.y);

    CGFloat right = round(width * (rect.origin.x + rect.size.columns) - grid.gutter.width);
    CGFloat bottom = round(height * (rect.origin.y + rect.size.rows) - grid.gutter.height);

    return CGRectMake(left, top, right - left, bottom - top);
}

CGRect CGRectWithIndexInGrid(NSUInteger index, GSGrid grid)
{
    GSGridRect rect = GSGridRectMake(index % grid.size.columns, index / grid.size.columns, 1, 1);
    
    return CGRectWithGridRectInGrid(rect, grid);
}
