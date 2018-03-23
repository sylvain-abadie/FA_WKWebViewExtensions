//
//  WKWebView+accessoryView.h
//  Pods
//
//  Created by Sylvain Abadie on 3/23/18.
//


#import <WebKit/WebKit.h>
#import <objc/runtime.h>

@interface WKWebView (WKWebViewAccessoryView)

- (void) removeInputAccessoryView;

@end

@interface _NoInputAccessoryView : NSObject

@end

@implementation _NoInputAccessoryView

- (id)inputAccessoryView {
  return nil;
}

@end


