import scipy.io as sio
import zarr
import xarray as xr
from os.path import join, isfile, exists


def read_covar_matrix(fname):
	dname_zarr = fname.replace('.mat', '.zarr')
	if not exists(dname_zarr):
		covMat = sio.loadmat(fname)
		names = ['fl063_c', 'fl063_l', 'fl064_c', 'fl064_l', 'fl065_c', 'fl065_l', 'fl068_c', 'fl068_l']
		covMats = zip(*(names, covMat['CovMat'][0]))

		def to_darray(cmatrix):
			cmatrix = cmatrix.reshape(3, 3, 1024, 1024)
			return xr.DataArray(cmatrix, dims=('i', 'j', 'x', 'y'))

		ds = xr.Dataset({name: to_darray(cm) for name, cm in  covMats})

		compressor = zarr.Blosc(cname='zstd', clevel=9, shuffle=2)
		encoding = {v: {'compressor': compressor} for v in list(ds.variables)}
		ds.to_zarr(dname_zarr)
	else:
		ds = xr.open_zarr(dname_zarr) 
	return ds
