################################################################################
#
# wpeframework-cdmi-widevine-nexus-svp
#
################################################################################

WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_VERSION = 07b53df654e04996212de670fc6803a00bdbe0d7
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_SITE_METHOD = git
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_SITE = https://code.rdkcentral.com/r/soc/broadcom/components/rdkcentral/OCDM-Widevine-Nexus-SVP
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_INSTALL_STAGING = NO
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_DEPENDENCIES = wpeframework

ifeq ($(BR2_PACKAGE_BCM_REFSW),y)
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_DEPENDENCIES += bcm-refsw
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_NEW_CENC_INTERFACE),y)
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_CONF_OPTS = -DCENC_VERSION=14
endif
ifeq ($(BR2_PACKAGE_BCM_REFSW_SAGE_WIDEVINE_VERSION_16),y)
WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP_CONF_OPTS += -DCENC_VERSION=16
endif

$(eval $(cmake-package))
