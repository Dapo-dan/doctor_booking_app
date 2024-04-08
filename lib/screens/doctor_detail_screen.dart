import 'package:doctor_booking_app/shared/utils/time_of_day_extension.dart';
import 'package:doctor_booking_app/shared/widgets/buttons/app_icon_button.dart';
import 'package:doctor_booking_app/shared/widgets/card/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({
    super.key,
    required this.doctorId,
  });

  final String doctorId;

  @override
  Widget build(BuildContext context) {
    // Create the bloc here
    return const DoctorDetailsView();
  }
}

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Create the UI here
    return Scaffold(
      appBar: AppBar(
        leading: AppIconButton(
          icon: Icons.arrow_back,
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Doctor Details',
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          AppIconButton(
            icon: Icons.favorite_outline,
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorCard(
              doctor: Doctor.sampleDoctors[0],
            ),
            Divider(
              height: 32.0,
              color: colorScheme.surfaceVariant,
            ),
            _DocorWorkingHours()
          ],
        ),
      ),
    );
  }
}

class _DocorWorkingHours extends StatelessWidget {
  const _DocorWorkingHours();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Working Hours',
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        ListView.separated(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 8.0,
          ),
          itemCount: Doctor.sampleDoctors[0].workingHours.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                    Doctor.sampleDoctors[0].workingHours[index].dayOfWeek,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme.surfaceVariant,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    Doctor.sampleDoctors[0].workingHours[index].startTime
                        .toCustomString(),
                    style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.onBackground.withOpacity(
                        0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                const Text('-'),
                const SizedBox(
                  width: 16.0,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme.surfaceVariant,
                    ),
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Text(
                    Doctor.sampleDoctors[0].workingHours[index].endTime
                        .toCustomString(),
                    style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
