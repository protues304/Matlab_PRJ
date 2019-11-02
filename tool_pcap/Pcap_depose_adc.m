%---------------------------------------
%Packet Resolution
%---------------------------------------
close all;
clear;

%% ---------------- depose pcap file ----------------------------
f = fopen('./daq_packet/adc_sa1_verify_t2.pcap','r');
pcap_data = fread(f,'uint8');
fclose(f);
 %--- segment 
pcap_data = pcap_data(1:1412*50);

%% ---------------- Match the head ------------------------------
 % ---head= [55 aa 5a a5]
 head       = [85 170 90 165];
 head_sum   = sum(head.^2);
 m_comv     = conv(pcap_data,fliplr(head));
 ha_index   = find(m_comv == heSad_sum);
 h4_index   = find(pcap_data == head(4));
 head_index =intersect(ha_index,h4_index)-3;
 packet_len = 1405;  %head(5) + payload(1400)

 data = zeros(packet_len,length(head_index)-1);
%% ---------------- Re-shape ------------------------------------
for  i = 1:(length(head_index)-1)
    data(:,i) = pcap_data(head_index(i):head_index(i) + packet_len-1);
end

payload     = data(6:6+1400-1,:);
re_row      = 1*4; %1byte*2data
pl          = reshape(payload,re_row,[]);

%--- signed
%data1          = pl(1,:) + pl(2,:)*2^8;
%index_n        = find(data1 > 2^9);
%data1(index_n) = data1(index_n) - 2^10;

data1  = pl(1,:) + pl(2,:)*2^8 + pl(3,:)*2^16;

figure(1);
plot(data1);



