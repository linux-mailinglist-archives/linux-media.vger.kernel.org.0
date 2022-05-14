Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F67A527354
	for <lists+linux-media@lfdr.de>; Sat, 14 May 2022 19:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbiENR0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 May 2022 13:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiENR0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 May 2022 13:26:43 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3171EECD
        for <linux-media@vger.kernel.org>; Sat, 14 May 2022 10:26:41 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id g16so13704550lja.3
        for <linux-media@vger.kernel.org>; Sat, 14 May 2022 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tq3VpataONgrKEvsF7uqQwofk2ulROTynwIqE6VDIAE=;
        b=PvMf0gP8/GHGoE6VBiB9NUAUCInQAIj1YOgVZEHAj7/4tUUcV/4vHR4g7/YHyWnTWo
         I76LUMeFqoaJTBEHZ3hOAxQUV5KEXA3XYvALmD8hESYnj5k0XTEylSZ0jwSR9DDJGhGF
         DBp8KOGmTt+CVgF5DV08Wa/7BC4LIbnXwplMaZlU3BGhxolxxgJ7hek6wvEXiQeR7TTe
         H72iXUpvkXwTjQIVPrUY+dRl/MhHjVgsr5oTuKF5ggm8iaxhA9VezpSOLVoO0IQ5w693
         7SAOyPvkACLaHk+e2X9Eg6FyKVz1VCCvIJHvSutp0zprN3RQ4JGcPFFEHSBKOkarecSw
         p6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tq3VpataONgrKEvsF7uqQwofk2ulROTynwIqE6VDIAE=;
        b=apeoXI5BFTyzkXJUemvyXB3S/3lYjcAboUsv1uHjQ47ZpEqFCYzxf4Jhk2N4NBFiSW
         ZulHWkvM1q4eblAHVg/7xnIvrdF9411L2J/65i1xaDHAaEuk+VHmSz74RyOxaIWFYcb4
         BOQhZP3E5ttzyAHoQmlRzLpLx+cl5kOfA1DyH2DY6wc79aFcmgSPqmdlJKF1C8B4s7BD
         ljEgzmF3sg+iZ3abhUQW+LQnnlYbZVlxn5IH8bJbwMpatDKR5Sf0T7zhLU77qCdc6ZEQ
         bFbqm659N8gKLaAFhHjSZKHeBmPz8ODH+oFCRUwn2tJ061++TlkF53hB2BISV2GQzcni
         IOiw==
X-Gm-Message-State: AOAM5333J8tUZuhI98z6rSfO6EYTUPAUfaq5+kcdfgsbER83Ju2/u9zt
        ZTP/yRIMFupcfIWG4KF8XRs14A==
X-Google-Smtp-Source: ABdhPJznRzNFxY2Z8HUAkjw+DxVFt9Z2cZmh2h42pi6I8UL1FvSOYe9wd617n2hrg3zw2wRdb4mA7g==
X-Received: by 2002:a2e:bd13:0:b0:244:da2f:ff4d with SMTP id n19-20020a2ebd13000000b00244da2fff4dmr6366502ljq.213.1652549199514;
        Sat, 14 May 2022 10:26:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h16-20020a05651211d000b0047255d2116dsm766372lfr.156.2022.05.14.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 10:26:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] media: ov9650: Drop platform data code path
Date:   Sat, 14 May 2022 19:24:35 +0200
Message-Id: <20220514172435.328194-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
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
2.35.1

