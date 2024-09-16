import 'dart:math';
import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RandomQuote {
  int _quoteNumber = 0;
  final List<Quote> favoriteQuotes = [];

  void addToFavorites() {
    final currentQuote = _quoteData[_quoteNumber];
    if (!favoriteQuotes.contains(
      currentQuote,
    )) {
      favoriteQuotes.add(currentQuote);
    }
  }

  List<Quote> getFavoriteQuotes() {
    return favoriteQuotes;
  }

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.blue, 
    textColor: Colors.white,      
    fontSize: 16.0,
  );
}


  final List<Quote> _quoteData = [
    Quote(1, "No one can make you feel inferior without your consent.",
        "Eleanor Roosevelt"),
    Quote(
        2,
        "It is better to remain silent at the risk of being thought a fool, than to talk and remove all doubt of it.",
        "Maurice Switzer"),
    Quote(
        3,
        "The fool doth think he is wise, but the wise man knows himself to be a fool.",
        "William Shakespeare"),
    Quote(
        4,
        "Whenever you find yourself on the side of the majority, it is time to reform (or pause and reflect).",
        "Mark Twain"),
    Quote(
        5, "The only true wisdom is in knowing you know nothing.", "Socrates"),
    Quote(
        6,
        "The saddest aspect of life right now is that science gathers knowledge faster than society gathers wisdom.",
        "Isaac Asimov"),
    Quote(
        7,
        "Hold fast to dreams, For if dreams die, Life is a broken-winged bird, That cannot fly.",
        "Langston Hughes"),
    Quote(
        8,
        "It is the mark of an educated mind to be able to entertain a thought without accepting it.",
        "Aristotle"),
    Quote(
        9, "Any fool can know. The point is to understand.", "Albert Einstein"),
    Quote(
        10,
        "The best index to a person's character is how he treats people who can't do him any good, and how he treats people who can't fight back.",
        "Abigail Van Buren"),
    Quote(
        11,
        "There are three things all wise men fear: the sea in storm, a night with no moon, and the anger of a gentle man.",
        "Patrick Rothfuss"),
    Quote(
        12,
        "By three methods we may learn wisdom: First, by reflection, which is noblest; Second, by imitation, which is easiest; and third by experience, which is the bitterest.",
        "Confucius"),
    Quote(
        13,
        "In the end, it's not the years in your life that count. It's the life in your years.",
        "Abraham Lincoln"),
    Quote(14, "The only way to do great work is to love what you do.",
        "Steve Jobs"),
    Quote(15, "You miss 100% of the shots you don't take.", "Wayne Gretzky"),
    Quote(
        16, "The journey of a thousand miles begins with one step.", "Lao Tzu"),
    Quote(
        17,
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "Franklin D. Roosevelt"),
    Quote(
        18, "Believe you can and you're halfway there.", "Theodore Roosevelt"),
    Quote(
        19,
        "The future belongs to those who believe in the beauty of their dreams.",
        "Eleanor Roosevelt"),
    Quote(
        20,
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
        "Winston Churchill"),
    Quote(
        21, "In the middle of difficulty lies opportunity.", "Albert Einstein"),
    Quote(
        22,
        "In three words I can sum up everything I've learned about life: it goes on.",
        "Robert Frost"),
    Quote(23, "Life is what happens when you're busy making other plans.",
        "John Lennon"),
    Quote(24, "The best way to predict the future is to create it.",
        "Peter Drucker"),
    Quote(25, "You must be the change you wish to see in the world.",
        "Mahatma Gandhi"),
    Quote(
        26,
        "The only limit to our realization of tomorrow is our doubts of today.",
        "Franklin D. Roosevelt"),
    Quote(
        27,
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
        "Winston Churchill"),
    Quote(
        28, "The journey of a thousand miles begins with one step.", "Lao Tzu"),
    Quote(
        29, "Believe you can and you're halfway there.", "Theodore Roosevelt"),
    Quote(30, "Don't watch the clock; do what it does. Keep going.",
        "Sam Levenson"),
    Quote(
        31,
        "Happiness is not something ready-made. It comes from your own actions.",
        "Dalai Lama"),
    Quote(32, "The mind is everything. What you think you become.", "Buddha"),
    Quote(
        33,
        "Your time is limited, don't waste it living someone else's life.",
        "Steve Jobs"),
    Quote(34, "Act as if what you do makes a difference. It does.",
        "William James"),
    Quote(
        35,
        "It does not matter how slowly you go as long as you do not stop.",
        "Confucius"),
    Quote(36, "You only live once, but if you do it right, once is enough.",
        "Mae West"),
    Quote(37, "The best revenge is massive success.", "Frank Sinatra"),
    Quote(38, "Life is either a daring adventure or nothing at all.",
        "Helen Keller"),
    Quote(
        39,
        "Do not wait to strike till the iron is hot, but make it hot by striking.",
        "William Butler Yeats"),
    Quote(
        40,
        "The future belongs to those who believe in the beauty of their dreams.",
        "Eleanor Roosevelt"),
    Quote(
        41,
        "The best time to plant a tree was 20 years ago. The second best time is now.",
        "Chinese Proverb"),
    Quote(42, "You must be the change you wish to see in the world.",
        "Mahatma Gandhi"),
  ];

  String getQuoteText() {
    return _quoteData[_quoteNumber].quote;
  }

  String getQuoteAuthor() {
    return _quoteData[_quoteNumber].author;
  }

  void nextQuote() {
    final random = Random();
    _quoteNumber = random.nextInt(
      _quoteData.length,
    );
  }
}
