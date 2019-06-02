#include <stdio.h>

int main() {
    int counter = 90;
    unsigned long current = 0;
    unsigned long next = 1;
    unsigned long swp;
    while(counter-->0) {
        printf("%20ld\n", current);
        swp = current;
        current = next;
        next = next + swp;
    }
}
