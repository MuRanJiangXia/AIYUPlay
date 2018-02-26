//
//  Header.h
//  AIYUPlay
//
//  Created by cyan on 2018/2/18.
//  Copyright © 2018年 cyan. All rights reserved.
//

#ifndef Header_h
#define Header_h

/** 用十六进制创建颜色*/
#define UIColorFromRGB(rgbValue, alp)                                                                                                      \
[UIColor colorWithRed:((float) ((rgbValue & 0xFF0000) >> 16)) / 255.0                                                                  \
green:((float) ((rgbValue & 0x00FF00) >> 8)) / 255.0                                                                   \
blue:((float) (rgbValue & 0x0000FF)) / 255.0                                                                          \
alpha:(float) alp]

// 屏幕宽度
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height




#endif /* Header_h */
