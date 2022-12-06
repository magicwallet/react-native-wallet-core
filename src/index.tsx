import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-wallet-core' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const ReactNativeWalletCore = NativeModules.ReactNativeWalletCore ? NativeModules.ReactNativeWalletCore : new Proxy(
  {},
  {
    get() {
      throw new Error(LINKING_ERROR);
    },
  }
);

export function validateAddress(address: string, coin: number): Promise<boolean> {
  return ReactNativeWalletCore.validateAddress(address, coin);
}

export function createWallet(
  strength: number,
  passphrase: string
): Promise<string> {
  return ReactNativeWalletCore.createWallet(strength, passphrase);
}

export function sha512(
  value: string
): Promise<string> {
  return ReactNativeWalletCore.sha512(value);
}
