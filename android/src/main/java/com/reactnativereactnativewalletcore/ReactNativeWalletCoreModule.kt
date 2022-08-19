package com.reactnativereactnativewalletcore
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class ReactNativeWalletCoreModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "ReactNativeWalletCore"
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {
        promise.resolve(a * b)
    }

    @ReactMethod
    fun createWallet(strength: Int, passphrase: String, promise: Promise) {
        promise.resolve('test')
    }
}