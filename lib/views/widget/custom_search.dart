import 'package:flutter/material.dart';

class SearchableAppBar extends StatefulWidget {
  final Function(bool) onSearchToggle;
  final TextEditingController searchController;
  final VoidCallback onSearchTextChanged;

  const SearchableAppBar({
    super.key,
    required this.onSearchToggle,
    required this.searchController,
    required this.onSearchTextChanged,
  });

  @override
  _SearchableAppBarState createState() => _SearchableAppBarState();
}

class _SearchableAppBarState extends State<SearchableAppBar> {
  bool _isSearching = false;

  @override
  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor ?? Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child:
          _isSearching
              ? Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.searchController,
                      autofocus: true,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'TV shows, movies and more',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 24,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _isSearching = false;
                              widget.searchController.clear();
                            });
                            widget.onSearchToggle(false);
                            widget.onSearchTextChanged();
                          },
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {});
                        widget.onSearchTextChanged();
                      },
                    ),
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Watch',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _isSearching = true;
                      });
                      widget.onSearchToggle(true);
                    },
                  ),
                ],
              ),
    );
  }
}
