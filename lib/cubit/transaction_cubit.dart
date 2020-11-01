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

  Future<String> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      return result.value.paymentUrl;
    } else {
      return null;
    }
  }
}
