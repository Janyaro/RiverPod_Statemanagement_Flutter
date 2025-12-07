import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final visibilityProvider = StateProvider<bool>((ref) {
  return false;
});

class LoginScreen extends ConsumerWidget { // Change to ConsumerWidget
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    
    print('build - Scaffold level');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Email field - no provider dependency
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 10),
            
            // Password field with Consumer - ONLY THIS REBUILDS
            Consumer(
              builder: (context, ref, child) {
                final isVisible = ref.watch(visibilityProvider);
                print('build - Password field only');
                
                return TextField(
                  controller: passwordController,
                  obscureText: !isVisible, // Fixed: Hide when not visible
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                      final value = ref.read(visibilityProvider.notifier);
                      value.state = !value.state;
                      },
                      icon: Icon(
                        isVisible 
                          ? Icons.visibility 
                          : Icons.visibility_off,
                      ),
                    ),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 10),
            
            // Login button
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.deepPurple,
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}