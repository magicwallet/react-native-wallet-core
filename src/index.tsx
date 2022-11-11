import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-react-native-wallet-core' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const ReactNativeWalletCore = NativeModules.ReactNativeWalletCore  ? NativeModules.ReactNativeWalletCore  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return ReactNativeWalletCore.multiply(a, b);
}

export function createWallet(
    strength: number,
    passphrase: string
): Promise<string> {
    return ReactNativeWalletCore.createWallet(strength, passphrase);
}

export function sha512(
  string: string
): Promise<string> {
  return ReactNativeWalletCore.sha512(string);
}