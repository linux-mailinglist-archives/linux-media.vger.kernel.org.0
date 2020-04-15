Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D2A1A9A8F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408653AbgDOKcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:32:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:33830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408647AbgDOKbs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:31:48 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08F3F21556;
        Wed, 15 Apr 2020 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586946701;
        bh=aPW4KRSGSSAnFhhCuHdHUZN+HF5qz+C0gR4w9+NHse8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yy7qummi8cpw2FCdAYWjxFJ6hZdfnpswJIXD1oGI1K9cEOMF38I2fmN4zPxcU6Yvz
         7qR+MWX/Q8DfiUFJZ+bcc3VsZTtQRBXqsLUT1rPxM+cxElp8JUWSoWNmNUvgpWWxBd
         Ywa6KJfBvTgo5d7CZKmkUESD3ynNQ6LRnTJg5QXU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOfKV-006gMN-8X; Wed, 15 Apr 2020 12:31:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 5/6] media: cec: rename CEC platform drivers config options
Date:   Wed, 15 Apr 2020 12:31:36 +0200
Message-Id: <ff1274d6cba94f769660e535e23d6b6d41b4e31e.1586946605.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586946605.git.mchehab+huawei@kernel.org>
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most CEC platform drivers are using VIDEO_*_CEC pattern, some with
an _HDMI extension too.

Well, they're not related to V4L2 support, and we don't really
need those big config names. So drop VIDEO_* from them, remove
_HDMI (if present) and move CEC to the start.

This way, all platform driver options are now CEC_<driver>.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 arch/arm/configs/exynos_defconfig           |  2 +-
 arch/arm/configs/multi_v7_defconfig         |  2 +-
 drivers/media/cec/platform/Kconfig          | 22 ++++++++++-----------
 drivers/media/cec/platform/Makefile         | 16 +++++++--------
 drivers/media/cec/platform/cros-ec/Makefile |  2 +-
 drivers/media/cec/platform/meson/Makefile   |  4 ++--
 drivers/media/cec/platform/s5p/Makefile     |  2 +-
 drivers/media/cec/platform/seco/Makefile    |  2 +-
 drivers/media/cec/platform/seco/seco-cec.c  |  2 +-
 drivers/media/cec/platform/sti/Makefile     |  2 +-
 drivers/media/cec/platform/stm32/Makefile   |  2 +-
 drivers/media/cec/platform/tegra/Makefile   |  2 +-
 12 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 3c3a00fc71f6..2c779ac13270 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -207,7 +207,7 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
-CONFIG_VIDEO_SAMSUNG_S5P_CEC=m
+CONFIG_CEC_SAMSUNG_S5P=m
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_S5K6A3=m
 CONFIG_VIDEO_S5C73M3=m
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f8e45351c3f9..9c86b1ab2f1d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -638,7 +638,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
-CONFIG_VIDEO_SAMSUNG_S5P_CEC=m
+CONFIG_CEC_SAMSUNG_S5P=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_VIDEO_ML86V7667=m
 CONFIG_IMX_IPUV3_CORE=m
diff --git a/drivers/media/cec/platform/Kconfig b/drivers/media/cec/platform/Kconfig
index 6a8bb8b68344..2c4dd7401dd8 100644
--- a/drivers/media/cec/platform/Kconfig
+++ b/drivers/media/cec/platform/Kconfig
@@ -2,7 +2,7 @@
 #
 # Platform drivers
 
-config VIDEO_CROS_EC_CEC
+config CEC_CROS_EC
 	tristate "ChromeOS EC CEC driver"
 	depends on CROS_EC
 	select CEC_CORE
@@ -14,7 +14,7 @@ config VIDEO_CROS_EC_CEC
 	  The CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
 
-config VIDEO_MESON_AO_CEC
+config CEC_MESON_AO
 	tristate "Amlogic Meson AO CEC driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	select CEC_CORE
@@ -24,7 +24,7 @@ config VIDEO_MESON_AO_CEC
 	  generic CEC framework interface.
 	  CEC bus is present in the HDMI connector and enables communication
 
-config VIDEO_MESON_G12A_AO_CEC
+config CEC_MESON_G12A_AO
 	tristate "Amlogic Meson G12A AO CEC driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	depends on COMMON_CLK && OF
@@ -52,7 +52,7 @@ config CEC_GPIO
 	  The CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
 
-config VIDEO_SAMSUNG_S5P_CEC
+config CEC_SAMSUNG_S5P
 	tristate "Samsung S5P CEC driver"
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	select CEC_CORE
@@ -63,7 +63,7 @@ config VIDEO_SAMSUNG_S5P_CEC
 	  CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
 
-config VIDEO_STI_HDMI_CEC
+config CEC_STI
 	tristate "STMicroelectronics STiH4xx HDMI CEC driver"
 	depends on ARCH_STI || COMPILE_TEST
 	select CEC_CORE
@@ -74,7 +74,7 @@ config VIDEO_STI_HDMI_CEC
 	  CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
 
-config VIDEO_STM32_HDMI_CEC
+config CEC_STM32
 	tristate "STMicroelectronics STM32 HDMI CEC driver"
 	depends on ARCH_STM32 || COMPILE_TEST
 	select REGMAP
@@ -86,7 +86,7 @@ config VIDEO_STM32_HDMI_CEC
 	  CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
 
-config VIDEO_TEGRA_HDMI_CEC
+config CEC_TEGRA
 	tristate "Tegra HDMI CEC driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	select CEC_CORE
@@ -97,7 +97,7 @@ config VIDEO_TEGRA_HDMI_CEC
 	  The CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
 
-config VIDEO_SECO_CEC
+config CEC_SECO
 	tristate "SECO Boards HDMI CEC driver"
 	depends on (X86 || IA64) || COMPILE_TEST
 	select PCI
@@ -110,10 +110,10 @@ config VIDEO_SECO_CEC
 	  CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
 
-config VIDEO_SECO_RC
+config CEC_SECO_RC
 	bool "SECO Boards IR RC5 support"
-	depends on VIDEO_SECO_CEC
-	depends on RC_CORE=y || RC_CORE = VIDEO_SECO_CEC
+	depends on CEC_SECO
+	depends on RC_CORE=y || RC_CORE = CEC_SECO
 	help
 	  If you say yes here you will get support for the
 	  SECO Boards Consumer-IR in seco-cec driver.
diff --git a/drivers/media/cec/platform/Makefile b/drivers/media/cec/platform/Makefile
index e5fb5d383e5c..3a947159b25a 100644
--- a/drivers/media/cec/platform/Makefile
+++ b/drivers/media/cec/platform/Makefile
@@ -3,12 +3,12 @@
 # Makefile for the CEC platform device drivers.
 #
 
-obj-$(CONFIG_CEC_GPIO)			+= cec-gpio/
-
-obj-$(CONFIG_VIDEO_CROS_EC_CEC)		+= cros-ec/
-obj-$(CONFIG_VIDEO_MESON_AO_CEC)	+= meson/
-obj-$(CONFIG_VIDEO_SAMSUNG_S5P_CEC)	+= s5p/
-obj-$(CONFIG_VIDEO_SECO_CEC)		+= seco/
-obj-$(CONFIG_VIDEO_STI_HDMI_CEC)	+= sti/
-obj-$(CONFIG_VIDEO_TEGRA_HDMI_CEC)	+= tegra/
+# Please keep it in alphabetic order
+obj-$(CONFIG_CEC_CROS_EC)	+= cros-ec/
+obj-$(CONFIG_CEC_GPIO)		+= cec-gpio/
+obj-$(CONFIG_CEC_MESON_AO)	+= meson/
+obj-$(CONFIG_CEC_SAMSUNG_S5P)	+= s5p/
+obj-$(CONFIG_CEC_SECO)		+= seco/
+obj-$(CONFIG_CEC_STI)		+= sti/
+obj-$(CONFIG_CEC_TEGRA)		+= tegra/
 
diff --git a/drivers/media/cec/platform/cros-ec/Makefile b/drivers/media/cec/platform/cros-ec/Makefile
index 2615cdc6e227..d7e3511078ef 100644
--- a/drivers/media/cec/platform/cros-ec/Makefile
+++ b/drivers/media/cec/platform/cros-ec/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_CROS_EC_CEC) += cros-ec-cec.o
+obj-$(CONFIG_CEC_CROS_EC) += cros-ec-cec.o
diff --git a/drivers/media/cec/platform/meson/Makefile b/drivers/media/cec/platform/meson/Makefile
index 6bf728addbf8..34fc5d444d0e 100644
--- a/drivers/media/cec/platform/meson/Makefile
+++ b/drivers/media/cec/platform/meson/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_MESON_AO_CEC)	+= ao-cec.o
-obj-$(CONFIG_VIDEO_MESON_G12A_AO_CEC)	+= ao-cec-g12a.o
+obj-$(CONFIG_CEC_MESON_AO)	+= ao-cec.o
+obj-$(CONFIG_CEC_MESON_G12A_AO)	+= ao-cec-g12a.o
diff --git a/drivers/media/cec/platform/s5p/Makefile b/drivers/media/cec/platform/s5p/Makefile
index bd0103b91bee..92bf7b8557c5 100644
--- a/drivers/media/cec/platform/s5p/Makefile
+++ b/drivers/media/cec/platform/s5p/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_SAMSUNG_S5P_CEC)	+= s5p-cec.o
+obj-$(CONFIG_CEC_SAMSUNG_S5P)	+= s5p-cec.o
 s5p-cec-y += s5p_cec.o exynos_hdmi_cecctrl.o
diff --git a/drivers/media/cec/platform/seco/Makefile b/drivers/media/cec/platform/seco/Makefile
index 79fde6947ff2..aa1ca8ccdb8b 100644
--- a/drivers/media/cec/platform/seco/Makefile
+++ b/drivers/media/cec/platform/seco/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_SECO_CEC) += seco-cec.o
+obj-$(CONFIG_CEC_SECO) += seco-cec.o
diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index 2ff62a488b27..075dd79beb6f 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -343,7 +343,7 @@ static const struct cec_adap_ops secocec_cec_adap_ops = {
 	.adap_transmit = secocec_adap_transmit,
 };
 
-#ifdef CONFIG_VIDEO_SECO_RC
+#ifdef CONFIG_CEC_SECO_RC
 static int secocec_ir_probe(void *priv)
 {
 	struct secocec_data *cec = priv;
diff --git a/drivers/media/cec/platform/sti/Makefile b/drivers/media/cec/platform/sti/Makefile
index d0c6b4ae94d6..26ec5ba1c633 100644
--- a/drivers/media/cec/platform/sti/Makefile
+++ b/drivers/media/cec/platform/sti/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_STI_HDMI_CEC) += stih-cec.o
+obj-$(CONFIG_CEC_STI) += stih-cec.o
diff --git a/drivers/media/cec/platform/stm32/Makefile b/drivers/media/cec/platform/stm32/Makefile
index 5c89dbce0f67..b7597a00befa 100644
--- a/drivers/media/cec/platform/stm32/Makefile
+++ b/drivers/media/cec/platform/stm32/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_STM32_HDMI_CEC) += stm32-cec.o
+obj-$(CONFIG_CEC_STM32) += stm32-cec.o
diff --git a/drivers/media/cec/platform/tegra/Makefile b/drivers/media/cec/platform/tegra/Makefile
index 97e57c7493c0..275d1c019d49 100644
--- a/drivers/media/cec/platform/tegra/Makefile
+++ b/drivers/media/cec/platform/tegra/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_VIDEO_TEGRA_HDMI_CEC)	+= tegra_cec.o
+obj-$(CONFIG_CEC_TEGRA)	+= tegra_cec.o
-- 
2.25.2

