//
//  WKWebView+WkWebView_focus.h
//  ios
//
//  Created by Sylvain Abadie on 3/20/18.
//  Copyright © 2018 Front. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <objc/runtime.h>

@interface WKWebView (WKWebViewFocus)

+ (void)allowDisplayingKeyboardWithoutUserAction;

@end

