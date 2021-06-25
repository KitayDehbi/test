import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:strong_delivery/controllers/commandeController.dart';
import 'package:strong_delivery/models/MessageArguments.dart';

class NewCommande extends StatelessWidget {
  const NewCommande({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageArguments args = ModalRoute.of(context).settings.arguments;
    RemoteMessage message = args.message;
    RemoteNotification notification = message.notification;
    String commandeRef = message.data['ref'];
    String commandeClient = message.data['client'];
    String commandeTel = message.data['tel'];
    String commandeRestau = message.data['restaurant'];
    String commandeDistination = message.data['distination'];
    // String commandeCommission = message.data['commission'];
    // String commandeRef = "Commande N 200";
    // String commandeClient = "sergio ramos";
    // String commandeTel = "+33 612356789";
    // String commandeRestau = "KFC";
    // String commandeDistination = "Meknes ouislane";
    // String commandeCommission = "5€";
    CommandeController commandeController = CommandeController();
    return Scaffold(
        appBar: AppBar(
          title: Text("Nouvelle Commande"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 60, 10, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Référence: ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    commandeRef,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Client: ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    commandeClient,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Tél: ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    commandeTel,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Destination : ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    commandeDistination,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 21,
                                      //fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )),
                          // Padding(
                          //     padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           'Commission: ',
                          //           style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontSize: 21,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         ),
                          //         Text(
                          //           commandeCommission,
                          //           style: TextStyle(
                          //             fontFamily: 'Poppins',
                          //             fontSize: 21,
                          //             //fontWeight: FontWeight.w600,
                          //           ),
                          //         ),
                          //       ],
                          //     )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: OutlinedButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      Colors.deepOrange),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                ),
                                onPressed: () async {
                                  var a = await commandeController
                                      .reserveCommande(int.parse(commandeRef));
                                  if (a == 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'veuillez remlir les champs')));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Un erreur s\'es produit')));
                                  }
                                },
                                child: Text(
                                  "Accepter",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: MediaQuery.of(context).size.width - 95,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 7.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/bell.png"),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
