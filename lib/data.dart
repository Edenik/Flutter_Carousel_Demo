class CarouselImage {
  final String url;
  final String title;

  CarouselImage(this.url, this.title);
}

List<CarouselImage> _imageList = [
  CarouselImage(
      'https://images.unsplash.com/photo-1529079688486-feaa9f516c9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'Jerusalem'),
  CarouselImage(
      'https://images.unsplash.com/photo-1596106464740-c43bb7257eb4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      'Jerusalem'),
  CarouselImage(
      'https://images.unsplash.com/photo-1593873454637-2c89268764b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=318&q=80',
      'Jerusalem'),
  CarouselImage(
      'https://images.unsplash.com/photo-1585305980076-24c841e2dfaa?ixlib=rb-1.2.1&auto=format&fit=crop&w=353&q=80',
      'Tel Aviv Beach'),
  CarouselImage(
      'https://images.unsplash.com/flagged/photo-1565544863956-7619785813fc?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
      'Tel Aviv')
];

List<CarouselImage> get carouselImages {
  return [..._imageList];
}
