//
//  WKWebView+focus.m
//  ios
//
//  Created by Sylvain Abadie on 3/20/18.
//  Copyright © 2018 Front. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKWebView+focus.h"

@implementation WKWebView (WKWebViewFocus)

+ (void)allowDisplayingKeyboardWithoutUserAction {
  Class class = NSClassFromString(@"WKContentView");
  NSOperatingSystemVersion iOS_11_3_0 = (NSOperatingSystemVersion){11, 3, 0};
  NSOperatingSystemVersion iOS_12_2_0 = (NSOperatingSystemVersion){12, 2, 0};
  char * methodSignature = "_startAssistingNode:userIsInteracting:blurPreviousNode:changingActivityState:userObject:";
  
  if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion: iOS_12_2_0]) {
    methodSignature = "_elementDidFocus:userIsInteracting:blurPreviousNode:changingActivityState:userObject:";
  }
  
  if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion: iOS_11_3_0]) {
    SEL selector = sel_getUid(methodSignature);
    Method method = class_getInstanceMethod(class, selector);
    IMP original = method_getImplementation(method);
    IMP overridee = imp_implementationWithBlock(^void(id me, void* arg0, BOOL arg1, BOOL arg2, BOOL arg3, id arg4) {
      ((void (*)(id, SEL, void*, BOOL, BOOL, BOOL, id))original)(me, selector, arg0, TRUE, arg2, arg3, arg4);
    });
    method_setImplementation(method, overridee);
  } else {
    SEL selector = sel_getUid("_startAssistingNode:userIsInteracting:blurPreviousNode:userObject:");
    Method method = class_getInstanceMethod(class, selector);
    IMP original = method_getImplementation(method);
    IMP overridee = imp_implementationWithBlock(^void(id me, void* arg0, BOOL arg1, BOOL arg2, id arg3) {
      ((void (*)(id, SEL, void*, BOOL, BOOL, id))original)(me, selector, arg0, TRUE, arg2, arg3);
    });
    method_setImplementation(method, overridee);
  }
}

@end
