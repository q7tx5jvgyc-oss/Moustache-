#import <UIKit/UIKit.h>

@interface MoustacheView : UIView
@end

@implementation MoustacheView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        self.layer.cornerRadius = 12;

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
        label.text = @"Moustache Loaded 🔥";
        label.textColor = UIColor.whiteColor;
        [self addSubview:label];
    }

    return self;
}

@end

__attribute__((constructor))
static void init() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        UIWindow *window = UIApplication.sharedApplication.keyWindow;
        if (!window) return;

        MoustacheView *view = [[MoustacheView alloc] initWithFrame:CGRectMake(50, 150, 220, 80)];
        [window addSubview:view];

        NSLog(@"Moustache injected");
    });
}
