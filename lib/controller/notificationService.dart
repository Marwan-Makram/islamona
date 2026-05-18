import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamona/main.dart';
import 'package:islamona/veiw/mainpages/PrayerTimesView.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: 'prayer_channel_id',
              channelName: 'your_channel_name',
              channelDescription: 'your_channel_description',
              importance: NotificationImportance.Max,
              playSound: true,
              enableVibration: true
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'prayer_channel_id',
              channelGroupName: 'your_channel_name'
          )
        ],
        debug: true
    );
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async{
      if(!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    }
    );
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async{
    debugPrint('onNotificationDisplayedMethod');
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async{
    debugPrint('onDismissActionReceivedMethod');
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async{
    debugPrint('onActionReceivedMethod');
    final payload = receivedAction.payload ?? {};
    if (payload["navigate"] == "true"){
      MyApp.navigatorKey.currentState?.push(
        MaterialPageRoute(
            builder: (_) => PrayerTimesScreen()
        ),
      );
    }
  }
  static Future<void> showNotification({required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
    final String? customSound,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final int? interval,}) async {
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(content: NotificationContent(
      id: 1,
      channelKey: 'prayer_channel_id',
      title: title,
      body: body,
      actionType: actionType,
      notificationLayout: notificationLayout,
      summary: summary,
      category: category,
      payload: payload,
      bigPicture: bigPicture,
      customSound: customSound,
    ),
      actionButtons: actionButtons,
      schedule: scheduled ? NotificationInterval(
          interval: interval,
          timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
          preciseAlarm: true)
          : null,
    );
  }

}