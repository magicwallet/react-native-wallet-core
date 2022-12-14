package com.reactnativewalletcore
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import wallet.core.jni.HDWallet
import wallet.core.jni.CoinType
import wallet.core.jni.Hash

class ReactNativeWalletCoreModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    init {
        System.loadLibrary("TrustWalletCore")
    }

    override fun getName(): String {
        return "ReactNativeWalletCore"
    }

    @ReactMethod
    fun validateAddress(address: String, coin: Int, promise: Promise) {
        val coinType = CoinType.createFromValue(coin)
        if (coinType == null) {
            promise.reject("Invalid CoinType", String.format("coin %d is not a valid CoinType", coin))
            return
        }
        promise.resolve(coinType.validate(address))
    }

    @ReactMethod
    fun createWallet(strength: Int, passphrase: String, promise: Promise) {
        val wallet = HDWallet(strength, passphrase);
        promise.resolve(wallet.mnemonic())
    }

    @ReactMethod
    fun sha256(string: String, promise: Promise) {
        promise.resolve(Hash.sha256(string.toData()).toHex())
    }

    @ReactMethod
    fun keccak256(string: String, promise: Promise) {
        promise.resolve(Hash.keccak256(string.toData()).toHex())
    }

    @ReactMethod
    fun sha3_256(string: String, promise: Promise) {
        promise.resolve(Hash.sha3256(string.toData()).toHex())
    }

    @ReactMethod
    fun sha512(string: String, promise: Promise) {
        promise.resolve(Hash.sha512(string.toData()).toHex())
    }

    private fun String.toData(): ByteArray {
        if (startsWith("0x")) {
            check(length % 2 == 0)
            return drop(2)
                .chunked(2)
                .map { it.toInt(16).toByte() }
                .toByteArray()
        }
        return toByteArray()
    }

    private fun ByteArray.toHex(): String {
        return joinToString("") { "%02x".format(it) }
    }
}
