import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp
  (
    home: Scaffold
    (
      appBar: AppBar(title: Text("Bảng thông tin")),
      body: Padding
      (
        padding: EdgeInsets.all(16),
        child: Table
        (
          border: TableBorder.all
          (
            color: Colors.black,
            width: 1,
            borderRadius: BorderRadius.circular(10),
            style: BorderStyle.solid,
          ),
          children:
          [
            TableRow
            (
              decoration: BoxDecoration(color: Colors.grey[300]),
              children:
              [
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Tên', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Địa chỉ', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Tuổi', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            TableRow
            (
              children:
              [
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('An'),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Hà nội'),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('20'),
                ),
              ],
            ),
            TableRow
            (
              children:
              [
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Bình'),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Hải phòng'),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('22'),
                ),
              ],
            ),
            TableRow
            (
              children:
              [
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Chì'),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('Đà nẵng'),
                ),
                Padding
                (
                  padding: EdgeInsets.all(8),
                  child: Text('21'),
                ),
              ]
            )
          ],
        ),
      ),
    ),
  ));
}
