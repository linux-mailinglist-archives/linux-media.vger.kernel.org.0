Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 813E772D9F5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 08:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239808AbjFMGd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 02:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjFMGdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 02:33:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC23C1AD
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 23:33:20 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f6255ad8aeso6281955e87.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 23:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686637999; x=1689229999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SimncKFafOv0EPP1eKWkZkIgfWz007nswpvYVa91Wow=;
        b=tRuckTlAvRkMrw+uJMUdg/xzExLU21JuW2mnGvTa9Tnpkeph68gjmoOPTglLO3AGmJ
         j2hcjhsfLb7BvLTmg1u45D8RXSohLWa/sHK3J1y1IeiSjwRmXrQNYwdHDn/QPU9m5XmY
         HDM88tYhn272cSPtV7/hAeQCnKdGYYezwLx/L5rALO/WjtzcONsJIwpAAr0u8IBcQdj8
         GumUzxJwVfZ2jbC3QKKNckUh7pv7YtvX/Xj2lGKCrjmcug3Pcsm8fLsLsRdPJc5HCruy
         QbjIooCOBxbeWyiWQEZndJinJcXeHfHFN6jdXjpbWIi3yHBc5+xZYBSpCeL8DKExItcP
         oRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686637999; x=1689229999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SimncKFafOv0EPP1eKWkZkIgfWz007nswpvYVa91Wow=;
        b=UJzMMtGWx5/YHSgxdSGnJRZRiiC4KvZ3IaUnRPz64y/YY+X701kRxx9voBtnS4rk2e
         NSHWZyI18AElTEfw3t5ShwiEloUjVaamn5IBPj8v8VsPsxzeqpJ1CItaE2I4OAZdLmky
         RHBKQo0wJgozzWctl+xIRnqGCPqm5Ck0U+NFmLNaLpqliC2Bmo7cRmcwVsShxRHizJHB
         bmmGbe3xpoQ65EmkAxD1DUb0A/5A4dmVwQIjxl0Sh/9VzrOcZ5yLJ0gvX9x/Z9CSVMaN
         R3DkaZ23bMImokgsMwtuyXNfISd/pbzdc8EMnCGxPYRn+mavaGe69LRzb1VzymsZIZuO
         2yrA==
X-Gm-Message-State: AC+VfDyyHLlB9OB45Z1SpxiOpYJ1Fv5n4qUfGKJS1XCTDcEwTEOWzvpp
        b/kZb1btLVell/AugaCfG9s5qa2S1v9cDvZK1TY=
X-Google-Smtp-Source: ACHHUZ6qgVHX3zqR77WmOJe4sqm1+2SFQsugU9UqYESZkwsU5sIZFMi1/Xut7Wqgbw5eak1Fiz83QA==
X-Received: by 2002:a05:6512:604:b0:4f4:b0d0:63fb with SMTP id b4-20020a056512060400b004f4b0d063fbmr4860327lfe.35.1686637999135;
        Mon, 12 Jun 2023 23:33:19 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id t11-20020a19ad0b000000b004f3940c2b07sm1658378lfc.274.2023.06.12.23.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 23:33:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helge Deller <deller@gmx.de>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] fbdev/media: Use GPIO descriptors for VIA GPIO
Date:   Tue, 13 Jun 2023 08:33:14 +0200
Message-Id: <20230613063314.736889-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
ChangeLog v1->v2:
- Fix a missed include (I guess I had an old compiled
  object that just worked...)

I don't know about the merge path for this one, let's merge
it in the provider (fbdev) if possible.
This looks like OLPC stuff.
---
 drivers/media/platform/via/via-camera.c       | 51 ++++++++-----------
 drivers/video/fbdev/via/via-core.c            |  2 +-
 drivers/video/fbdev/via/via-gpio.c            | 28 +++++-----
 .../video/fbdev/via}/via-gpio.h               |  1 -
 4 files changed, 35 insertions(+), 47 deletions(-)
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
index f1b670397c02..2719943c06f4 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -7,10 +7,11 @@
 
 #include <linux/spinlock.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
 #include <linux/platform_device.h>
 #include <linux/via-core.h>
-#include <linux/via-gpio.h>
 #include <linux/export.h>
+#include "via-gpio.h"
 
 /*
  * The ports we know about.  Note that the port-25 gpios are not
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

