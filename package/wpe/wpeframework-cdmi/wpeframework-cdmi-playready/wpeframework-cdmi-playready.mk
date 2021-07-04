################################################################################
#
# wpeframework-cdmi-playready
#
################################################################################

WPEFRAMEWORK_CDMI_PLAYREADY_VERSION = a233e3f472ff3847fc1c4f7759c7172d4ca4ceee
WPEFRAMEWORK_CDMI_PLAYREADY_SITE_METHOD = git
WPEFRAMEWORK_CDMI_PLAYREADY_SITE = git@github.com:rdkcentral/OCDM-Playready.git
WPEFRAMEWORK_CDMI_PLAYREADY_INSTALL_STAGING = YES
WPEFRAMEWORK_CDMI_PLAYREADY_DEPENDENCIES = wpeframework wpeframework-interfaces playready
WPEFRAMEWORK_CDMI_PLAYREADY_CONF_OPTS = -DPERSISTENT_PATH=${BR2_PACKAGE_WPEFRAMEWORK_PERSISTENT_PATH}

$(eval $(cmake-package))
