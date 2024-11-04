@import UIKit;
@import CoreMotion;

static NSTimeInterval gAppLaunchedAt = 0;
static BOOL gShouldBlockShakeGesture = YES;

static BOOL shouldBlockShakeGesture() {
    if (!gShouldBlockShakeGesture) {
        return NO;
    }
    gShouldBlockShakeGesture = ([NSDate timeIntervalSinceReferenceDate] - gAppLaunchedAt < 15.0);
    return gShouldBlockShakeGesture;
}

%hook UIWindow

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

%end

%hook UIResponder

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake && shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

%end

%hook CMMotionManager

- (CMGyroData *)gyroData {
	if (shouldBlockShakeGesture()) {
		return nil;
	}
	return %orig;
}

- (void)startAccelerometerUpdates {
    if (shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)startAccelerometerUpdatesToQueue:(id)queue withHandler:(id)handler {
    if (shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)startDeviceMotionUpdates {
    if (shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)startDeviceMotionUpdatesToQueue:(id)queue withHandler:(id)handler {
    if (shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)startGyroUpdates {
    if (shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (void)startGyroUpdatesToQueue:(id)queue withHandler:(id)handler {
    if (shouldBlockShakeGesture()) {
        return;
    }
    %orig;
}

- (BOOL)isAccelerometerActive {
    if (shouldBlockShakeGesture()) {
        return NO;
    }
    return %orig;
}

- (BOOL)isDeviceMotionActive {
    if (shouldBlockShakeGesture()) {
        return NO;
    }
    return %orig;
}

- (BOOL)isGyroActive {
    if (shouldBlockShakeGesture()) {
        return NO;
    }
    return %orig;
}

- (CMAccelerometerData *)accelerometerData {
	if (shouldBlockShakeGesture()) {
		return nil;
	}
	return %orig;
}

%end

%ctor {
    gAppLaunchedAt = [NSDate timeIntervalSinceReferenceDate];
#if DEBUG
    NSLog(@"[ShakeShield] launched at: %.3f", gAppLaunchedAt);
#endif
}
