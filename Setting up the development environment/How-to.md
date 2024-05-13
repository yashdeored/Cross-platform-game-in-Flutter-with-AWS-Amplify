<h1>Prepare the Flutter Project</h1>
In this module, we will start by downloading the startup project. Then we will add the Amplify packages and other dependencies to the app. Next, we will create the constants the app will use to define its routes and colors. And finally, we will provision the Amplify backend for the app

What you will accomplish
Download the startup project.
Define the constants for the game routes, levels, icons and colors.
Provision the Amplify backend.

Download the starter project
Step 1: Run the command below to download the starter project.

curl 'https://static.us-east-1.prod.workshops.aws/public/162b8763-f908-4c88-81b0-ecfe89aa24b2/assets/memory_match_game.zip' -o memory_match_game.zip

Step 2: Unzip the startup project and remove the zip file

unzip -o memory_match_game.zip -d memory_match_game
rm memory_match_game.zip

Step 3: Open the project using VSCode. You can do that by running the commands below in your terminal.

cd memory_match_game
code . -r

Open the app using VSCode

Step 4: Run the command below in your terminal to install the dependencies listed in the pubspec.yaml file.

flutter pub get

Define the constants for the game routes, levels, icons and colors
Step 1: Open the dart file lib/common/navigation/routes.dart. Update it with the following code. We will use this enum to create the routing of the app.

Update the routes.dart

1
2
3
4
enum AppRoute {
  home,
  game,
}

Step 2: Open the file lib/common/utils/constants.dart, and update it with the following code to create constant variables to set the app’s colors, game levels & game title.

Update the constants.dart

1
2
3
4
5
6
7
8
9
10
11
12
13
import 'package:flutter/material.dart';

const Color continueButtonColor = Color.fromRGBO(235, 32, 93, 1);
const Color restartButtonColor = Color.fromRGBO(243, 181, 45, 1);
const Color quitButtonColor = Color.fromRGBO(39, 162, 149, 1);

const List<Map<String, dynamic>> gameLevels = [
  {'title': '4 x 4', 'level': 4, 'color': Colors.amberAccent},
  {'title': '6 x 6', 'level': 6, 'color': Colors.blueAccent},
  {'title': '8 x 8', 'level': 8, 'color': Colors.cyanAccent},
];

const String gameTitle = 'MEMORY MATCH';

Step 3: Open the file lib/common/utils/icons.dart, and update it with the following code to create a list variable for the Icons that we will use for the game's cards.

Update the icons.dart

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
import 'package:flutter/material.dart';

const List<IconData> cardIcons = <IconData>[
  Icons.celebration,
  Icons.directions_car_filled,
  Icons.directions_bike,
  Icons.house,
  Icons.local_shipping,
  Icons.fastfood,
  Icons.album_sharp,
  Icons.forest,
  Icons.anchor,
  Icons.ac_unit,
  Icons.android,
  Icons.favorite,
  Icons.light,
  Icons.agriculture_sharp,
  Icons.airplanemode_on,
  Icons.umbrella,
  Icons.alarm,
  Icons.directions_subway_rounded,
  Icons.person,
  Icons.light_mode_outlined,
  Icons.bedtime_sharp,
  Icons.all_inclusive,
  Icons.wine_bar,
  Icons.star,
  Icons.headset_rounded,
  Icons.apple_sharp,
  Icons.whatshot_outlined,
  Icons.delete,
  Icons.audiotrack_rounded,
  Icons.back_hand_sharp,
  Icons.visibility,
  Icons.traffic_rounded,
  Icons.beach_access_rounded,
  Icons.battery_charging_full_sharp,
  Icons.downhill_skiing_rounded,
  Icons.directions_boat_rounded,
  Icons.eco_sharp,
  Icons.restaurant,
  Icons.balance_sharp,
  Icons.shopping_cart_rounded,
  Icons.radar_sharp,
  Icons.sports_esports_rounded,
];

Create an Amplify backend for the app
Step 1: Navigate to the app's root folder, and provision the Amplify backend for the app by running the command below in your terminal.

amplify init

Step 2: Enter a name for the Amplify project, or accept the suggested name and press Enter.

? Enter a name for the project memorymatchgame
The following configuration will be applied:

Project information
| Name: memorymatchgame
| Environment: dev
| Default editor: Visual Studio Code
| App type: flutter
| Configuration file location: ./lib/

? Initialize the project with the above configuration? (Y/n) 

Step 3: Press Enter again to accept the auto-generated options and select the AWS Authentication method. In this example, we are using an AWS profile. Amplify CLI will initialize the backend and connect the project to the cloud.

Amplify CLI initialized the backend

The Amplify CLI will add a new folder named amplify to the app's root folder, which contains the amplify project and backend details. And it will also add a new dartfile (amplifyconfiguration.dart) to lib/ folder. The app will use this file to know how to reach your provisioned backend resources at runtime.

The Amplify CLI added a new folder and a dart file


<h1>Add Amplify Authentication</h1>
Overview
In this module, you will learn how to authenticate a user with the Amplify auth category  by using Amazon Cognito, a managed user identity service.

You will also learn how to use the Amplify Authenticator  library to quickly create an authentication flow for the app, allowing users to sign up, sign in, and reset their password with just a few lines of code.

What you will accomplish
Add Amplify authentication category to the app
Implement the authentication flow using Amplify Authenticator

Add Amplify authentication category to the app
Step 1: Navigate to the app's root folder and run the command below in your terminal.

amplify add auth

Step 2: Select the Default configuration option and then select Email as the sign-in method. Then select the No, I am done option.


Using service: Cognito, provided by: awscloudformation
 
 The current configured provider is Amazon Cognito. 
 
 Do you want to use the default authentication and security configuration? Default configuration
 Warning: you will not be able to edit these selections. 
 How do you want users to be able to sign in? Email
 Do you want to configure advanced settings? No, I am done.
✅ Successfully added auth resource memorymatchgame28e6d925 locally

✅ Some next steps:
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud


Step 3: Now the Amplify Auth category is ready. Run the command amplify push to create the resources in the cloud.

Run amplify push to create the resources

Step 4: Press Enter. The Amplify CLI will deploy the authentication resources and display a confirmation, as shown in the screenshot.

The Amplify CLU deploys the authentication resources

Implement the app authentication flow using Amplify Authenticator
Step 1: Open the file lib/features/game_manager/ui/pages/startup_page.dart and update it with the following code. This will be the app’s homepage.

Update the startup_page.dart

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
import 'package:flutter/material.dart';
import 'package:memory_match_game/common/utils/constants.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  gameTitle,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ]),
        ),
      ),
    );
  }
}

Step 2: Open the lib/common/navigation/router.dart file. Update it with the following code to create the route for the app’s home page.

Update the router.dart

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_match_game/common/navigation/routes.dart';
import 'package:memory_match_game/features/game_manager/ui/pages/startup_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const StartUpPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);

Step 3: Open the file lib/memory_match_game.dart. Update it with the following code to wrap the MaterialApp in an Amplify Authenticator widget.

Update the memory_match_game.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:memory_match_game/common/navigation/router.dart';


class MemoryMatchGame extends StatelessWidget {
  const MemoryMatchGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        builder: Authenticator.builder(),
        title: 'The MemoryMatch Game',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

Step 4: Open the main.dart file and update it with the following code. This contains the logic of configuring Amplify for the Auth category.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:memory_match_game/memory_match_game.dart';

import 'amplifyconfiguration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();

  runApp(
    const ProviderScope(
      child: MemoryMatchGame(),
    ),
  );
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    
  ]);
  await Amplify.configure(amplifyconfig);
}

Step 5: Use the command below to run the app using chrome browser,Use the authentication flow to create a new account.

flutter run -d chrome

Memory Match Game

<h1>Add Amplify API</h1>
Overview
In this module, you will add an API to your app using the Amplify CLI to retrieve and persist your game sessions data. The API you will create is a GraphQL API that uses AWS AppSync (a managed GraphQL service) backed by Amazon DynamoDB (a NoSQL database).

What you will accomplish
Add Amplify API to the app
Add the game session data model to the app
Implement the CRUD operations and flow for the game session feature

Add Amplify API to the app
Step 1: Navigate to the root folder of the app and provision an Amplify API resource by running the command below in your terminal.

amplify add api

Step 2: Select the GraphQL option and hit Enter , Updated the suggested settiings as below A Scroll up to the Authorization modes option and change it to Amazon Cognito User Pool. B Select No for the additional auth types prompt. C Choose the Continue option. D Select the Blank Schema template and hit Enter. E Select No for editing the schema prompt.

? Select from one of the below mentioned services: GraphQL
? Here is the GraphQL API that we will create. Select a setting to edit or continue Authorization mod
es: API key (default, expiration time: 7 days from now)
? Choose the default authorization type for the API Amazon Cognito User Pool
Use a Cognito user pool configured as a part of this project.
? Configure additional auth types? No
? Here is the GraphQL API that we will create. Select a setting to edit or continue Continue
? Choose a schema template: Blank Schema
✅ GraphQL schema compiled successfully.

The Amplify CLI will add a new folder for the API which will include the schema.graphql file where you will define the models for the app.

The schema.graphql file where you define the models

Step 3: Open the schema.graphql file and replace its contents with the following to define the game session model.

1
2
3
4
5
type GameSession @model @auth(rules: [{ allow: owner }]) {
  id: ID!
  level: Int!
  durationInSeconds: Int!
}

Implement the game session feature
Step 1: Open the file lib/features/game_session/services/game_sessions_api_service.dart and update it with the following code to create the GameSessionsAPIService which contains the following functions:

getGameSessions - This function will query the Amplify API for the game sessions and return a list of them.
createGameSession is for creating a game session using the Amplify API.
Update the game_sessions_api_service.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_match_game/models/ModelProvider.dart';

final gameSessionsAPIServiceProvider = Provider<GameSessionsAPIService>((ref) {
  final service = GameSessionsAPIService();
  return service;
});

class GameSessionsAPIService {
  GameSessionsAPIService();

  Future<List<GameSession>> getGameSessions() async {
    try {
      final request = ModelQueries.list(GameSession.classType);
      final response = await Amplify.API.query(request: request).response;

      final gameSessions =
          response.data?.items.map((e) => e as GameSession).toList();
      if (gameSessions == null) {
        safePrint('getGameSessions errors: ${response.errors}');
        return const [];
      }
      gameSessions.sort(
        (a, b) => a.createdAt!.compareTo(b.createdAt!),
      );
      return gameSessions;
    } on Exception catch (error) {
      safePrint('getGameSessions failed: $error');

      return const [];
    }
  }

  Future<void> createGameSession(GameSession gameSession) async {
    try {
      final request = ModelMutations.create(gameSession);
      final response = await Amplify.API.mutate(request: request).response;

      final createdGameSession = response.data;
      if (createdGameSession == null) {
        safePrint('addGameSession errors: ${response.errors}');
        return;
      }
    } on Exception catch (error) {
      safePrint('addGameSession failed: $error');
    }
  }
}

Step 2: Open the file lib/features/game_session/data/game_sessions_repository.dart and update it with the following code:

Update the game_sessions_repository.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_match_game/features/game_session/services/game_sessions_api_service.dart';
import 'package:memory_match_game/models/ModelProvider.dart';

final gameSessionsRepositoryProvider = Provider<GameSessionsRepository>((ref) {
  final gameSessionsAPIService = ref.read(gameSessionsAPIServiceProvider);
  return GameSessionsRepository(gameSessionsAPIService);
});

class GameSessionsRepository {
  GameSessionsRepository(this.gameSessionsAPIService);

  final GameSessionsAPIService gameSessionsAPIService;

  Future<List<GameSession>> getGameSessions() {
    return gameSessionsAPIService.getGameSessions();
  }

  Future<void> create(GameSession gameSession) async {
    return gameSessionsAPIService.createGameSession(gameSession);
  }
}

Step 3: Open the file lib/features/game_session/controllers/game_sessions_controller.dart and update it with the following code:

Update the game_sessions_controller.dart file

Note: VSCode will show errors due to the missing the game_sessions_controller.g.dart file. You will fix that in the next step.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:memory_match_game/features/game_session/data/game_sessions_repository.dart';
import 'package:memory_match_game/models/ModelProvider.dart';
part 'game_sessions_controller.g.dart';

@riverpod
class GameSessionsController extends _$GameSessionsController {
  Future<List<GameSession>> _fetchGameSessions() async {
    final gameSessionsRepository = ref.read(gameSessionsRepositoryProvider);
    final gameSessions = await gameSessionsRepository.getGameSessions();
    return gameSessions;
  }

  @override
  FutureOr<List<GameSession>> build() async {
    return _fetchGameSessions();
  }

  Future<void> createGameSession({
    required int durationInSeconds,
    required int level,
  }) async {
    final gameSession = GameSession(
      durationInSeconds: durationInSeconds,
      level: level,
    );

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final gameSessionsRepository = ref.read(gameSessionsRepositoryProvider);
      await gameSessionsRepository.create(gameSession);
      return _fetchGameSessions();
    });
  }

  Future<GameSession> getBestTimeGameSession(int level) async {
    final gameSessions = await _fetchGameSessions();
    final highestScoreGameSession = gameSessions
        .where((element) => element.level == level)
        .reduce((currentGameSession, nextGameSession) =>
            currentGameSession.durationInSeconds <
                    nextGameSession.durationInSeconds
                ? currentGameSession
                : nextGameSession);

    return highestScoreGameSession;
  }
}

Step 4: Run the command below in the root folder of the app to generate the game session model file.

dart run build_runner build -d

This will generate the game_sessions_controller.g.dart file inside the lib/features/game_session/controllers folder.

The game_sessions_controller.g.dart file inside controllers folder

<h1>Build the Game</h1>
Overview
In this module, you will build the business logic & UI of the game, The UI will be responsive for web & mobile.

What you will accomplish
Create the game controller and implement the business logic.
Create a set of widgets the game will use for the UI.
Create the web & mobile UI.
Create and run the game flow.

Create the Game Controller
Step 1: Open the file lib/feature/game_manager/data/card_item.dart and update it with the following code to create the CardItem class.

Update the card_item.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
import 'package:flutter/material.dart';
enum CardState { hidden, visible, guessed }

class CardItem {
  CardItem({
    required this.value,
    required this.icon,
    required this.color,
    this.state = CardState.hidden,
  });

  final int value;
  final IconData icon;
  final Color color;
  CardState state;
}

Step 2: Open the file lib/feature/game_manager/controllers/game_controller.dart and update it with the following code. The App will use this controller to generate the cards & manage the game.

Update the game_controller.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:memory_match_game/common/utils/icons.dart';
import 'package:memory_match_game/features/game_manager/data/card_item.dart';

class GameController {
  GameController(this.gridSize) {
    generateCards();
  }
  final int gridSize;

  List<CardItem> cards = [];
  bool isGameOver = false;
  Set<IconData> icons = {};

  void generateCards() {
    generateIcons();
    cards = [];
    final List<Color> cardColors = Colors.primaries.toList();
    for (int i = 0; i < (gridSize * gridSize / 2); i++) {
      final cardValue = i + 1;
      final IconData icon = icons.elementAt(i);
      final Color cardColor = cardColors[i % cardColors.length];
      final List<CardItem> newCards =
          _createCardItems(icon, cardColor, cardValue);
      cards.addAll(newCards);
    }
    cards.shuffle(Random());
  }

  void generateIcons() {
    icons = <IconData>{};
    for (int j = 0; j < (gridSize * gridSize / 2); j++) {
      final IconData icon = _getRandomCardIcon();
      icons.add(icon);
      icons.add(icon); // Add the icon twice to ensure pairs are generated.
    }
  }

  void resetGame() {
    generateCards();
    isGameOver = false;
  }

  void onCardPressed(int index) {
    cards[index].state = CardState.visible;
    final List<int> visibleCardIndexes = _getVisibleCardIndexes();
    if (visibleCardIndexes.length == 2) {
      final CardItem card1 = cards[visibleCardIndexes[0]];
      final CardItem card2 = cards[visibleCardIndexes[1]];
      if (card1.value == card2.value) {
        card1.state = CardState.guessed;
        card2.state = CardState.guessed;
        isGameOver = _isGameOver();
      } else {
        Future.delayed(const Duration(milliseconds: 1000), () {
          card1.state = CardState.hidden;
          card2.state = CardState.hidden;
        });
      }
    }
  }

  List<CardItem> _createCardItems(
      IconData icon, Color cardColor, int cardValue) {
    return List.generate(
      2,
      (index) => CardItem(
        value: cardValue,
        icon: icon,
        color: cardColor,
      ),
    );
  }

  IconData _getRandomCardIcon() {
    final Random random = Random();
    IconData icon;
    do {
      icon = cardIcons[random.nextInt(cardIcons.length)];
    } while (icons.contains(icon));
    return icon;
  }

  List<int> _getVisibleCardIndexes() {
    return cards
        .asMap()
        .entries
        .where((entry) => entry.value.state == CardState.visible)
        .map((entry) => entry.key)
        .toList();
  }

  bool _isGameOver() {
    return cards.every((card) => card.state == CardState.guessed);
  }
}

Create the Game widgets
Step 1: Open the file lib/features/game_manager/ui/widgets/game_button.dart and update it with the following code to create the GameButton StatelessWidget.

Update the game_button.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  const GameButton({
    required this.title,
    required this.onPressed,
    required this.color,
    this.height = 40,
    this.width = double.infinity,
    this.fontSize = 18,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color color;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          textStyle: TextStyle(fontSize: fontSize),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(height / 2),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

Step 2: Open the file lib/features/game_manager/ui/widgets/game_confetti.dart and update it with the following code to create the GameConfetti StatefulWidget.

Update the game_confetti.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class GameConfetti extends StatefulWidget {
  const GameConfetti({
    super.key,
  });

  @override
  State<GameConfetti> createState() => _GameConfettiState();
}

class _GameConfettiState extends State<GameConfetti> {
  final controllerCenter =
      ConfettiController(duration: const Duration(seconds: 10));

  @override
  void initState() {
    super.initState();
    controllerCenter.play();
  }

  @override
  void dispose() {
    controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: controllerCenter,
        blastDirectionality: BlastDirectionality.explosive,
        shouldLoop: false,
        gravity: 0.5,
        emissionFrequency: 0.05,
        numberOfParticles: 20,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
      ),
    );
  }
}

Step 3: Open the lib/features/game_manager/ui/widgets/game_controls_bottom_sheet.dart and update it with the following code to create the GameControlsBottomSheet widget and use the GameButton to allow the user to pause, continue, restart or quit the game.

Update the game_controls_bottom_sheet.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_match_game/common/navigation/routes.dart';
import 'package:memory_match_game/common/utils/constants.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/game_button.dart';

class GameControlsBottomSheet extends StatelessWidget {
  const GameControlsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'PAUSE',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () => context.pop(false),
            title: 'CONTINUE',
            color: continueButtonColor,
            width: 200,
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () => context.pop(true),
            title: 'RESTART',
            color: restartButtonColor,
            width: 200,
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () {
              context.goNamed(
                AppRoute.home.name,
              );
            },
            title: 'QUIT',
            color: quitButtonColor,
            width: 200,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

Step 4: Open the lib/features/game_manager/ui/widgets/game_options.dart file and update it with the following code to create the GameOptions widget and use the GameButton to enable the user to select the game level.

Update the game_options.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_match_game/common/navigation/routes.dart';
import 'package:memory_match_game/common/utils/constants.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/game_button.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: gameLevels.map((level) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GameButton(
            onPressed: () => context.goNamed(
              AppRoute.game.name,
              pathParameters: {'gameLevel': level['level'].toString()},
            ),
            title: level['title'],
            color: level['color']![700]!,
            width: 250,
          ),
        );
      }).toList(),
    );
  }
}

Step 5: Open the file lib/features/game_manager/ui/widgets/memory_card.dart and update it with the following code to create the MemoryCard widget.

Update the memory_card.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memory_match_game/features/game_manager/data/card_item.dart';

class MemoryCard extends StatelessWidget {
  const MemoryCard({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  final CardItem card;
  final int index;
  final ValueChanged<int> onCardPressed;

  void _handleCardTap() {
    if (card.state == CardState.hidden) {
      Timer(const Duration(milliseconds: 100), () {
        onCardPressed(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleCardTap,
      child: Card(
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color:
            card.state == CardState.visible || card.state == CardState.guessed
                ? card.color
                : Colors.grey,
        child: Center(
          child: card.state == CardState.hidden
              ? null
              : SizedBox.expand(
                  child: FittedBox(
                    child: Icon(
                      card.icon,
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

Step 6: Open the file lib/features/game_manager/ui/widgets/restart_game.dart and update it with the following code to create the RestartGame widget.

Update the restart_game.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_match_game/common/navigation/routes.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/game_controls_bottom_sheet.dart';

class RestartGame extends StatelessWidget {
  const RestartGame({
    required this.isGameOver,
    required this.pauseGame,
    required this.restartGame,
    required this.continueGame,
    this.color = Colors.white,
    super.key,
  });

  final VoidCallback pauseGame;
  final VoidCallback restartGame;
  final VoidCallback continueGame;
  final bool isGameOver;
  final Color color;

  Future<void> showGameControls(BuildContext context) async {
    pauseGame();
    var value = await showModalBottomSheet<bool>(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (sheetContext) {
        return const GameControlsBottomSheet();
      },
    );

    value ??= false;

    if (value) {
      restartGame();
    } else {
      continueGame();
    }
  }

  void navigateback(BuildContext context) {
    context.goNamed(
      AppRoute.home.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      icon: (isGameOver)
          ? const Icon(Icons.replay_circle_filled)
          : const Icon(Icons.pause_circle_filled),
      iconSize: 40,
      onPressed: () =>
          isGameOver ? navigateback(context) : showGameControls(context),
    );
  }
}

Create the Game web UI
Step 1: Open the file lib/features/game_manager/ui/widgets/web/game_best_time.dart and update it with the following code to create the GameBestTime StatelessWidget to display the game's best duration..

Update the game_best_time.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
import 'package:flutter/material.dart';

class GameBestTime extends StatelessWidget {
  const GameBestTime({
    required this.bestTime,
    super.key,
  });

  final int bestTime;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Best: ${Duration(seconds: bestTime).toString().split('.').first.padLeft(8, "0")}',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}

Step 2: Open the file lib/features/game_manager/ui/widgets/web/game_timer.dart and update it with the following code to create the GameTimer widget..

Update the game_timer.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
import 'package:flutter/material.dart';

class GameTimer extends StatelessWidget {
  const GameTimer({
    required this.time,
    super.key,
  });

  final Duration time;

  @override
  Widget build(BuildContext context) {
    return Text(
      time.toString().split('.').first.padLeft(8, "0"),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Step 3: Open the file lib/features/game_manager/ui/widgets/web/game_board.dart and update it with the following code to create the GameBoard widget which will use the widgets you created earlier to create the game web UI.

Update the game_board.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_match_game/features/game_manager/controllers/game_controller.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/game_confetti.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/memory_card.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/restart_game.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/web/game_best_time.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/web/game_timer.dart';
import 'package:memory_match_game/features/game_session/controllers/game_sessions_controller.dart';

class GameBoard extends ConsumerStatefulWidget {
  const GameBoard({
    required this.gameLevel,
    super.key,
  });

  final int gameLevel;

  @override
  GameBoardState createState() => GameBoardState();
}

class GameBoardState extends ConsumerState<GameBoard> {
  late Timer timer;
  late GameController game;
  late Duration duration;
  int bestTime = 0;
  bool showConfetti = false;
  @override
  void initState() {
    super.initState();
    game = GameController(widget.gameLevel);
    duration = const Duration();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      startTimer();
      getBestTime();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void getBestTime() async {
    ref
        .watch(gameSessionsControllerProvider.notifier)
        .getBestTimeGameSession(widget.gameLevel)
        .then((value) {
      bestTime = value.durationInSeconds;
    });

    setState(() {});
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      setState(() {
        final seconds = duration.inSeconds + 1;
        duration = Duration(seconds: seconds);
      });

      if (game.isGameOver) {
        timer.cancel();
        ref.watch(gameSessionsControllerProvider.notifier).createGameSession(
              durationInSeconds: duration.inSeconds,
              level: widget.gameLevel,
            );

        if (bestTime == 0 || duration.inSeconds < bestTime) {
          setState(() {
            showConfetti = true;
            bestTime = duration.inSeconds;
          });
        }
      }
    });
  }

  pauseTimer() {
    timer.cancel();
  }

  void _resetGame() {
    game.resetGame();
    setState(() {
      timer.cancel();
      duration = const Duration();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsiveSpacing = sqrt(MediaQuery.of(context).size.width) *
        sqrt(MediaQuery.of(context).size.height);

    return Stack(
      children: [
        GridView.count(
          padding: const EdgeInsets.fromLTRB(8.0, 80.0, 8.0, 8.0),
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.2,
          mainAxisSpacing: responsiveSpacing / 100,
          crossAxisSpacing: responsiveSpacing / 100,
          crossAxisCount: game.gridSize,
          children: List.generate(game.cards.length, (index) {
            return MemoryCard(
              index: index,
              card: game.cards[index],
              onCardPressed: game.onCardPressed,
            );
          }),
        ),
        Positioned(
          top: 12.0,
          right: 24.0,
          child: RestartGame(
            isGameOver: game.isGameOver,
            pauseGame: () => pauseTimer(),
            restartGame: () => _resetGame(),
            continueGame: () => startTimer(),
          ),
        ),
        Positioned(
          bottom: 12.0,
          right: 24.0,
          child: GameTimer(
            time: duration,
          ),
        ),
        Positioned(
          bottom: 12.0,
          left: 24.0,
          child: GameBestTime(
            bestTime: bestTime,
          ),
        ),
        showConfetti ? const GameConfetti() : const SizedBox(),
      ],
    );
  }
}

Create the Game Mobile UI
Step 1: Open the file lib/features/game_manager/ui/widgets/mobile/game_best_time_mobile.dart and update it with the following code to create the GameBestTimeMobile StatelessWidget to display the game's best duration..

Updating the game_best_time_mobile.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
import 'package:flutter/material.dart';

class GameBestTimeMobile extends StatelessWidget {
  const GameBestTimeMobile({
    required this.bestTime,
    super.key,
  });

  final int bestTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 60,
      ),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.greenAccent[700],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.celebration,
                size: 40,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                textAlign: TextAlign.center,
                Duration(seconds: bestTime)
                    .toString()
                    .split('.')
                    .first
                    .padLeft(8, "0"),
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Step 2: Open the file lib/features/game_manager/ui/widgets/mobile/game_timer_mobile.dart and update it with the following code to create the GameTimerMobile widget.

Updating the game_timer_mobile.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
import 'package:flutter/material.dart';

class GameTimerMobile extends StatelessWidget {
  const GameTimerMobile({
    required this.time,
    super.key,
  });

  final Duration time;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 60,
      ),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.red[700],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.timer,
                size: 40,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                textAlign: TextAlign.center,
                time.toString().split('.').first.padLeft(8, "0"),
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Step 3: Open the file lib/features/game_manager/ui/widgets/mobile/game_board_mobile.dart and update it with the following code to create the GameBoardMobile widget which will use the widgets you created earlier to create the game mobile UI.

Updating the game_board_mobile.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_match_game/features/game_manager/controllers/game_controller.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/game_confetti.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/memory_card.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/mobile/game_best_time_mobile.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/mobile/game_timer_mobile.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/restart_game.dart';
import 'package:memory_match_game/features/game_session/controllers/game_sessions_controller.dart';

class GameBoardMobile extends ConsumerStatefulWidget {
  const GameBoardMobile({
    required this.gameLevel,
    super.key,
  });

  final int gameLevel;

  @override
  GameBoardMobileState createState() => GameBoardMobileState();
}

class GameBoardMobileState extends ConsumerState<GameBoardMobile> {
  late Timer timer;
  late GameController game;
  late Duration duration;
  int bestTime = 0;
  bool showConfetti = false;
  @override
  void initState() {
    super.initState();
    game = GameController(widget.gameLevel);
    duration = const Duration();
    startTimer();
    getBestTime();
  }

  void getBestTime() async {
    ref
        .watch(gameSessionsControllerProvider.notifier)
        .getBestTimeGameSession(widget.gameLevel)
        .then((value) {
      bestTime = value.durationInSeconds;
    });

    setState(() {});
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      setState(() {
        final seconds = duration.inSeconds + 1;
        duration = Duration(seconds: seconds);
      });

      if (game.isGameOver) {
        timer.cancel();
        ref.watch(gameSessionsControllerProvider.notifier).createGameSession(
              durationInSeconds: duration.inSeconds,
              level: widget.gameLevel,
            );

        if (bestTime == 0 || duration.inSeconds < bestTime) {
          setState(() {
            showConfetti = true;
            bestTime = duration.inSeconds;
          });
        }
      }
    });
  }

  pauseTimer() {
    timer.cancel();
  }

  void _resetGame() {
    game.resetGame();
    setState(() {
      timer.cancel();
      duration = const Duration();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return SafeArea(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              RestartGame(
                isGameOver: game.isGameOver,
                pauseGame: () => pauseTimer(),
                restartGame: () => _resetGame(),
                continueGame: () => startTimer(),
                color: Colors.amberAccent[700]!,
              ),
              GameTimerMobile(
                time: duration,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: game.gridSize,
                  childAspectRatio: aspectRatio * 2,
                  children: List.generate(game.cards.length, (index) {
                    return MemoryCard(
                      index: index,
                      card: game.cards[index],
                      onCardPressed: game.onCardPressed,
                    );
                  }),
                ),
              ),
              GameBestTimeMobile(
                bestTime: bestTime,
              ),
            ],
          ),
          showConfetti ? const GameConfetti() : const SizedBox(),
        ],
      ),
    );
  }
}

Create the Game Flow
Step 1: Open the file lib/features/game_manager/ui/pages/memory_match_page.dart and update it with the following code to create the MemoryMatchPage widget and use the screen's width to determine which UI to display, i.e. web or mobile.

Updating the memory_match_page.dart file

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
import 'package:flutter/material.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/mobile/game_board_mobile.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/web/game_board.dart';

class MemoryMatchPage extends StatelessWidget {
  const MemoryMatchPage({
    required this.gameLevel,
    super.key,
  });

  final int gameLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth > 720) {
              return GameBoard(
                gameLevel: gameLevel,
              );
            } else {
              return GameBoardMobile(
                gameLevel: gameLevel,
              );
            }
          }),
        ),
      ),
    );
  }
}

Step 2: Open the lib/common/navigation/router.dart file and update it as below to add the MemoryMatchPage route.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_match_game/common/navigation/routes.dart';
import 'package:memory_match_game/features/game_manager/ui/pages/memory_match_page.dart';
import 'package:memory_match_game/features/game_manager/ui/pages/startup_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const StartUpPage(),
    ),
    GoRoute(
      path: '/game/:gameLevel',
      name: AppRoute.game.name,
      builder: (context, state) {
        final gameLevel = int.parse(state.pathParameters['gameLevel']!);
        return MemoryMatchPage(gameLevel: gameLevel);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);

Step 3: Open the lib/features/game_manager/ui/pages/startup_page.dart file and update it with the following code to present the GameOptions widget for the user to select a level and start the game.

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
import 'package:flutter/material.dart';
import 'package:memory_match_game/common/utils/constants.dart';
import 'package:memory_match_game/features/game_manager/ui/widgets/game_options.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  gameTitle,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                GameOptions(),
              ]),
        ),
      ),
    );
  }
}

Step 4: Use the command below to run the app using chrome brwoser and use the authentication flow to create a user. Select a level and start the game.

flutter run -d chrome

Memory Match Game Web

Step 5: Reduce the width of the browser and try the game using the mobile UI.

Memory Match Game Mobile

<h1>Publish the Game</h1>
Overview
In this module, you will host your game over Amplify Hosting by automating your deployments with GitHub Actions and Amplify Hosting’s git based workflow settings.

What you will accomplish
Configure a GitHub Action to auto deploy the web app.
Use AWS Amplify hosting to publish the game.

Create GitHub Account
If you already have a GitHub account, you can skip this part.
Step 1: To create a new GitHub account, first you need to go to the sign up page . Enter your email address and continue.

Sign up page with email address

Step 2: Set a password and decide on a username.

Email, password set up form.

Step 3: Verify the account by doing the security step and enter the code that you receive on your email address.

Additional code to be entered for account confirmation.

Step 4: Personalize your account:

Personalization options for the account.

You can skip the personalization with the bottom of the page and land to the home page.

Skip personalization button at the bottom of the page.

Congratulations, now you have a GitHub account.

GitHub home page.

Configure the GitHub Action
Step 1: Open the file createandcopytofolder.sh inside the root folder, and update it with the following code. This shell script will automate the process of building and copying the files generated by the flutter web application to a new directory named artifacts, the code deletes any previously existing artifacts directory, creates a new one, and copies all the files and directories generated by the flutter web application into the new artifacts directory

Updating the createandcopytofolder.sh file

1
2
3
4
#!/bin/bash
[[ -d artifacts ]] && rm -r artifacts
mkdir artifacts
cp -R build/web artifacts

Step 2: Open the file .gitignore and delete the lines amplifyconfiguration.json & amplifyconfiguration.dart

Updating the .gitignore file

Step 3: Follow the steps below to commit & publish your project into github

Publish to github public repository

A. Open the source control view by clicking on the Source Control icon in the Activity Bar on the side of VS Code.

B. Select "Publish to GitHub" button.

C. Select the 'Publish to github public repository' option.

Note : If you haven't already signed in to GitHub, VS Code will prompt you to authenticate as shown below.

VSCode Github Auth

VSCode Github Auth

VSCode Github Auth

Step 4: In your GitHub repository, go to the Actions tab and choose the Set up a workflow yourself option

Actions tab

Step 5: Github will display an editor for you to create a new yaml file

Create a new yaml file

Step 6: Update the yaml file with the code below. This will create a workflow that gets triggered when a change is pushed on the main branch.it checks out the project, sets up Flutter as an environment and builds a release for Web, copies the release build into an artifacts folder using createandcopytofolder.sh, and commit the changes to the repo

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
name: On Website Deploy
"on":
  push:
    branches:
      - "main"
jobs:
  build_and_deploy_web:
    name: Build & Deploy Flutter to Web
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - uses: subosito/flutter-action@v2
        with:
          channel: "stable"

      - name: 🌍 Enable Web
        run: flutter config --enable-web

      - name: 📦 Get packages
        run: flutter pub get

      - name: 🏭 Build Web Application
        run: flutter build web --release

      - name: Make copy of artifacts
        run: |
          chmod u+x "${GITHUB_WORKSPACE}/createandcopytofolder.sh"
          bash "${GITHUB_WORKSPACE}/createandcopytofolder.sh"

      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Commit the artifacts.
permissions:
  contents: write

Step 7: Commit the yaml file to the repo using the Commit changes button

Commit the yaml file

Configure Amplify Hosting
Step 1: Open the AWS Console  and go to the AWS Amplify service dashboard. Ensure you are in the correct AWS region.

Amplify service dashboard

Step 2: Choose the New app dropdown list and then the Host web app option to begin.

The Host web app option

Step 3: Choose the GitHub option and click Continue.

The GitHub option

Step 4: Sign into github and choose the Authorize AWS Amplify button.

Authorize AWS Amplify button

Step 5: Select the repo & the branch from the dropdown lists. Make sure to enable the Connecting a monorepo? Pick a folder checkbox and add artifacts/web to the field. Then choose next.

Select the repo & the branch

Note : If you don't see the repo on the dropdown list, choose the View GitHub permissions button. Then choose the Install & Authorize button for your repo

Select the repo & the branch

Step 6: enable the checkbox to allow AWS Amplify to automatically deploy the files then choose next.

Allow AWS Amplify to automatically deploy the files

Step 7: Choose button Save and deploy.

Save and deploy

Step 8: Wait until all the deployment steps are green, and you will get a Url for the deployed game as shown below.

The Url for the deployed game

Step 10: Use the Url to run the game, create a user, select a level and start the game. The following is an example using chrome browser.

Memory Match Game

Clean up resources
Now that you’ve finished this walkthrough, follow the steps below to delete the AWS resources to avoid incurring unexpected costs

Step 1: Navigate to the app's root folder and run the command below in your terminal.

amplify delete

Step 2: Open the AWS Console and go to the AWS Amplify service dashboard, then choose the App memory_match_game-artifacts/web

Step 3: Choose the Actions dropdown button and select Delete app

The hosting app on AWS Console

