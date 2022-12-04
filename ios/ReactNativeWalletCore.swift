import WalletCore

@objc(ReactNativeWalletCore)
class ReactNativeWalletCore: NSObject {

    static let errorDomain = "Wallet Core Error"
    
    @objc(validateAddress:withCoin:withResolver:withRejecter:)
    func validateAddress(address: String, coin: NSNumber, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) {
        guard let coinType = CoinType(rawValue: UInt32(coin.int32Value)) else {
            reject(Self.errorDomain, "coin: \(coin) is not a valid CoinType", nil)
            return
        }
        resolve(coinType.validate(address: address))
    }

    @objc(createWallet:withPassphrase:withResolver:withRejecter:)
    func createWallet(strength: NSNumber, passphrase: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) {
        guard let wallet = HDWallet(strength: strength.int32Value, passphrase: passphrase) else {
            reject(Self.errorDomain, "failed to create HDWallet", nil)
            return
        }
        resolve(wallet.mnemonic)
    }
    
    @objc(sha512:withResolver:withRejecter:)
    func sha512(string: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(Hash.sha512(data: string.data(using: .utf8)!).hexString)
    }
}
