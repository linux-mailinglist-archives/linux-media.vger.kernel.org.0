Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B884C207F
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 01:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245210AbiBXAOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 19:14:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240912AbiBXAOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 19:14:02 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6396006E
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 16:13:33 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id bn33so570049ljb.6
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 16:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AI2mJP6yVV3BI3vkbKJ9/LR0nYIb/5UcKSXcm2Sf0hc=;
        b=XSzrgRux04wvwaklFv4rXdDP4SZagUJ1p0RqczTp72SOvxOCJXwKPMifHglrNk/3EJ
         1jn85R6Gy6WZQqrT6ZUfbgy0seUQHWx9sdtSAcOSTiz7SPs1+GZn4RwERennBankEWo0
         liv6vVqjDEBcTGNooJAPnEllDhHEsb7qW014pcYYpmXqIh5EiF0Is4yrGeiItXQK775g
         n6CJ2C2WcYSf40LURcP+aihMOfanRlm72jMa1FYlAfVREqrVnEnIyIobhDeEvKSYMMhZ
         Uf0Gs0cofAA1ETkCq3bDrJFCNagvw96FWSEv14qyt9Hemz+YthRoNEKH3CMVzbwl25r3
         Ol3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AI2mJP6yVV3BI3vkbKJ9/LR0nYIb/5UcKSXcm2Sf0hc=;
        b=LANhv1GBV8r75T7ifyCybWeJCsiYpNQ65tWwAc5GpLmxFaM2138AvjqdHZ58f7alVP
         brjYNAmfcAijBWO4CGcEHf93KPBeDkHdVwYrcRc7/rAA4ij+QTXxWYXlwm/ZoVo1nD1F
         v9dcxzQRlAYvuwjVRcabZevINP+8E5HPvsxXDSDz+hbW+gaU2E7G0pPHq5IILEo3BNYg
         mIII+DwAbTtba7bLMXYGzP+t2L9LvpsFvpRLMe2wfieRS6JKzvqx3lsFdprkFaUD+b05
         5AmaCvmxw1LSiKKu9LYwzJvZuJgYA4W9aBfcF+5xtPZrKUlkAh77jDTjOh8Ow5rZkJAJ
         TtOA==
X-Gm-Message-State: AOAM530fIREbuEIq0rYO0gsbCqJtXRSFZ0F8Pw2/Xee1vFGWFxMzszS/
        u4FnGBEwy97KHuAqKOj8iR66nQ==
X-Google-Smtp-Source: ABdhPJwCE8To9+eaiGLwVRD87funz4qKr25WsDKospCrhWrjBJoMuWC7RIKGoI7yeD0vx8xqwnoN8g==
X-Received: by 2002:a05:651c:1028:b0:246:468b:dc3d with SMTP id w8-20020a05651c102800b00246468bdc3dmr93446ljm.438.1645661611928;
        Wed, 23 Feb 2022 16:13:31 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id t18sm52391lfq.2.2022.02.23.16.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 16:13:31 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: noon010p30: Convert to use GPIO descriptors
Date:   Thu, 24 Feb 2022 01:11:29 +0100
Message-Id: <20220224001129.148465-1-linus.walleij@linaro.org>
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

The noon010pc30 sensor driver is using legacy gpio numbers passed
through platform data and open coding reverse polarity on the
GPIOs used for reset and standby.

Nothing in the kernel defines any platform data for this driver
so we can just convert the driver to use GPIO descriptors and
requires that these specify the correct polarity instead.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/i2c/noon010pc30.c | 75 +++++++++++++++------------------
 include/media/i2c/noon010pc30.h |  4 --
 2 files changed, 35 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/noon010pc30.c b/drivers/media/i2c/noon010pc30.c
index f3ac379ef34a..bc5187f46365 100644
--- a/drivers/media/i2c/noon010pc30.c
+++ b/drivers/media/i2c/noon010pc30.c
@@ -10,7 +10,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
@@ -130,8 +130,8 @@ struct noon010_info {
 	struct media_pad pad;
 	struct v4l2_ctrl_handler hdl;
 	struct regulator_bulk_data supply[NOON010_NUM_SUPPLIES];
-	u32 gpio_nreset;
-	u32 gpio_nstby;
+	struct gpio_desc *reset;
+	struct gpio_desc *stby;
 
 	/* Protects the struct members below */
 	struct mutex lock;
@@ -393,29 +393,33 @@ static int power_enable(struct noon010_info *info)
 		return 0;
 	}
 
-	if (gpio_is_valid(info->gpio_nstby))
-		gpio_set_value(info->gpio_nstby, 0);
+	/* Assert standby: line should be flagged active low in descriptor */
+	if (info->stby)
+		gpiod_set_value(info->stby, 1);
 
-	if (gpio_is_valid(info->gpio_nreset))
-		gpio_set_value(info->gpio_nreset, 0);
+	/* Assert reset: line should be flagged active low in descriptor */
+	if (info->reset)
+		gpiod_set_value(info->reset, 1);
 
 	ret = regulator_bulk_enable(NOON010_NUM_SUPPLIES, info->supply);
 	if (ret)
 		return ret;
 
-	if (gpio_is_valid(info->gpio_nreset)) {
+	/* De-assert reset and standby */
+	if (info->reset) {
 		msleep(50);
-		gpio_set_value(info->gpio_nreset, 1);
+		gpiod_set_value(info->reset, 0);
 	}
-	if (gpio_is_valid(info->gpio_nstby)) {
+	if (info->stby) {
 		udelay(1000);
-		gpio_set_value(info->gpio_nstby, 1);
+		gpiod_set_value(info->stby, 0);
 	}
-	if (gpio_is_valid(info->gpio_nreset)) {
+	/* Cycle reset: assert and deassert */
+	if (info->reset) {
 		udelay(1000);
-		gpio_set_value(info->gpio_nreset, 0);
+		gpiod_set_value(info->reset, 1);
 		msleep(100);
-		gpio_set_value(info->gpio_nreset, 1);
+		gpiod_set_value(info->reset, 0);
 		msleep(20);
 	}
 	info->power = 1;
@@ -438,11 +442,12 @@ static int power_disable(struct noon010_info *info)
 	if (ret)
 		return ret;
 
-	if (gpio_is_valid(info->gpio_nstby))
-		gpio_set_value(info->gpio_nstby, 0);
+	/* Assert standby and reset */
+	if (info->stby)
+		gpiod_set_value(info->stby, 1);
 
-	if (gpio_is_valid(info->gpio_nreset))
-		gpio_set_value(info->gpio_nreset, 0);
+	if (info->reset)
+		gpiod_set_value(info->reset, 1);
 
 	info->power = 0;
 
@@ -741,34 +746,24 @@ static int noon010_probe(struct i2c_client *client,
 		goto np_err;
 
 	info->i2c_reg_page	= -1;
-	info->gpio_nreset	= -EINVAL;
-	info->gpio_nstby	= -EINVAL;
 	info->curr_fmt		= &noon010_formats[0];
 	info->curr_win		= &noon010_sizes[0];
 
-	if (gpio_is_valid(pdata->gpio_nreset)) {
-		ret = devm_gpio_request_one(&client->dev, pdata->gpio_nreset,
-					    GPIOF_OUT_INIT_LOW,
-					    "NOON010PC30 NRST");
-		if (ret) {
-			dev_err(&client->dev, "GPIO request error: %d\n", ret);
-			goto np_err;
-		}
-		info->gpio_nreset = pdata->gpio_nreset;
-		gpio_export(info->gpio_nreset, 0);
+	/* Request reset asserted so we get put into reset */
+	info->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(info->reset)) {
+		ret = PTR_ERR(info->reset);
+		goto np_err;
 	}
+	gpiod_set_consumer_name(info->reset, "NOON010PC30 NRST");
 
-	if (gpio_is_valid(pdata->gpio_nstby)) {
-		ret = devm_gpio_request_one(&client->dev, pdata->gpio_nstby,
-					    GPIOF_OUT_INIT_LOW,
-					    "NOON010PC30 NSTBY");
-		if (ret) {
-			dev_err(&client->dev, "GPIO request error: %d\n", ret);
-			goto np_err;
-		}
-		info->gpio_nstby = pdata->gpio_nstby;
-		gpio_export(info->gpio_nstby, 0);
+	/* Request standby asserted so we get put into standby */
+	info->stby = devm_gpiod_get(&client->dev, "standby", GPIOD_OUT_HIGH);
+	if (IS_ERR(info->stby)) {
+		ret = PTR_ERR(info->stby);
+		goto np_err;
 	}
+	gpiod_set_consumer_name(info->reset, "NOON010PC30 STBY");
 
 	for (i = 0; i < NOON010_NUM_SUPPLIES; i++)
 		info->supply[i].supply = noon010_supply_name[i];
diff --git a/include/media/i2c/noon010pc30.h b/include/media/i2c/noon010pc30.h
index d1b2e06a1de0..1880dad25cf0 100644
--- a/include/media/i2c/noon010pc30.h
+++ b/include/media/i2c/noon010pc30.h
@@ -12,14 +12,10 @@
 /**
  * struct noon010pc30_platform_data - platform data
  * @clk_rate: the clock frequency in Hz
- * @gpio_nreset: GPIO driving nRESET pin
- * @gpio_nstby: GPIO driving nSTBY pin
  */
 
 struct noon010pc30_platform_data {
 	unsigned long clk_rate;
-	int gpio_nreset;
-	int gpio_nstby;
 };
 
 #endif /* NOON010PC30_H */
-- 
2.34.1

