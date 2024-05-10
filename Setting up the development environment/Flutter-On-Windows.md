<h2>Windows</h2>
Downloading Flutter SDK
Download the zip folder at the Flutter Website. 
Extract the Flutter SDK to a folder called development at your Desktop.
The file folder step above is just a recommendation and this reference will be used through the workshop. You can move it to any other folder as well. Just be sure to keep a reference to where your Flutter folder is extracted.

Adding Flutter to the Path
Go to the extracted Flutter folder and copy the path of it.
You can copy it either with a right click to the folder and selecting "Copy as Path" option or

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/b3706267-d798-450e-81de-446f929b2d05)

Click on the navigation bar on the top of the window and copy the path text from there. Flutter Path 1
Click on the Windows icon on the bottom left and search for Environment Variables at the start page, select the Edit Environment variables for your account option. Flutter Path 2

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/b65ea293-6047-4260-ba5d-28fa3c994c8e)

It should open a window with Advanced tab selected at System Properties, click on the Environment Variables... button. Flutter Path 3

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/22af07b7-8b78-46bf-9a66-85acea52bc8e)

On the opened window, at to System variables section, find Path and double click on it. Flutter Path 4

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/10d92150-39b1-4a24-9321-7629e04db789)

Add a new field by clicking the New button on the right side and paste the path you copied earlier. Flutter Path 5

![image](https://github.com/yashdeored/Cross-platform-game-in-Flutter-with-AWS-Amplify/assets/152061059/35741b91-1b22-4007-9065-56c6c3d577da)

Save and close all the windows
Close any Command Prompt as well
Then open a fresh Command Prompt and write the following to test:
flutter doctor
