GSGrid
======

CXSwipeNavigation is a series of classes that allows you to swipe vertically between `UITableView` and `UICollectionView`. Uses the interactive transitions API for reversability.

GSGrid is a set of basic structs to help build basic grid layouts.

It allows you to specify a GSGrid structure with a number of rows and columns, a bounds, and a gutter width and height, and then calculate CGRects within that grid.

For example:

    GSGrid grid = GSGridMake(GSGridSizeMake(2, 2), CGRectMake(0.0, 0.0, 60.0, 60.0), CGSizeMake(2.0, 2.0));

    CGRect rect = CGRectWithGridRectInGrid(GSGridRectMake(0, 0, 1, 1), grid);

    NSLog(@"%@", NSStringFromCGRect(rect));

    > {{0, 0}, {29, 29}}

Returns the first cell in a 2 by 2 grid of 60pt square, with a vertical and horizontal gutter of 2pt.

The hard work of rounding the rect to integer number of pixels is taken care of automatically, so that a constant gutter appears between adjacent rects.
