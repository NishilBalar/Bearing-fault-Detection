<a name="br1"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

Damage detection on bearings 1. Test Rack

In this project a test rack will be used to analyse machine data. An acceleration sensor will be used todetect damages of a bearing.

The main components of the test rack are an electrical motor, a frequency converter and a doublysupported shaft with an additional bearing in the middle, which should be investigated. The bearingis shown in Figure 2

*Figure 1 Test Rack*

The electric motor is rotating with a defined frequency, over a coupling element the shaft issupported by two self-align bearings. To avoid frequency variations a 23kg flywheel is mounteddirectly on the shaft of the motor.

Between the two self-align bearings the third bearing which should be investigated is attached. Thebearing is made by SKF with the bearing type number 61804. (Figure 3 and Figure 4). It is placedbetween a divisible bearing block.

To measure the vibrations a sensor of type PCB 353B15 will be used with a coupler of type Kistler5134A. A measurement device of type dSPACE MicroLabBox with 16 Bit (A/D Converter) will be usedto transmit the data to the computer, so that it is possible to analyse the data with matlab. Thesample frequency is fixed by 40kHz.



<a name="br2"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

*Figure 2 Detail view of test rack with bearing which should be investigated.*

2\. Geometrical data of the bearing SKF 61804

The bearing of the type SKF 61804 is a single row rill ball bearing with a cage and thirteen balls. Theexact name of the bearing from the company SKF is. (SKF 61804 055C PK12).

*Figure 3 Single row rill bearing*

Geometrical data of the bearing

nWK 13 (Number of rolling elements)DW 3,7mm (Diameter of rolling elements)DT 26,15mm (Part-circle diameter)αB 0° (Operating contact angle)fn 50Hz (Rotational frequency)




<a name="br3"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

*Figure 4 Geometrical data of the bearing SKF 61804*




<a name="br4"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

3\. The measurement system

*Figure 5 measurement chain*

4\. Data format of measurements

Each student gets three different kinds of measurement data with different states of the bearing. Alldatasets have the same structure.

datensatz Acceleration signalfs Sampling rate in Hzfn Rotational speed in Hzcomment Descriptions of the datasetsname Name of archiv file

5\. Task definition

1\.) Analyse the three signals with different signal processing methods and determine which signals

belong to a damaged bearing. Then decide which kind of damage. Different types of damage are listed in Table 1.

2\.) Present your results during a short power point presentation

• Extend: 5-10 slides

• Duration: 10-12 minutes• Date: tbd.



<a name="br5"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

6 Annotations for the analyse in frequency domain

*Table 1 Damage frequencys*

Cage rotational frequency with fix outer ring

Cage rotational frequency with fix inner ring

Rollover frequency of an irregularity on theouter ring

Rollover frequency of an irregularity on theinner ring

Rolling element rotation frequency or rollingelement spin frequency

Rollover frequency of a rolling elementirregularity on both tracks

• Please consider, that for a damaged inner ring the specific over roll frequency will be modulated by the frequency of the shaft. The result is that sidebands will occur around the damage frequency in the frequency spectrum.

• Often a damage is just detectable in higher harmonics of the over roll frequency. o Attention: The rotational speed was measured with a handheld tachometer, with a limited accuracy. Small deviations during the estimation of the rotational speed can lead to larger differences especially when considering higher harmonic.

• Usually bearing damages occur as shock shaped impulses. These impulses are shown as peaks, which resonate for a while because of the machine resonance. An by the damage frequency amplitude modulated signal will be detect. Aim of the envelope formation is to demodulate the signal so that just the damage frequency remains. It is a typical approach in the communication technology. A high frequency carrier signal is modulated with the message signal (Figure 6 left) to ensure an efficient transmitting. At the receiver the message signal will be separated from the modulated signal by use of the envelope formation. The envelope spectrum has the advantage compared to the power density spectrum with the original signal in time domain the visualisation of the relevant frequencies. The power density spectrum will show mainly the carrier frequency fTr. The modulation frequency fm just occur as Sidebands (figure 6, middle). By use of envelope spectrum the modulation frequency will be shown, while the unimportant carrier frequency is for example just a machine resonance.



<a name="br6"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

*Figure 6 Comparison between frequency and envelope spectrum*

The envelope can be generated using the Hilbertransformation. The signal will be transformed to thefrequency domain then phase shifted by 90° and then transformed back to time domain. The result isan analytic signal x, which real part xr is the original signal and the imaginary part xi is thehilbertransform:

*x* = *xr* + *j* × *xi*

The amount of the analytic signal is the envelope. (Figure 7)

*Figure 7 Creation of the envelope using hilbertransformation*

Was the envelope extracted, the envelope spectrum can be calculated using thefouriertransformation. Like the power spectral density, it is possible to calculate the envelope powerdensity spectrum. Cause of simplicity it is just called envelope spectrum.

The added matlab function

[h] = hcurve\_fun(y,anzeige,N)

Calculate the envelope of a time domain signal using hilbert transformation. A description of the function is build in. (help hcurve\_fun)



<a name="br7"></a>Project work to the lecture Condition Monitoring

Prof. Dr.-Ing. Peter Kraemer – Institute of Mechanics (Structural Health Monitoring)

7 Distribution of rawdata

Each participant gets three different data packages which must be analyzed. The data packages arecompressed together in an archive-file. All archive-files are uploaded on moodle. Each student whowants to prepare the project needs to write an Email to the exercise responsible person.

WS 22/23 Marcel Wiemann <marcel.wiemann@uni-siegen.de>

As answer you get the name of the compressed file and the corresponding password, to unzip thearchive container.

8 Guideline for the preparation of the project

1 Each student prepares his own datasets.

2 One week before the presentation date, the presentation and the matlab-file must be sent to Mr. Wiemann

3 In the presentation it must be clearly visible which dataset was analyzed. For e.g. name of the rawdata file must be shown in the title or subtitle of the diagram.4 Password and archive-file name must be visible on the first slide of the presentation, together with your name your student id, your email-address and the name of the analyzed files.

5 A working version of the matlab-file which was used to analyze the data must be available on the day of presentation. In case of questions to the matlab-code.
