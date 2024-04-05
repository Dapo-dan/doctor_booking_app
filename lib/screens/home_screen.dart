import 'package:doctor_booking_app/shared/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_booking_app/shared/widgets/titles/section_title.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a bloc and provide it to the HomeView
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Create HomeView UI
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'Dapo',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: colorScheme.secondary,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  "Dubai, UAE",
                  style: textTheme.bodyMedium!
                      .copyWith(color: colorScheme.secondary),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.expand_more,
                  color: colorScheme.secondary,
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search for doctors...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.onSurfaceVariant,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: colorScheme.surfaceVariant,
                      ),
                    )),
              ),
            )),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _DoctorCategories(),
            _MySchedule(),
          ],
        ),
      ),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Categories',
          action: 'See all',
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: DoctorCategory.values
              .take(5)
              .map((category) => Expanded(
                    child: CircleAvatarWithTextLabel(
                        icon: category.icon, label: category.name),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
