set wave_name=%1.wav

ffmpeg -i %1 -vn -ac 1 %wave_name%
echo Unpacking of %wave_name% is done

call norm.bat %wave_name%
echo Normalization of %wave_name% is done

ffmpeg ^
	-i %1 ^
	-i %wave_name%_norm.wav ^
	-map 0:0 ^
	-map 1:0 ^
	-c:v libx264 ^
	-crf 23 ^
	-vf "scale=640:360" ^
	-c:a aac ^
	-b:a 64k ^
	%1_scaled.mp4
echo Scaling for %1 is done

echo deleting temporary files

del %wave_name%
del %wave_name%_norm.wav

echo Scaling of %1 is done