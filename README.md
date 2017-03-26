GSGrid
======

GSGrid is deprecated in favour of [GridSpan](https://github.com/dclelland/GridSpan).

---

`GSGrid` is a set of basic structs to help build basic grid layouts.

It allows you to specify a `GSGrid` structure with a number of rows and columns, a bounds, and a gutter width and height, and then calculate `CGRect`s within that grid.

For example:

```objc
GSGrid grid = GSGridMake(GSGridSizeMake(2, 2), CGRectMake(0.0, 0.0, 60.0, 60.0), CGSizeMake(2.0, 2.0));

CGRect rect = CGRectWithGridRectInGrid(GSGridRectMake(0, 0, 1, 1), grid);

NSLog(@"%@", NSStringFromCGRect(rect));

> {{0, 0}, {29, 29}}
```

This returns the first cell in a 2 by 2 grid of 60pt square, with a vertical and horizontal gutter of 2pt.

The hard work of rounding the rect to integer number of pixels is taken care of automatically, so that a constant gutter appears between adjacent rects.

## API

### Constructors

```objc
GSGridPoint GSGridPointMake(NSInteger x, NSInteger y);
GSGridSize GSGridSizeMake(NSInteger columns, NSInteger rows);
GSGridRect GSGridRectMake(NSInteger x, NSInteger y, NSInteger columns, NSInteger rows);
GSGrid GSGridMake(GSGridSize size, CGRect bounds, CGSize gutter);
```

### Functions

```objc
CGRect CGRectWithGridRectInGrid(GSGridRect rect, GSGrid grid);
CGRect CGRectWithIndexInGrid(NSUInteger index, GSGrid grid);
```
