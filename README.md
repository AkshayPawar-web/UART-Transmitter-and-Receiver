UART Communication Protocol
# 1.INTRODUCTION :
UART ,or Universal Asynchronous Receiver Transmitter Protocol.is one of the most used device-to-device communication protocols.UART can work with many different types of serial protocols that involve transmitting and receiving serial data. In serial communication, data is transferred bit by bit using a single line or wire. In two-way communication, we use two wires for successful serial data transfer.

From name itself we can understand the function of UART,where U stand for universal which means this protocol can be applied to any transmitter and receiver, and A is for Asynchronous which mean one cannot shared use clock signal for communication  of data and R and T refer to Receiver and transmitter.
There are Two wire in which only one wire is used for transmission and other wire is used for reception. Data format and transmission speeds can be configured here. So, before starting with the communication define the data format and transmission speed.
On comparing this serial communication of UART with parallel then it can be observed that in parallel multiple buses are required.Based on the number of lines bus complexity of UART is better but parallel communication is good in terms of speed. So, when speed is required at that time we should select parallel communication and for a low-speed application, UART must be used and the bus complexity will be less.
For UART serial communications, the baud rate needs to be set the same on both the transmitting and receiving end’s. The baud rate is the rate at which information is transferred over communication channel. In the serial port context, the set baud rate will serve as the maximum number of bits per second to be transferred. 
The two signals of each UART device are named:
Transmitter (Tx)
Receiver (Rx)
The main purpose of a transmitter and receiver line for each device is to transmit and receive serial data intended for serial communication.

<img width="473" height="169" alt="image" src="https://github.com/user-attachments/assets/e75f2b0f-813a-4299-98cc-2c629ede3e3a" />
