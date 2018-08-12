# Xiaomi-Yi-Script
Xiaomi Yi Script | firmware 1.5.12
# Xiaomi Yi Z(22/23/25)L 1.5.12 customized bitrates script
# WARNING: may be not compatible with other hardware revisions (Z2*, Z26L etc.)!
 

#desactivar Auto Balance Blancos
#t ia2 -awb off

#set AAA function
#Activar ajuste de blancos# -3a [ae][awb][af][adj]: turn on/off ae/awb/af/adj
#  ae = [0|1], 0:on 1:off AE
#  awb = [0|1], 0:on 1:off AWB
#  af  = [0|1], 0:on 1:off AF
#  adj = [0|1], 0:on 1:off ADJ
#t ia2 -3a 1 1 0 1

#set Noise Reduction
# tidx: [ev_idx][nf_idx][shutter_idx], -1 disable  
# [nf_idx]: 0-16383
t ia2 -adj tidx -1 200 -1


# 2K
#2304x1296 30fps - Hi - 45mb
writew 0xC05CBEB2 0x4234
#2304x1296 30fps - Mid - 35mb
writew 0xC05CBEC2 0x420C
#2304x1296 30fps - Low - 25mb
writew 0xC05CBED2 0x41C8

# FullHD
#1920x1080 30fps - Hi - 30mb
writew 0xC05CBF72 0x41F0
#1920x1080 30fps - Mid - 25mb
writew 0xC05CBF82 0x41C8
#1920x1080 30fps - Low - 18mb
writew 0xC05CBF92 0x4190

#1920x1080 48fps - Hi - 35mb
writew 0xC05CC452 0x420C
#1920x1080 48fps - Mid - 30mb
writew 0xC05CC462 0x41F0
#1920x1080 48fps - Low - 20mb 
writew 0xC05CC472 0x41A0

#1920x1080 60fps - Hi - 45mb
writew 0xC05CBEE2 0x4234
#1920x1080 60fps - Mid - 35mb
writew 0xC05CBEF2 0x420C
#1920x1080 60fps - Low - 25mb
writew 0xC05CBF02 0x41C8

#1920x1080 24fps - Hi - 30mb
writew 0xC05CC482 0x41F0
#1920x1080 24fps - Mid - 25mb
writew 0xC05CC492 0x41C8
#1920x1080 24fps - Low - 18mb
writew 0xC05CC4A2 0x4190

# HD
#1280x720 120fps - Hi - 40mb
writew 0xC05CC812 0x4220
#1280x720 120fps - Mid - 30mb
writew 0xC05CC822 0x41F0
#1280x720 120fps - Low - 25mb
writew 0xC05CC832 0x41C8

#1280x720 60fps - Hi - 25mb
writew 0xC05CC122 0x41C8
#1280x720 60fps - Mid - 20mb
writew 0xC05CC132 0x41A0
#1280x720 60fps - Low - 18mb
writew 0xC05CC142 0x4190

#1280x720 48fps - Hi - 25mb
writew 0xC05CC5A2 0x41C8
#1280x720 48fps - Mid - 20mb
writew 0xC05CC5B2 0x41A0
#1280x720 48fps - Low - 16mb
writew 0xC05CC5C2 0x4170

#1280x720 30fps - Hi - 20mb
writew 0xC05CC182 0x41A0
#1280x720 30fps - Mid - 16mb
writew 0xC05CC192 0x4170
#1280x720 30fps - Low - 12mb
writew 0xC05CC1A2 0x4140

#1280x720 24fps - Hi - 20mb
writew 0xC05CC5D2 0x41A0
#1280x720 24fps - Mid - 16mb
writew 0xC05CC5E2 0x4170
#1280x720 24fps - Low - 12mb
writew 0xC05CC5F2 0x4140


# Other (Hi options only)
#1280x960 24fps
writew 0xC05CC572 0x41C8
#1280x960 30fps
writew 0xC05CC2A2 0x41C8
#1280x960 48fps
writew 0xC05CC542 0x41C8
#1280x960 60fps
writew 0xC05CC272 0x41C8
#1600x1200 24fps
writew 0xC05CC512 0x41C8
#1600x1200 30fps
writew 0xC05CC0C2 0x41C8
#1600x1200 48fps
writew 0xC05CC4E2 0x41C8
#1600x1200 60fps
writew 0xC05CC092 0x41C8

#set buzzer volume 1-150
#front led blink

t gpio 6 sw out1 
sleep 1
t gpio 6 sw out0
t gpio 54 sw out1
sleep 1
t gpio 54 sw out0
#short beep & front leds
t gpio 6 sw out1
t gpio 54 sw out0
t pwm 1 enable
sleep 1
t gpio 6 sw out0
t gpio 54 sw out0
t pwm 1 disable

Шумоподавитель ( 0...16383 ) \ 3% = 500, 10% = 1640
t ia2 -adj tidx -1 3000 -1

первая цифра (-1) добавит яркости ( и шума) при смене с -1 на 0
вторая цифра "3000" шумодав изменив на 0 будет максимум резкости и максимум шума
третья цифра не влияет вроде ни на что ( хотя в описании это shutter idx = изменение выдержки )

Цифровой "зум" :
t ia2 -dzoom jump [0-487] 0 0

Громкость писка в камере ( 0...140 ) :
t pwm 1 set_level 140


Включить пищалку камеры
t pwm 1 enable
Выключить пищалку камеры
t pwm 1 disable


Ожидание следующего действия ( в секундах ) :
ждать 0,5сек.
lu_util exec 'sleep 0.5'

ждать 1сек.
sleep 1

ждать 100мсек.
p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p
или
lu_util exec 'sleep 0.1''


Команды между строк "do" и "done" выполняются по кругу пока условие "while true" истинно ( так как в этом условии стоит "true", то есть "истина", оно истинно всегда и значит команды выполняются бесконечное число раз ) 
while true
do
sleep 5
done


Нажать кнопку спуска ( для фото ) :
t app key shutter

Нажать кнопку спуска ( для видео ) :
t app key record


Включить светодиод Wi-Fi
t gpio 114 sw out0

Выключить светодиод Wi-Fi
t gpio 114 sw out1


Выключить камеру :
poweroff yes


Включить создание JPG+RAW файлов при съемке фотографий ( рядом с jpg файлом записывается .raw файл )
t app test debug_dump 14


Установить ISO=100 ( для фото ) :
t ia2 -ae exp 100 0 0


Отключает автоматически баланс белого
t ia2 -awb off


Запустить скрипт из другой папки через "autoexec.ash" :
d:\new_folder\script.ash


Установка выдержки ( для фото ) \ 900=1/16, 1100=1/48, 1400=1/245, 1550=1/552, 1750=1/1631, 2047=1/8147 (мин.)
t ia2 -ae still_shutter 900
