#!/bin/bash
source "sDu.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;37m";}
 HEAD()
{
 for (( a=2; a<=34; a++ ))
  do
   TPUT $a 1
    $E "$na";
  done
   TPUT  1 1;$E "$nb";UNMARK;
   TPUT  2 2;$E "\e[36m Options\e[0m \e[2m                                                    Опции, Параметры\e[0m";
   TPUT  3 1;$E "$nc";
   TPUT 33 1;$E "$nd";
}
 FOOT(){ MARK;TPUT 35 1;$E "$ne";UNMARK;}
  M0(){ TPUT  4 3; $e "Заканчивайте каждую строку вывода с помощью NUL                   \e[32m -0 --null \e[0m";}
  M1(){ TPUT  5 3; $e "Количество записей для всех файлов, а не только для каталогов      \e[32m -a --all \e[0m";}
  M2(){ TPUT  6 3; $e "Печатайте видимые размеры, а не использование диска         \e[32m --apparent-size \e[0m";}
  M3(){ TPUT  7 3; $e "Масштабировать размеры по SIZE перед их печатью        \e[32m -B --block-size=SIZE \e[0m";}
  M4(){ TPUT  8 3; $e "Эквивалентно                                                     \e[32m -b --bytes \e[0m";}
  M5(){ TPUT  9 3; $e "Подведите итог                                                   \e[32m -c --total \e[0m";}
  M6(){ TPUT 10 3; $e "Разыменовывать только символические ссылки            \e[32m -D --dereference-args \e[0m";}
  M7(){ TPUT 11 3; $e "Вывести общее количество для каталога                      \e[32m -d --max-depth=N \e[0m";}
  M8(){ TPUT 12 3; $e "Подведите итоги использования диска именами файлов          \e[32m --files0-from=F \e[0m";}
  M9(){ TPUT 13 3; $e "Эквивалентно --dereference-args (-D)                                     \e[32m -H \e[0m";}
 M10(){ TPUT 14 3; $e "Размеры печати в удобочитаемом формате                  \e[32m -h --human-readable \e[0m";}
 M11(){ TPUT 15 3; $e "Список информации об использовании inode вместо использования блока\e[32m --inodes \e[0m";}
 M12(){ TPUT 16 3; $e "Подобно --block-size=1K                                                  \e[32m -k \e[0m";}
 M13(){ TPUT 17 3; $e "Разыменование всех символических ссылок                    \e[32m -L --dereference \e[0m";}
 M14(){ TPUT 18 3; $e "Считайте размеры много раз, если они жестко связаны        \e[32m -l --count-links \e[0m";}
 M15(){ TPUT 19 3; $e "Подобно --block-size=1M                                                  \e[32m -m \e[0m";}
 M16(){ TPUT 20 3; $e "Не переходить по символическим ссылкам (по умолчанию)   \e[32m -P --no-dereference \e[0m";}
 M17(){ TPUT 21 3; $e "Для каталогов не включайте размер подкаталогов           \e[32m -S --separate-dirs \e[0m";}
 M18(){ TPUT 22 3; $e "Как -h, но используйте степени 1000, а не 1024                         \e[32m --si \e[0m";}
 M19(){ TPUT 23 3; $e "Отображение только суммы для каждого аргумента               \e[32m -s --summarize \e[0m";}
 M20(){ TPUT 24 3; $e "Исключить записи меньше SIZE                            \e[32m -t --threshold=SIZE \e[0m";}
 M21(){ TPUT 25 3; $e "Показать время последней модификации любого файла в каталоге         \e[32m --time \e[0m";}
 M22(){ TPUT 26 3; $e "Показывать время в формате WORD вместо времени модификации      \e[32m --time=WORD \e[0m";}
 M23(){ TPUT 27 3; $e "Показать время, используя СТИЛЬ, который может быть      \e[32m --time-style=STYLE \e[0m";}
 M24(){ TPUT 28 3; $e "Исключить файлы, соответствующие любому шаблону FILE \e[32m -X --exclude-from=FILE \e[0m";}
 M25(){ TPUT 29 3; $e "Исключить файлы, соответствующие ШАБЛОНУ                  \e[32m --exclude=PATTERN \e[0m";}
 M26(){ TPUT 30 3; $e "Пропускать каталоги в разных файловых системах         \e[32m -x --one-file-system \e[0m";}
 M27(){ TPUT 31 3; $e "Display this help and exit                                           \e[32m --help \e[0m";}
 M28(){ TPUT 32 3; $e "Output version information and exit                               \e[32m --version \e[0m";}
 M29(){ TPUT 34 3; $e "Exit                                                                         ";}
LM=29
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
 Заканчивайте каждую строку вывода с помощью NUL, а не новой строки.
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Количество записей для всех файлов, а не только для каталогов
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Печатайте видимые размеры, а не использование диска, хотя видимый размер обычно
 меньше, он может быть больше из-за дыр в («разреженных») файлах,
 внутренней фрагментации, непрямых блоков и т.п.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Масштабировать размеры по SIZE перед их печатью.
 Например, '-BM' печатает размеры в единицах 1 048 576 байтов. см. формат SIZE ниже
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Эквивалентно:\e[32m '--apparent-size --block-size=1'\e[0m
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Подведите итог.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Разыменовывать только символические ссылки, перечисленные в командной строке.
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Вывести общее количество для каталога (или файла с параметром --all),
 только если оно на N или меньше уровней ниже аргумента командной строки
 --max-depthu003d0 совпадает с --summarize
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Подведите итоги использования диска именами файлов, заканчивающимися NUL,
 указанными в файле F; если F равно -, то читать имена со стандартного ввода.
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Эквивалентно --dereference-args (-D)
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Размеры печати в удобочитаемом формате (например, 1K 234M 2G)
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Список информации об использовании inode вместо использования блока.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Подобно --block-size=1K
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Разыменование всех символических ссылок.
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Считайте размеры много раз, если они жестко связаны.
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Подобно --block-size=1M
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Не переходить по символическим ссылкам (по умолчанию)
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Для каталогов не включайте размер подкаталогов
";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Как -h, но используйте степени 1000, а не 1024
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Отображение только суммы для каждого аргумента
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Исключить записи меньше SIZE,
 если они положительные, или записи больше SIZE, если отрицательные.
";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "
 Показать время последней модификации любого файла в каталоге
 или любом из его подкаталогов
";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e "
 Показывать время в формате WORD вместо времени модификации:
 atime, access, use, ctime или status
";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e "
 Показать время, используя СТИЛЬ, который может быть:
 full-iso, long-iso, iso или +FORMAT;
 FORMAT интерпретируется как 'date'
";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo -e "
 Исключить файлы, соответствующие любому шаблону в FILE
";ES;fi;;
 25) S=M25;SC;if [[ $cur == enter ]];then R;echo -e "
 Исключить файлы, соответствующие ШАБЛОНУ
";ES;fi;;
 26) S=M26;SC;if [[ $cur == enter ]];then R;echo -e "
 Пропускать каталоги в разных файловых системах
";ES;fi;;
 27) S=M27;SC;if [[ $cur == enter ]];then R;echo -e "
 Display this help and exit:\e[32m du --help\e[0m
";ES;fi;;
 28) S=M28;SC;if [[ $cur == enter ]];then R;echo -e "
 Output version information and exit:\e[32m du --version\e[0m";ES;fi;;
 29) S=M29;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
