import Foundation
import WalletCore

extension ReactNativeWalletCore {
    @objc(sha3_256:withResolver:withRejecter:)
    func sha3_256(string: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
        guard let data = string.rtnData else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.sha3_256(data: data).hexString)
    }

    @objc(sha256:withResolver:withRejecter:)
    func sha256(string: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
        guard let data = string.rtnData else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.sha256(data: data).hexString)
    }

    @objc(sha512:withResolver:withRejecter:)
    func sha512(string: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
        guard let data = string.rtnData else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.sha512(data: data).hexString)
    }

    @objc(keccak256:withResolver:withRejecter:)
    func keccak256(string: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) {
        guard let data = string.rtnData else {
            reject(Self.errorDomain, "invalid hex string", nil)
            return
        }
        resolve(Hash.keccak256(data: data).hexString)
    }
}

private extension String {
    var rtnData: Data? {
        if hasPrefix("0x") {
            return Data(hexString: self)
        }
        return Data(utf8)
    }
}
