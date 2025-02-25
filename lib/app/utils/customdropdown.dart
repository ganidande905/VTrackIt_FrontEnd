import 'package:flutter/material.dart';
import 'package:v_track_it/app/utils/constants.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> hostelNames;
  final String? initialValue;
  final Function(String?)? onChanged;

  const CustomDropdown({
    super.key,
    required this.hostelNames,
    this.initialValue,
    this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedHostel;

  @override
  void initState() {
    super.initState();
    _selectedHostel = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedHostel,
      items: widget.hostelNames.map((String hostel) {
        return DropdownMenuItem<String>(
          value: hostel,
          child: Text(hostel,
          style: TextStyle(color: kSecondaryTextColor)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedHostel = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      dropdownColor: Color(0xFFE4C6CD),
      decoration: InputDecoration(
        labelText: 'HOSTEL',
        labelStyle: TextStyle(color: kSecondaryTextColor),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kUnderLineEnabled),
        )
      ),
    );
  }
}