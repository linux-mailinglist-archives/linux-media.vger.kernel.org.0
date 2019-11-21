Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2AAD1048FF
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 04:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfKUDTn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 22:19:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:33080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726541AbfKUDTm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 22:19:42 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C8FB20721;
        Thu, 21 Nov 2019 03:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574306381;
        bh=lchu/KX2vsWxSi8jH1B3g1xn82G2zo0dqdm09ot22HI=;
        h=From:To:Cc:Subject:Date:From;
        b=1qFijktoYtNuoo2iHnx0rqjpGJjP02Yc5gPd+CW1iSG9vJLkQYbMTxMELAFtjhFPG
         w2BhV+09JwK9X0A29WfnOZ5EbM/ylnO/95HH8edvu+yi/g6OUYQbS8pukMHE42X3Ku
         h7ChmHewCd8fa5hjE1wV1MeRWjc8TZ7yLp5QvXAs=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] media: Fix Kconfig indentation
Date:   Thu, 21 Nov 2019 04:19:37 +0100
Message-Id: <1574306377-30120-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix also 7-space and tab+1 space indentation issues.
---
 drivers/media/Kconfig                     |  6 +--
 drivers/media/platform/Kconfig            | 74 +++++++++++++++----------------
 drivers/media/platform/exynos4-is/Kconfig |  2 +-
 drivers/media/radio/si470x/Kconfig        |  4 +-
 4 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b36a41332867..9dfea5c4b6ab 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -208,9 +208,9 @@ config MEDIA_SUBDRV_AUTOSELECT
 	  If unsure say Y.
 
 config MEDIA_HIDE_ANCILLARY_SUBDRV
-        bool
-        depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
-        default y
+	bool
+	depends on MEDIA_SUBDRV_AUTOSELECT && !COMPILE_TEST && !EXPERT
+	default y
 
 config MEDIA_ATTACH
 	bool
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index e84f35d3a68e..cd977dfb1da2 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -610,49 +610,49 @@ config CEC_GPIO
 	  between compatible devices.
 
 config VIDEO_SAMSUNG_S5P_CEC
-       tristate "Samsung S5P CEC driver"
-       depends on ARCH_EXYNOS || COMPILE_TEST
-       select CEC_CORE
-       select CEC_NOTIFIER
-       help
-	 This is a driver for Samsung S5P HDMI CEC interface. It uses the
-	 generic CEC framework interface.
-	 CEC bus is present in the HDMI connector and enables communication
-	 between compatible devices.
+	tristate "Samsung S5P CEC driver"
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for Samsung S5P HDMI CEC interface. It uses the
+	  generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
 
 config VIDEO_STI_HDMI_CEC
-       tristate "STMicroelectronics STiH4xx HDMI CEC driver"
-       depends on ARCH_STI || COMPILE_TEST
-       select CEC_CORE
-       select CEC_NOTIFIER
-       help
-	 This is a driver for STIH4xx HDMI CEC interface. It uses the
-	 generic CEC framework interface.
-	 CEC bus is present in the HDMI connector and enables communication
-	 between compatible devices.
+	tristate "STMicroelectronics STiH4xx HDMI CEC driver"
+	depends on ARCH_STI || COMPILE_TEST
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for STIH4xx HDMI CEC interface. It uses the
+	  generic CEC framework interface.
+	  CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
 
 config VIDEO_STM32_HDMI_CEC
-       tristate "STMicroelectronics STM32 HDMI CEC driver"
-       depends on ARCH_STM32 || COMPILE_TEST
-       select REGMAP
-       select REGMAP_MMIO
-       select CEC_CORE
-       help
-	 This is a driver for STM32 interface. It uses the
-	 generic CEC framework interface.
-	 CEC bus is present in the HDMI connector and enables communication
-	 between compatible devices.
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
 
 config VIDEO_TEGRA_HDMI_CEC
-       tristate "Tegra HDMI CEC driver"
-       depends on ARCH_TEGRA || COMPILE_TEST
-       select CEC_CORE
-       select CEC_NOTIFIER
-       help
-	 This is a driver for the Tegra HDMI CEC interface. It uses the
-	 generic CEC framework interface.
-	 The CEC bus is present in the HDMI connector and enables communication
-	 between compatible devices.
+	tristate "Tegra HDMI CEC driver"
+	depends on ARCH_TEGRA || COMPILE_TEST
+	select CEC_CORE
+	select CEC_NOTIFIER
+	help
+	  This is a driver for the Tegra HDMI CEC interface. It uses the
+	  generic CEC framework interface.
+	  The CEC bus is present in the HDMI connector and enables communication
+	  between compatible devices.
 
 config VIDEO_SECO_CEC
 	tristate "SECO Boards HDMI CEC driver"
diff --git a/drivers/media/platform/exynos4-is/Kconfig b/drivers/media/platform/exynos4-is/Kconfig
index 989cb34f19b1..be4effcbfe7b 100644
--- a/drivers/media/platform/exynos4-is/Kconfig
+++ b/drivers/media/platform/exynos4-is/Kconfig
@@ -13,7 +13,7 @@ config VIDEO_SAMSUNG_EXYNOS4_IS
 if VIDEO_SAMSUNG_EXYNOS4_IS
 
 config VIDEO_EXYNOS4_IS_COMMON
-       tristate
+	tristate
 
 config VIDEO_S5P_FIMC
 	tristate "S5P/EXYNOS4 FIMC/CAMIF camera interface driver"
diff --git a/drivers/media/radio/si470x/Kconfig b/drivers/media/radio/si470x/Kconfig
index 537f8e1601f3..a1ba8bc54b62 100644
--- a/drivers/media/radio/si470x/Kconfig
+++ b/drivers/media/radio/si470x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config RADIO_SI470X
-        tristate "Silicon Labs Si470x FM Radio Receiver support"
-        depends on VIDEO_V4L2
+	tristate "Silicon Labs Si470x FM Radio Receiver support"
+	depends on VIDEO_V4L2
 	help
 	  This is a driver for devices with the Silicon Labs SI470x
 	  chip (either via USB or I2C buses).
-- 
2.7.4

