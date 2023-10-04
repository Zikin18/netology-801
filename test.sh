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