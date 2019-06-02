#define __GNU_SOURCE
#define __STDC_FORMAT_MACROS
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>


extern uint64_t sumvec(uint64_t* elems, uint64_t len);

uint64_t csum(uint64_t* elems, uint64_t len) {
    uint64_t sum = 0;
    for(uint64_t i = 0; i < len; i++) {
        sum += elems[i];
    }
    return sum;
}

int main() {
    uint64_t nums[] = {1,1,1,1,2};
    uint64_t cnt = sizeof(nums) / sizeof(*nums);
    printf("csum: %"PRIu64"\n", csum(nums, cnt));
    printf("vsum: %"PRIu64"\n", sumvec(nums, cnt));
}
