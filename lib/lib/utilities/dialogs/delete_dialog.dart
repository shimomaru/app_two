import 'package:app_two/lib/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete',
    content: 'Are you sure you delete this item?',
    optionsBuilder: () => {
      'Cancel': false,
      'Yes': true,
    },
  ).then(
    (value) => value ?? false,
    //get default return value or false
  );
}
