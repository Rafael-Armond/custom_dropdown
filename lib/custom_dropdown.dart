import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String text;

  const CustomDropdown({Key key, @required this.text}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool isDropDownOpened;
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    isDropDownOpened = false;
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    // Essas são as posições relativas do widget nas quais o dropdown vai se basear
    print("Height: $height");
    print("Width: $width");
    print("xPosition: $height");
    print("yPosition: $height");
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height + 12,
        height: 4 * height + 40,
        child: DropDown(
          itemHeight: height,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropDownOpened)
            floatingDropdown.remove();
          else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropdown);
          }
          isDropDownOpened = !isDropDownOpened;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red.shade600,
        ),
        child: Row(
          children: <Widget>[
            Text(
              widget.text.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;

  const DropDown({Key key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(),
      ],
    );
  }
}
