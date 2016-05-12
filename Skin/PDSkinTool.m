//
//  PDSkinTool.m
//  Skin
//
//  Created by william on 16/5/12.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "PDSkinTool.h"
#import "PDSkinToolConfig.h"

#define kSkinColor @"skin_color"
@implementation PDSkinTool
static NSString *_color;

+ (void)initialize
{
    //1. 开始，从沙盒中取之前存储的皮肤颜色
    _color = [[NSUserDefaults standardUserDefaults] objectForKey:kSkinColor];
    //2. 之前没有存储，取出为空
    if (_color == nil) {
        _color = @"blue";
    }
}
#pragma mark - action: 初始化
+ (instancetype)shared{
    static PDSkinTool * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PDSkinTool alloc]init];
    });
    return manager;
}

#pragma mark - action: 设置当前的主题
- (void)setSkinColor:(NSString *)color{
    _color = color;
    // 对皮肤颜色进行保存
    [[NSUserDefaults standardUserDefaults] setObject:color forKey:kSkinColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


#pragma mark ------------------- 获取图片 ------------------------
#pragma mark - action: 根据主题取图片
- (UIImage *)skinToolWithImageName:(NSString *)name
{
    // 1.获取文件所在的位置
    NSString *imageName = [NSString stringWithFormat:@"skinColor/%@/%@", _color, name];
    // 2.获取plist的路径
    NSString *resourceBundle = [[NSBundle mainBundle] pathForResource:@"skin" ofType:@"bundle"];
    NSString *plistPath = [[NSBundle bundleWithPath:resourceBundle] pathForResource:imageName ofType:nil];
//    return [UIImage imageNamed:imageName];
    UIImage *img = [UIImage imageWithContentsOfFile:plistPath];
    return img;

}

#pragma mark ------------------- 获取颜色 ------------------------
#pragma mark - action: 获取页面背景颜色
- (UIColor *)skinToolBgColor{
    return [self getColorWithKey:Back_Color];
}
#pragma mark - action: 获取按钮方法
- (UIColor *)skinToolBtnColor{
    return [self getColorWithKey:Btn_Back_Color];
}



#pragma mark - action: 公共获取颜色方法
/**
 *  公共获取颜色方法
 *
 *  @param key 返回的颜色根据传递进来的 key 进行改变
 *
 *  @return 返回颜色
 */
- (UIColor *)getColorWithKey:(NSString *)key{
    // 1.获取文件所在的位置
    NSString *filePath = [NSString stringWithFormat:@"skinColor/%@/color.plist", _color];
    // 2.获取plist的路径
    NSString *resourceBundle = [[NSBundle mainBundle] pathForResource:@"skin" ofType:@"bundle"];
    NSString *plistPath = [[NSBundle bundleWithPath:resourceBundle] pathForResource:filePath ofType:nil];
    // 3.读取plist当中的数据
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    // 4.将字典当中的值取出
    NSString *bgStr = colorDict[key];
    // 5.将颜色的字符串截取
    NSArray *bgArray = [bgStr componentsSeparatedByString:@","];
    // 6.取出颜色的r,g,b数值
    CGFloat red = [bgArray[0] floatValue];
    CGFloat green = [bgArray[1] floatValue];
    CGFloat blue = [bgArray[2] floatValue];
    // 7.返回当前皮肤的颜色
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}



@end
