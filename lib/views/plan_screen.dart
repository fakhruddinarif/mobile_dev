import 'package:flutter/material.dart';
import 'package:mobile_dev/models/data_layer.dart';
import 'package:mobile_dev/provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(plan.name),),
      body: ValueListenableBuilder<List<Plan>>(
          valueListenable: planNotifier,
          builder: (context, plans, child) {
            Plan currentPlan = plans.firstWhere((plan) => plan.name == widget.plan.name, orElse: () => Plan(name: '', tasks: []));
            return Column(
              children: [
                Expanded(
                  child: _buildList(currentPlan),
                ),
                SafeArea(
                  child: Text(currentPlan.completenessMessage),
                ),
              ],
            );
          }
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex = planNotifier.value.indexWhere((plan) => plan.name == currentPlan.name);
        if (planIndex == -1) return;
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
        planNotifier.value = List<Plan>.from(planNotifier.value);
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
        controller: scrollController,
        itemCount: plan.tasks.length,
        itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index, context)
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            Plan currentPlan = planNotifier.value.firstWhere((plan) => plan.name == widget.plan.name, orElse: () => Plan(name: '', tasks: []));
            int planIndex = planNotifier.value.indexWhere((plan) => plan.name == currentPlan.name);
            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: List<Task>.from(currentPlan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            planNotifier.value = List<Plan>.from(planNotifier.value);
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = planNotifier.value.firstWhere((plan) => plan.name == widget.plan.name, orElse: () => Plan(name: '', tasks: []));
          int planIndex = planNotifier.value.indexWhere((plan) => plan.name == currentPlan.name);
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          planNotifier.value = List<Plan>.from(planNotifier.value);
        },
      ),
    );
  }
}