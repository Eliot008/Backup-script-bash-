#!/bin/bash

count_log=$(cat /tmp/reserve/paths.txt| wc -l) # Підраховуємо всю кількість стрічок, щоб зрозуміти скільки конф файлів

i=1 # Створюємо ітератор
while [ $i -lt $count_log ] # Коли ітератор і менше за загальну кількість конф файлів то робимо таке
        do
                path_file=$(cat /tmp/reserve/paths.txt | sed -n $i\p) # З файлу де зберігаються всі шляхи беремо і-тий рядок
                check_path=$(ls $path_file) # За допомогою команди ls перевіряємо чи є такий файл
                int_number=$(basename $check_path | wc -w) # З повного шляху достаємо конкретну назву файла та підраховуємо кількість слів, >
                if [[ $int_number != 1 ]]; then  # якщо int_number не дорівнює 1
                        file=$(basename $path_file) # З повного шляху достаємо конкретну назву файла
                        sudo cp /tmp/reserve/$file $path_file # І закидаємо видалений файл з  у оригінальну директорію
                fi;
                i=`expr $i + 1` # ітератор і збільшуємо на одиницю
        done 
