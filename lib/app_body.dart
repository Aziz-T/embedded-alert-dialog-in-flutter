import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  TextEditingController _textEditingController = TextEditingController();
  final _form = GlobalKey<FormState>();
   ValueNotifier<bool> status = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // _textEditingController.clear();
      },
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Form(
          key: _form,
          child: Column(
            children: [
              animatedAlertDialog(),
              SizedBox(height: 20,),
              TextFormField(
                validator: (val){
                  if(val==null||val.isEmpty)
                    return "type something";
                },
                controller: _textEditingController,
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                  hintText: "Write Something",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val){
                    if(val==null||val.isEmpty)
                      return "type something";
                },
                controller: _textEditingController,
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                  hintText: "Write Something",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 40,
                width: 400,
                //decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.all(Radius.circular(60))),
                child: TextButton(
                  style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.blue)
                          )
                      )
                  ),
                  onPressed: () {
                    if(_form.currentState!.validate()){
                       status.value = true;
                       print("validate");
                    }else {
                      print("cada");
                      status.value = false;
                    }

                  },
                  child: Text("BUTTON",style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget animatedAlertDialog()
  {
    return ValueListenableBuilder<Object>(
      valueListenable: status,
      builder: (context, snapshot,_) {
        return AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
         opacity: status.value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.
          child:  Row(
            children: [
              Expanded(
                  child: Card(
                            margin: EdgeInsets.all(0),
                            shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.all(Radius.circular(5)),
                                side:BorderSide(color: Colors.red,width: 2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Asağıdaki ek teminatlardan birini seçiniz",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black45
                                ),
                              ),
                            )),

                  ),
            ],
          ),
        );
      }
    );

  }
}
