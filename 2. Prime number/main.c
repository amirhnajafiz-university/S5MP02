#include <stdio.h> 

void isprime(int input, int *res)
{
    int division = 2;
    *res = 1;
    if (input == 0) 
        *res = 0;
    while (input > division)
    {
        int temp = input % division;
        if (temp == 0) {
            *res = 0;
            return;
        }
        division++;
    }
}

int main() {
    int temp;

    isprime(12, &temp);
    printf("%d\n", temp);

    isprime(2, &temp);
    printf("%d\n", temp);

    isprime(0, &temp);
    printf("%d\n", temp);

    isprime(13, &temp);
    printf("%d\n", temp);

    return 0;
}