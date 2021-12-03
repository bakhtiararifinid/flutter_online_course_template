import 'package:flutter/material.dart';
import 'package:flutter_online_course_template/pages/course_page.dart';

class MyCourseTab extends StatelessWidget {
  const MyCourseTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: const [
          _Header(),
          SizedBox(height: 32),
          _TabBar(),
          SizedBox(height: 32),
          _Courses(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 59,
            child: Text(
              'My Course',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search for anything',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Ongoing',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text('Completed'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Courses extends StatelessWidget {
  const _Courses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        _Course(
          imagePath: 'assets/images/design_thinking.jpg',
          title: 'Design thinking fundamental',
          author: 'Robert Fox',
          labels: ['UI', 'UX'],
          totalCompletedVideo: 20,
          totalVideo: 29,
          dueTime: 'November 2, 2021',
        ),
        _Course(
          imagePath: 'assets/images/user_behaviour_research.jpg',
          title: 'User Behaviour Research',
          author: 'Esther Howard',
          labels: ['UX'],
          totalCompletedVideo: 7,
          totalVideo: 32,
          dueTime: 'August 24, 2021',
        ),
      ],
    );
  }
}

class _Course extends StatelessWidget {
  const _Course({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.labels,
    required this.totalCompletedVideo,
    required this.totalVideo,
    required this.dueTime,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String author;
  final List<String> labels;
  final int totalCompletedVideo;
  final int totalVideo;
  final String dueTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _gotoCoursePage(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            _CourseInfo(
              imagePath: imagePath,
              title: title,
              author: author,
              labels: labels,
            ),
            const SizedBox(height: 16),
            _CourseProgressInfo(
              totalCompletedVideo: totalCompletedVideo,
              totalVideo: totalVideo,
              dueTime: dueTime,
            ),
            const SizedBox(height: 16),
            _CourseProgressBar(
              totalCompletedVideo: totalCompletedVideo,
              totalVideo: totalVideo,
            )
          ],
        ),
      ),
    );
  }

  void _gotoCoursePage(BuildContext context) {
    Navigator.of(context).pushNamed(CoursePage.routeName);
  }
}

class _CourseInfo extends StatelessWidget {
  const _CourseInfo({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.author,
    required this.labels,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String author;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 96,
          width: 96,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  author,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: labels
                  .map(
                    (label) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Chip(
                        backgroundColor:
                            Theme.of(context).primaryColor.withAlpha(32),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        label: Text(
                          label,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }
}

class _CourseProgressInfo extends StatelessWidget {
  const _CourseProgressInfo({
    Key? key,
    required this.totalCompletedVideo,
    required this.totalVideo,
    required this.dueTime,
  }) : super(key: key);

  final int totalCompletedVideo;
  final int totalVideo;
  final String dueTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Progress',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$totalCompletedVideo/$totalVideo lesson',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Due time',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dueTime,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CourseProgressBar extends StatelessWidget {
  const _CourseProgressBar({
    Key? key,
    required this.totalCompletedVideo,
    required this.totalVideo,
  }) : super(key: key);

  final int totalCompletedVideo;
  final int totalVideo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: totalCompletedVideo / totalVideo,
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.grey.shade300,
        minHeight: 8,
      ),
    );
  }
}
