import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hq/providers/home_provider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
  static String path = "/home";
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).load();
  }

  @override
  Widget build(BuildContext context) {
    final homeData = ref.watch(homeProvider);
    if (homeData.user != null) {
      return const Scaffold(
        body: SafeArea(
          child: Center(),
        ),
      );
    } else
      // ignore: curly_braces_in_flow_control_structures
      return const Scaffold(
        body: Center(
          child: Text("loading..."),
        ),
      );
  }
}
