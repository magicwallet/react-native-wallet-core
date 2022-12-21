import { ReactNativeWalletCore } from "./index";

export namespace AnyAddress {
    export function validateAddress(address: string, coin: number): Promise<boolean> {
        return ReactNativeWalletCore.validateAddress(address, coin);
    }
}