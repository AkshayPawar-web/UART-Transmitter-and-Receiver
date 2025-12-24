UART Communication Protocol
# 1.INTRODUCTION :
UART ,or Universal Asynchronous Receiver Transmitter Protocol.is one of the most used device-to-device communication protocols.UART can work with many different types of serial protocols that involve transmitting and receiving serial data. In serial communication, data is transferred bit by bit using a single line or wire. In two-way communication, we use two wires for successful serial data transfer.

From name itself we can understand the function of UART,where U stand for universal which means this protocol can be applied to any transmitter and receiver, and A is for Asynchronous which mean one cannot shared use clock signal for communication  of data and R and T refer to Receiver and transmitter.
There are Two wire in which only one wire is used for transmission and other wire is used for reception. Data format and transmission speeds can be configured here. So, before starting with the communication define the data format and transmission speed.
On comparing this serial communication of UART with parallel then it can be observed that in parallel multiple buses are required.Based on the number of lines bus complexity of UART is better but parallel communication is good in terms of speed. So, when speed is required at that time we should select parallel communication and for a low-speed application, UART must be used and the bus complexity will be less.
For UART serial communications, the baud rate needs to be set the same on both the transmitting and receiving end’s. The baud rate is the rate at which information is transferred over communication channel. In the serial port context, the set baud rate will serve as the maximum number of bits per second to be transferred. 
The two signals of each UART device are named:
* Transmitter (Tx)
* Receiver (Rx)
  
The main purpose of a transmitter and receiver line for each device is to transmit and receive serial data intended for serial communication.

<img width="783" height="329" alt="Screenshot 2025-12-24 221246" src="https://github.com/user-attachments/assets/20a79927-d496-4202-a811-086734bd648d" />

# Baud_rate_generator:

Baud rate=115200 bit/sec

Internal clock frequency =25MHZ

Bit Time: Amount of duration of time which s allocated to single bit which is given as follow.

 <img width="277" height="121" alt="image" src="https://github.com/user-attachments/assets/8f4b0f90-1b3b-44a6-be77-7fe1211b4aca" />   
                                  
So baud rate  always inversely proportional to bit time as baud rate increases  bit time decreases.

Numbers of cycle to to send the single bit at desired baud rate is given below.
<img width="534" height="153" alt="image" src="https://github.com/user-attachments/assets/e9ee1506-14f7-4855-ad21-9c54175e1fed" />


⸫ for sending 1 bit 217 cycle are required to achieve 115200 baud rate

⸫ At master (transmitter) required counter to count 0 to 216 cycle for sending single bit and again it reset to 0 for sending other bit.

<img width="621" height="68" alt="image" src="https://github.com/user-attachments/assets/7a40e60e-c6b4-4528-a3c1-03910b00ca74" />


At the receiver, the number of clock cycles required to receive a single bit is 14 cycles. The difference between the transmitter and receiver timing occurs because, in UART, there is no shared clock between the transmitter and receiver. Due to possible baud-rate mismatch and clock drift, the receiver cannot rely on exact bit timing like the transmitter.
To avoid missing data, the receiver uses a 16× oversampling technique. It samples the incoming data multiple times within one bit period and selects the sample near the center of the bit. 

Because of start-bit detection and internal synchronization, the effective sampling of each bit happens after about 14 cycles instead of 16, which improves reliability and ensures correct data reception.

⸫ At slave (receiver) required counter to count 0 to 14 cycle for receiving single bit and again it reset to 0 for re other bit.

# Transmitter FSM:
<img width="598" height="405" alt="image" src="https://github.com/user-attachments/assets/d4ccbc4f-d9fb-4172-a8b6-12245db1ffbd" />

# Receiver FSM:

<img width="620" height="399" alt="image" src="https://github.com/user-attachments/assets/08f5cbcb-878c-426e-9a9c-8c8d091e9f7b" />


# Repository Structure
* Schematic
* code
* README.md
* UART Communication_Protocol.pdf(Documentaion)
*  simualtion Result(images)
# Contact Me!
www.linkedin.com/in/
akahay-pawar-73a656258
