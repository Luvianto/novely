import 'package:flutter/material.dart';
import 'dart:async';

class DialogueBox extends StatefulWidget {
  final List<String> dialogues;
  final VoidCallback onDialogueComplete;

  const DialogueBox({
    super.key,
    required this.dialogues,
    required this.onDialogueComplete,
  });

  @override
  State<DialogueBox> createState() => _DialogueBoxState();
}

class _DialogueBoxState extends State<DialogueBox> {
  int _currentDialogueIndex = 0;
  String _currentText = "";
  int _charIndex = 0;
  bool _isTyping = false;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    setState(() {
      _isTyping = true;
      _currentText = "";
      _charIndex = 0;
    });
    _typingTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_charIndex < widget.dialogues[_currentDialogueIndex].length) {
        setState(() {
          _currentText += widget.dialogues[_currentDialogueIndex][_charIndex];
          _charIndex++;
        });
      } else {
        _isTyping = false;
        timer.cancel();
      }
    });
  }

  void _nextDialogue() {
    if (_isTyping) {
      setState(() {
        _currentText = widget.dialogues[_currentDialogueIndex];
        _isTyping = false;
      });
      _typingTimer?.cancel();
      return;
    }

    if (_currentDialogueIndex < widget.dialogues.length - 1) {
      setState(() {
        _currentDialogueIndex++;
      });
      _startTyping();
    } else {
      widget.onDialogueComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _nextDialogue,
      child: Container(
        height: 150,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.7),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Text(
          _currentText,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
