import { ReactNativeWalletCore } from './index';

export namespace HDWallet {
    export function createWallet(
        strength: number,
        passphrase: string
    ): Promise<string> {
        return ReactNativeWalletCore.createWallet(strength, passphrase);
    }
}
