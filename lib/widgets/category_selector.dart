import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ["Messages", "Online", "Groups", "Requests"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).colorScheme.primary,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (
          BuildContext context,
          index,
        ) =>
            GestureDetector(
          onTap: () {
            setState(
              () {
                selectedIndex = index;
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: index == selectedIndex ? Colors.white : Colors.white60,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
