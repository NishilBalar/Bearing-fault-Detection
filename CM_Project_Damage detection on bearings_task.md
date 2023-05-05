﻿<a name="br1"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

Damage detection on bearings 1. Test Rack

In this project a test rack will be used to analyse machine data. An acceleration sensor will be used to

The main components of the test rack are an electrical motor, a frequency converter and a doubly

*Figure 1 Test Rack*

The electric motor is rotating with a defined frequency, over a coupling element the shaft is

Between the two self-align bearings the third bearing which should be investigated is attached. The

To measure the vibrations a sensor of type PCB 353B15 will be used with a coupler of type Kistler



<a name="br2"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

*Figure 2 Detail view of test rack with bearing which should be investigated.*

2\. Geometrical data of the bearing SKF 61804

The bearing of the type SKF 61804 is a single row rill ball bearing with a cage and thirteen balls. The

*Figure 3 Single row rill bearing*

Geometrical data of the bearing

nWK 13 (Number of rolling elements)




<a name="br3"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

*Figure 4 Geometrical data of the bearing SKF 61804*




<a name="br4"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

3\. The measurement system

*Figure 5 measurement chain*

4\. Data format of measurements

Each student gets three different kinds of measurement data with different states of the bearing. All

datensatz Acceleration signal

5\. Task definition

1\.) Analyse the three signals with different signal processing methods and determine which signals

belong to a damaged bearing. Then decide which kind of damage. Different types of damage are listed in Table 1.

2\.) Present your results during a short power point presentation

• Extend: 5-10 slides

• Duration: 10-12 minutes



<a name="br5"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

6 Annotations for the analyse in frequency domain

*Table 1 Damage frequencys*

Cage rotational frequency with fix outer ring

Cage rotational frequency with fix inner ring

Rollover frequency of an irregularity on the

Rollover frequency of an irregularity on the

Rolling element rotation frequency or rolling

Rollover frequency of a rolling element

• Please consider, that for a damaged inner ring the specific over roll frequency will be modulated

• Often a damage is just detectable in higher harmonics of the over roll frequency.

• Usually bearing damages occur as shock shaped impulses. These impulses are shown as peaks,



<a name="br6"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

*Figure 6 Comparison between frequency and envelope spectrum*

The envelope can be generated using the Hilbertransformation. The signal will be transformed to the

*x* = *xr* + *j* × *xi*

The amount of the analytic signal is the envelope. (Figure 7)

*Figure 7 Creation of the envelope using hilbertransformation*

Was the envelope extracted, the envelope spectrum can be calculated using the

The added matlab function

[h] = hcurve\_fun(y,anzeige,N)

Calculate the envelope of a time domain signal using hilbert transformation. A description of the function is build in. (help hcurve\_fun)



<a name="br7"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

7 Distribution of rawdata

Each participant gets three different data packages which must be analyzed. The data packages are

WS 22/23 Marcel Wiemann <marcel.wiemann@uni-siegen.de>

As answer you get the name of the compressed file and the corresponding password, to unzip the

8 Guideline for the preparation of the project

1 Each student prepares his own datasets.

2 One week before the presentation date, the presentation and the matlab-file must be

3 In the presentation it must be clearly visible which dataset was analyzed. For e.g. name

5 A working version of the matlab-file which was used to analyze the data must be