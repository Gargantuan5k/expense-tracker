import 'package:expense_tracker/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transactionModel;

  const TransactionItem({
    super.key,
    required this.transactionModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            transactionModel.date.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 400,
                      child: AlertDialog(
                        title: const Text("Transaction Details"),
                        actions: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            child: const Text('OK'),
                          ),
                        ],
                        content: const SizedBox(
                          height: 200,
                          width: 350,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Tag: Lorem Tag', // TODO
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10), // Tag
                              Row(
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      'Rs. 3000000000000', // TODO
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red, // TODO
                                      ),
                                      maxLines: 10000,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ), // Amount
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      'ipsum dolor sit amet consectetur adipiscing elit description', // TODO
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey,
                                      ),
                                      maxLines: 10000,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      '21 Sept. 2024', // TODO
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                      maxLines: 10000,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ), // Description
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 33,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset("assets/images/icons/income.png"),
                      ),
                    ),
                    const SizedBox(width: 11),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactionModel.tag,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            transactionModel.description,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 85,
                            child: Text(
                              transactionModel.amount.toString(),
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
