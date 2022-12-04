package com.reactnativewalletcore
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import wallet.core.java.AnySigner
import wallet.core.jni.HDWallet
import wallet.core.jni.CoinType

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
}