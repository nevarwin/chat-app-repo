// for firebase functions
import { firestore } from "firebase-functions";

export const myFunction = firestore
  .document("chat/{message}")
  .onCreate((snapshot, context) => {
    console.log(snapshot.data());
    return;
  });

// const functions = require("firebase-functions");

// exports.myFunction = functions.firestore
//   .document("chat/{message}")
//   .onCreate((snapshot, context) => {
//     console.log(snapshot.data());
//     return;
//   });
