################################################################################
#
# wpeframework-cdmi-nagra
#
################################################################################

WPEFRAMEWORK_CDMI_NAGRA_VERSION = f3cfc3dffc4cb7684819c160646a461d958e442b
WPEFRAMEWORK_CDMI_NAGRA_SITE_METHOD = git
WPEFRAMEWORK_CDMI_NAGRA_SITE = git@github.com:rdkcentral/OCDM-Nagra.git
WPEFRAMEWORK_CDMI_NAGRA_INSTALL_STAGING = NO
WPEFRAMEWORK_CDMI_NAGRA_DEPENDENCIES = wpeframework

$(eval $(cmake-package))
