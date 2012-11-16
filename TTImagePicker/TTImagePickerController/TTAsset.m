//
//  TTAsset.m
//  MultiImagePickerDemo
//
//  Created by Jason Lee on 12-11-1.
//  Copyright (c) 2012年 Jason Lee. All rights reserved.
//

#import "TTAsset.h"

//static NSInteger totalSelectedCount = 0;

@implementation TTAsset

- (void)dealloc
{
    [_totalSelectedCount release];
    [_asset release];
    [_maskImageView release];
    //
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.totalSelectedCount = [NSNumber numberWithInteger:0];
    }
    return self;
}

- (id)initWithAsset:(ALAsset *)asset
{
    self = [super init];
    if (self) {
        self.asset = asset;
        
        CGRect rect = (CGRect){0, 0, PHOTO_THUMBNAIL_DEFAULT_SIZE};
        
        UIImageView *assetImageView = [[UIImageView alloc] initWithFrame:rect];
		[assetImageView setContentMode:UIViewContentModeScaleToFill];
		[assetImageView setImage:[UIImage imageWithCGImage:[self.asset thumbnail]]];
		[self addSubview:assetImageView];
		[assetImageView release], assetImageView = nil;
        
        _maskImageView = [[UIImageView alloc] initWithFrame:rect];
		[_maskImageView setImage:[UIImage imageNamed:@"TTThumbnailCheckMask"]];
		[_maskImageView setHidden:YES];
		[self addSubview:_maskImageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)thumbnailDidToggle
{
    NSLog(@"thumbnailDidToggle");

//    NSLog(@"before totalSelectedCount is %d",self.totalSelectedCount.integerValue);
//    NSLog(@"!self.selected is %d",!self.selected);
//    if ((self.totalSelectedCount.integerValue >= 20) && !self.selected) {
//        NSLog(@"in return totalSelectedCount is %d",self.totalSelectedCount.integerValue);
//        return ;
//    }
//    
//    self.selected = !self.selected;
//    _maskImageView.hidden = !self.selected;
//    
//    if (self.selected) {
//        self.totalSelectedCount = [NSNumber numberWithInteger:(self.totalSelectedCount.integerValue + 1)];
//    } else {
//        self.totalSelectedCount = [NSNumber numberWithInteger:(self.totalSelectedCount.integerValue - 1)];
//    }
//    NSLog(@"totalSelectedCount is %d",self.totalSelectedCount.integerValue);
    if (self.delegate && [self.delegate respondsToSelector:@selector(thumbnailDidClick:)]) {
        [self.delegate performSelector:@selector(thumbnailDidClick:) withObject:self];
    }
}

@end
