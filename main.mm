#import <UIKit/UIKit.h>

static BOOL isEnabled = NO;
static float speedValue = 1.0;

@interface FloatingMenu : UIView
@end

@implementation FloatingMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        self.layer.cornerRadius = 14;

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 180, 20)];
        title.text = @"Moustache Menu";
        title.textColor = UIColor.whiteColor;
        title.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:title];

        UIButton *start = [UIButton buttonWithType:UIButtonTypeSystem];
        start.frame = CGRectMake(10, 35, 80, 30);
        [start setTitle:@"Start" forState:UIControlStateNormal];
        [start setTitleColor:UIColor.greenColor forState:UIControlStateNormal];
        [start addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:start];

        UIButton *stop = [UIButton buttonWithType:UIButtonTypeSystem];
        stop.frame = CGRectMake(100, 35, 80, 30);
        [stop setTitle:@"Stop" forState:UIControlStateNormal];
        [stop setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [stop addTarget:self action:@selector(stopAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:stop];

        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 75, 170, 20)];
        slider.minimumValue = 0.5;
        slider.maximumValue = 3.0;
        slider.value = 1.0;
        [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider];
    }

    return self;
}

- (void)startAction {
    isEnabled = YES;
    NSLog(@"[Moustache] Started");
}

- (void)stopAction {
    isEnabled = NO;
    NSLog(@"[Moustache] Stopped");
}

- (void)sliderChanged:(UISlider *)slider {
    speedValue = slider.value;
    NSLog(@"Speed: %f", speedValue);
}

// سحب القائمة
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:self.superview];
    self.center = pos;
}

@end

__attribute__((constructor))
static void init_tweak() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        UIWindow *window = UIApplication.sharedApplication.keyWindow;
        if (!window) return;

        FloatingMenu *menu = [[FloatingMenu alloc] initWithFrame:CGRectMake(60, 150, 200, 110)];
        [window addSubview:menu];

        NSLog(@"[Moustache] Loaded Successfully 🔥");
    });
}
