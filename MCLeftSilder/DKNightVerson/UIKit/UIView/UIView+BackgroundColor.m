//
//  UIView+BackgroundColor.m
//  UIView+BackgroundColor
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UIView+BackgroundColor.h"
#import "DKNightVersionManager.h"
#import "objc/runtime.h"

@interface UIView ()

@end

@implementation UIView (BackgroundColor)

- (UIColor *)nightBackgroundColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightBackgroundColor));
    if (nightColor) {
        return nightColor;
    } else if (self.normalBackgroundColor) {
        return self.normalBackgroundColor;
    } else {
        return self.backgroundColor;
    }
}

- (void)setNightBackgroundColor:(UIColor *)nightBackgroundColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        if (!self.normalBackgroundColor) {
            self.normalBackgroundColor = self.backgroundColor;
        }
        [self setBackgroundColor:nightBackgroundColor];
    } else {
        [self setBackgroundColor:self.normalBackgroundColor];
    }
    objc_setAssociatedObject(self, @selector(nightBackgroundColor), nightBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalBackgroundColor {
    return objc_getAssociatedObject(self, @selector(normalBackgroundColor));
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal) {
        [self setBackgroundColor:normalBackgroundColor];
    } else {
        [self setBackgroundColor:self.nightBackgroundColor];
    }
    objc_setAssociatedObject(self, @selector(normalBackgroundColor), normalBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end