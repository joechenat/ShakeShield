#import <UIKit/UIKit.h>

static NSTimeInterval appLaunchTime;

%hook UIWindow

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime < 15)) {
        return;
    }
    %orig;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime < 15)) {
        return;
    }
    %orig;
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime < 15)) {
        return;
    }
    %orig;
}

%end

%hook UIResponder

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime < 15)) {
        return;
    }
    %orig;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime < 15)) {
        return;
    }
    %orig;
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime < 15)) {
        return;
    }
    %orig;
}

%end

%hook CMMotionManager

- (void)startAccelerometerUpdates {
    if ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) {
        %orig;
    }
}

- (void)startAccelerometerUpdatesToQueue:(id)queue withHandler:(id)handler {
    if ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) {
        %orig;
    }
}

- (void)startDeviceMotionUpdates {
    if ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) {
        %orig;
    }
}

- (void)startDeviceMotionUpdatesToQueue:(id)queue withHandler:(id)handler {
    if ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) {
        %orig;
    }
}

- (void)startGyroUpdates {
    if ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) {
        %orig;
    }
}

- (void)startGyroUpdatesToQueue:(id)queue withHandler:(id)handler {
    if ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) {
        %orig;
    }
}

- (BOOL)isAccelerometerActive {
    return ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) ? %orig : NO;
}

- (BOOL)isDeviceMotionActive {
    return ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) ? %orig : NO;
}

- (BOOL)isGyroActive {
    return ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) ? %orig : NO;
}

- (BOOL)isAccelerometerAvailable {
    return ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) ? %orig : NO;
}

- (BOOL)isDeviceMotionAvailable {
    return ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) ? %orig : NO;
}

- (BOOL)isGyroAvailable {
    return ([NSDate timeIntervalSinceReferenceDate] - appLaunchTime >= 15) ? %orig : NO;
}

%end

%ctor {
    appLaunchTime = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"%f",appLaunchTime);
}
