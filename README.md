# TPBF

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg?style=flat-square)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fbigmms%2Fchen_grsl21_tpbf&count_bg=%233D46C8&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=views&edge_flat=false)](https://hits.seeyoufarm.com)

This repository is implementation of the ["Two-Pass Bilateral Smooth Filtering for Remote Sensing Imagery."](https://arxiv.org/abs/1501.00092)



## Introduction
This repository contains implementation of our GRSL 2021 paper titled as __Two-Pass Bilateral Smooth Filtering for Remote Sensing Imagery.__ In this letter, we propose a two-pass bilateral filter, TP-based BF, and an adaptive control scheme of range kernels for noise-invariant edge-preserving image smoothing. Experimental results on four aerial-imagery benchmark datasets show that our TP-based BF outperforms the existing bilateral filters in terms of both feature-aware and gradient-aware measures.


## Dependencies
> * MATLAB R2019a

## It was tested and runs under the following OSs:
* Windows 10
* Ubuntu 16.04

Might work under others, but didn't get to test any other OSs just yet.

## Getting Started:
### Run testing
```bash
$ git clone https://github.com/bigmms/chen_grsl21_tpbf.git
$ cd chen_grsl21_tpbf
$ matlab
>> demo_GABF
```
The test results will be saved in: `./img_output/`

### License + Attribution
The TPBF code is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Commercial usage is not permitted. If you use this code in a scientific publication, please cite the following [paper](http://openaccess.thecvf.com/content_ECCV_2018/html/Tobias_Fischer_RT-GENE_Real-Time_Eye_ECCV_2018_paper.html):
```
@inproceedings{FischerECCV2018,
author = {Tobias Fischer and Hyung Jin Chang and Yiannis Demiris},
title = {{RT-GENE: Real-Time Eye Gaze Estimation in Natural Environments}},
booktitle = {European Conference on Computer Vision},
year = {2018},
month = {September},
pages = {339--357}
}
```
