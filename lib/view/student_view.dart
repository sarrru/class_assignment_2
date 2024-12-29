import 'package:bloc_assignment/bloc/student_bloc.dart';
import 'package:bloc_assignment/bloc/student_event.dart';
import 'package:bloc_assignment/bloc/student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentView extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();

  StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Bloc'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Name Input
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Age Input
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Address Input
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 203, 221, 236)),
                ),
                onPressed: () {
                  final name = _nameController.text;
                  final age = int.tryParse(_ageController.text) ?? 0;
                  final address = _addressController.text;

                  if (name.isNotEmpty && age > 0 && address.isNotEmpty) {
                    context
                        .read<StudentBloc>()
                        .add(AddStudent(name, age, address));
                    _nameController.clear();
                    _ageController.clear();
                    _addressController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if (state is StudentLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is StudentLoaded) {
                      final students = state.students;
                      if (students.isEmpty) {
                        return const Center(
                            child: Text('No students added yet.'));
                      }
                      return ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return ListTile(
                            title: Text(student.name),
                            subtitle: Text(
                                'Age: ${student.age}\nAddress: ${student.address}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<StudentBloc>()
                                    .add(DeleteStudent(index));
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is StudentError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
