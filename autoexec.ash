#Level sounds
t pwm 1 set_level 49

#cleans any folder in DCIM of _thm.mp4 and .THM
lu_util exec 'rm -fR /tmp/fuse_d/DCIM/*/*.THM' 
lu_util exec 'rm -fR /tmp/fuse_d/DCIM/*/*_thm.mp4'

#create RAW files
t app test debug_dump 14

#SET 4GB File weight limit
#Tamaño max archivo a 4GB
writew 0xC03A2654 0x2004

#SET JPEG QUALITY TO 100
writeb 0xC0BC205B 0x64

