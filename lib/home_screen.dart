import 'package:flutter/material.dart';

class HomeScreeen extends StatelessWidget {
  HomeScreeen({Key? key}) : super(key: key);

  List<String> images = [
    "https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg?crop=0.88847xw:1xh;center,top&resize=1200:*",
    "https://www.yourpetpa.co.nz/cdn/shop/articles/Raising_Kittens_1200x1200.jpg?v=1676516778",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/RedCat_8727.jpg/1200px-RedCat_8727.jpg",
    "https://natusan.co.uk/cdn/shop/articles/natusan-blog-how-cat-years-work-header.jpg?v=1674474680",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUDvF8l753KHOWjwCmjEO1PfxYe5J95T54IA&usqp=CAU",
    "https://www.catster.com/wp-content/uploads/2018/01/Ragdoll-cat-on-blue-backdrop-.jpg.optimal.jpg",
  ];
  List<String> imagesForTile = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/RedCat_8727.jpg/1200px-RedCat_8727.jpg",
    "https://natusan.co.uk/cdn/shop/articles/natusan-blog-how-cat-years-work-header.jpg?v=1674474680",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUDvF8l753KHOWjwCmjEO1PfxYe5J95T54IA&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to My Photo Gallery!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search for Photos..',
                  hintStyle: TextStyle(fontSize: 16)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 230,
              child: Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                const snackdemo = SnackBar(
                                  content: Text('You are clicked on image'),
                                  backgroundColor: Colors.green,
                                  elevation: 10,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackdemo);
                              },
                              child: Image.network(
                                images[index],
                                width: 150,
                                height: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Photo $index',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ),
            Container(
              height: 230,
              child: Expanded(
                child: ListView.builder(
                    itemCount: imagesForTile.length,
                    itemBuilder: (BuildContext context, int index) {
                      int count = index + 1;
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            imagesForTile[index],
                          ),
                        ),
                        title: Text(
                          "Photo $count",
                          textScaleFactor: 1.2,
                        ),
                        subtitle: Text('Description For Photo $count'),
                      );
                    }),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  const snackdemo = SnackBar(
                    content: Text('Photo Uploaded Sucessfully'),
                    backgroundColor: Colors.black,
                    elevation: 10,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                },
                child: Icon(
                  //<-- SEE HERE
                  Icons.upload,

                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), //<-- SEE HERE
                  padding: EdgeInsets.all(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
