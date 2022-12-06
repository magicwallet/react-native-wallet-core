#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReactNativeWalletCore, NSObject)

RCT_EXTERN_METHOD(validateAddress:(NSString)address withCoin:(nonnull NSNumber)coin
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(createWallet:(nonnull NSNumber)strength withPassphrase:(NSString)passphrase
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup {
  return NO;
}

@end
