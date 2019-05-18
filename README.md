# iOS Certification Exam

An application to help to pass iOS developer certification exam

![alt text](https://pp.userapi.com/c846324/v846324222/2048a2/934iucOpFlE.jpg)

While I studied the Swift language, I heard about ["App Development with Swift Certification Level 1"](https://certiport.pearsonvue.com/Certifications/Apple/App-Dev-With-Swift/Overview). I've got a bit inside iformation, i.e. questions' types. This test must include simple questions about swift syntax and Xcode interface. So, I decided to make this application to help myself. Probably, there aren't all of possible questions in this application, but atleast some of them.

Also, I used some technologies just for studying, for example:
1) programmatically gradient;
2) programmatically constraints, like a half of view;
3) Realm DB, but I just tried to connect my model by using the List<Answer> property, because I wanted to try one-to-many relationships. However, I haven't pushed it in fact that I didn't want to be Realm Cloud to store my data;
4) UserDefaults data.
  
You can answer and then just go back by the cancel button. 

![alt text](https://pp.userapi.com/c846324/v846324602/205a48/X8M5ylzAspA.jpg)

In the end your results calculate automatically, so you can see the current, the latest and the best results. This data store in UserDefaults, that's why you can see your results after you close the application. But not after deleting, but it's not a purpose :)
