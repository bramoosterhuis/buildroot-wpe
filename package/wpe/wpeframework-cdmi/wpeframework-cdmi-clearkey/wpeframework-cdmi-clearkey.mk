################################################################################
#
# wpeframework-cdmi-clearkey
#
################################################################################

WPEFRAMEWORK_CDMI_CLEARKEY_VERSION = 1524b947f5c28100326415a2ac1d02f3974acdc8
WPEFRAMEWORK_CDMI_CLEARKEY_SITE_METHOD = git
WPEFRAMEWORK_CDMI_CLEARKEY_SITE = git@github.com:rdkcentral/OCDM-Clearkey.git
WPEFRAMEWORK_CDMI_CLEARKEY_INSTALL_STAGING = YES
WPEFRAMEWORK_CDMI_CLEARKEY_DEPENDENCIES = wpeframework

$(eval $(cmake-package))
