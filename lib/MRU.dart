import 'package:flutter/material.dart';


class MRUPageReplacement extends StatefulWidget {
  @override
  _MRUPageReplacementState createState() => _MRUPageReplacementState();
}

class _MRUPageReplacementState extends State<MRUPageReplacement> {
  List<int> pageFrames = [];
  List<int> referenceString = [1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5];
  int frameSize = 3; // Initial size of page frames
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
  }

  void initiateMRU() async {
    for (int page in referenceString) {
      await Future.delayed(Duration(milliseconds: 1500));
      setState(() {
        if (!pageFrames.contains(page)) {
          if (pageFrames.length < frameSize) {
            pageFrames.add(page);
          } else {
            pageFrames.removeAt(0);
            pageFrames.add(page);
          }
        } else {
          pageFrames.remove(page);
          pageFrames.add(page);
        }
      });
      _pageController.animateToPage(
        pageFrames.indexOf(page),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void increasePages() {
    setState(() {
      frameSize++;
      if (frameSize > referenceString.length) {
        frameSize = referenceString.length;
      }
      pageFrames = List<int>.generate(frameSize, (index) => referenceString[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        title: Text('MRU Page Replacement',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                initiateMRU();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black
              ),
              child: Text('Start Animation',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            SizedBox(height: 20),
            Text(
              'Number of Pages: $frameSize',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              child: PageView.builder(
                controller: _pageController,
                itemCount: frameSize,
                itemBuilder: (BuildContext context, int index) {
                  return AnimatedPageFrame(
                    pageNumber: (pageFrames.length > index)
                        ? pageFrames[index]
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          increasePages();
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}

class AnimatedPageFrame extends StatelessWidget {
  final int? pageNumber;

  const AnimatedPageFrame({Key? key, this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 5, color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: Text(
        pageNumber != null ? pageNumber.toString() : '-',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}