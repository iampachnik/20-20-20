import 'package:flutter/material.dart';

class RightContent extends StatefulWidget {
  final bool isActive;
  final VoidCallback toggleActive;

  const RightContent({
    required this.isActive,
    required this.toggleActive,
    super.key,
  });

  @override
  State<RightContent> createState() => _RightContentState();
}

class _RightContentState extends State<RightContent> {
  final TextEditingController _hoursController = TextEditingController(text: '0');
  final TextEditingController _minutesController = TextEditingController(text: '20');

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  int _parseValue(String value) => int.tryParse(value) ?? 0;

  void _changeHours(int value) {
    int currentValue = _parseValue(_hoursController.text);
    int nextValue = currentValue + value;

    if (nextValue < 0) nextValue = 0;
    if (nextValue > 23) nextValue = 23;

    setState(() {
      _hoursController.text = nextValue.toString();
    });
  }

  void _changeMinutes(int value) {
    int currentValue = _parseValue(_minutesController.text);
    int nextValue = currentValue + value;

    if (nextValue < 0) nextValue = 0;
    if (nextValue > 59) nextValue = 59;

    setState(() {
      _minutesController.text = nextValue.toString();
    });
  }

  Widget _buildTimeEditor({
    required TextEditingController controller,
    required String label,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
  }) {
    return Expanded(
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF29293D),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: widget.isActive ? onDecrease : null,
              icon: const Icon(Icons.remove, color: Colors.white),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                enabled: widget.isActive,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: label == 'hours' ? '0' : '20',
                  hintStyle: const TextStyle(color: Colors.white30),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
            ),
            IconButton(
              onPressed: widget.isActive ? onIncrease : null,
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Break Reminder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Choose how often you want to take a break',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Take a break every',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildTimeEditor(
                  controller: _hoursController,
                  label: 'hours',
                  onDecrease: () => _changeHours(-1),
                  onIncrease: () => _changeHours(1),
                ),
                const SizedBox(width: 16),
                _buildTimeEditor(
                  controller: _minutesController,
                  label: 'minutes',
                  onDecrease: () => _changeMinutes(-5),
                  onIncrease: () => _changeMinutes(5),
                ),
              ],
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: widget.isActive
                    ? () {
                        final hours = _parseValue(_hoursController.text);
                        final minutes = _parseValue(_minutesController.text);
                        final totalMinutes = hours * 60 + minutes;
                        debugPrint(
                          'Break every $hours hours and $minutes minutes ($totalMinutes total minutes)',
                        );
                        widget.toggleActive();
                      }
                    : () => widget.toggleActive(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.isActive ? Colors.redAccent : Colors.grey[200],
                  foregroundColor: widget.isActive ? Colors.white : Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  widget.isActive ? 'Pause Focus Session' : 'Start Focus Session',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: widget.isActive ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.isActive ? 'Active' : 'Inactive',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}