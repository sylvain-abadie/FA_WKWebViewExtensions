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
// From https://stackoverflow.com/questions/32449870/programmatically-focus-on-a-form-in-a-webview-wkwebview

+ (void)allowDisplayingKeyboardWithoutUserAction {
  Class class = NSClassFromString(@"WKContentView");
  NSOperatingSystemVersion iOS_11_3_0 = (NSOperatingSystemVersion){11, 3, 0};
  NSOperatingSystemVersion iOS_12_2_0 = (NSOperatingSystemVersion){12, 2, 0};
  NSOperatingSystemVersion iOS_13_0_0 = (NSOperatingSystemVersion){13, 0, 0};
  if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion: iOS_13_0_0]) {
    SEL selector = sel_getUid("_elementDidFocus:userIsInteracting:blurPreviousNode:activityStateChanges:userObject:");
    Method method = class_getInstanceMethod(class, selector);
    IMP original = method_getImplementation(method);
    IMP override = imp_implementationWithBlock(^void(id me, void* arg0, BOOL arg1, BOOL arg2, BOOL arg3, id arg4) {
      ((void (*)(id, SEL, void*, BOOL, BOOL, BOOL, id))original)(me, selector, arg0, TRUE, arg2, arg3, arg4);
    });
    method_setImplementation(method, override);
  }
  else if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion: iOS_12_2_0]) {
    SEL selector = sel_getUid("_elementDidFocus:userIsInteracting:blurPreviousNode:changingActivityState:userObject:");
    Method method = class_getInstanceMethod(class, selector);
    IMP original = method_getImplementation(method);
    IMP override = imp_implementationWithBlock(^void(id me, void* arg0, BOOL arg1, BOOL arg2, BOOL arg3, id arg4) {
      ((void (*)(id, SEL, void*, BOOL, BOOL, BOOL, id))original)(me, selector, arg0, TRUE, arg2, arg3, arg4);
    });
    method_setImplementation(method, override);
  }
  else if ([[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion: iOS_11_3_0]) {
    SEL selector = sel_getUid("_startAssistingNode:userIsInteracting:blurPreviousNode:changingActivityState:userObject:");
    Method method = class_getInstanceMethod(class, selector);
    IMP original = method_getImplementation(method);
    IMP override = imp_implementationWithBlock(^void(id me, void* arg0, BOOL arg1, BOOL arg2, BOOL arg3, id arg4) {
      ((void (*)(id, SEL, void*, BOOL, BOOL, BOOL, id))original)(me, selector, arg0, TRUE, arg2, arg3, arg4);
    });
    method_setImplementation(method, override);
  } else {
    SEL selector = sel_getUid("_startAssistingNode:userIsInteracting:blurPreviousNode:userObject:");
    Method method = class_getInstanceMethod(class, selector);
    IMP original = method_getImplementation(method);
    IMP override = imp_implementationWithBlock(^void(id me, void* arg0, BOOL arg1, BOOL arg2, id arg3) {
      ((void (*)(id, SEL, void*, BOOL, BOOL, id))original)(me, selector, arg0, TRUE, arg2, arg3);
    });
    method_setImplementation(method, override);
  }
}

@end
