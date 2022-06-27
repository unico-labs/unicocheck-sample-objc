//
//  UnicoSampleView.m
//  unicocheck-sample-objc
//
//  Created by Matheus Domingos on 15/12/21.
//

#import "UnicoSampleView.h"
#import "UnicoTheme.h"
#import "UnicoConfig.h"
#import <AcessoBio/AcessoBio-Swift.h>

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
    /*
         Para utilizar a Câmera Normal:
         
             [unicoCheck setSmartFrame:false];
             [unicoCheck setAutoCapture:false];
             [[unicoCheck build]prepareSelfieCamera:self];
         
         Para utilizar a Câmera Inteligente:
         
             [unicoCheck setSmartFrame:true];
             [unicoCheck setAutoCapture:true];
             [[unicoCheck build]prepareSelfieCamera:self jsonConfigName: @""];
         
         Para utlizar o Prova de Vidas com Interação:
         */
    
        /// with AcessoBioConfigDataSource implementation
        [[unicoCheck build] prepareSelfieCamera:self config: [UnicoConfig new]];

        // or

        /// with JSON config
        //  [[unicoCheck build] prepareSelfieCamera:self jsonConfigName: @""];
}
/*
 Para gerar o arquivo json é necessário criar uma API key. Siga os passos abaixo:
 - Acesse o portal do cliente da unico com suas credenciais;
 - Navegue em Configurações > Integração > API Key;
 - Crie ou edite uma nova API Key;
 - Marque o campo "Utiliza liveness ativo" como SIM caso queira habilitar a câmera Prova de Vidas ou NÃO caso queira utilizar a Câmera Normal ou Inteligente;
 - Marque o campo "Utiliza autenticação segura na SDK" como SIM;
 - Expanda a seção SDK iOS, adicione o nome de sua aplicação iOS e o Bundle ID;
 - Salve as alterações;
 - Neste momento, retornará para a página de API Key e ao lado da API Key desejada, pressione o botão de download do Bundle;
 - Selecione a opção iOS;
 - Clique em "Gerar";
 Atenção: Uma nova aba será aberta contendo informações do projeto em formato JSON.
 Caso a nova aba não abra, por favor, verifique se o seu navegador está bloqueando os popups.
 - Salve o conteúdo desta nova aba em um novo arquivo JSON;
 - Adicione o arquivo salvo no seu projeto e adicione abaixo o nome do arquivo json no "jsonConfigName".
 */

#pragma mark - SelfieCameraDelegate

- (void)onCameraReady:(id<AcessoBioCameraOpenerDelegate>)cameraOpener {
    [cameraOpener open:self];
}

/*
 Com a nova versão, o método onCameraFailed também foi alterado, segue o exemplo abaixo:
 */
- (void)onCameraFailed:(ErrorPrepare *)message {
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
