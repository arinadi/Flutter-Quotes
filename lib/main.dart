import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class Quote {
  // Struct
  String text;
  String author;

  //__construct
  Quote({this.text, this.author});
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quote = [
    Quote(text: 'Text', author: 'IM'),
    Quote(text: 'Yo do IT', author: 'IM'),
    Quote(text: 'We do IT', author: 'IM'),
    Quote(text: 'We do IT', author: 'IM'),
    Quote(text: 'We do IT', author: 'IM'),
    Quote(text: 'We do IT', author: 'IM'),
    Quote(text: 'We do IT', author: 'IM'),
    Quote(text: 'We do IT', author: 'IM'),
    Quote(text: 'We do IT', author: 'IM'),
  ];

  Widget quoteTemplate(Quote quote) {
    return QuoteCard(quote: quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text('Quote'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: quote.map((e) => QuoteCard(
          quote: e,
          delete: () {
            setState(() {
              quote.remove(e);
            });
          },
        )).toList(),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
     margin: EdgeInsets.all(10),
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Text(
             quote.text,
             style: TextStyle(
               fontSize: 18,
               color: Colors.grey,
             ),
           ),
           SizedBox(height: 5,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 quote.author,
                 style: TextStyle(
                   fontSize: 14,
                   color: Colors.red,
                 ),
               ),
               IconButton(icon: Icon(Icons.delete), onPressed: delete)
             ],
           ),
         ],
       ),
     ),
    );
  }
}
