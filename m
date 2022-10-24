Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857DD609FE9
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 13:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiJXLMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 07:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJXLMu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 07:12:50 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5D655092
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:12:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g1so16068818lfu.12
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c1WaX3jQQyf7g4U4+fSAlZRXcbNscIMPZyOimv76+g=;
        b=JYEFaU0g147SWM4MdD7PgaXHggR0ic4tB+TsVvfhhdpllzDGfXDSWaG5OlGEtjEDIn
         CD/IpuQ3KB0iaHHYdX3TZ+rbh+jNuz2lv9DQT6LnzVHXmugqRumXSVMQQJDtRthCdLT5
         HRQxBDQQTW/lHVXZ/KWvEvcSTHqnCj3+JJ7pyeFr+Sj+FZMXy55lJ7udzmXcSjvhQihz
         xKzeraKYoMjIXeDNX1r1CkcowJ/anO07Nm/2Lds/RTsfLBzBI690IaSVP5LjgsEFGfmd
         KlJsdN19/xY4TsBSVk1XTaW2LHz+Aqqf7dqaX9zzFRVOIbNF4KqcaPcET2IAVHHVuFp7
         4JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c1WaX3jQQyf7g4U4+fSAlZRXcbNscIMPZyOimv76+g=;
        b=aEMglFq2RYHGYgyw92PueaHMHg/tZtmX4Zt6XFJclfpYHxl6Ly+bcsAcck1lBOUjoe
         Bj8vv1sjoVa0ygWuCz8pzcMtgKPAvQUlFuK82P3zaWhgGmFaSR4sY9/m8Aw9p3GGMq3j
         qAUj5WZjCJUrd0g1ZKTaZhz06zhkXclLN0Hreeba78GUU5HvwIIB7yc5LOn221ZknSSs
         sxlhzvM/BvCk75gucpdD28lbMW+wLwFDbusAl8ZQLZTMURgrFraGGoYISuTgnNb4ZE24
         te419CdK37KRAhov4TSwg4rzO604pPY4bWj/nZKmw794pTiBYeIsMejZgFMX+E7QBM5o
         Wl9A==
X-Gm-Message-State: ACrzQf0HY7gVpWLcORESf2c0w/I/71kZlKRAHdct54vH6k64UvpCvTpU
        L6PmrpNN9eMp9SQkirtJx6P1/kfR/A0PnA==
X-Google-Smtp-Source: AMsMyM7eWtj1Lv7JwUM7VvX6m2p6+i1NZEUuHuM3YWQUw0feSsl864jM6y7ZtGbI6DYrSD7WfUq59g==
X-Received: by 2002:a05:6512:3f89:b0:4a1:b468:1a7 with SMTP id x9-20020a0565123f8900b004a1b46801a7mr10961827lfa.341.1666609950174;
        Mon, 24 Oct 2022 04:12:30 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb5d6000000b0026de1bf528esm4821692ljn.119.2022.10.24.04.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:12:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 3/3 v3] media: ov9650: Drop platform data code path
Date:   Mon, 24 Oct 2022 13:12:23 +0200
Message-Id: <20221024111223.7142-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024111223.7142-1-linus.walleij@linaro.org>
References: <20221024111223.7142-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
ChangeLog v2->v3:
- Rebase on v6.1-rc1
ChangeLog v1->v2:
- Rebase on v6.0-rc1
---
 drivers/media/i2c/ov9650.c | 49 ++------------------------------------
 include/media/i2c/ov9650.h | 24 -------------------
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 include/media/i2c/ov9650.h

diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 4d458993e6d6..7e7cb1e4520e 100644
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
2.34.1

