Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406F172C644
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 15:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbjFLNpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 09:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbjFLNpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 09:45:07 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCAEF9
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 06:45:06 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f6255ad8aeso5160421e87.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686577504; x=1689169504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o3c15JFu9uXKITEKskQyKNy6UG3lODZ9zGdrA5UjPqA=;
        b=JX7+Y1hFg74yunqJeZlCvXLaVJppSs/HSbJ+V0MdjHgLf8LjI9bmPS5rhgYYstYy1O
         uyHBGLBn20rF5NtWI9f3Z9bFyzHEpHCULCzGmyWYnDtUtSGMWFB6Fzl0xYLNdO0HZSz6
         mw4Ze8rkizpNWIAjkK99qPkGglNAZbl9UAQamNXiV1Le9RcZwK/Hyd/Yj8PlXAz8hDUI
         +w2OCgNULZr1sNzw3zrMSis31jqWmQ0P45winxNWDUZ613bc81ClUFGu/qE25hzwvuGe
         rt9+/1h+1H6ppk9qaZz22pEM24mWi14VLqzTeP6U79Rw1dY01Yu+QNAzUz1wbcdw7Snb
         gq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686577504; x=1689169504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3c15JFu9uXKITEKskQyKNy6UG3lODZ9zGdrA5UjPqA=;
        b=cn+b7P4tYWM5wmV4XuR6qFHp4MPcALOsv5SSPTw/O2zqm5Cyd/+uh30QS1nrmoP1KL
         usK0FMUU32Hlx00q6Or6KXyeQgJ3oAQ/dIBATtrt9LKZ8F1KBjYSr8j8K78C49SMmeZR
         p4OHV4omt/x/UifjI5dCj9K5LZ0tO680aeowim7I+fEbWXhZS/0VvJC3SWaFoAk4JZrq
         MrMmm9SAnsvsMhFXK4+DBNCc+/7HB4e1WA0CSbjrAuE/5k/O8Vt7fWhdKTgXEv3RBrz/
         msbip4qXs/lq1k1598SanXHzs3YtxnGOORLtX0suiG5XtDlr4Ah6d44FpoN8rw4O1TY5
         602g==
X-Gm-Message-State: AC+VfDyWK8URAxX0ZOHIduiTa7sBUrw0v4/ZoOK3uUhmxnB4lEtZtxlV
        PW76f+xU6KGL5Ujasc5cqC/Pxg==
X-Google-Smtp-Source: ACHHUZ4h85kfHl3DI8/Abcv89tWBeUmwVQ4OIrcqdypRpQDgTPWDHo356NMqGTKYViQ9nwW38zbtmg==
X-Received: by 2002:a19:674a:0:b0:4f6:1cc4:8567 with SMTP id e10-20020a19674a000000b004f61cc48567mr4236437lfj.30.1686577504408;
        Mon, 12 Jun 2023 06:45:04 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p6-20020a05651238c600b004f3b319ed4bsm1457389lft.120.2023.06.12.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 06:45:03 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] fbdev/media: Use GPIO descriptors for VIA GPIO
Date:   Mon, 12 Jun 2023 15:45:00 +0200
Message-Id: <20230612134500.249178-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIA fbdev exposes a custom GPIO chip for its GPIOs, these
are in turn looked up the camera driver using a custom API.

Drop the custom API, provide a look-up table and convert to
GPIO descriptors. Note proper polarity on the RESET line.

Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I don't know about the merge path for this one, let's merge
it in the provider (fbdev) if possible.
This looks like OLPC stuff.
---
 drivers/media/platform/via/via-camera.c       | 51 ++++++++-----------
 drivers/video/fbdev/via/via-core.c            |  2 +-
 drivers/video/fbdev/via/via-gpio.c            | 26 +++++-----
 .../video/fbdev/via}/via-gpio.h               |  1 -
 4 files changed, 34 insertions(+), 46 deletions(-)
 rename {include/linux => drivers/video/fbdev/via}/via-gpio.h (84%)

diff --git a/drivers/media/platform/via/via-camera.c b/drivers/media/platform/via/via-camera.c
index 450254403fa8..4cb8f29e2f14 100644
--- a/drivers/media/platform/via/via-camera.c
+++ b/drivers/media/platform/via/via-camera.c
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 #include <linux/list.h>
 #include <linux/pci.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
@@ -26,7 +26,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/pm_qos.h>
 #include <linux/via-core.h>
-#include <linux/via-gpio.h>
 #include <linux/via_i2c.h>
 
 #ifdef CONFIG_X86
@@ -71,8 +70,8 @@ struct via_camera {
 	/*
 	 * GPIO info for power/reset management
 	 */
-	int power_gpio;
-	int reset_gpio;
+	struct gpio_desc *power_gpio;
+	struct gpio_desc *reset_gpio;
 	/*
 	 * I/O memory stuff.
 	 */
@@ -180,27 +179,19 @@ static struct via_format *via_find_format(u32 pixelformat)
  */
 static int via_sensor_power_setup(struct via_camera *cam)
 {
-	int ret;
+	struct device *dev = &cam->platdev->dev;
+
+	cam->power_gpio = devm_gpiod_get(dev, "VGPIO3", GPIOD_OUT_LOW);
+	if (IS_ERR(cam->power_gpio))
+		return dev_err_probe(dev, PTR_ERR(cam->power_gpio),
+				     "failed to get power GPIO");
+
+	/* Request the reset line asserted */
+	cam->reset_gpio = devm_gpiod_get(dev, "VGPIO2", GPIOD_OUT_HIGH);
+	if (IS_ERR(cam->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(cam->reset_gpio),
+				     "failed to get reset GPIO");
 
-	cam->power_gpio = viafb_gpio_lookup("VGPIO3");
-	cam->reset_gpio = viafb_gpio_lookup("VGPIO2");
-	if (!gpio_is_valid(cam->power_gpio) || !gpio_is_valid(cam->reset_gpio)) {
-		dev_err(&cam->platdev->dev, "Unable to find GPIO lines\n");
-		return -EINVAL;
-	}
-	ret = gpio_request(cam->power_gpio, "viafb-camera");
-	if (ret) {
-		dev_err(&cam->platdev->dev, "Unable to request power GPIO\n");
-		return ret;
-	}
-	ret = gpio_request(cam->reset_gpio, "viafb-camera");
-	if (ret) {
-		dev_err(&cam->platdev->dev, "Unable to request reset GPIO\n");
-		gpio_free(cam->power_gpio);
-		return ret;
-	}
-	gpio_direction_output(cam->power_gpio, 0);
-	gpio_direction_output(cam->reset_gpio, 0);
 	return 0;
 }
 
@@ -209,25 +200,23 @@ static int via_sensor_power_setup(struct via_camera *cam)
  */
 static void via_sensor_power_up(struct via_camera *cam)
 {
-	gpio_set_value(cam->power_gpio, 1);
-	gpio_set_value(cam->reset_gpio, 0);
+	gpiod_set_value(cam->power_gpio, 1);
+	gpiod_set_value(cam->reset_gpio, 1);
 	msleep(20);  /* Probably excessive */
-	gpio_set_value(cam->reset_gpio, 1);
+	gpiod_set_value(cam->reset_gpio, 0);
 	msleep(20);
 }
 
 static void via_sensor_power_down(struct via_camera *cam)
 {
-	gpio_set_value(cam->power_gpio, 0);
-	gpio_set_value(cam->reset_gpio, 0);
+	gpiod_set_value(cam->power_gpio, 0);
+	gpiod_set_value(cam->reset_gpio, 1);
 }
 
 
 static void via_sensor_power_release(struct via_camera *cam)
 {
 	via_sensor_power_down(cam);
-	gpio_free(cam->power_gpio);
-	gpio_free(cam->reset_gpio);
 }
 
 /* --------------------------------------------------------------------------*/
diff --git a/drivers/video/fbdev/via/via-core.c b/drivers/video/fbdev/via/via-core.c
index 2c1803eb196f..908524a74a38 100644
--- a/drivers/video/fbdev/via/via-core.c
+++ b/drivers/video/fbdev/via/via-core.c
@@ -11,7 +11,7 @@
 #include <linux/aperture.h>
 #include <linux/via-core.h>
 #include <linux/via_i2c.h>
-#include <linux/via-gpio.h>
+#include "via-gpio.h"
 #include "global.h"
 
 #include <linux/module.h>
diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/via/via-gpio.c
index f1b670397c02..fea5c195906f 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -7,6 +7,7 @@
 
 #include <linux/spinlock.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/via-core.h>
 #include <linux/via-gpio.h>
@@ -189,19 +190,14 @@ static struct viafb_pm_hooks viafb_gpio_pm_hooks = {
 };
 #endif /* CONFIG_PM */
 
-/*
- * Look up a specific gpio and return the number it was assigned.
- */
-int viafb_gpio_lookup(const char *name)
-{
-	int i;
-
-	for (i = 0; i < viafb_gpio_config.gpio_chip.ngpio; i++)
-		if (!strcmp(name, viafb_gpio_config.active_gpios[i]->vg_name))
-			return viafb_gpio_config.gpio_chip.base + i;
-	return -1;
-}
-EXPORT_SYMBOL_GPL(viafb_gpio_lookup);
+static struct gpiod_lookup_table viafb_gpio_table = {
+	.dev_id = "viafb-camera",
+	.table = {
+		GPIO_LOOKUP("via-gpio", 2, "VGPIO2", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("via-gpio", 3, "VGPIO3", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
 
 /*
  * Platform device stuff.
@@ -249,12 +245,16 @@ static int viafb_gpio_probe(struct platform_device *platdev)
 	 * Get registered.
 	 */
 	viafb_gpio_config.gpio_chip.base = -1;  /* Dynamic */
+	viafb_gpio_config.gpio_chip.label = "via-gpio";
 	ret = gpiochip_add_data(&viafb_gpio_config.gpio_chip,
 				&viafb_gpio_config);
 	if (ret) {
 		printk(KERN_ERR "viafb: failed to add gpios (%d)\n", ret);
 		viafb_gpio_config.gpio_chip.ngpio = 0;
 	}
+
+	gpiod_add_lookup_table(&viafb_gpio_table);
+
 #ifdef CONFIG_PM
 	viafb_pm_register(&viafb_gpio_pm_hooks);
 #endif
diff --git a/include/linux/via-gpio.h b/drivers/video/fbdev/via/via-gpio.h
similarity index 84%
rename from include/linux/via-gpio.h
rename to drivers/video/fbdev/via/via-gpio.h
index ac34668fd442..2ffedf282f7e 100644
--- a/include/linux/via-gpio.h
+++ b/drivers/video/fbdev/via/via-gpio.h
@@ -8,7 +8,6 @@
 #ifndef __VIA_GPIO_H__
 #define __VIA_GPIO_H__
 
-extern int viafb_gpio_lookup(const char *name);
 extern int viafb_gpio_init(void);
 extern void viafb_gpio_exit(void);
 #endif
-- 
2.34.1

