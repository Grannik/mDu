#!/bin/bash
 source "sDu.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[30;47m";}
#
 HEAD()
{
 for (( a=2; a<=29; a++ ))
          do
              TPUT $a 1;$E "$ma"
          done
TPUT  1 1;$E "$mb"
TPUT  3 3;$E "\e[1;36m *** du ***\e[0m";
TPUT  4 3;$E "\e[2m Оценить использование файлового пространства\e[0m";
TPUT  5 1;$E "$mc"
TPUT 14 1;$E "$mc"
TPUT 15 3;$E "\e[2m Обязательные аргументы для длинных опций обязательны и для коротких опций.\e[0m";
TPUT 17 3;$E "\e[2m Отображаемые значения представлены в единицах первого доступного SIZE\e[0m";
TPUT 18 3;$E "\e[2m из --block-size и переменных среды DU_BLOCK_SIZE, BLOCK_SIZE и BLOCKSIZE.\e[0m";
TPUT 19 3;$E "\e[2m В противном случае единицы измерения по умолчанию равны 1024 байтам\e[0m";
TPUT 20 3;$E "\e[2m (или 512, если установлено POSIXLY_CORRECT).\e[0m";
TPUT 21 3;$E "\e[2m Аргумент SIZE представляет собой целое число и необязательную единицу\e[0m";
TPUT 22 3;$E "\e[2m измерения (пример: 10 КБ равно 10*1024).\e[0m";
TPUT 23 3;$E "\e[2m Единицы: K,M,G,T,P,E,Z,Y (степень 1024) или KB,MB,... (степень 1000).\e[0m";
TPUT 24 3;$E "\e[2m Также можно использовать двоичные префиксы: KiBu003dK, MiBu003dM и так далее.\e[0m";
TPUT 25 1;$E "$mc"
TPUT 27 1;$E "$md"
}
 FOOT(){ MARK;TPUT 30 1;$E "$me";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Установка                                                          \e[32m Install \e[0m";}
  M1(){ TPUT  7 3; $e " Kраткий обзор                                                     \e[32m Synopsis \e[0m";}
  M2(){ TPUT  8 3; $e " Описание                                                       \e[32m Description \e[0m";}
  M3(){ TPUT  9 3; $e " Авторы                                                              \e[32m Author \e[0m";}
  M4(){ TPUT 10 3; $e " Смотрите также                                                    \e[32m See Also \e[0m";}
  M5(){ TPUT 11 3; $e " Авторские права                                                  \e[32m Copyright \e[0m";}
  M6(){ TPUT 12 3; $e " Сообщение об ошибках                                        \e[32m Reporting Bugs \e[0m";}
  M7(){ TPUT 13 3; $e " Шаблоны                                                           \e[32m Patterns \e[0m";}
  M8(){ TPUT 16 3; $e " Опции, Параметры                                                   \e[32m Options \e[0m";}
  M9(){ TPUT 26 3; $e " Grannik Git                                                                 ";}
 M10(){ TPUT 28 3; $e " Exit                                                                        ";}
LM=10
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Предустаномлена
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 du [OPTION]... [FILE]...
 du [OPTION]... --files0-from=F
\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Суммируйте использование диска набором ФАЙЛОВ, рекурсивно для каталогов.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Авторы сценария:
 Torbjorn Granlund, David MacKenzie, Paul Eggert, and Jim Meyering.
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Полная документация:\e[36m https://www.gnu.org/software/coreutils/du\e[0m
 или доступна локально через:\e[32m info '(coreutils) du invocation'\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Copyright © 2020 Free Software Foundation, Inc. Лицензия GPLv3+: GNU GPL версии 3
 или выше:\e[36m https://gnu.org/licenses/gpl.html\e[0m
 Это бесплатное программное обеспечение: вы можете изменять и распространять его.
 НИКАКИХ ГАРАНТИЙ, насколько это разрешено законом.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Онлайн-справка GNU coreutils:\e[32m https://www.gnu.org/software/coreutils/\e[0m
 Сообщайте обо всех ошибках перевода по адресу:
\e[32m https://translationproject.org/team/\e[0m
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Шаблоны — это шаблон оболочки (не регулярное выражение).
 Шаблон ? соответствует любому одному символу,
 тогда как * соответствует любой строке
 (состоящей из нуля, одного или нескольких символов).
 Например, *.o будет соответствовать всем файлам, имена которых заканчиваются
 на .o. Следовательно, команда:
\e[32m du --exclude='*.o'\e[0m
 пропустит все файлы и подкаталоги, оканчивающиеся на .o (включая сам файл .o).
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;./nDu.sh;ES;fi;;
#
  9) S=M9;SC;if [[ $cur == enter ]];then R;echo -e "
 Di 12 Jul 2022 16:42:14 CEST
 Описание утилиты.
 Asciinema:  \e[36m \e[0m
 Github:     \e[36m \e[0m
 Gitlab:     \e[36m \e[0m
 Sourceforge:\e[36m \e[0m
 Notabug:    \e[36m \e[0m
 Bitbucket:  \e[36m \e[0m
 Framagit:   \e[36m \e[0m
 GFogs:      \e[36m \e[0m
 Codeberg:   \e[36m \e[0m
 Gitea       \e[36m \e[0m
 ~~~ File ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Phacility:  \e[36m \e[0m
 Archive:    \e[36m \e[0m
 Discord:    \e[36m \e[0m
 Mewe:       \e[36m \e[0m
 ~~~ Post ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Bastyon:\e[36m \e[0m
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Peergos:\e[36m \e[0m
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done
