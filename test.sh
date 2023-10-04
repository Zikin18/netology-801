
echo "А я первее хочу быть здесь, поэтому сделаю merge"
echo "Здраствуйте, я ваш ученик"

read -p "Какое число первое? " n1
read -p "Какое число второе? " n2
PS3="Что за операция? "
select ans in сложение вычитание умножение деление; do
    case $ans in
        сложение) op='+' ; break ;;
        вычитание) op='-' ; break ;;
        умножение) op='*' ; break ;;
        деление) op='/' ; break ;;
        *) echo "Неверный ответ" ;;
    esac
done
ans=$(echo "$n1 $op $n2" | bc -l)
printf "%s %s %s = %s\n\n" "$n1" "$op" "$n2" "$ans"

read -p "Число для головоломки" number
result=1
if (( number == 1 || number == 0 )); then
    echo
    echo number: $number
    echo
    else
    for (( i = 1; i < number; i++ )); do
        if (( i < 9 )); then
            if (( i % 2 == 0 )); then
                let "result = result + i + 1"
            else
                let "result = result - i - 1"
            fi
        fi
    done
    for (( i = 10; i <= number; i++ )); do
        if (( i < 100 )); then
            let "result = result - i/10 + i%10"
        else
            if (( i % 2 == 0 )); then
                let "result = result - i/100 + (i%100)/10 - (i%100)%10"
            else
                let "result = result + i/100 - (i%100)/10 + (i%100)%10"
            fi
        fi
    done


    echo
    echo result: $result
    echo number: $number
    echo
fi
