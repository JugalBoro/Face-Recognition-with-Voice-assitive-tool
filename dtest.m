%Testing Model:

clc;close;clear

c=webcam;

load myNet2;

faceDetector=vision.CascadeObjectDetector;

while true

    e=c.snapshot;

    bboxes =step(faceDetector,e);

    if(sum(sum(bboxes))~=0)

     es=imcrop(e,bboxes(1,:));

    es=imresize(es,[227 227]);

    label=classify(myNet1,es);

    image(e);

    title(char(label));
    object_Name = char(label);
    Object_Name1 = char('This is'); 

    NET.addAssembly('System.Speech');
    obj = System.Speech.Synthesis.SpeechSynthesizer;
    obj.Volume = 100;
    Speak(obj, object_Name);

    drawnow;

    else

        image(e);

        title('No Face Detected');

    end

end 