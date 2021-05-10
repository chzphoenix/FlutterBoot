package com.bennu.flutter_boot

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec

object BootEngine {
    public var flutterBoot : BasicMessageChannel<String>? = null

    fun init(context: Application){
        var flutterEngine = FlutterEngine(context)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        FlutterEngineCache.getInstance().put("main", flutterEngine)

        flutterBoot = BasicMessageChannel<String>(flutterEngine.dartExecutor.binaryMessenger, "startPage", StringCodec.INSTANCE)
    }
}