import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> signUp(
      String name, String email, String password) async {
    final response =
        await supabase.auth.signUp(email: email, password: password);

    if (response.user != null) {
      // Store the user's name in a 'profiles' table
      await supabase
          .from('profiles')
          .insert({'id': response.user!.id, 'name': name, 'email': email});
    }

    return response;
  }

  Future<AuthResponse> login(String email, String password) async {
    return await supabase.auth
        .signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
