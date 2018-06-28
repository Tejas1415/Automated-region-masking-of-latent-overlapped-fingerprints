# Automated-region-masking-of-latent-overlapped-fingerprints.

## if you are working with this code / idea - Kindly, cite the paper from the below mentioned link.

https://ieeexplore.ieee.org/abstract/document/8245111/

This was my first ever research work. 

Research Gap: Overlapped Finger print seperation for further identification is an active research topic over the past decade. Several research papers have been published in this area increasing the robustness of the seperation process + fastening the process + Automating the pioneer manual work involved in seperating these overlapped fingerprints.

This process in general consists of 5 steps. The first and foremost step in this is to manually seperate the 2 finger print regions where the overlapped region exists in both. The other 4 steps are not related to my work, hence i am not discussing in detail about those. This manual seperation is very tedious and requires expert pioneers to manually seperate the regions without trying to remove the overlapped region. This takes considerably high time to process in the laboratories.

## Therefore, we developed this model considering the above limitation and created an algorithm that can automatically do the initial seperation excluding the tedious manual work.  

Rest of the details based on the algorithm have been well illustrated in the paper.

Code by - Tejas K
For any further doubts feel free to contact me at tejastk.reddy@gmail.com
Project was done in month of Feb 2017.

To run the code,
1. Download d25.m file
2. download any sample image uploaded. 
3. change the image name in d25.m in the imread command. Overl is an image i reccomend since its the official image most other researchers test with.
4. U might end up with ugly result, thats because parameters in the code such as blurring coefficient, Linear dilation constant in structuring element, Threshold etc vary fromone image to an other, fiddle with constants to get the desired results.
5. If its a 3-4 fingerprints overlapped image then for each iteration of the algo, one fingerprint can be seperated, Therefore, upload the result as new image untill all fingerprints are seperated properly.


This algorithm is robust against different kind of noises such as speckle noise, gaussian noise, salt and pepper noise etc. The robustness against these has been proved in the paper. The Codes involved for these have also been uploaded if needed to be tested.
