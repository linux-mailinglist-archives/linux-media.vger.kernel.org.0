Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3F61A995A
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 11:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895880AbgDOJts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 05:49:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895865AbgDOJtc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 05:49:32 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 90D0A2082E;
        Wed, 15 Apr 2020 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586944170;
        bh=ilC+CLgufIuozRdSBefWZ9+DEvUgG/Y3qdclHopqpZ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2KdYEdLCeswqhB4BagpDL9PihGpkBXQEbrGgZsl3rS/4zEmSmqH6m8ohCHmc5NURL
         jo2wpPKrnU8ZjtKOM+HefYUMD7tThX4f1Tz73fZ6d3bvM5ve79ZZwh0+Takq5dwPYW
         8JCQ59loq476I26gjIgyqqB608CrZIRmJ2kA2zUQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOefg-006WIS-3f; Wed, 15 Apr 2020 11:49:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] media: move CEC platform drivers to a separate directory
Date:   Wed, 15 Apr 2020 11:49:26 +0200
Message-Id: <c3f6462dc782c7416c9df982f61119a067b11a37.1586944045.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586944045.git.mchehab+huawei@kernel.org>
References: <cover.1586944045.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As CEC support doesn't depend on MEDIA_SUPPORT, let's
place the platform drivers outside the media menu.

As a side effect, instead of depends on PCI, seco driver
can select it (and DMI).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/Kconfig                     |   6 +-
 drivers/media/cec/Makefile                    |   2 +-
 drivers/media/cec/platform/Kconfig            | 121 ++++++++++++++++++
 drivers/media/cec/platform/Makefile           |  11 ++
 .../{ => cec}/platform/cec-gpio/Makefile      |   0
 .../{ => cec}/platform/cec-gpio/cec-gpio.c    |   0
 .../s5p-cec => cec/platform/s5p}/Makefile     |   0
 .../platform/s5p}/exynos_hdmi_cec.h           |   0
 .../platform/s5p}/exynos_hdmi_cecctrl.c       |   0
 .../s5p-cec => cec/platform/s5p}/regs-cec.h   |   0
 .../s5p-cec => cec/platform/s5p}/s5p_cec.c    |   0
 .../s5p-cec => cec/platform/s5p}/s5p_cec.h    |   0
 .../seco-cec => cec/platform/seco}/Makefile   |   0
 .../seco-cec => cec/platform/seco}/seco-cec.c |   0
 .../seco-cec => cec/platform/seco}/seco-cec.h |   0
 .../sti/cec => cec/platform/sti}/Makefile     |   0
 .../sti/cec => cec/platform/sti}/stih-cec.c   |   0
 .../tegra-cec => cec/platform/tegra}/Makefile |   0
 .../platform/tegra}/tegra_cec.c               |   0
 .../platform/tegra}/tegra_cec.h               |   0
 drivers/media/platform/Kconfig                | 121 ------------------
 drivers/media/platform/Makefile               |   8 --
 22 files changed, 138 insertions(+), 131 deletions(-)
 create mode 100644 drivers/media/cec/platform/Kconfig
 create mode 100644 drivers/media/cec/platform/Makefile
 rename drivers/media/{ => cec}/platform/cec-gpio/Makefile (100%)
 rename drivers/media/{ => cec}/platform/cec-gpio/cec-gpio.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/Makefile (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cec.h (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cecctrl.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/regs-cec.h (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.h (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/Makefile (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.c (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.h (100%)
 rename drivers/media/{platform/sti/cec => cec/platform/sti}/Makefile (100%)
 rename drivers/media/{platform/sti/cec => cec/platform/sti}/stih-cec.c (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/Makefile (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.c (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.h (100%)

diff --git a/drivers/media/cec/Kconfig b/drivers/media/cec/Kconfig
index 1586dd899302..7b1fb70066bd 100644
--- a/drivers/media/cec/Kconfig
+++ b/drivers/media/cec/Kconfig
@@ -21,7 +21,7 @@ config CEC_PIN_ERROR_INJ
 	help
 	  This option enables CEC error injection using debugfs.
 
-config MEDIA_CEC_SUPPORT
+menuconfig MEDIA_CEC_SUPPORT
 	bool
 	prompt "HDMI CEC drivers"
 	default y if !MEDIA_SUPPORT_FILTER
@@ -31,3 +31,7 @@ config MEDIA_CEC_SUPPORT
 
 	  Say Y when you have an HDMI receiver, transmitter or a USB CEC
 	  adapter that supports HDMI CEC.
+
+if MEDIA_CEC_SUPPORT
+source "drivers/media/cec/platform/Kconfig"
+endif
diff --git a/drivers/media/cec/Makefile b/drivers/media/cec/Makefile
index 3fdbc22b1530..8c6448bee386 100644
--- a/drivers/media/cec/Makefile
+++ b/drivers/media/cec/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += core/
+obj-y += core/ platform/
diff --git a/drivers/media/cec/platform/Kconfig b/drivers/media/cec/platform/Kconfig
new file mode 100644
index 000000000000..6a8bb8b68344
--- /dev/null
+++ b/drivers/media/cec/platform/Kconfig
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Platform drivers
+
+config VIDEO_CROS_EC_CEC
+	tristate "ChromeOS EC CEC driver"
+	depends on CROS_EC
+	select CEC_CORE
+	select CEC_NOTIFIER
+	select CROS_EC_PROTO
+	help
+	  If you say yes here you will get support for the
+	  ChromeOS Embedded Controller's CEC.
+	  The CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config VIDEO_MESON_AO_CEC
+	tristate "Amlogic Meson AO CEC driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for Amlogic Meson SoCs AO CEC interface. It uses the
+	  generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+
+config VIDEO_MESON_G12A_AO_CEC
+	tristate "Amlogic Meson G12A AO CEC driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on COMMON_CLK && OF
+	select REGMAP
+	select REGMAP_MMIO
+	select CEC_CORE
+	select CEC_NOTIFIER
+	---help---
+	  This is a driver for Amlogic Meson G12A SoCs AO CEC interface.
+	  This driver if for the new AO-CEC module found in G12A SoCs,
+	  usually named AO_CEC_B in documentation.
+	  It uses the generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config CEC_GPIO
+	tristate "Generic GPIO-based CEC driver"
+	depends on PREEMPTION || COMPILE_TEST
+	select CEC_CORE
+	select CEC_PIN
+	select CEC_NOTIFIER
+	select GPIOLIB
+	help
+	  This is a generic GPIO-based CEC driver.
+	  The CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config VIDEO_SAMSUNG_S5P_CEC
+	tristate "Samsung S5P CEC driver"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for Samsung S5P HDMI CEC interface. It uses the
+	  generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config VIDEO_STI_HDMI_CEC
+	tristate "STMicroelectronics STiH4xx HDMI CEC driver"
+	depends on ARCH_STI || COMPILE_TEST
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for STIH4xx HDMI CEC interface. It uses the
+	  generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config VIDEO_STM32_HDMI_CEC
+	tristate "STMicroelectronics STM32 HDMI CEC driver"
+	depends on ARCH_STM32 || COMPILE_TEST
+	select REGMAP
+	select REGMAP_MMIO
+	select CEC_CORE
+	help
+	  This is a driver for STM32 interface. It uses the
+	  generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config VIDEO_TEGRA_HDMI_CEC
+	tristate "Tegra HDMI CEC driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for the Tegra HDMI CEC interface. It uses the
+	  generic CEC framework interface.
+	  The CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config VIDEO_SECO_CEC
+	tristate "SECO Boards HDMI CEC driver"
+	depends on (X86 || IA64) || COMPILE_TEST
+	select PCI
+	select DMI
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for SECO Boards integrated CEC interface.
+	  Selecting it will enable support for this device.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
+
+config VIDEO_SECO_RC
+	bool "SECO Boards IR RC5 support"
+	depends on VIDEO_SECO_CEC
+	depends on RC_CORE=y || RC_CORE = VIDEO_SECO_CEC
+	help
+	  If you say yes here you will get support for the
+	  SECO Boards Consumer-IR in seco-cec driver.
+	  The embedded controller supports RC5 protocol only, default mapping
+	  is set to rc-hauppauge.
diff --git a/drivers/media/cec/platform/Makefile b/drivers/media/cec/platform/Makefile
new file mode 100644
index 000000000000..3c103fb364ba
--- /dev/null
+++ b/drivers/media/cec/platform/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the CEC platform device drivers.
+#
+
+obj-$(CONFIG_CEC_GPIO)			+= cec-gpio/
+obj-$(CONFIG_VIDEO_SAMSUNG_S5P_CEC)	+= s5p/
+obj-$(CONFIG_VIDEO_STI_HDMI_CEC)	+= sti/
+obj-$(CONFIG_VIDEO_TEGRA_HDMI_CEC)	+= tegra/
+obj-$(CONFIG_VIDEO_SECO_CEC)		+= seco/
+
diff --git a/drivers/media/platform/cec-gpio/Makefile b/drivers/media/cec/platform/cec-gpio/Makefile
similarity index 100%
rename from drivers/media/platform/cec-gpio/Makefile
rename to drivers/media/cec/platform/cec-gpio/Makefile
diff --git a/drivers/media/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
similarity index 100%
rename from drivers/media/platform/cec-gpio/cec-gpio.c
rename to drivers/media/cec/platform/cec-gpio/cec-gpio.c
diff --git a/drivers/media/platform/s5p-cec/Makefile b/drivers/media/cec/platform/s5p/Makefile
similarity index 100%
rename from drivers/media/platform/s5p-cec/Makefile
rename to drivers/media/cec/platform/s5p/Makefile
diff --git a/drivers/media/platform/s5p-cec/exynos_hdmi_cec.h b/drivers/media/cec/platform/s5p/exynos_hdmi_cec.h
similarity index 100%
rename from drivers/media/platform/s5p-cec/exynos_hdmi_cec.h
rename to drivers/media/cec/platform/s5p/exynos_hdmi_cec.h
diff --git a/drivers/media/platform/s5p-cec/exynos_hdmi_cecctrl.c b/drivers/media/cec/platform/s5p/exynos_hdmi_cecctrl.c
similarity index 100%
rename from drivers/media/platform/s5p-cec/exynos_hdmi_cecctrl.c
rename to drivers/media/cec/platform/s5p/exynos_hdmi_cecctrl.c
diff --git a/drivers/media/platform/s5p-cec/regs-cec.h b/drivers/media/cec/platform/s5p/regs-cec.h
similarity index 100%
rename from drivers/media/platform/s5p-cec/regs-cec.h
rename to drivers/media/cec/platform/s5p/regs-cec.h
diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
similarity index 100%
rename from drivers/media/platform/s5p-cec/s5p_cec.c
rename to drivers/media/cec/platform/s5p/s5p_cec.c
diff --git a/drivers/media/platform/s5p-cec/s5p_cec.h b/drivers/media/cec/platform/s5p/s5p_cec.h
similarity index 100%
rename from drivers/media/platform/s5p-cec/s5p_cec.h
rename to drivers/media/cec/platform/s5p/s5p_cec.h
diff --git a/drivers/media/platform/seco-cec/Makefile b/drivers/media/cec/platform/seco/Makefile
similarity index 100%
rename from drivers/media/platform/seco-cec/Makefile
rename to drivers/media/cec/platform/seco/Makefile
diff --git a/drivers/media/platform/seco-cec/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
similarity index 100%
rename from drivers/media/platform/seco-cec/seco-cec.c
rename to drivers/media/cec/platform/seco/seco-cec.c
diff --git a/drivers/media/platform/seco-cec/seco-cec.h b/drivers/media/cec/platform/seco/seco-cec.h
similarity index 100%
rename from drivers/media/platform/seco-cec/seco-cec.h
rename to drivers/media/cec/platform/seco/seco-cec.h
diff --git a/drivers/media/platform/sti/cec/Makefile b/drivers/media/cec/platform/sti/Makefile
similarity index 100%
rename from drivers/media/platform/sti/cec/Makefile
rename to drivers/media/cec/platform/sti/Makefile
diff --git a/drivers/media/platform/sti/cec/stih-cec.c b/drivers/media/cec/platform/sti/stih-cec.c
similarity index 100%
rename from drivers/media/platform/sti/cec/stih-cec.c
rename to drivers/media/cec/platform/sti/stih-cec.c
diff --git a/drivers/media/platform/tegra-cec/Makefile b/drivers/media/cec/platform/tegra/Makefile
similarity index 100%
rename from drivers/media/platform/tegra-cec/Makefile
rename to drivers/media/cec/platform/tegra/Makefile
diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
similarity index 100%
rename from drivers/media/platform/tegra-cec/tegra_cec.c
rename to drivers/media/cec/platform/tegra/tegra_cec.c
diff --git a/drivers/media/platform/tegra-cec/tegra_cec.h b/drivers/media/cec/platform/tegra/tegra_cec.h
similarity index 100%
rename from drivers/media/platform/tegra-cec/tegra_cec.h
rename to drivers/media/cec/platform/tegra/tegra_cec.h
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 3df0d789d452..19282b8343e2 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -556,127 +556,6 @@ menuconfig CEC_PLATFORM_DRIVERS
 	bool "CEC platform devices"
 	depends on MEDIA_CEC_SUPPORT
 
-if CEC_PLATFORM_DRIVERS
-
-config VIDEO_CROS_EC_CEC
-	tristate "ChromeOS EC CEC driver"
-	depends on CROS_EC
-	select CEC_CORE
-	select CEC_NOTIFIER
-	select CROS_EC_PROTO
-	help
-	  If you say yes here you will get support for the
-	  ChromeOS Embedded Controller's CEC.
-	  The CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config VIDEO_MESON_AO_CEC
-	tristate "Amlogic Meson AO CEC driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	select CEC_CORE
-	select CEC_NOTIFIER
-	help
-	  This is a driver for Amlogic Meson SoCs AO CEC interface. It uses the
-	  generic CEC framework interface.
-	  CEC bus is present in the HDMI connector and enables communication
-
-config VIDEO_MESON_G12A_AO_CEC
-	tristate "Amlogic Meson G12A AO CEC driver"
-	depends on ARCH_MESON || COMPILE_TEST
-	depends on COMMON_CLK && OF
-	select REGMAP
-	select REGMAP_MMIO
-	select CEC_CORE
-	select CEC_NOTIFIER
-	---help---
-	  This is a driver for Amlogic Meson G12A SoCs AO CEC interface.
-	  This driver if for the new AO-CEC module found in G12A SoCs,
-	  usually named AO_CEC_B in documentation.
-	  It uses the generic CEC framework interface.
-	  CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config CEC_GPIO
-	tristate "Generic GPIO-based CEC driver"
-	depends on PREEMPTION || COMPILE_TEST
-	select CEC_CORE
-	select CEC_PIN
-	select CEC_NOTIFIER
-	select GPIOLIB
-	help
-	  This is a generic GPIO-based CEC driver.
-	  The CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config VIDEO_SAMSUNG_S5P_CEC
-	tristate "Samsung S5P CEC driver"
-	depends on ARCH_EXYNOS || COMPILE_TEST
-	select CEC_CORE
-	select CEC_NOTIFIER
-	help
-	  This is a driver for Samsung S5P HDMI CEC interface. It uses the
-	  generic CEC framework interface.
-	  CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config VIDEO_STI_HDMI_CEC
-	tristate "STMicroelectronics STiH4xx HDMI CEC driver"
-	depends on ARCH_STI || COMPILE_TEST
-	select CEC_CORE
-	select CEC_NOTIFIER
-	help
-	  This is a driver for STIH4xx HDMI CEC interface. It uses the
-	  generic CEC framework interface.
-	  CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config VIDEO_STM32_HDMI_CEC
-	tristate "STMicroelectronics STM32 HDMI CEC driver"
-	depends on ARCH_STM32 || COMPILE_TEST
-	select REGMAP
-	select REGMAP_MMIO
-	select CEC_CORE
-	help
-	  This is a driver for STM32 interface. It uses the
-	  generic CEC framework interface.
-	  CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config VIDEO_TEGRA_HDMI_CEC
-	tristate "Tegra HDMI CEC driver"
-	depends on ARCH_TEGRA || COMPILE_TEST
-	select CEC_CORE
-	select CEC_NOTIFIER
-	help
-	  This is a driver for the Tegra HDMI CEC interface. It uses the
-	  generic CEC framework interface.
-	  The CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config VIDEO_SECO_CEC
-	tristate "SECO Boards HDMI CEC driver"
-	depends on (X86 || IA64) || COMPILE_TEST
-	depends on PCI && DMI
-	select CEC_CORE
-	select CEC_NOTIFIER
-	help
-	  This is a driver for SECO Boards integrated CEC interface.
-	  Selecting it will enable support for this device.
-	  CEC bus is present in the HDMI connector and enables communication
-	  between compatible devices.
-
-config VIDEO_SECO_RC
-	bool "SECO Boards IR RC5 support"
-	depends on VIDEO_SECO_CEC
-	depends on RC_CORE=y || RC_CORE = VIDEO_SECO_CEC
-	help
-	  If you say yes here you will get support for the
-	  SECO Boards Consumer-IR in seco-cec driver.
-	  The embedded controller supports RC5 protocol only, default mapping
-	  is set to rc-hauppauge.
-
-endif #CEC_PLATFORM_DRIVERS
-
 menuconfig SDR_PLATFORM_DRIVERS
 	bool "SDR platform devices"
 	depends on MEDIA_SDR_SUPPORT
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index a0194ef1211f..512dcc6e710a 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -23,8 +23,6 @@ obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
 
 obj-$(CONFIG_VIDEO_SH_VEU)		+= sh_veu.o
 
-obj-$(CONFIG_CEC_GPIO)			+= cec-gpio/
-
 obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
 
 obj-$(CONFIG_VIDEO_MUX)			+= video-mux.o
@@ -35,22 +33,16 @@ obj-$(CONFIG_VIDEO_SAMSUNG_S5P_JPEG)	+= s5p-jpeg/
 obj-$(CONFIG_VIDEO_SAMSUNG_S5P_MFC)	+= s5p-mfc/
 
 obj-$(CONFIG_VIDEO_SAMSUNG_S5P_G2D)	+= s5p-g2d/
-obj-$(CONFIG_VIDEO_SAMSUNG_S5P_CEC)	+= s5p-cec/
 obj-$(CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC)	+= exynos-gsc/
 
 obj-$(CONFIG_VIDEO_STI_BDISP)		+= sti/bdisp/
 obj-$(CONFIG_VIDEO_STI_HVA)		+= sti/hva/
 obj-$(CONFIG_DVB_C8SECTPFE)		+= sti/c8sectpfe/
-obj-$(CONFIG_VIDEO_STI_HDMI_CEC)	+= sti/cec/
 
 obj-$(CONFIG_VIDEO_STI_DELTA)		+= sti/delta/
 
-obj-$(CONFIG_VIDEO_TEGRA_HDMI_CEC)	+= tegra-cec/
-
 obj-y					+= stm32/
 
-obj-$(CONFIG_VIDEO_SECO_CEC)		+= seco-cec/
-
 obj-y					+= davinci/
 
 obj-$(CONFIG_VIDEO_SH_VOU)		+= sh_vou.o
-- 
2.25.2

