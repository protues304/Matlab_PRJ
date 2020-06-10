clc;
clear;
close all;

buff_size = 1000;
packet_len = 605;
u=udp('192.168.1.102','RemotePort',6677,'Localport',6699);
set(u,'DatagramTerminateMode','on');   
set(u, 'InputBufferSize', buff_size);     
set(u,'Timeout',2); 
disp(u);

r_buff = zeros(1,buff_size);
r_data = zeros(1,packet_len);
h1 = figure(1);
h1.Position=[-1156 574 1138 420];
len = 0;

for i=1:1:500
    i
    fopen(u);
    [r_buff,len] = fscanf(u);
    fclose(u);
    r_buff = uint8(r_buff);
    len
     if(len< packet_len)
         continue;
     end
    %a = r_buff(5)
    r_data = r_buff(6:605);
    plot(r_data);
    axis([0,620,-50,300]);
    drawnow();
    pause();
end
delete(u);
