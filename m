Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFEEA4C2086
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 01:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245227AbiBXAPk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 19:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239973AbiBXAPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 19:15:40 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1512C606E4
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 16:15:11 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bu29so1197884lfb.0
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6KKtujxsxL700PImDkEYgIHj9SiLuwrELF/sr6rBEwU=;
        b=tU7BGBWWMzBJ5iP3qPO/fXlNDe60OUt/Tj1B73Wfe76v+4hLVa5QX6mIN7tXnTK6FL
         RPBct347NnxuT1VpNpDzp8WX1PVh3tpq19Zpd+/IvFiHNzcpCpNWzA6g3AtxssZXWUff
         7ApDLQay0i4Sj6ygXWup1xIcqkkazXLYs9t8Ip2WdW0GugMWD3xsjxA4v5a1s6xkprMN
         R9cyvZY8B6Bmam1UNu+yVzsklkQiFLehRn+kxkFvt/UU06m7JuWoXAdIHyhril4ItZim
         6iyE75cBJeaK4JQhhWTIjjTV9lokfro8/OOA5Aqqhr8Sfv45Mqd3agZ99LDMrC/cXKEW
         q2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6KKtujxsxL700PImDkEYgIHj9SiLuwrELF/sr6rBEwU=;
        b=bRP78oemsdBATsnCpwxv3uuebCe79InzmUhSHV/QUJzYBtyAQUYMEYHziKNWheGGCe
         +wfN/8UFmWMRkiyzy0ATz2s1EawzWzfKUkQ5lmgIQg6rd+1C+sariN28xw9N7cbdywo6
         E1qsOBYAK35bNNr4X+U6YeAbI7TsZkf6Cd0EZx7ivcCB51nuPu5aSvC+ys5BrDOhrUly
         T3NKWIIPeBpFndnC3Ie/vYb0HEx3pJKVY+iFL2zg+wGpizKl0a5tZ83nAOwIFPYVoytr
         9AJBjN/1EDd5GSzfn/Kop62xS0jcgWDQPmwoGbljZ737YKNklTDoqjPSi3lb2isbytMW
         vPoQ==
X-Gm-Message-State: AOAM531k38HCsqCK5AXczQ0zYN1T2J8sEhKUPDvS6wz+1zxVUDMR6c0J
        rw1QYXkzJczjG1CZhfAD/ML59w==
X-Google-Smtp-Source: ABdhPJwWLOJ1uOgsCD/rN9KOdvDQwwUxuo72QYHrUTSBPtX+BjbsUncF+FXhS0bdz1cdvSxwmzGBew==
X-Received: by 2002:a05:6512:3403:b0:440:c021:950b with SMTP id i3-20020a056512340300b00440c021950bmr163093lfr.330.1645661709425;
        Wed, 23 Feb 2022 16:15:09 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z3sm76596lfd.110.2022.02.23.16.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 16:15:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Heungjun Kim <riverful.kim@samsung.com>
Subject: [PATCH v2] media: m5mols: Convert to use GPIO descriptors
Date:   Thu, 24 Feb 2022 01:13:07 +0100
Message-Id: <20220224001307.148851-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Also delete the platform data entries that are no longer
  in use.
---
 drivers/media/i2c/m5mols/m5mols.h         |  2 ++
 drivers/media/i2c/m5mols/m5mols_capture.c |  1 -
 drivers/media/i2c/m5mols/m5mols_core.c    | 29 ++++++++---------------
 include/media/i2c/m5mols.h                |  4 ----
 4 files changed, 12 insertions(+), 24 deletions(-)

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
diff --git a/include/media/i2c/m5mols.h b/include/media/i2c/m5mols.h
index 9cec5a09e125..a56ae353c891 100644
--- a/include/media/i2c/m5mols.h
+++ b/include/media/i2c/m5mols.h
@@ -14,15 +14,11 @@
 
 /**
  * struct m5mols_platform_data - platform data for M-5MOLS driver
- * @gpio_reset:	GPIO driving the reset pin of M-5MOLS
- * @reset_polarity: active state for gpio_reset pin, 0 or 1
  * @set_power:	an additional callback to the board setup code
  *		to be called after enabling and before disabling
  *		the sensor's supply regulators
  */
 struct m5mols_platform_data {
-	int gpio_reset;
-	u8 reset_polarity;
 	int (*set_power)(struct device *dev, int on);
 };
 
-- 
2.34.1

