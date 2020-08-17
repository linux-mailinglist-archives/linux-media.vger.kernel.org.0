Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF2B246D34
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 18:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388979AbgHQQtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 12:49:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388161AbgHQQsp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 12:48:45 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59BF620674;
        Mon, 17 Aug 2020 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597682923;
        bh=kzRDwZLFfJe7R8z59qXdL7m6vBqsZL47jFQyxYNoDY8=;
        h=From:To:Subject:Date:From;
        b=KH5zsm/HeL0NnlC4K5/H1gpleYkvKb469BWoVzKEX5TNadOF4GBPDm8VJg4DPTPLR
         j3JyAsaYpRvR6OqHNyitpIxU9OwhkuLUWv33SOnUBOdRuNsyrqCzqnFAZ9N3f8x8q5
         ipCMYThuGWIWlwwS/zJitngSs+7QUaM6+0NI7Y6w=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3] ARM: s3c24xx: drop s3c-camif setup platform code
Date:   Mon, 17 Aug 2020 18:48:36 +0200
Message-Id: <20200817164836.4613-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The s3c-camif driver setup platform code does not have any users so it
can be safely removed.

Along with the code W=1 compile warnings go away:

    arch/arm/mach-s3c24xx/setup-camif.c:28:5: warning: no previous prototype for 's3c_camif_gpio_get' [-Wmissing-prototypes]
    arch/arm/mach-s3c24xx/setup-camif.c:56:6: warning: no previous prototype for 's3c_camif_gpio_put' [-Wmissing-prototypes]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Continuation of v2 here:
https://patchwork.kernel.org/patch/11700881/

Changes since v2:
1. Drop setup-camif.

Changes since v1:
1. New patch.
---
 arch/arm/mach-s3c24xx/Kconfig       |  6 ---
 arch/arm/mach-s3c24xx/Makefile      |  1 -
 arch/arm/mach-s3c24xx/setup-camif.c | 67 -----------------------------
 include/media/drv-intf/s3c_camif.h  |  4 --
 4 files changed, 78 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/setup-camif.c

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 7673dde9671a..eaea567fcbfe 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -123,11 +123,6 @@ config S3C24XX_PLL
 	  This also means that the PLL tables for the selected CPU(s) will
 	  be built which may increase the size of the kernel image.
 
-config S3C_SETUP_CAMIF
-	bool
-	help
-	  Compile in common setup code for S3C CAMIF devices
-
 # cpu frequency items common between s3c2410 and s3c2440/s3c2442
 
 config S3C2410_IOTIMING
@@ -468,7 +463,6 @@ config MACH_MINI2440
 	select NEW_LEDS
 	select S3C_DEV_NAND
 	select S3C_DEV_USB_HOST
-	select S3C_SETUP_CAMIF
 	help
 	  Say Y here to select support for the MINI2440. Is a 10cm x 10cm board
 	  available via various sources. It can come with a 3.5" or 7" touch LCD.
diff --git a/arch/arm/mach-s3c24xx/Makefile b/arch/arm/mach-s3c24xx/Makefile
index 6692f2de71b2..fbebc5f775e7 100644
--- a/arch/arm/mach-s3c24xx/Makefile
+++ b/arch/arm/mach-s3c24xx/Makefile
@@ -97,4 +97,3 @@ obj-$(CONFIG_S3C2416_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
 obj-$(CONFIG_S3C2443_SETUP_SPI)		+= setup-spi.o
 obj-$(CONFIG_ARCH_S3C24XX)		+= setup-i2c.o
 obj-$(CONFIG_S3C24XX_SETUP_TS)		+= setup-ts.o
-obj-$(CONFIG_S3C_SETUP_CAMIF)		+= setup-camif.o
diff --git a/arch/arm/mach-s3c24xx/setup-camif.c b/arch/arm/mach-s3c24xx/setup-camif.c
deleted file mode 100644
index 2b262fae3f61..000000000000
--- a/arch/arm/mach-s3c24xx/setup-camif.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Copyright (C) 2012 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
-//
-// Helper functions for S3C24XX/S3C64XX SoC series CAMIF driver
-
-#include <linux/gpio.h>
-#include <plat/gpio-cfg.h>
-#include <mach/gpio-samsung.h>
-
-/* Number of camera port pins, without FIELD */
-#define S3C_CAMIF_NUM_GPIOS	13
-
-/* Default camera port configuration helpers. */
-
-static void camif_get_gpios(int *gpio_start, int *gpio_reset)
-{
-#ifdef CONFIG_ARCH_S3C24XX
-	*gpio_start = S3C2410_GPJ(0);
-	*gpio_reset = S3C2410_GPJ(12);
-#else
-	/* s3c64xx */
-	*gpio_start = S3C64XX_GPF(0);
-	*gpio_reset = S3C64XX_GPF(3);
-#endif
-}
-
-int s3c_camif_gpio_get(void)
-{
-	int gpio_start, gpio_reset;
-	int ret, i;
-
-	camif_get_gpios(&gpio_start, &gpio_reset);
-
-	for (i = 0; i < S3C_CAMIF_NUM_GPIOS; i++) {
-		int gpio = gpio_start + i;
-
-		if (gpio == gpio_reset)
-			continue;
-
-		ret = gpio_request(gpio, "camif");
-		if (!ret)
-			ret = s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(2));
-		if (ret) {
-			pr_err("failed to configure GPIO %d\n", gpio);
-			for (--i; i >= 0; i--)
-				gpio_free(gpio--);
-			return ret;
-		}
-		s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
-	}
-
-	return 0;
-}
-
-void s3c_camif_gpio_put(void)
-{
-	int i, gpio_start, gpio_reset;
-
-	camif_get_gpios(&gpio_start, &gpio_reset);
-
-	for (i = 0; i < S3C_CAMIF_NUM_GPIOS; i++) {
-		int gpio = gpio_start + i;
-		if (gpio != gpio_reset)
-			gpio_free(gpio);
-	}
-}
diff --git a/include/media/drv-intf/s3c_camif.h b/include/media/drv-intf/s3c_camif.h
index d1200b40f53a..f746851a5ce6 100644
--- a/include/media/drv-intf/s3c_camif.h
+++ b/include/media/drv-intf/s3c_camif.h
@@ -35,8 +35,4 @@ struct s3c_camif_plat_data {
 	int (*gpio_put)(void);
 };
 
-/* Platform default helper functions */
-int s3c_camif_gpio_get(void);
-int s3c_camif_gpio_put(void);
-
 #endif /* MEDIA_S3C_CAMIF_ */
-- 
2.17.1

