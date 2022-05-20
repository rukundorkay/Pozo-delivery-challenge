import 'package:flutter/material.dart';
import 'package:pozo/color.dart';

Container taskCard(status, dataList) {
  return Container(
      color: extralightBlue,
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: ListView.separated(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final list = dataList[index];
          return Card(
            child: Row(
              children: [
                (status == "pending")
                    ? const Icon(
                        Icons.pending_actions_rounded,
                        color: darkBlue,
                        size: 50,
                      )
                    : (status == "completed")
                        ? const Icon(
                            Icons.done_all_rounded,
                            color: darkBlue,
                            size: 50,
                          )
                        : (status == "overdue")
                            ? const Icon(
                                Icons.cancel_schedule_send_rounded,
                                color: darkBlue,
                                size: 50,
                              )
                            : const Icon(Icons.no_accounts),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Text(
                    list.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (_, index) => Divider(),
        shrinkWrap: true,
      ));
}
