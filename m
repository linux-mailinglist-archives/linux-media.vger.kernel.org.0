Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084B34C1A45
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 18:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243560AbiBWRyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 12:54:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243553AbiBWRyP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 12:54:15 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212E81104
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:53:46 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d23so32470424lfv.13
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 09:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xX8meJF+9gRDqNb55AvXhYbm65OknBby0B5/vlES7Cs=;
        b=hndnteQYpPapPv/rXcdLpwPhQhHMm9LUbumhDbeYs7cmKtf2PoJGkyQbMHON0y1q8d
         8hHzMlRopJGY9WlbSsNmobIwtyYopmf9lfA8TNs4Q2so9xBWevaneAoxwVGm2I6itRZc
         +GXhU6iUylZ+mkc26xXy/finnOBkIr7LdgfpfkP8fBOFgzLaAGl1HaI5eJ0nCmeKEH8g
         BDbUy9XGaONAmauBICBDEgIoCvg8JL4PojtqyYZ4VcXVQ94F9QdE03Rxctk+MgRf6nMK
         dZ2K2Pv8qyPa0ARhrEpwR0pig7BlVZ33fo+zjSo1hHhK4IQqJOUnZv0xtMy0e8ZHI+93
         Ipqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xX8meJF+9gRDqNb55AvXhYbm65OknBby0B5/vlES7Cs=;
        b=4rS5K5KrDXIen9/0HVRz2vjcr08I5Z1WXDxjrbaUN50JcYbT+OXeR3Fz3fS9YmYhtJ
         3skrxGW5Aqu8fxWQ/FniIe/HVoL23jcbxe4P6fWNeIa8ALYWJb44H8WaibIJ7AfJVkll
         t4shPBo6Mi9Oe3PBmlDTD/XBqO+Gy4Pt5P/ormbFaFM4+W1YmiBHtfuH10dem4DZ4kyM
         CmtIGXDr2OLudMqvnHZG27KT4vI8YuJTZh/Yet03m1POov/aOQ1qL4eWpWifLMQY9U9k
         VfXU8PhRK2YQjMopQ4D7qHQITHZiSsS2XBEwou82tX7S/SdK48wF3qbM6ZGKM6vVieWX
         wwxw==
X-Gm-Message-State: AOAM530/RxdS+1NfxdBGMShdvNbY93uBJDZ95IVrOv5UJEujTjtBsK/B
        5Nq6V8DVPF8fX4y7oa6kp8rooQ==
X-Google-Smtp-Source: ABdhPJwlB82uq1i51GHSblG3L2AjzRU83OyjdFDA8kkehDD7iIpo1RM6/myQR8zWKsZW+0dPZJNtJA==
X-Received: by 2002:a19:e00e:0:b0:443:127b:558d with SMTP id x14-20020a19e00e000000b00443127b558dmr517581lfg.396.1645638824480;
        Wed, 23 Feb 2022 09:53:44 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o22sm15411lfr.92.2022.02.23.09.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 09:53:43 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Heungjun Kim <riverful.kim@samsung.com>
Subject: [PATCH] media: m5mols: Convert to use GPIO descriptors
Date:   Wed, 23 Feb 2022 18:51:41 +0100
Message-Id: <20220223175141.133500-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The Fujitsu M5MOLS sensor driver is using a reset GPIO number
passed from platform data.

No machine/board descriptor file in the kernel is using this so
let's replace it with a GPIO descriptor.

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Heungjun Kim <riverful.kim@samsung.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/m5mols/m5mols.h         |  2 ++
 drivers/media/i2c/m5mols/m5mols_capture.c |  1 -
 drivers/media/i2c/m5mols/m5mols_core.c    | 29 ++++++++---------------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/m5mols/m5mols.h b/drivers/media/i2c/m5mols/m5mols.h
index 60c102fa7df5..b56eb0a8ee97 100644
--- a/drivers/media/i2c/m5mols/m5mols.h
+++ b/drivers/media/i2c/m5mols/m5mols.h
@@ -13,6 +13,7 @@
 #define M5MOLS_H
 
 #include <linux/sizes.h>
+#include <linux/gpio/consumer.h>
 #include <media/v4l2-subdev.h>
 #include "m5mols_reg.h"
 
@@ -224,6 +225,7 @@ struct m5mols_info {
 	struct v4l2_ctrl *jpeg_quality;
 
 	int (*set_power)(struct device *dev, int on);
+	struct gpio_desc *reset;
 
 	struct mutex lock;
 
diff --git a/drivers/media/i2c/m5mols/m5mols_capture.c b/drivers/media/i2c/m5mols/m5mols_capture.c
index e1b1d689c044..275c5b2539fd 100644
--- a/drivers/media/i2c/m5mols/m5mols_capture.c
+++ b/drivers/media/i2c/m5mols/m5mols_capture.c
@@ -15,7 +15,6 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-ctrls.h>
diff --git a/drivers/media/i2c/m5mols/m5mols_core.c b/drivers/media/i2c/m5mols/m5mols_core.c
index e29be0242f07..c19590389bfe 100644
--- a/drivers/media/i2c/m5mols/m5mols_core.c
+++ b/drivers/media/i2c/m5mols/m5mols_core.c
@@ -14,7 +14,7 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <linux/module.h>
@@ -752,7 +752,6 @@ static int m5mols_sensor_power(struct m5mols_info *info, bool enable)
 {
 	struct v4l2_subdev *sd = &info->sd;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	const struct m5mols_platform_data *pdata = info->pdata;
 	int ret;
 
 	if (info->power == enable)
@@ -772,7 +771,7 @@ static int m5mols_sensor_power(struct m5mols_info *info, bool enable)
 			return ret;
 		}
 
-		gpio_set_value(pdata->gpio_reset, !pdata->reset_polarity);
+		gpiod_set_value(info->reset, 0);
 		info->power = 1;
 
 		return ret;
@@ -785,7 +784,7 @@ static int m5mols_sensor_power(struct m5mols_info *info, bool enable)
 	if (info->set_power)
 		info->set_power(&client->dev, 0);
 
-	gpio_set_value(pdata->gpio_reset, pdata->reset_polarity);
+	gpiod_set_value(info->reset, 1);
 
 	info->isp_ready = 0;
 	info->power = 0;
@@ -944,7 +943,6 @@ static int m5mols_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	const struct m5mols_platform_data *pdata = client->dev.platform_data;
-	unsigned long gpio_flags;
 	struct m5mols_info *info;
 	struct v4l2_subdev *sd;
 	int ret;
@@ -954,11 +952,6 @@ static int m5mols_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	if (!gpio_is_valid(pdata->gpio_reset)) {
-		dev_err(&client->dev, "No valid RESET GPIO specified\n");
-		return -EINVAL;
-	}
-
 	if (!client->irq) {
 		dev_err(&client->dev, "Interrupt not assigned\n");
 		return -EINVAL;
@@ -968,18 +961,16 @@ static int m5mols_probe(struct i2c_client *client,
 	if (!info)
 		return -ENOMEM;
 
+	/* This asserts reset, descriptor shall have polarity specified */
+	info->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(info->reset))
+		return PTR_ERR(info->reset);
+	/* Notice: the "N" in M5MOLS_NRST implies active low */
+	gpiod_set_consumer_name(info->reset, "M5MOLS_NRST");
+
 	info->pdata = pdata;
 	info->set_power	= pdata->set_power;
 
-	gpio_flags = pdata->reset_polarity
-		   ? GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
-	ret = devm_gpio_request_one(&client->dev, pdata->gpio_reset, gpio_flags,
-				    "M5MOLS_NRST");
-	if (ret) {
-		dev_err(&client->dev, "Failed to request gpio: %d\n", ret);
-		return ret;
-	}
-
 	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(supplies),
 				      supplies);
 	if (ret) {
-- 
2.34.1

