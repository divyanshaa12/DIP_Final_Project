function diff_img = anisodiff(img, num_iter, delta_t, K, option)

diff_img=double(img);

%Setting default values.
switch nargin
    case 1
        num_iter = 20;
        delta_t = 1/7;
        K = 10;
        option=1;
    case 2
        delta_t = 1/7;
        K = 10;
        option=1;
    case 3
        K = 10;
        option=1;
    case 4
        option=1;
end

%masks for n s w e ne nw sw se gradient calculation
Hn=[0 1 0;0 -1 0;0 0 0];
Hs=[0 0 0;0 -1 0;0 1 0];
He=[0 0 0;0 -1 1;0 0 0];
Hw=[0 0 0;1 -1 0;0 0 0];
Hnw=[1 0 0;0 -1 0;0 0 0];
Hne=[0 0 1;0 -1 0;0 0 0];
Hsw=[0 0 0;0 -1 0;1 0 0];
Hse=[0 0 0;0 -1 0;0 0 1];

for i=1:num_iter
    
    %Calculating gradients
    In=conv2(diff_img,Hn,'same');
    Is=conv2(diff_img,Hs,'same');
    Ie=conv2(diff_img,He,'same');
    Iw=conv2(diff_img,Hw,'same');
    Inw=conv2(diff_img,Hnw,'same');
    Ine=conv2(diff_img,Hne,'same');
    Isw=conv2(diff_img,Hsw,'same');
    Ise=conv2(diff_img,Hse,'same');
    
    if option==1
        Cn = exp(-(In./K).^2);
        Cs = exp(-(Is./K).^2);
        Cw = exp(-(Iw./K).^2);
        Ce = exp(-(Ie./K).^2);
        Cne = exp(-(Ine./K).^2);
        Cnw = exp(-(Inw./K).^2);
        Cse = exp(-(Ise./K).^2);
        Csw = exp(-(Isw./K).^2);
        
        %Solving the PDE equation
        diff_img = diff_img + delta_t.*( In.*Cn + Ie.*Ce + Iw.*Cw + Is.*Cs + ...
            0.5.*( Ine.*Cne + Ise.*Cse +...
            Inw.*Cnw + Isw.*Csw ) );
    
    elseif option==2
        a=1; % a>0
        Cn=(1 + (In./K).^(1+a)).^(-1);
        Cs=(1 + (Is./K).^(1+a)).^(-1);
        Ce=(1 + (Ie./K).^(1+a)).^(-1);
        Cw=(1 + (Iw./K).^(1+a)).^(-1);
        Cne=(1 + (Ine./K).^(1+a)).^(-1);
        Cnw=(1 + (Inw./K).^(1+a)).^(-1);
        Cse=(1 + (Ise./K).^(1+a)).^(-1);
        Csw=(1 + (Isw./K).^(1+a)).^(-1);
        
        %Solving the PDE equation
        diff_img = diff_img + delta_t.*( In.*Cn + Ie.*Ce + Iw.*Cw + Is.*Cs + ...
            0.5.*( Ine.*Cne + Ise.*Cse +...
            Inw.*Cnw + Isw.*Csw ) );

    elseif option==3
        Cn = exp(-(In./K).^2);
        Cs = exp(-(Is./K).^2);
        Cw = exp(-(Iw./K).^2);
        Ce = exp(-(Ie./K).^2);
                
        %Solving the PDE equation
        diff_img = diff_img + delta_t.*( In.*Cn + Ie.*Ce + Iw.*Cw + Is.*Cs );
    
    elseif option==4
        a=1; % a>0
        Cn=(1 + (In./K).^(1+a)).^(-1);
        Cs=(1 + (Is./K).^(1+a)).^(-1);
        Ce=(1 + (Iw./K).^(1+a)).^(-1);
        Cw=(1 + (Ie./K).^(1+a)).^(-1);
        
        %Solving the PDE equation
        diff_img = diff_img + delta_t.*( In.*Cn + Ie.*Ce + Iw.*Cw + Is.*Cs );
    end
end
