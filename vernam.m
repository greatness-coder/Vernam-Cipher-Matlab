%%
%%%Transmitter
msg = 'SECURITYINCPS';
a = length (msg);
key = round(rand(1,1)*10);
for i=1:a
    if msg(i)==32
        ciph(i)=32      %space
    else if msg(i)=='.'
        ciph(i)='.'    %full stop
    else
         l(i)= double(msg(i))+key;   %add key
         if l(i)>90
         q(i)= mod(l(i),90)     %check for invalid characters
         ciph(i)= (q(i)+65);
         else
         ciph(i)= (l(i));
         end
    end
    end
end
clc
fprintf('Key: %d \n Cipher: %s\n', key, ciph);

%%
%%%Reciever

%%%Assuming key recieved through secure channel
r_msg = ciph;

for i=1:a
    if r_msg(i)==32
        plain(i)=32      %space
    else if r_msg(i)=='.'
        plain(i)='.'    %full stop
    else
         l(i)= double(r_msg(i))-key;   %add key
         if l(i)<65     %check for invalid characters
         plain(i)= 90-(65-l(i));
         else
         plain(i)= (l(i));
         end
    end
    end
end
fprintf( 'Key: %d \n Plain text: %s\n', key, plain);