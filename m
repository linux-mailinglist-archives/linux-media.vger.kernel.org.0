Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6295A6F0A
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 23:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbiH3VTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 17:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiH3VTb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 17:19:31 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE7288DE1
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:19:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z29so8694512lfb.13
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=BBBeU+2rOdaxMTksalvTtJt5xM4iyjWWHeSnTBkIJ3w=;
        b=ZzNW50bGZ0gkBRATOvB4/16HGrJq+CwnnhYRuE3vawm3scKP0Tx0KL1mXV6ir5wJFC
         lUibQhsU7Vo5SetTNZSBcKkxqlhU5N9iyM+eKA9aID7ietbsxrFCO6rpxgC11F3TyJ9+
         z/0zCrbv8WNJQjPzmZWh6pwwwz3xmZT9SF3DyIWrP2SCKzyOBaHJYXB0FD7NXi0B6SMN
         VkURPliSYOjT+loYW1ia94/qq21ukJowrvZMCiqIwF6eACdzQoNKPskU72qRSKwZeYWd
         rTAxi08LDsvbRC7aAdpFm2FA60H1UJL57fv6BIWxlMJgs62Ot55+p7cqYNF81wztSH84
         a+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=BBBeU+2rOdaxMTksalvTtJt5xM4iyjWWHeSnTBkIJ3w=;
        b=DlzKLn12n3RwqW4eabEMnmiTmuBJ5cD2DZ6QzFumaCG64vZsnjTZCRnG31iXL2WaZd
         tWL6O0RfytOxKhmKniASBzKTJQZEeBiLCmJrUkwp49y6DFhNVim+gDficuLzg1O+UztQ
         iaWke3P7hoEjpYC26MpCWAuZR9pJuQfggE2Ih6Cz65J0xZAxwCyg6Uq4/VKx1Y7fAmix
         w/7U1VrIeC+7o+S/AcWUpq80Ix4SG/ZWS9jiKTQnkY/GYYSB5bnmhW/BpSYs47sDF6Sh
         YafOVJVaSuZ7xdQmZE7M859R4U5C4LozZ7tiM8YdDM1FKIz3F7ELBhuiL06GBD9PnNcV
         3ezA==
X-Gm-Message-State: ACgBeo0kR8DvriOgnzfFiTQKF40rYaqsXGWfXNlcVkJa0UtmD1hTKNUL
        u1f9CBTK/gzlzkcE6MP9yq6oqkF8Jkbp6GN6
X-Google-Smtp-Source: AA6agR4SRwFwHHHCQRpSGhPB7L1YpQSn0pEspHHEv/9tXcAKvIyhDXUmRYjI1UWTXfPNBsCe0soc9g==
X-Received: by 2002:a05:6512:2807:b0:494:6cc8:d31e with SMTP id cf7-20020a056512280700b004946cc8d31emr3272884lfb.82.1661894368754;
        Tue, 30 Aug 2022 14:19:28 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512315300b0049465db4be5sm1116108lfi.34.2022.08.30.14.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:19:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2] media: ov9650: Drop platform data code path
Date:   Tue, 30 Aug 2022 23:17:26 +0200
Message-Id: <20220830211726.397967-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
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

Nothing in the kernel uses the platform data code path.
Drop it, and drop the use of the old legacy <linux/gpio.h>
API in the process.

Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on v6.0-rc1
---
 drivers/media/i2c/ov9650.c | 49 ++------------------------------------
 include/media/i2c/ov9650.h | 24 -------------------
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 include/media/i2c/ov9650.h

diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index c313e11a9754..e8279310e5cf 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -10,7 +10,6 @@
  */
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
@@ -30,7 +29,6 @@
 #include <media/v4l2-image-sizes.h>
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-mediabus.h>
-#include <media/i2c/ov9650.h>
 
 static int debug;
 module_param(debug, int, 0644);
@@ -1402,38 +1400,6 @@ static const struct v4l2_subdev_ops ov965x_subdev_ops = {
 	.video = &ov965x_video_ops,
 };
 
-/*
- * Reset and power down GPIOs configuration
- */
-static int ov965x_configure_gpios_pdata(struct ov965x *ov965x,
-				const struct ov9650_platform_data *pdata)
-{
-	int ret, i;
-	int gpios[NUM_GPIOS];
-	struct device *dev = regmap_get_device(ov965x->regmap);
-
-	gpios[GPIO_PWDN] = pdata->gpio_pwdn;
-	gpios[GPIO_RST]  = pdata->gpio_reset;
-
-	for (i = 0; i < ARRAY_SIZE(ov965x->gpios); i++) {
-		int gpio = gpios[i];
-
-		if (!gpio_is_valid(gpio))
-			continue;
-		ret = devm_gpio_request_one(dev, gpio,
-					    GPIOF_OUT_INIT_HIGH, "OV965X");
-		if (ret < 0)
-			return ret;
-		v4l2_dbg(1, debug, &ov965x->sd, "set gpio %d to 1\n", gpio);
-
-		gpio_set_value_cansleep(gpio, 1);
-		gpio_export(gpio, 0);
-		ov965x->gpios[i] = gpio_to_desc(gpio);
-	}
-
-	return 0;
-}
-
 static int ov965x_configure_gpios(struct ov965x *ov965x)
 {
 	struct device *dev = regmap_get_device(ov965x->regmap);
@@ -1493,7 +1459,6 @@ static int ov965x_detect_sensor(struct v4l2_subdev *sd)
 
 static int ov965x_probe(struct i2c_client *client)
 {
-	const struct ov9650_platform_data *pdata = client->dev.platform_data;
 	struct v4l2_subdev *sd;
 	struct ov965x *ov965x;
 	int ret;
@@ -1513,17 +1478,7 @@ static int ov965x_probe(struct i2c_client *client)
 		return PTR_ERR(ov965x->regmap);
 	}
 
-	if (pdata) {
-		if (pdata->mclk_frequency == 0) {
-			dev_err(&client->dev, "MCLK frequency not specified\n");
-			return -EINVAL;
-		}
-		ov965x->mclk_frequency = pdata->mclk_frequency;
-
-		ret = ov965x_configure_gpios_pdata(ov965x, pdata);
-		if (ret < 0)
-			return ret;
-	} else if (dev_fwnode(&client->dev)) {
+	if (dev_fwnode(&client->dev)) {
 		ov965x->clk = devm_clk_get(&client->dev, NULL);
 		if (IS_ERR(ov965x->clk))
 			return PTR_ERR(ov965x->clk);
@@ -1534,7 +1489,7 @@ static int ov965x_probe(struct i2c_client *client)
 			return ret;
 	} else {
 		dev_err(&client->dev,
-			"Neither platform data nor device property specified\n");
+			"No device properties specified\n");
 
 		return -EINVAL;
 	}
diff --git a/include/media/i2c/ov9650.h b/include/media/i2c/ov9650.h
deleted file mode 100644
index 3ec7e06955b4..000000000000
--- a/include/media/i2c/ov9650.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * OV9650/OV9652 camera sensors driver
- *
- * Copyright (C) 2013 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
- */
-#ifndef OV9650_H_
-#define OV9650_H_
-
-/**
- * struct ov9650_platform_data - ov9650 driver platform data
- * @mclk_frequency: the sensor's master clock frequency in Hz
- * @gpio_pwdn:	    number of a GPIO connected to OV965X PWDN pin
- * @gpio_reset:     number of a GPIO connected to OV965X RESET pin
- *
- * If any of @gpio_pwdn or @gpio_reset are unused then they should be
- * set to a negative value. @mclk_frequency must always be specified.
- */
-struct ov9650_platform_data {
-	unsigned long mclk_frequency;
-	int gpio_pwdn;
-	int gpio_reset;
-};
-#endif /* OV9650_H_ */
-- 
2.37.2

