Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45CD1A9A90
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408678AbgDOKcd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:33828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408648AbgDOKbs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:31:48 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDFE1214AF;
        Wed, 15 Apr 2020 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586946701;
        bh=d8rlQ7v3/u8ClPPSrvb3rQ1cfYaUU+9nvj14FfSOM88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cHMH+23KkZa+eaT/ibIvXOpwsyPkZ0se2tBZVhuxwY8/Hytbm1CU2B/R9BbzNgWYO
         bpsnKpOR24ViRKULFtAQOR/mhZPWGeZoqyMw+HNa2isrUX20MOhMl22+Zan0r470+/
         WvWBMO+m1hohaNEYTt+ae3hPLB9TQgSobCvR/uzA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOfKV-006gMC-6W; Wed, 15 Apr 2020 12:31:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/6] media: move CEC platform drivers to a separate directory
Date:   Wed, 15 Apr 2020 12:31:34 +0200
Message-Id: <221ac8f88034bb55c7029c162c0273eccd6b6480.1586946605.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586946605.git.mchehab+huawei@kernel.org>
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
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
 drivers/media/cec/platform/Kconfig            | 121 +++++++++++++++++
 drivers/media/cec/platform/Makefile           |  14 ++
 .../{ => cec}/platform/cec-gpio/Makefile      |   0
 .../{ => cec}/platform/cec-gpio/cec-gpio.c    |   0
 .../platform/cros-ec}/Makefile                |   0
 .../platform/cros-ec}/cros-ec-cec.c           |   0
 .../media/{ => cec}/platform/meson/Makefile   |   0
 .../{ => cec}/platform/meson/ao-cec-g12a.c    |   0
 .../media/{ => cec}/platform/meson/ao-cec.c   |   0
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
 drivers/media/cec/platform/stm32/Makefile     |   2 +
 .../{ => cec}/platform/stm32/stm32-cec.c      |   0
 .../tegra-cec => cec/platform/tegra}/Makefile |   0
 .../platform/tegra}/tegra_cec.c               |   0
 .../platform/tegra}/tegra_cec.h               |   0
 drivers/media/platform/Kconfig                | 125 ------------------
 drivers/media/platform/Makefile               |  12 --
 drivers/media/platform/stm32/Makefile         |   1 -
 30 files changed, 143 insertions(+), 140 deletions(-)
 create mode 100644 drivers/media/cec/platform/Kconfig
 create mode 100644 drivers/media/cec/platform/Makefile
 rename drivers/media/{ => cec}/platform/cec-gpio/Makefile (100%)
 rename drivers/media/{ => cec}/platform/cec-gpio/cec-gpio.c (100%)
 rename drivers/media/{platform/cros-ec-cec => cec/platform/cros-ec}/Makefile (100%)
 rename drivers/media/{platform/cros-ec-cec => cec/platform/cros-ec}/cros-ec-cec.c (100%)
 rename drivers/media/{ => cec}/platform/meson/Makefile (100%)
 rename drivers/media/{ => cec}/platform/meson/ao-cec-g12a.c (100%)
 rename drivers/media/{ => cec}/platform/meson/ao-cec.c (100%)
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
 create mode 100644 drivers/media/cec/platform/stm32/Makefile
 rename drivers/media/{ => cec}/platform/stm32/stm32-cec.c (100%)
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
index 000000000000..e5fb5d383e5c
--- /dev/null
+++ b/drivers/media/cec/platform/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the CEC platform device drivers.
+#
+
+obj-$(CONFIG_CEC_GPIO)			+= cec-gpio/
+
+obj-$(CONFIG_VIDEO_CROS_EC_CEC)		+= cros-ec/
+obj-$(CONFIG_VIDEO_MESON_AO_CEC)	+= meson/
+obj-$(CONFIG_VIDEO_SAMSUNG_S5P_CEC)	+= s5p/
+obj-$(CONFIG_VIDEO_SECO_CEC)		+= seco/
+obj-$(CONFIG_VIDEO_STI_HDMI_CEC)	+= sti/
+obj-$(CONFIG_VIDEO_TEGRA_HDMI_CEC)	+= tegra/
+
diff --git a/drivers/media/platform/cec-gpio/Makefile b/drivers/media/cec/platform/cec-gpio/Makefile
similarity index 100%
rename from drivers/media/platform/cec-gpio/Makefile
rename to drivers/media/cec/platform/cec-gpio/Makefile
diff --git a/drivers/media/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
similarity index 100%
rename from drivers/media/platform/cec-gpio/cec-gpio.c
rename to drivers/media/cec/platform/cec-gpio/cec-gpio.c
diff --git a/drivers/media/platform/cros-ec-cec/Makefile b/drivers/media/cec/platform/cros-ec/Makefile
similarity index 100%
rename from drivers/media/platform/cros-ec-cec/Makefile
rename to drivers/media/cec/platform/cros-ec/Makefile
diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
similarity index 100%
rename from drivers/media/platform/cros-ec-cec/cros-ec-cec.c
rename to drivers/media/cec/platform/cros-ec/cros-ec-cec.c
diff --git a/drivers/media/platform/meson/Makefile b/drivers/media/cec/platform/meson/Makefile
similarity index 100%
rename from drivers/media/platform/meson/Makefile
rename to drivers/media/cec/platform/meson/Makefile
diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
similarity index 100%
rename from drivers/media/platform/meson/ao-cec-g12a.c
rename to drivers/media/cec/platform/meson/ao-cec-g12a.c
diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
similarity index 100%
rename from drivers/media/platform/meson/ao-cec.c
rename to drivers/media/cec/platform/meson/ao-cec.c
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
diff --git a/drivers/media/cec/platform/stm32/Makefile b/drivers/media/cec/platform/stm32/Makefile
new file mode 100644
index 000000000000..5c89dbce0f67
--- /dev/null
+++ b/drivers/media/cec/platform/stm32/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_VIDEO_STM32_HDMI_CEC) += stm32-cec.o
diff --git a/drivers/media/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
similarity index 100%
rename from drivers/media/platform/stm32/stm32-cec.c
rename to drivers/media/cec/platform/stm32/stm32-cec.c
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
index 3df0d789d452..b1ac9c6c9cdb 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -552,131 +552,6 @@ if DVB_PLATFORM_DRIVERS
 source "drivers/media/platform/sti/c8sectpfe/Kconfig"
 endif #DVB_PLATFORM_DRIVERS
 
-menuconfig CEC_PLATFORM_DRIVERS
-	bool "CEC platform devices"
-	depends on MEDIA_CEC_SUPPORT
-
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
index a0194ef1211f..ac31d4748869 100644
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
@@ -89,8 +81,4 @@ obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
 
 obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
 
-obj-y					+= meson/
-
-obj-y					+= cros-ec-cec/
-
 obj-y					+= sunxi/
diff --git a/drivers/media/platform/stm32/Makefile b/drivers/media/platform/stm32/Makefile
index 5ed73599ca44..48b36db2c2e2 100644
--- a/drivers/media/platform/stm32/Makefile
+++ b/drivers/media/platform/stm32/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_VIDEO_STM32_DCMI) += stm32-dcmi.o
-obj-$(CONFIG_VIDEO_STM32_HDMI_CEC) += stm32-cec.o
-- 
2.25.2

