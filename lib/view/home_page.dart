import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:test_app/controller/controller.dart';
import 'package:test_app/controller/home_state_provider.dart';
import 'package:test_app/view/widgets/action_button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 43, 43),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Test App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              color: const Color.fromARGB(255, 44, 43, 43),
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  ActionButtonWidget(
                    text: 'Request Location Permission',
                    color: Colors.blue,
                    onTap: () async {
                      /// Check if location service is enabled
                      if (await isLocationEnabled()) {
                        /// Check if the app has permission
                        if (await requestLocationPermission()) {
                          // ignore: avoid_print
                          print('Location permission granted');
                        } else {
                          // ignore: avoid_print
                          print('Location permission denied');
                        }
                      } else {
                        // ignore: avoid_print
                        print('Location not enabled');
                      }
                    },
                    textcolor: Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ActionButtonWidget(
                      text: 'Request Notification Permission',
                      color: const Color.fromARGB(255, 238, 210, 55),
                      onTap: () {
                        // ignore: avoid_print
                        print("Request Notification Permission");
                        AwesomeNotifications()
                            .requestPermissionToSendNotifications();
                      },
                      textcolor: Colors.black),
                  const SizedBox(
                    height: 16,
                  ),
                  ActionButtonWidget(
                      text: 'Start Location Upadate',
                      color: Colors.green,
                      onTap: () async {
                        if (await requestLocationPermission()) {
                          /// Check if the app has permission
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text('Alert'),
                                content: const Text('Are you sure'),
                                actions: [
                                  TextButton(
                                      onPressed: (() {
                                        Navigator.pop(context);
                                      }),
                                      child: const Text('No')),
                                  TextButton(
                                    onPressed: () {
                                      ref
                                          .read(homeStateProvider.notifier)
                                          .startLocationPolling();
                                      AwesomeNotifications().createNotification(
                                        content: NotificationContent(
                                          id: 10,
                                          channelKey: 'location-update',
                                          actionType: ActionType.Default,
                                          title: 'Location update started',
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Yes'),
                                  )
                                ],
                              );
                            }),
                          );
                        } else {
                          showDialog(
                            // ignore: use_build_context_synchronously
                            context: context,
                            builder: ((context) {
                              return const AlertDialog(
                                title: Text('Alert'),
                                content:
                                    Text('Place Enable Location permission'),
                              );
                            }),
                          );
                        }
                      },
                      textcolor: Colors.white),
                  const SizedBox(
                    height: 16,
                  ),
                  ActionButtonWidget(
                      text: 'Stop Location Upadate',
                      color: const Color.fromRGBO(244, 67, 54, 1),
                      onTap: () {
                        ref
                            .read(homeStateProvider.notifier)
                            .stopLocationPolling();
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 11,
                            channelKey: 'location-update',
                            actionType: ActionType.Default,
                            title: 'Location update stoped',
                          ),
                        );
                      },
                      textcolor: Colors.white),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: ref.watch(homeStateProvider).locations.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = ref.watch(homeStateProvider).locations[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 212, 212),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Request${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Lat:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data.lat.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Lng:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    data.lon.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Speed: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${data.speed.toStringAsFixed(0)}m',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
