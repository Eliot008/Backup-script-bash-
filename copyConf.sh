!/bin/bash

user=$(whoami) # Визначаємо юзера

mkdir /tmp/reserve # Створюємо папку reserve для скопійованих conf файлів

if [ $user == "root" ]; then # Якщо юзер root то будемо робити наступне
        count_log=$(find /$user -type f \( -name *.conf -o -name *.config \) | wc -l) # Підраховуємо всю кількість стрічок, щоб зрозуміти ск>
        find /$user -type f \( -name *.conf -o -name *.config \) > /tmp/reserve/paths.txt # Знаходимо всі conf файли у домашньому каталозі т>
else # інакше
        count_log=$(find /home/$user -type f \( -name *.conf -o -name *.config \) | wc -l) # Підраховуємо всю кількість стрічок, щоб зрозумі>
        find /home/$user -type f \( -name *.conf -o -name *.config \) > /tmp/reserve/paths.txt # Знаходимо всі conf файли у домашньому катал>
fi;

i=1 # Створюємо ітератор
while [ $i -lt $count_log ] # Коли ітератор і менше за загальну кількість конф файлів то робимо таке 
        do
                path_file=$(cat /tmp/reserve/paths.txt | sed -n $i\p) # З файлу де зберігаються всі шляхи беремо і-тий рядок
                name_file=$(basename $path_file) # З повного шляху достаємо конкретну назву файла
                sudo cp $path_file /tmp/reserve/$name_file # Копіюємо конф файл у /tmp/reserve/
                i=`expr $i + 1` # ітератор і збільшуємо на одиницю
        done
