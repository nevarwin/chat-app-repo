// for firebase functions
import { firestore } from "firebase-functions";
import { admin } from "firebase-admin";

admin.initializeApp();

export const myFunction = firestore
  .document("chat/{message}")
  .onCreate((snapshot, context) => {
    console.log(snapshot.data());
    return admin.messaging().sendToTopic("chat", {
      notification: {
        title: snapshot.data().username,
        body: snapshot.data().text,
        clickAction: "FLUTTERNOTIFICATION_CLICK",
      },
    });
  });

// const functions = require("firebase-functions");

// exports.myFunction = functions.firestore
//   .document("chat/{message}")
//   .onCreate((snapshot, context) => {
//     console.log(snapshot.data());
//     return;
//   });
