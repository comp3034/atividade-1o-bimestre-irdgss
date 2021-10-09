import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MedidasScreen extends StatelessWidget {
  const MedidasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              height: height - 64,
              child: Image.asset(
                'assets/images/women-silhouette.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 8,
              left: width * .3,
              child: Text('atualizado em ${DateTime.now()}'),
            ),
            Positioned(
              right: 48,
              top: 48,
              child: Row(
                children: [
                  MeasureLabelWidget(
                    label: 'Altura',
                    value: '170',
                    measure: 'cm',
                  ),
                  SizedBox(width: 16),
                  MeasureLabelWidget(
                    label: 'Peso',
                    value: '70',
                    measure: 'kg',
                  ),
                ],
              ),
            ),
            NestedMeasureWidget(
              top: 160,
              left: 0,
              width: width * .5,
              label: 'Pescoço',
              value: '95',
            ),
            NestedMeasureWidget(
              top: 220,
              left: 0,
              width: width * .65,
              label: 'Peito',
              value: '95',
            ),
            NestedMeasureWidget(
              top: 280,
              left: 60,
              width: (width - 130) * .5,
              label: 'Biceps',
              value: '95',
            ),
            NestedMeasureWidget(
              top: 340,
              left: 0,
              width: width * .65,
              label: 'Cintura',
              value: '95',
            ),
            NestedMeasureWidget(
              top: 400,
              left: 10,
              width: (width - 20) * .5,
              label: 'Quadril',
              value: '95',
            ),
            NestedMeasureWidget(
              top: 460,
              left: 10,
              width: (width - 26) * .65,
              label: 'Peito',
              value: '95',
            ),
            NestedMeasureWidget(
              top: 600,
              left: 10,
              width: (width - 20) * .5,
              label: 'Peito',
              value: '95',
            ),
            // Positioned(
            //   top: 75,
            //   right: 10,
            //   child: Container(width: 125, child: PerdaDeTempo()),
            // ),
            Positioned(
              top: 340,
              right: 10,
              child: Row(
                children: [
                  MeasureLabelWidget(
                    label: 'IMC',
                    value: '22',
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            Positioned(
              top: 220,
              right: 10,
              child: Row(
                children: [
                  MeasureLabelWidget(
                    label: 'Gordura',
                    value: '170',
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class NestedMeasureWidget extends StatelessWidget {
  NestedMeasureWidget({
    Key? key,
    required this.width,
    this.top = 0,
    this.left = 0,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  final double width;
  final double top;
  final double left;
  final String label;
  final String value;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: DottedLine(
                  dashGapLength: 8,
                ),
              ),
            ),
            MeasureLabelWidget(
              label: '$label',
              value: '$value',
              measure: '$measure',
            ),
          ],
        ),
      ),
    );
  }
}

class MeasureLabelWidget extends StatelessWidget {
  final String label;
  final String value;
  final String measure;

  const MeasureLabelWidget({
    Key? key,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label'),
        RichText(
          text: TextSpan(
            text: '$value',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(
                text: ' $measure',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class PerdaDeTempo extends StatefulWidget {
//   PerdaDeTempo({Key? key}) : super(key: key);

//   @override
//   _PerdaDeTempoState createState() => _PerdaDeTempoState();
// }

// class _PerdaDeTempoState extends State<PerdaDeTempo> {
//   @override
//   Widget build(BuildContext context) {
//     return SfRadialGauge(axes: <RadialAxis>[
//       RadialAxis(
//           startAngle: 0,
//           endAngle: 360,
//           showTicks: false,
//           showLabels: false,
//           axisLineStyle: AxisLineStyle(thickness: 10),
//           pointers: <GaugePointer>[
//             RangePointer(
//                 value: 73,
//                 width: 10,
//                 color: Color(0xFFFFCD60),
//                 enableAnimation: true,
//                 cornerStyle: CornerStyle.bothCurve)
//           ],
//           annotations: <GaugeAnnotation>[
//             GaugeAnnotation(
//                 widget: Container(
//                   child: MeasureLabelWidget(
//                           label: 'IMC',
//                           value: '170',
//                         ),
//                     ),
//                 angle: 90,
//                 positionFactor: 2.6)
//           ])
//     ]);
//   }
// }
