import 'package:bloc_assignment/bloc/simple_interest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatelessWidget {
  SimpleInterestView({super.key});

  // Separate controllers for each input field
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Interest Bloc"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: principalController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Principal",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: rateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Rate",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: timeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Time",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            BlocBuilder<SimpleInterestBloc, double>(
              builder: (context, state) {
                return Text(
                  'Simple Interest: $state',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 203, 221, 236)),
              ),
              onPressed: () {
                // Get values from the text fields and parse them
                final double principal =
                    double.tryParse(principalController.text) ?? 0;
                final double rate = double.tryParse(rateController.text) ?? 0;
                final double time = double.tryParse(timeController.text) ?? 0;

                // Add the CalculateSimpleInterest event with the parsed values
                context.read<SimpleInterestBloc>().add(
                      CalculateSimpleInterest(
                        principal: principal,
                        rate: rate,
                        time: time,
                      ),
                    );
              },
              child: const Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
