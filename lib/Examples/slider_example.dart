import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/Provider_class/slider_class.dart';

class SliderExample extends StatelessWidget {
  const SliderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Slider Example ', style: TextStyle(fontSize: 25 ,color: Colors.white),),
      centerTitle: true,
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       Consumer(builder: (context, ref ,child){
        final slider_example = ref.watch(sliderProvider.select((state)=> state.showPassword));
        print('Eye build widget');
        return  InkWell(
            onTap: (){
              final sliderprovider = ref.read(sliderProvider.notifier,);
              sliderprovider.state = sliderprovider.state.copyWith(showPassword: !slider_example);
            },
             child: Container(
              width: 200,
              height: 200,
              color: Colors.teal,
              child:slider_example ? Icon(Icons.visibility , color: Colors.white,): Icon(Icons.visibility_off)
             ),
           );
       }),

          Consumer(builder: (context,ref,child){
            final val =ref.watch(sliderProvider.select((state)=> state.slider) );
            print('Slider Build');
            return Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
              color: Colors.red.withOpacity(val)
              ),
            ),
          ); 
          }),
          Consumer(builder: (context,ref , child){
            final val = ref.watch(sliderProvider.select((state)=> state.slider));
            return Slider(value: val, onChanged: (value){
              final slidernotifier = ref.read(sliderProvider.notifier);
              slidernotifier.state = slidernotifier.state.copyWith(slider: value);
            }); 
          })
          
        ],
      ),
    );
  }
}