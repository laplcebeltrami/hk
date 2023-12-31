# Heat Kernel Smoothing on Manifolds

Gaussian kernel smoothing has been widely used in 3D brain images to increase the signal-to-noise ratio. 
The Gaussian kernel weights observations according to their Euclidean distance. When the observations lie on 
a convoluted brain surface; it is more natural to assign the weight based on the geodesic distance along the surface [1-2]. 
On a curved manifold, a straight line between two points is not the shortest distance so one may incorrectly assign 
less weights to closer observations. Therefore, smoothing data residing on manifolds requires constructing a kernel that 
is isotropic along the geodesic curves. With this motivation in mind, we construct the kernel of a heat equation on manifolds 
that should be isotropic in the local conformal coordinates, and develop a framework for heat kernel smoothing on manifolds. 
Run MATLAb Live Script [SCRIPT.mlx](https://github.com/laplcebeltrami/hk/blob/main/SCRIPT.mlx).

References: 

[1] Chung, M.K., Robbins,S., Dalton, K.M., Davidson, Alexander, A.L., R.J., Evans, A.C. 2005. Cortical thickness analysis in autism 
via heat kernel smoothing. NeuroImage 25:1256-1265 
http://www.stat.wisc.edu/%7Emchung/papers/ni_heatkernel.pdf

[2] Chung, M.K., Robbins, S., Evans, A.C. 2005. Unified statistical approach to cortical thickness analysis. Information Processing 
in Medical Imaging (IPMI). Lecture Notes in Computer Science (LNCS) 3565:627-638. Springer-Verlag.
http://www.stat.wisc.edu/%7Emchung/papers/IPMI/hk.IPMI.2005.pdf

Last update, 2023 December 31: two-sample t-field included. 

(C) 2005- Moo K. Chung, Univesity of Wisconsin-Madison
