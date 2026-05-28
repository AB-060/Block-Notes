package com.example.notes

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

class NotesWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (widgetId in appWidgetIds) {
            updateWidget(context, appWidgetManager, widgetId)
        }
    }

    private fun updateWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        widgetId: Int
    ) {
        val data = HomeWidgetPlugin.getData(context)

        val count    = data.getInt("notes_count", 0)
        val title    = data.getString("latest_title", "Aucune note") ?: "Aucune note"
        val preview  = data.getString("latest_preview", "") ?: ""
        val date     = data.getString("latest_date", "") ?: ""
        val colorHex = data.getString("latest_color", "#FFE082") ?: "#FFE082"

        val views = RemoteViews(context.packageName, R.layout.notes_widget_layout)

        views.setTextViewText(R.id.tv_count, count.toString())
        views.setTextViewText(R.id.tv_title, title.ifEmpty { "Aucune note" })
        views.setTextViewText(R.id.tv_preview, preview)
        views.setTextViewText(R.id.tv_date, date)

        try {
            views.setInt(R.id.color_bar, "setBackgroundColor", Color.parseColor(colorHex))
        } catch (_: Exception) {
            views.setInt(R.id.color_bar, "setBackgroundColor", Color.parseColor("#FFE082"))
        }

        val intent = context.packageManager
            .getLaunchIntentForPackage(context.packageName)
            ?.apply { flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK }

        val pendingIntent = PendingIntent.getActivity(
            context, 0, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        views.setOnClickPendingIntent(android.R.id.background, pendingIntent)

        appWidgetManager.updateAppWidget(widgetId, views)
    }
}