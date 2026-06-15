import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/research_cubit.dart';

class ResearchScreen extends StatefulWidget {
  const ResearchScreen({super.key});

  @override
  State<ResearchScreen> createState() => _ResearchScreenState();
}

class _ResearchScreenState extends State<ResearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stock Research')),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter Symbol'),
          ),

          ElevatedButton(
            onPressed: () {
              context.read<ResearchCubit>().analyze(controller.text);
            },
            child: const Text('Analyze'),
          ),

          Expanded(
            child: BlocBuilder<ResearchCubit, ResearchState>(
              builder: (_, state) {
                if (state is ResearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ResearchSuccess) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Text(state.result),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
