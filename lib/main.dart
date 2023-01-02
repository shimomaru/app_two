import 'package:app_two/lib/constants/routes.dart';
import 'package:app_two/lib/services/auth/auth_service.dart';
import 'package:app_two/views/login_view.dart';
import 'package:app_two/views/notes/create_update_note_view.dart';
import 'package:app_two/views/notes/notes_view.dart';
import 'package:app_two/views/register_view.dart';
import 'package:app_two/views/verify_email_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Phoenix(
      child: MaterialApp(
        title: 'Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomePage(),
        routes: {
          loginRoute: (context) => const LoginView(),
          registerRoute: (context) => const RegisterView(),
          notesRoute: (context) => const NotesView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
          createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
        },
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}

// class RestartWidget extends StatefulWidget {
//   RestartWidget({required this.child});

//   final Widget child;

//   static void restartApp(BuildContext context) {
//     context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
//   }

//   @override
//   _RestartWidgetState createState() => _RestartWidgetState();
// }

// class _RestartWidgetState extends State<RestartWidget> {
//   Key key = UniqueKey();

//   void restartApp() {
//     setState(() {
//       key = UniqueKey();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyedSubtree(
//       key: key,
//       child: widget.child,
//     );
//   }
// }
