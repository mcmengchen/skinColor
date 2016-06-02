//
//  ViewController.m
//  Skin
//
//  Created by william on 16/5/12.
//  Copyright © 2016年 Roobo. All rights reserved.
//

#import "ViewController.h"
#import "PDSkinTool.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (nonatomic, assign) NSInteger total;
/** 图片 */
@property (nonatomic, strong) UIImageView *imageV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.total =0 ;
    self.view.backgroundColor = [PDSkinColorTool skinToolBgColor];
    self.imageV = [[UIImageView alloc]initWithImage:[PDSkinColorTool skinToolWithImageName:@"image.png"]];
    self.imageV.center = self.view.center;
    [self.view addSubview:self.imageV];
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSInteger result = _total%3;
    NSLog(@"reuslt = %ld",result);
    if (result == 0) {
        [PDSkinColorTool setSkinColor:@"blue"];
        self.view.backgroundColor = [PDSkinColorTool skinToolBgColor];
        self.btn.backgroundColor = [PDSkinColorTool skinToolBtnColor];
        self.imageV.image = [PDSkinColorTool skinToolWithImageName:@"image.png"];
    }else if (result == 1){
        [PDSkinColorTool setSkinColor:@"green"];
        self.view.backgroundColor = [PDSkinColorTool skinToolBgColor];
        self.btn.backgroundColor = [PDSkinColorTool skinToolBtnColor];
        self.imageV.image = [PDSkinColorTool skinToolWithImageName:@"image.png"];
    }else{
        [PDSkinColorTool setSkinColor:@"red"];
        self.view.backgroundColor = [PDSkinColorTool skinToolBgColor];
        self.btn.backgroundColor = [PDSkinColorTool skinToolBtnColor];
        self.imageV.image = [PDSkinColorTool skinToolWithImageName:@"image.png"];
    }
    _total ++;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
