import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  String? selectedType;
  String? selectedEmployee;

  final List<String> employees = ['Alice', 'Bob', 'Charlie'];

  final TextEditingController newGrossController = TextEditingController();
  final TextEditingController newNetController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController oldTitleController = TextEditingController();
  final TextEditingController newTitleController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _pickDate({required bool isFrom}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  Widget buildEmployeeDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedEmployee,
      decoration: const InputDecoration(labelText: "Employee"),
      items: employees
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedEmployee = value;
        });
      },
    );
  }

  Widget buildLeavesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildEmployeeDropdown(),
        const SizedBox(height: 12),
        TextFormField(
          readOnly: true,
          onTap: () => _pickDate(isFrom: true),
          decoration: InputDecoration(
            labelText: "From Date",
            hintText: fromDate != null
                ? "${fromDate!.toLocal()}".split(' ')[0]
                : "Select From Date",
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          readOnly: true,
          onTap: () => _pickDate(isFrom: false),
          decoration: InputDecoration(
            labelText: "To Date",
            hintText: toDate != null
                ? "${toDate!.toLocal()}".split(' ')[0]
                : "Select To Date",
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: noteController,
          decoration: const InputDecoration(labelText: "Note"),
        ),
      ],
    );
  }

  Widget buildRaiseSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildEmployeeDropdown(),
        const SizedBox(height: 12),
        TextField(
          controller: newGrossController,
          decoration: const InputDecoration(labelText: "New Gross"),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: newNetController,
          decoration: const InputDecoration(labelText: "New Net"),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: reasonController,
          decoration: const InputDecoration(labelText: "Reason"),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: noteController,
          decoration: const InputDecoration(labelText: "Note"),
        ),
      ],
    );
  }

  Widget buildPromotionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildEmployeeDropdown(),
        const SizedBox(height: 12),
        TextField(
          controller: oldTitleController,
          decoration: const InputDecoration(labelText: "Old Title"),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: newTitleController,
          decoration: const InputDecoration(labelText: "New Title"),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: noteController,
          decoration: const InputDecoration(labelText: "Note"),
        ),
      ],
    );
  }

  Widget buildFormFields() {
    switch (selectedType) {
      case 'Raise':
        return buildRaiseSection();
      case 'Leaves':
        return buildLeavesSection();
      case 'Promotion':
        return buildPromotionSection();
      default:
        return const SizedBox.shrink();
    }
  }

  void _submitRequest() {
    Fluttertoast.showToast(
      msg: "Request has been sent successfully",
      backgroundColor: Colors.red,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Request")),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Request Type"),
                  value: selectedType,
                  items: ['Raise', 'Leaves', 'Promotion']
                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value;
                      // Reset fields when type is changed
                      selectedEmployee = null;
                      newGrossController.clear();
                      newNetController.clear();
                      reasonController.clear();
                      noteController.clear();
                      oldTitleController.clear();
                      newTitleController.clear();
                      fromDate = null;
                      toDate = null;
                    });
                  },
                ),
                const SizedBox(height: 20),
                if (selectedType != null) buildFormFields(),
              ],
            ),
          ),
          if (selectedType != null)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Submit Request', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
