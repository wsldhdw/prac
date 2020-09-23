function output_data = oversample(input_data, times)

b=times;
a=input_data;
c=length(a);
d=[];
for i=1:c
    c=a(i).* ones(1,b);
    d=[d,c];
end
output_data=d;
end