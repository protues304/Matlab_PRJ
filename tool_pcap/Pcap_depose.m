%---------------------------------------
%Packet Resolution
%---------------------------------------
close all;
clear;

%% ---------------- depose pcap file ----------------------------
f = fopen('./daq_packet/dsp_rtl_verify_t2.pcap','r');
pcap_data = fread(f,'uint8');
fclose(f);
 %--- segment 
pcap_data = pcap_data(1:1412*400);

%% ---------------- Match the head ------------------------------
 % ---head= [a5 55 aa 5a]
 head       = [165 85 170 90];
 head_sum   = sum(head.^2);
 m_comv     = conv(pcap_data,fliplr(head));
 ha_index   = find(m_comv == head_sum);
 h4_index   = find(pcap_data == head(4));
 head_index =intersect(ha_index,h4_index)-3;
 packet_len = 1412-1;  %head(4) + packet_num(4) + payload(1400) + tail(4)

%% ---------------- Re-shape ------------------------------------
for  i = 1:(length(head_index)-1)
    data(:,i) = pcap_data(head_index(i):head_index(i) + packet_len);;
end

payload     = data(9:9+1400-1,:);
re_row      = 4*5; %4byte*5data
pl          = reshape(payload,20,[]);

data1 = pl(1,:) + pl(2,:)*2^8 + pl(3,:)*2^16 + pl(4,:)*2^24;
data2 = pl(5,:) + pl(6,:)*2^8 + pl(7,:)*2^16 + pl(8,:)*10^24;


 %--- signed

index_n        = find(data2 > 2^9);
data2(index_n) = data2(index_n) - 2^10;

figure(1);
plot(data1);



