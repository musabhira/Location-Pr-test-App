import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          'Request Location Permission',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 210, 55),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          'Request Notification Permission',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          'Start Location Upadate',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          'Stop Location Upadate',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 29,
                itemBuilder: (BuildContext context, int index) {
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
                              const Row(
                                children: [
                                  Text(
                                    'Lat:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    ' 1.234',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Lng:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    ' 4.321',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Speed:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    ' 45m',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
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
