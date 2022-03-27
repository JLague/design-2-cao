code=transpose(code);
code=code(1100:1530);
for i=1:(100)
    code=[code;code(1,:)];
end
saveas(imshow(code), "code.png")
I = imread("code.png");
msg = readBarcode(I);
disp(msg)