#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AcessoBio.h"
#import "ErrorBio.h"
#import "ErrorPrepare.h"
#import "UIColorExtensions.h"
#import "UnicoCheck.h"
#import "UnicoCheckMapCallbacks.h"
#import "UnicoCheckThemes.h"
#import "UnicoCheckThemesDelegate.h"
#import "AcessoBioCameraDelegate.h"
#import "AcessoBioCameraImpl.h"
#import "AcessoBioCameraOpener.h"
#import "AcessoBioCameraOpenerDelegate.h"
#import "AcessoBioDocumentDelegate.h"
#import "AcessoBioManager.h"
#import "AcessoBioManagerDelegate.h"
#import "AcessoBioSelfieDelegate.h"
#import "AcessoBioThemeDelegate.h"
#import "DocumentCameraDelegate.h"
#import "DocumentType.h"
#import "iAcessoBioBuilder.h"
#import "SelfieCameraDelegate.h"
#import "AcessoBioConstants.h"
#import "CIFaceFeatureNormalize.h"
#import "FaceAnalyze.h"
#import "FixedValues.h"
#import "SensorsDevice.h"
#import "CircleUtilsDebug.h"
#import "DeviceUtils.h"
#import "UIImageUtils.h"
#import "CameraFaceView.h"
#import "CameraMain.h"
#import "DocumentInsertView.h"
#import "UIViewWithHole.h"

FOUNDATION_EXPORT double AcessoBioVersionNumber;
FOUNDATION_EXPORT const unsigned char AcessoBioVersionString[];

