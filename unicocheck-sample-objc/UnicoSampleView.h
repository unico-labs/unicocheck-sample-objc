//
//  UnicoSampleView.h
//  unicocheck-sample-objc
//
//  Created by Matheus Domingos on 15/12/21.
//

#import <UIKit/UIKit.h>
#import <AcessoBio/AcessoBioManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnicoSampleView : UIViewController <AcessoBioManagerDelegate, AcessoBioSelfieDelegate, SelfieCameraDelegate> {
    AcessoBioManager *unicoCheck;
}

@end

NS_ASSUME_NONNULL_END
