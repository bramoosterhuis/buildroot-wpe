################################################################################
#
# libprovision
#
################################################################################

LIBPROVISION_VERSION = 0ae89c7dd107f090d9a6e3827c22b7d89c5758ab
LIBPROVISION_SITE_METHOD = git
LIBPROVISION_SITE = git@github.com:Metrological/libprovision.git
LIBPROVISION_LICENSE = PROPRIETARY
LIBPROVISION_REDISTRIBUTE = NO
LIBPROVISION_INSTALL_STAGING = YES

LIBPROVISION_DEPENDENCIES = openssl

$(eval $(cmake-package))
