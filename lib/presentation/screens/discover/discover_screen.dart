import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();

    // Existen otras formas de leer y escuchar el contexto:
    // 1. Leer el contexto, es equivalente al context.read<DiscoverProvider>()
    //    => final discoverProvider = Provider.of<DiscoverProvider>(context, listen: false);
    // 2. Escuchar el contexto, es equivalente al context.watch<DiscoverProvider>()
    //    => final discoverProvider = Provider.of<DiscoverProvider>(context);

    return Scaffold(
      body: discoverProvider.initialLoading
          ? const Center(child: CircularProgressIndicator(strokeWidth: 2.0))
          : VideoScrollableView(
              videos: discoverProvider.videos,
            ),
    );
  }
}
