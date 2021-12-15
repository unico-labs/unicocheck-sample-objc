//
//  UnicoSampleView.m
//  unicocheck-sample-objc
//
//  Created by Matheus Domingos on 15/12/21.
//

#import "UnicoSampleView.h"
#import "UnicoTheme.h"

@interface UnicoSampleView ()

@end

@implementation UnicoSampleView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildViews];
    [self buildAcessoBio];
}

- (void)buildViews {
    UIButton *btOpenCamera = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 50, 50)];
    btOpenCamera.center = self.view.center;
    [btOpenCamera setTitle:@"Abrir câmera" forState:UIControlStateNormal];
    [btOpenCamera setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btOpenCamera setBackgroundColor:[UIColor systemBlueColor]];
    [btOpenCamera addTarget:self action:@selector(openCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btOpenCamera];
}

- (void)buildAcessoBio {
    unicoCheck = [[AcessoBioManager alloc]initWithViewController:self];
    [unicoCheck setTheme:[UnicoTheme new]];
}

#pragma mark - IBActions

- (void)openCamera {
    [[unicoCheck build] prepareSelfieCamera:self];
}


#pragma mark - SelfieCameraDelegate

- (void)onCameraReady:(id<AcessoBioCameraOpenerDelegate>)cameraOpener {
    [cameraOpener open:self];
}

- (void)onCameraFailed:(NSString *)message {
    NSLog(@"error message: %@", message);
}

#pragma mark - AcessoBioSelfieDelegate

- (void)onSuccessSelfie:(SelfieResult *)result {
    NSLog(@"base64 result: %@", result.base64);
}

- (void)onErrorSelfie:(ErrorBio *)errorBio {
    NSLog(@"code %lu | description: %@", errorBio.code, errorBio.desc);
}

#pragma mark - AcessoBioManagerDelegate Callbacks

- (void)onErrorAcessoBioManager:(ErrorBio *)error {
    NSLog(@"code %lu | description: %@", error.code, error.desc);
}

- (void)onUserClosedCameraManually {
    NSLog(@"session expired. system closed camera");
}

- (void)onSystemChangedTypeCameraTimeoutFaceInference {
    NSLog(@"face not found. type of camera changed to default (no smart)");
}

- (void)onSystemClosedCameraTimeoutSession {
    NSLog(@"session expired. system closed camera");
}


@end
