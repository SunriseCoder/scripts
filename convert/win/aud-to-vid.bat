
ffmpeg ^
	-loop 1 ^
	-i d:\convert\scripts\AudioToVideoStub.jpg ^
	-i %1 ^
	-c:a copy ^
	-c:v libx264 -tune stillimage -pix_fmt yuv420p ^
	-shortest ^
	%1.mp4

echo %1 is done
