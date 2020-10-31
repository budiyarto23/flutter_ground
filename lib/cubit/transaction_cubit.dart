import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market/models/models.dart';
import 'package:food_market/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async {
    ApiReturnValue<List<Transaction>> hasil =
        await TransactionServices.getTransaction();

    if (hasil.value != null) {
      emit(TransactionLoaded(hasil.value));
    } else {
      emit(TransactionLoadingFailed(hasil.message));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> hasilnya =
        await TransactionServices.submitTransaction(transaction);

    if (hasilnya.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [hasilnya.value]));
      return true;
    } else {
      return false;
    }
  }
}
