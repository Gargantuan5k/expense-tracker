import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "September 17, 2024",
            style: TextStyle(
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
                        content: SizedBox(
                          height: 400,
                          width: 350,
                          child: Column(
                            children: [
                              Row(), // Tag
                              Row(), // Amount
                              Row(), // Description
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Tag",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            "ipsum dolor sit amet consectetur adipiscing elit description",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 85,
                            child: Text(
                              "₹ 3000000000000",
                              style: TextStyle(
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
