################################################################################
#
# wpeframework-cdmi-widevine
#
################################################################################

WPEFRAMEWORK_CDMI_WIDEVINE_VERSION = a268eda866aedccc0d29e4bfb4b5c58ef9fc7be4
WPEFRAMEWORK_CDMI_WIDEVINE_SITE_METHOD = git
WPEFRAMEWORK_CDMI_WIDEVINE_SITE = git@github.com:rdkcentral/OCDM-Widevine.git
WPEFRAMEWORK_CDMI_WIDEVINE_INSTALL_STAGING = NO
WPEFRAMEWORK_CDMI_WIDEVINE_DEPENDENCIES = wpeframework widevine

$(eval $(cmake-package))
