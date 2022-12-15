package com.reactnativewalletcore

fun String.toData(): ByteArray {
    if (startsWith("0x")) {
        check(length % 2 == 0)
        return drop(2)
            .chunked(2)
            .map { it.toInt(16).toByte() }
            .toByteArray()
    }
    return toByteArray()
}

fun ByteArray.toHex(): String {
    return joinToString("") { "%02x".format(it) }
}
