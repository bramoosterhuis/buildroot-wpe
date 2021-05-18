################################################################################
#
# wpeframework-clientlibraries
#
################################################################################

WPEFRAMEWORK_CLIENTLIBRARIES_VERSION = f233f08499b424c98f1bcdcd3092c03d61396c84
WPEFRAMEWORK_CLIENTLIBRARIES_SITE = $(call github,rdkcentral,ThunderClientLibraries,$(WPEFRAMEWORK_CLIENTLIBRARIES_VERSION))
WPEFRAMEWORK_CLIENTLIBRARIES_INSTALL_STAGING = YES
WPEFRAMEWORK_CLIENTLIBRARIES_DEPENDENCIES = wpeframework wpeframework-interfaces

WPEFRAMEWORK_CLIENTLIBRARIES_OPKG_NAME = "wpeframework-clientlibraries"
WPEFRAMEWORK_CLIENTLIBRARIES_OPKG_VERSION = "1.0.0"
WPEFRAMEWORK_CLIENTLIBRARIES_OPKG_ARCHITECTURE = "${BR2_ARCH}"
WPEFRAMEWORK_CLIENTLIBRARIES_OPKG_MAINTAINER = "Metrological"
WPEFRAMEWORK_CLIENTLIBRARIES_OPKG_DESCRIPTION = "WPEFramework clientlibraries"

WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_CLIENTLIBRARIES_VERSION}

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BUILD_TYPE_DEBUG),y)
        WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DBUILD_TYPE=Debug
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BUILD_TYPE_DEBUG_OPTIMIZED),y)
        WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DBUILD_TYPE=DebugOptimized
else ifeq ($( BR2_PACKAGE_WPEFRAMEWORK_BUILD_TYPE_RELEASE_WITH_SYMBOLS),y)
        WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DBUILD_TYPE=ReleaseSymbols
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BUILD_TYPE_RELEASE),y)
        WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DBUILD_TYPE=Release
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BUILD_TYPE_PRODUCTION),y)
        WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DBUILD_TYPE=Production
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITORCLIENT),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCOMPOSITORCLIENT=ON
WPEFRAMEWORK_CLIENTLIBRARIES_DEPENDENCIES += libegl
ifeq ($(BR2_PACKAGE_WESTEROS),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DPLUGIN_COMPOSITOR_IMPLEMENTATION=Wayland
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DPLUGIN_COMPOSITOR_SUB_IMPLEMENTATION=Westeros
WPEFRAMEWORK_CLIENTLIBRARIES_DEPENDENCIES += westeros
else ifeq ($(BR2_PACKAGE_HAS_NEXUS),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DPLUGIN_COMPOSITOR_IMPLEMENTATION=Nexus
ifeq ($(BR2_PACKAGE_BCM_REFSW),y)
WPEFRAMEWORK_CLIENTLIBRARIES_DEPENDENCIES += bcm-refsw
endif
else ifeq  ($(BR2_PACKAGE_RPI_FIRMWARE),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DPLUGIN_COMPOSITOR_IMPLEMENTATION=RPI
ifeq ($(BR2_PACKAGE_RPI_VERSION_RPI4),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DVIDEO_CORE=VC6
endif
else
$(error Missing a compositor implemtation, please provide one or disable PLUGIN_COMPOSITOR)
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_COMPOSITOR),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCOMPOSITORSERVERPLUGIN=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_GSTREAMERCLIENT),y)
WPEFRAMEWORK_CLIENTLIBRARIES_DEPENDENCIES += gstreamer1 gst1-plugins-base
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DGSTREAMERCLIENT=ON
ifeq ($(BR2_PACKAGE_HAS_NEXUS),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DGSTREAMER_CLIENT_IMPLEMENTATION=Nexus
else ifeq  ($(BR2_PACKAGE_RPI_FIRMWARE),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DGSTREAMER_CLIENT_IMPLEMENTATION=RPI
else
$(error Missing a gstreamer client implementation, please provide one)
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DISPLAYINFO),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DDISPLAYINFO=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLAYERINFO),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DPLAYERINFO=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PROVISIONPROXY),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DPROVISIONPROXY=ON
WPEFRAMEWORK_CLIENTLIBRARIES_DEPENDENCIES += libprovision
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_SECURITYAGENT_ACCESSOR),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DSECURITYAGENT=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_VIRTUALINPUT),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DVIRTUALINPUT=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDM),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCDMI=ON
ifeq ($(BR2_PACKAGE_HAS_NEXUS_SAGE),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCDMI_BCM_NEXUS_SVP=ON
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCDMI_ADAPTER_IMPLEMENTATION="broadcom-svp"
WPEFRAMEWORK_CLIENTLIBRARIES_DEPENDENCIES += gst1-bcm
else
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCDMI_ADAPTER_IMPLEMENTATION="gstreamer"
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CRYPTOGRAPHY),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCRYPTOGRAPHY=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CRYPTOGRAPHY_IMPLEMENTATION_NEXUS),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCRYPTOGRAPHY_IMPLEMENTATION=Nexus
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CRYPTOGRAPHY_IMPLEMENTATION_OPENSSL),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCRYPTOGRAPHY_IMPLEMENTATION=OpenSSL
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CRYPTOGRAPHY_IMPLEMENTATION_THUNDER),y)
WPEFRAMEWORK_CLIENTLIBRARIES_CONF_OPTS += -DCRYPTOGRAPHY_IMPLEMENTATION=Thunder
else
$(error Missing a cryptography implementation)
endif
endif

ifeq ($(BR2_PACKAGE_RPI_VERSION_RPI4),y)
WPEFRAMEWORK_CLIENTLIBRARIES_POST_PATCH_HOOKS += WPEFRAMEWORK_CLIENTLIBRARIES_PI4_PATCH
define WPEFRAMEWORK_CLIENTLIBRARIES_PI4_PATCH
[ -d $(WPEFRAMEWORK_CLIENTLIBRARIES_PKGDIR)/$(WPEFRAMEWORK_CLIENTLIBRARIES_VERSION) ] && \
$(APPLY_PATCHES) $(@D) $(WPEFRAMEWORK_CLIENTLIBRARIES_PKGDIR)/$(WPEFRAMEWORK_CLIENTLIBRARIES_VERSION) *.patch.hooked
endef
endif

$(eval $(cmake-package))
