int* buildArray(int *nums, int numsSize, int *returnSize)
{
    int c0=0;
    int *p=malloc(sizeof(int) * numsSize);
     
    for(c0=0; c0<numsSize; c0++){
        p[c0] = nums[nums[c0]];
    }
    *returnSize = numsSize;
    return p;
}