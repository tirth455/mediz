import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  List<File> _files = [];
  List<String> _fileNames = [];
  List<TextEditingController> _controllers = [];
  List<bool> _isEditing = [];
  List<Color> _colors = [];

  void _generateColors() {
    for (double opacity = 0.5; opacity <= 0.8; opacity += 0.05) {
      _colors.add(Color.fromRGBO(0, 0, 255, opacity));
    }
  }

  void _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        _files.addAll(files);
        _fileNames.addAll(List.filled(files.length, ""));
        _controllers.addAll(List.generate(files.length, (index) => TextEditingController()));
        _isEditing.addAll(List.filled(files.length, true));
        _colors.clear();
        _generateColors();
      });
    } else {
      print("No file selected");
    }
  }

  void _openFile(int index) async {
    await OpenFile.open(_files[index].path);
  }

  void _updateFileName(int index, String newName) {
    setState(() {
      _fileNames[index] = newName;
    });
  }

  void _saveFileName(int index) {
    setState(() {
      _isEditing[index] = false;
    });
  }

  void _deleteFile(int index) {
    setState(() {
      _files.removeAt(index);
      _fileNames.removeAt(index);
      _controllers.removeAt(index);
      _isEditing.removeAt(index);
      _colors.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3498db), // <--- Combo color for app bar
        title: Text('Patient', style: TextStyle(color: Colors.white)),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          color: Color(0xffe6f7ff), // <--- Brighter background color
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: _pickFiles,
                  child: Text("Pick Files"),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _files.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: _colors[index % _colors.length],
                            ),
                            child: ListTile(
                              leading: Icon(Icons.file_present),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          _isEditing[index]
                                              ? SizedBox(
                                            width: 200,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Enter file name',
                                              ),
                                              controller: _controllers[index],
                                              onChanged: (newName) {
                                                _updateFileName(index, newName);
                                              },
                                            ),
                                          )
                                              : Text(_fileNames[index]),
                                          SizedBox(width: 10),
                                          _isEditing[index]
                                              ? ElevatedButton(
                                            onPressed: () {
                                              _saveFileName(index);
                                            },
                                            child: Text("Save"),
                                          )
                                              : ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _isEditing[index] = true;
                                              });
                                            },
                                            child: Text("Edit"),
                                          ),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              _openFile(index);
                                            },
                                            child: Text("Open"),
                                          ),
                                          SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              _deleteFile(index);
                                            },
                                            child: Text("Delete"),
                                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}