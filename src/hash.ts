import { ReactNativeWalletCore } from './index';

export namespace Hash {
    export function sha3_256(
        value: string
    ): Promise<string> {
        return ReactNativeWalletCore.sha3_256(value);
    }
    export function sha256(
        value: string
    ): Promise<string> {
        return ReactNativeWalletCore.sha256(value);
    }
    export function keccak256(
        value: string
    ): Promise<string> {
        return ReactNativeWalletCore.keccak256(value);
    }
    export function sha512(
        value: string
    ): Promise<string> {
        return ReactNativeWalletCore.sha512(value);
    }
}
