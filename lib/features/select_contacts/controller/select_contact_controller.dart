import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topchat_ui/features/select_contacts/repository/select_contact_repository.dart';

final getContactsProvider = FutureProvider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return selectContactRepository.getContacts();
});

final selectCOntactControllerProvider = Provider((ref) {
  final SelectedContactRepository = ref.watch(selectContactRepositoryProvider);
  return SelectContactController(
    ref: ref,
    selectContactRepository: selectContactRepository
  );
});

class SelectContactController {
  final ProviderRef ref;
  final SelectContactRepository selectContactRepository;

  SelectContactController(
      {required this.ref, required this.selectContactRepository});

  void selectContact(Contact selectedCOntact, BuildContext context) {
    selectContactRepository.selectContact(selectedCOntact, context);
  }
}
