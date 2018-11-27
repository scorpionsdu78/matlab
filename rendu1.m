v=[1039;1070;1041;1102;1020;1054;1083;1084;1038;1030;1038;1100;1045;1083;1008;1043;1000;1034;1035;1047;1079;1038;1067;1058;1072;1156;1141;1080;1148;1074;1099;1075;1160;1072;1145;1148;1105;1117;1134;1123;1092;1157;1147;1167;1176;1131;1170;1099;1124;1104;1134;1181;1172;1199;1194;1112;1117;1111;1170;1195;1174;1153;1217;1147;1219;1177;1166;1212;1174;1217;1222;1143;1209;1204;1216;1155;1239;1210;1230;1148;1194;1195;1208;1244;1231;1247;1178;1169;1189;1184;1195;1230;1213;1188;1253;1195;1248;1245;1203;1257;1272;1255;1225;1255;1279;1281;1246;1197;1203;1218;1239;1259;1270;1294;1281;1293;1271;1220;1211;1231];
L=length(v);
pred = zeros(L+1,1);
for(i=2:L+1)
    pred(i)=v(i-1);
end;

dif=zeros(L,1);
for(i=2:L)
    dif(i)=v(i)-v(i-1);
end;

difpred=zeros(L+1,1);

for(i=2:L+1)
    difpred(i)=dif(i-1);
end;

average = zeros(L,1);

for(i=3:L)
    average(i) = (v(i) + v(i-1) + v(i-2))/3;
end;

average2 = zeros(L,1);

for(i=4:L)
    average2(i) = (dif(i) + dif(i-1) + dif(i-2))/3;
end;

average3 = zeros(L,1);


prompt= 'k= ';

k =input(prompt);

while(k>=L)
   prompt= 'k= ';

    k =input(prompt); 
end;

fprintf('%i\n',k);


rmse1=sqrt(mean((v(2:L)-pred(2:L)).^2)/L);

rmse2=sqrt(mean((dif(2:L)-difpred(2:L)).^2)/L);

rmse3=sqrt(mean((v(3:L)-average(3:L)).^2)/L);

rmse4=sqrt(mean((dif(3:L)-average2(3:L)).^2)/L);



for(i=1:L)
    fprintf('%2i  | v= %10.2f | dif= %10.2f | zero-order-hold-v=  %10.2f | zero-order-hold-dif= %10.2f | average-v= %10.2f | average-dif= %10.2f \n', i, v(i), dif(i), pred(i), difpred(i), average(i), average2(i));
end

fprintf('\n\n rmse-zero-order-hold-v= %10.2f | rmse-zero-order-hold-dif= %10.2f | rmse-average-v= %10.2f | rmse-average-dif= %10.2f \n',rmse1,rmse2,rmse3,rmse4);

subplot(5,1,1); plot(v);
subplot(5,1,2); plot(pred);
subplot(5,1,3);plot(difpred);
subplot(5,1,4);plot(average);
subplot(5,1,5); plot(average2);

system('pause');

clc;

%% task B%%


rmse5 = zeros(L,1);

for(k=2:(L-1))

    for(i=k:L)
        for(j=i-(k-1):i)
            average3(i) = average3(i) + v(j);
        
        end
    
    end
    
    average3(i) = average3(i)/k;
    
    rmse5(k)=sqrt(mean((v(3:L)-average3(3:L)).^2)/L);
    
    subplot(L,1,k);plot(average3);
    
    average3=zeros(L,1);
end

for(i=2:L)
    
    fprintf('\n rmse k= %2i : %10.2f\n',i,rmse5(i));
    
end

system('pause');

clc;

%%task C%%

