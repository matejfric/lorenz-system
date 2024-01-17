function [] = save_animation_video(frames, filename)
%SAVE_ANIMATION_VIDEO
arguments
    frames, filename = 'test'
end

fps = 60; 

v = VideoWriter(filename, 'MPEG-4'); % default 'AVI'
v.FrameRate = fps;
v.Quality = 95; % integer in the range [0,100]

open(v) % Open the video file

B = 250; % buffer (batch size) 
for k = progress(1:B:length(frames)-B+1)
    f = frames(k:k+B);
    writeVideo(v,f);
end
k=k+B;
if k < length(frames)
  writeVideo(v, frames(k:end));
end

close(v) % Close the video file.

end
