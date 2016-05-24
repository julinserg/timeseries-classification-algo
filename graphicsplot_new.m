clc;
clear;
%%
x_speech = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 660];
y_speech_train_hmm_full_5_0 = [0.900000000000000,0,0,0,0,0.00166666666666667,0,0.00250000000000000,0.00222222222222222,0.00100000000000000,0.0133333333333333,0.00850000000000000,0.00800000000000000,0.0206666666666667,0.0340000000000000,0.0367500000000000,0.0524444444444444,0.0532000000000000,0.0527272727272727,0.0738333333333333,0.0556060606060606];
y_speech_test_hmm_full_5_0 = [0.900000000000000,0.745909090909091,0.491818181818182,0.462727272727273,0.432272727272727,0.410909090909091,0.401363636363636,0.414545454545455,0.387272727272727,0.429545454545455,0.382727272727273,0.349545454545455,0.361818181818182,0.335000000000000,0.186818181818182,0.153636363636364,0.143636363636364,0.125454545454545,0.117272727272727,0.117727272727273,0.0954545454545455];

y_speech_train_hmm_diag_5_0 = [0.900000000000000,0.0150000000000000,0.0133333333333333,0,0.00200000000000000,0.0400000000000000,0.0228571428571429,0.0350000000000000,0.0444444444444444,0.0240000000000000,0.0480000000000000,0.0745000000000000,0.0816000000000000,0.0850000000000000,0.144000000000000,0.148500000000000,0.155777777777778,0.143000000000000,0.157272727272727,0.139500000000000,0.130909090909091];
y_speech_test_hmm_diag_5_0 = [0.900000000000000,0.719090909090909,0.433636363636364,0.409090909090909,0.359545454545455,0.384545454545455,0.405000000000000,0.403636363636364,0.331363636363636,0.384545454545455,0.301363636363636,0.347272727272727,0.334090909090909,0.302727272727273,0.270454545454545,0.233636363636364,0.190000000000000,0.193181818181818,0.158181818181818,0.155909090909091,0.131363636363636];

y_speech_train_hcrf_5_0 = [0.0 0.0 0.0 0.0 0 0.0 0.0 0.0 0.0 0 0.000666666666666667 0.00200000000000000 0.00640000000000000 0.00366666666666667 0.0225714285714286 0.0265000000000000 0.0317777777777778 0.0300000000000000 0.0416363636363636 0.0516666666666667 0.0326153846153846];
y_speech_test_hcrf_5_0 = [0.529090909090909 0.5087 0.4884 0.4681 0.447727272727273 0.4345 0.4212 0.4079 0.3946 0.381363636363636 0.345000000000000 0.328181818181818 0.334090909090909 0.260454545454545 0.168181818181818 0.0881818181818182 0.0936363636363636 0.0872727272727273 0.0713636363636364 0.0627272727272727 0.0722727272727273];

y_speech_train_npmpgm_5_0 = [0.0300000000000000 0.0250000000000000 0.0400000000000000 0.0475000000000000 0.0440000000000000 0.0683333333333333 0.0628571428571429 0.0712500000000000 0.0744444444444444 0.0600000000000000 0.0773333333333333 0.0940000000000000 0.116800000000000 0.114000000000000 0.188571428571429 0.214750000000000 0.216000000000000 0.227200000000000 0.221090909090909 0.213000000000000 0.208333333333333];
y_speech_test_npmpgm_5_0 = [0.511818181818182 0.427727272727273 0.358181818181818 0.305000000000000 0.281818181818182 0.298636363636364 0.302272727272727 0.299545454545455 0.277272727272727 0.277272727272727 0.254090909090909 0.256818181818182 0.262727272727273 0.266818181818182 0.262272727272727 0.253181818181818 0.247272727272727 0.235000000000000 0.215909090909091 0.213181818181818 0.224090909090909];

%%
x_char = [6 12 18 24 30 36 42 48];
y_char_train_hmm_full_7_0 = [0.00833333333333333,0.00416666666666667,0.0333333333333333,0.0187500000000000,0.0233333333333333,0.0277777777777778,0.0285714285714286,0.0354166666666667];
y_char_test_hmm_full_7_0 = [0.478000000000000,0.412000000000000,0.381000000000000,0.416000000000000,0.327000000000000,0.368000000000000,0.327000000000000,0.332000000000000];

y_char_train_hmm_full_5_0 = [0.0500000000000000,0.0708333333333333,0.0555555555555556,0.0250000000000000,0.0533333333333333,0.0319444444444444,0.0261904761904762,0.0552083333333333];
y_char_test_hmm_full_5_0 = [0.460000000000000,0.463000000000000,0.416000000000000,0.422000000000000,0.336000000000000,0.371000000000000,0.324000000000000,0.333000000000000];

y_char_train_hmm_diag_7_0 = [0,0.0583333333333333,0.108333333333333,0.108333333333333,0.0866666666666667,0.0930555555555556,0.120238095238095,0.0937500000000000];
y_char_test_hmm_diag_7_0 = [0.535000000000000,0.460000000000000,0.507000000000000,0.446000000000000,0.431000000000000,0.473000000000000,0.412000000000000,0.465000000000000];

y_char_train_hcrf_7_0 = [0 0 0 0 0.00208333333333333 0 0 0];
y_char_test_hcrf_7_0 = [0.4486 0.383 0.3596 0.3344 0.279000000000000 0.241000000000000 0.249 0.2566 ];


y_char_train_npmpgm_7_0 = [0.0333333333333333,0.0458333333333333,0.0583333333333333,0.0645833333333333,0.0716666666666667,0.0888888888888889,0.0630952380952381,0.0739583333333333];
y_char_test_npmpgm_7_0 = [0.360000000000000,0.329000000000000,0.361000000000000,0.330000000000000,0.349000000000000,0.372000000000000,0.366000000000000,0.387000000000000];


%%
x_acs = [5 10 15 20];
%y_acs_train_hmm_9_16 = [0 0 0.00952380952380953 0.0142857142857143];
%y_acs_test_hmm_9_16 = [0.505714285714286 0.392857142857143 0.391428571428571 0.381428571428571];
%y_acs_val_hmm_9_16 = 0.3886;

y_acs_train_hmm_9_3 = [0.0285714285714286 0.0857142857142857 0.0571428571428571 0.0571428571428571];
y_acs_test_hmm_9_3 = [0.452857142857143 0.412857142857143 0.402857142857143 0.392857142857143];
y_acs_val_hmm_9_3 = 0.3886;

y_acs_train_hcrf_9_0 = [0 0 0.00952380952380953 0];
y_acs_test_hcrf_9_0 = [0.465714285714286 0.430000000000000 0.342857142857143 0.325714285714286];
y_acs_test_hcrf_9_0m = [0.465714285714286 0.430000000000000 0.342857142857143 0.305714285714286];
y_acs_val_hcrf_9_0 = 0.2958;

y_acs_train_npmpgm_15_15 = [0 0 0 0.01414285714285714];
y_acs_test_npmpgm_15_15 = [0.398571428571429 0.361428571428571 0.327142857142857 0.345714285714286];
y_acs_test_npmpgm_15_15m = [0.398571428571429 0.361428571428571 0.327142857142857 0.293714285714286];
y_acs_val_npmpgm_15_15 = 0.2851;
%%
TYPE = 1;
%%
if TYPE == 1
    x1 = x_char;
    y1 = y_char_train_npmpgm_7_0;
    y2 = y_char_test_npmpgm_7_0;   
    y3 = 0;
    title('HCRF');
    set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Times New Roman');
    set(0,'DefaultTextFontSize',14,'DefaultTextFontName','Times New Roman');
    %figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
    
    hold on;
    grid on;    
    plot(x1, y1,'r','LineWidth',3);
    plot(x1, y2,'--','Color',[.1 .4 .1],'LineWidth',3);
    %plot(x1, repmat(min(y2),size(x1,1),size(x1,2)),'black','LineWidth',1);
    plot(x1, repmat(y3,size(x1,1),size(x1,2)),'-.','Color','black','LineWidth',1);
    axis([min(x1),max(x1),0,0.6])
    legend('������ �� ��������� �������','������ �� �������� �������', 1);
    BX=get(gca,'XTick');
    BY=get(gca,'YTick');
else
    %x1 = x_speech;
    %y1 = y_speech_test_hmm_full_5_0;
    %y2 = y_speech_test_hmm_diag_5_0;
    %y3 = y_speech_test_hcrf_5_0;
    %y4 = y_speech_test_npmpgm_5_0;
    x1 = x_char;
    y1 = y_char_test_hmm_full_7_0;
    y2 = y_char_test_hmm_diag_7_0;
    y3 = y_char_test_hcrf_7_0;
    y4 = y_char_test_npmpgm_7_0;
    set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Times New Roman');
    set(0,'DefaultTextFontSize',14,'DefaultTextFontName','Times New Roman');
    %figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
    %title('��������');
    hold on;
    grid on;    
    plot(x1, y1,'--','Color',[.1 .4 .1],'LineWidth',3);
    plot(x1, y2,'-.','Color',[.8 .6 .1],'LineWidth',3);
    plot(x1, y3,'r','LineWidth',3);
    plot(x1, y4,':','Color',[0 0 1],'LineWidth',3);
    axis([min(x1),max(x1),0,0.6])
    legend('HMM(Full)','HMM(Diagonal)','HCRF','HMM-SSOM', 1);
    BX=get(gca,'XTick');
    BY=get(gca,'YTick');
end;
%%
%xlabel('���������� ��������� ������','Position',[BX(size(BX,2)) BY(1)])
%ylabel('������ �������������','Rotation',0,'Position',[BX(1) BY(size(BY,2))])
xlabel('���������� ��������� ������')
ylabel('������ �������������')

XA=get(gca,'XTickLabel');%

for i=1:size(XA,1)

    z=rem(i,2);
    if z==0;
        if XA(i,1)~='0' && XA(i,2)~=0
            XA(i,:)=char(0);
        end
    end
    
end

XA(size(XA,1),:)=char(0);

set(gca,'XTickLabel',XA);

YA=get(gca,'YTickLabel');%

for i=1:size(YA,1)

    z=strfind(YA(i,:),'.');
    YA(i,z)=',';
    clear z;
    z=rem(i,2);
    if z~=0; 
        YA(i,:)=char(0);
    end
    
end

YA(size(YA,1),:)=char(0);

set(gca,'YTickLabel',YA);

%xlabel('Sample Size');
%ylabel('Error');
