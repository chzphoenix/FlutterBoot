package com.bennu.flutter_boot

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import org.json.JSONObject

class FlutterBootActivity : FlutterActivity() {

    companion object{
        const val ROUTE_KEY = "flutter.route.key"

        fun build(context: Context, routeName : String, params : Map<String, String>?) : Intent{
            var intent = withCachedEngine("main").build(context)
            intent.component = ComponentName(context, FlutterBootActivity::class.java)
            var json = JSONObject()
            json.put("route", routeName)

            var paramsObj = JSONObject()
            params?.let {
                for(entry in it){
                    paramsObj.put(entry.key, entry.value)
                }
            }
            json.put("params", paramsObj)
            intent.putExtra(ROUTE_KEY, json.toString())
            return intent
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }

    override fun onResume() {
        super.onResume()
        var route = intent.getStringExtra(ROUTE_KEY)
        BootEngine.flutterBoot?.send(route)
    }

    override fun onDestroy() {
        super.onDestroy()
    }
}