#!/bin/bash
MYPATH=$(dirname $0)
PROJECT_PATH=`cd $MYPATH; pwd`
echo $PROJECT_PATH
while true; do
    echo "Скрипт-установщик Mathlab 2021b"
    echo "Меню:"
    echo "1)Пропатчить libfreetype в установщике"
    echo "2)Запустить установщик"
    echo "3)Запустить окно(для проверки недостающих библеотек)"
    echo "4)Выход"
    read -p "Выбор: " selected
    case $selected in
      1)
        echo "Выбран патч..."
        echo "Проверка наличия библеотеки в ожидаемом месте"
        libfreetypedir=/lib64/
        if [-f /$libfreetypedir/libfreetype.so.6 ]
        then
          echo "Библеотека найдена.Начинаем патчить"
          cp /$libfreetypedir/libfreetype.so.6.* $PROJECT_PATH/Matlab911R2021b_Lin64/bin/glnxa64
          if [$? -eq 0]
            then
              echo "Заебись!"
            else
              echo "Что-то проебалось...смотри в консоль"
              break
          fi
        else
          echo "Укажи путь к библеотеке"
          read "Путь(папку, без файла): " libfreetypedir
          if [-f /$libfreetypedir/libfreetype.so.6 ]
          then
            echo "Библеотека найдена.Начинаем патчить"
            cp /$libfreetypedir/libfreetype.so.6.* $PROJECT_PATH/Matlab911R2021b_Lin64/bin/glnxa64
            if [$? -eq 0]
            then
              echo "Заебись!"
            else
              echo "Что-то проебалось...смотри в консоль"
              break
            fi
          fi
        fi
      ;;
      2)
        echo "Запуск установщика...(Может долго запускаться!)"
        cd $PROJECT_PATH/Matlab911R2021b_Lin64/
        ./install
      ;;
      3)
        echo "Запуск окна...(Закрой окно для продолжения работы скрипта)"
         cd $PROJECT_PATH/Matlab911R2021b_Lin64/bin/glnxa64
         ./MATLABWindow
      ;;
      4)
        echo "Выход..."
        break
      ;;
    esac
done
