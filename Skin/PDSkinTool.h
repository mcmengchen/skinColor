//
//  PDSkinTool.h
//  Skin
//
//  Created by william on 16/5/12.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define PDSkinColorTool [PDSkinTool shared]
@interface PDSkinTool : NSObject

/**
 *  初始化
 *
 *  @return 实例对象
 */
+ (instancetype)shared;


/**
 *  设置皮肤的主题颜色
 *
 *  @param color 颜色
 */
- (void)setSkinColor:(NSString *)color;


/**
 *  返回图片
 *
 *  @param name 名称
 *
 */
- (UIImage *)skinToolWithImageName:(NSString *)name;


/**
 *  返回背景颜色
 *
 */
- (UIColor *)skinToolBgColor;
/**
 *  返回按钮颜色
 *
 *  @return 颜色
 */
- (UIColor *)skinToolBtnColor;
@end
