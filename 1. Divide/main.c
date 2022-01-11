#include <stdio.h>

void divide(int division, int divider, int *target, int *remain) 
{
    while (division >= divider) {
        division = division - divider;
        (*target)++;
    }
    *remain = division;
}

int main() {
    int number = 12;
    int divider = 3;
    int res=0, remain=0;

    divide(number, divider, &res, &remain); 
    printf("%d %d", res, remain);

    return 0;
}