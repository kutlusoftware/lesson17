import 'package:flutter/material.dart';

class FilterMenuWithChips extends StatefulWidget {
  const FilterMenuWithChips({super.key});

  @override
  State<FilterMenuWithChips> createState() => _FilterMenuWithChipsState();
}

class _FilterMenuWithChipsState extends State<FilterMenuWithChips> {
  final Map<String, List<String>> filters = {
    "Renk": ["Kırmızı", "Mavi", "Yeşil"],
    "Beden": ["S", "M", "L"],
    "Marka": ["Nike", "Adidas", "Puma"],
  };

  final Set<String> selectFilters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori Seçimi"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            "Filtereler",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 12),
          //examp
          ...filters.entries.map((entry) {
            final category = entry.key;
            final secenekler = entry.value;
            return ExpansionTile(
              title: Text(category),
              children: secenekler.map((secenek) {
                return CheckboxListTile(
                  title: Text(secenek),
                  value: selectFilters.contains(secenek),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        selectFilters.add(secenek);
                      } else {
                        selectFilters.remove(secenek);
                      }
                    });
                  },
                );
              }).toList(),
            );
          }),
          Divider(height: 32),
          Text(
            "Seçilen Filtreler",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectFilters.map((filter) {
              return Chip(
                label: Text(filter),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Köşe yuvarlaklığı
                  side: BorderSide(color: Colors.green, width: 1), // Border rengi ve kalınlığı
                ),
                onDeleted: () {
                  setState(() {
                    selectFilters.remove(filter);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
