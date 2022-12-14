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
    
    @objc(sha3_256:withResolver:withRejecter:)
    func sha3_256(string: String, resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) -> Void {
        guard let data = stringToData(string: string) else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.sha3_256(data: data).hexString)
    }
    
    @objc(sha256:withResolver:withRejecter:)
    func sha256(string: String, resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) -> Void {
        guard let data = stringToData(string: string) else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.sha256(data: data).hexString)
    }
    
    @objc(sha512:withResolver:withRejecter:)
    func sha512(string: String, resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) -> Void {
        guard let data = stringToData(string: string) else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.sha512(data: data).hexString)
    }
    
    @objc(keccak256:withResolver:withRejecter:)
    func keccak256(string: String, resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) -> Void {
        guard let data = stringToData(string: string) else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.keccak256(data: data).hexString)
    }
    
    func stringToData(string: String) -> Data? {
        if string.hasPrefix("0x") {
            return Data(hexString: string)
        }
        return Data(string.utf8)
    }
}
