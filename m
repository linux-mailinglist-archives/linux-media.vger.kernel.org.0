Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E85621D4B
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 20:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiKHTxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 14:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKHTxl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 14:53:41 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A67D2F2
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 11:53:40 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bp15so22626494lfb.13
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HoBq6Hvf2dp7dBWu2zL/Py/hW67y5W/BzXnE8boyxxw=;
        b=A+Swjg9tPYutSi2I6j3R6OA0m3hkk0LL2X6EECsL/PV9gvxnlw082Io2feiw1L5YYb
         zPv1wQ37IkNF7rxPqYp7zREkAXeHjYjybnSTpyKvwMLRSdL27lKbdG6mslHvizBPCTdT
         l1T4FhqN7P4K2pQVePF5AptHCtWyMvr+3hThKxESZgDa3Rtl5eDkNz8cDK2ZngA8zx1B
         vDUOcjx9brDmDlyl57jf+NXFZ6slaFEGmzqIPekxriJdoIyh2Gm6WTZURdrOy4EWS0Jf
         oMuXdMIPm6G9jZysLU9lkrdCGgeqXANzXNUivwO1KHLSXCeNgAvkOUQ4KS3Tmc5qloSH
         E8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoBq6Hvf2dp7dBWu2zL/Py/hW67y5W/BzXnE8boyxxw=;
        b=ngnIwOlo79IFwp/nEDBEXAqttBHyNGRNrlRTb389IRN1HVmhnifMoFK6OsuBH6narB
         7YXga+SYMTUtClnEf0B83qIzWJyoSUcuQF2LbuDr0thldHE87r1XakSbt2dZK1/ZkuFD
         xj49USlO/LN5E2h3ErZBiCtRcVodjzGwXmqDLXT9ZultldXT9lVNQbHeKmr97u/5vgxH
         3QfTxsZlfJHV3EG7S72RBy0dqqxabUurAGFKX3W0uV1MDRx28lQtnT812DFaVY40hhMB
         u/DRwh7CzlrzSrf1oMYX4e2DbfVF5NfBa5tGsPmiDxWrepJry5m/EcxWzc2ArcfrMkD0
         P0/Q==
X-Gm-Message-State: ACrzQf0pyvgBEm+E65HBKVAGwQw+L4O+fnmdD54ygOL3Yu7EJ8+lglg1
        D5nFfhpl1jBipE3bUEY8dMn4Jg==
X-Google-Smtp-Source: AMsMyM4Q84cjunggwA0YAPjFQ/sMGGS4nox7uKJejeCtFnlYsDuUnimbtgIrFGLc+QRZ57Cd0UvfpA==
X-Received: by 2002:ac2:48ad:0:b0:4b1:3030:8e92 with SMTP id u13-20020ac248ad000000b004b130308e92mr12788506lfg.87.1667937218377;
        Tue, 08 Nov 2022 11:53:38 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id n12-20020a2e720c000000b0026bca725cd0sm1828059ljc.39.2022.11.08.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 11:53:37 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH 1/2 v8] media: s5k4ecgx: Switch to GPIO descriptors
Date:   Tue,  8 Nov 2022 20:53:27 +0100
Message-Id: <20221108195329.1827323-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
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

The driver has an option to pass in GPIO numbers from platform
data but this is not used in the kernel so delete this and the
whole platform data mechanism.

Get GPIO descriptors using the standard API and simplify the code,
gpiolib will handle any inversions.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v7->v8:
- Resend with a patch deleting the driver.
ChangeLog v6->v7:
- Fix copy/paste error.
ChangeLog v5->v6:
- Drop some self-evident comments.
- Use dev_err_probe()
- Collect Andrzej's Review tag.
ChangeLog v4->v5:
- Rebase on v6.1-rc1
ChangeLog v3->v4:
- Collect Tommaso's Review tag
- Rebase on v6.0-rc1
ChangeLog v2->v3:
- COMMIT and send out what is actually in my tree (and
  compiling).
ChangeLog v1->v2:
- Fix compile bug by sending out the patch actually in my
  git tree.
---
 drivers/media/i2c/s5k4ecgx.c | 127 +++++++----------------------------
 include/media/i2c/s5k4ecgx.h |  33 ---------
 2 files changed, 25 insertions(+), 135 deletions(-)
 delete mode 100644 include/media/i2c/s5k4ecgx.h

diff --git a/drivers/media/i2c/s5k4ecgx.c b/drivers/media/i2c/s5k4ecgx.c
index 3dddcd9dd351..45bfc2cd4845 100644
--- a/drivers/media/i2c/s5k4ecgx.c
+++ b/drivers/media/i2c/s5k4ecgx.c
@@ -15,7 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
@@ -23,7 +23,6 @@
 #include <asm/unaligned.h>
 
 #include <media/media-entity.h>
-#include <media/i2c/s5k4ecgx.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mediabus.h>
@@ -171,12 +170,6 @@ static const char * const s5k4ecgx_supply_names[] = {
 
 #define S5K4ECGX_NUM_SUPPLIES ARRAY_SIZE(s5k4ecgx_supply_names)
 
-enum s5k4ecgx_gpio_id {
-	STBY,
-	RSET,
-	GPIO_NUM,
-};
-
 struct s5k4ecgx {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -190,7 +183,8 @@ struct s5k4ecgx {
 	u8 set_params;
 
 	struct regulator_bulk_data supplies[S5K4ECGX_NUM_SUPPLIES];
-	struct s5k4ecgx_gpio gpio[GPIO_NUM];
+	struct gpio_desc *stby;
+	struct gpio_desc *reset;
 };
 
 static inline struct s5k4ecgx *to_s5k4ecgx(struct v4l2_subdev *sd)
@@ -454,15 +448,6 @@ static int s5k4ecgx_init_sensor(struct v4l2_subdev *sd)
 	return ret;
 }
 
-static int s5k4ecgx_gpio_set_value(struct s5k4ecgx *priv, int id, u32 val)
-{
-	if (!gpio_is_valid(priv->gpio[id].gpio))
-		return 0;
-	gpio_set_value(priv->gpio[id].gpio, val);
-
-	return 1;
-}
-
 static int __s5k4ecgx_power_on(struct s5k4ecgx *priv)
 {
 	int ret;
@@ -472,23 +457,20 @@ static int __s5k4ecgx_power_on(struct s5k4ecgx *priv)
 		return ret;
 	usleep_range(30, 50);
 
-	/* The polarity of STBY is controlled by TSP */
-	if (s5k4ecgx_gpio_set_value(priv, STBY, priv->gpio[STBY].level))
-		usleep_range(30, 50);
-
-	if (s5k4ecgx_gpio_set_value(priv, RSET, priv->gpio[RSET].level))
-		usleep_range(30, 50);
+	gpiod_set_value(priv->stby, 0);
+	usleep_range(30, 50);
+	gpiod_set_value(priv->reset, 0);
+	usleep_range(30, 50);
 
 	return 0;
 }
 
 static int __s5k4ecgx_power_off(struct s5k4ecgx *priv)
 {
-	if (s5k4ecgx_gpio_set_value(priv, RSET, !priv->gpio[RSET].level))
-		usleep_range(30, 50);
-
-	if (s5k4ecgx_gpio_set_value(priv, STBY, !priv->gpio[STBY].level))
-		usleep_range(30, 50);
+	gpiod_set_value(priv->reset, 1);
+	usleep_range(30, 50);
+	gpiod_set_value(priv->stby, 1);
+	usleep_range(30, 50);
 
 	priv->streaming = 0;
 
@@ -840,68 +822,6 @@ static const struct v4l2_subdev_ops s5k4ecgx_ops = {
 	.video = &s5k4ecgx_video_ops,
 };
 
-/*
- * GPIO setup
- */
-static int s5k4ecgx_config_gpio(int nr, int val, const char *name)
-{
-	unsigned long flags = val ? GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
-	int ret;
-
-	if (!gpio_is_valid(nr))
-		return 0;
-	ret = gpio_request_one(nr, flags, name);
-	if (!ret)
-		gpio_export(nr, 0);
-
-	return ret;
-}
-
-static void s5k4ecgx_free_gpios(struct s5k4ecgx *priv)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(priv->gpio); i++) {
-		if (!gpio_is_valid(priv->gpio[i].gpio))
-			continue;
-		gpio_free(priv->gpio[i].gpio);
-		priv->gpio[i].gpio = -EINVAL;
-	}
-}
-
-static int s5k4ecgx_config_gpios(struct s5k4ecgx *priv,
-				  const struct s5k4ecgx_platform_data *pdata)
-{
-	const struct s5k4ecgx_gpio *gpio = &pdata->gpio_stby;
-	int ret;
-
-	priv->gpio[STBY].gpio = -EINVAL;
-	priv->gpio[RSET].gpio  = -EINVAL;
-
-	ret = s5k4ecgx_config_gpio(gpio->gpio, gpio->level, "S5K4ECGX_STBY");
-
-	if (ret) {
-		s5k4ecgx_free_gpios(priv);
-		return ret;
-	}
-	priv->gpio[STBY] = *gpio;
-	if (gpio_is_valid(gpio->gpio))
-		gpio_set_value(gpio->gpio, 0);
-
-	gpio = &pdata->gpio_reset;
-
-	ret = s5k4ecgx_config_gpio(gpio->gpio, gpio->level, "S5K4ECGX_RST");
-	if (ret) {
-		s5k4ecgx_free_gpios(priv);
-		return ret;
-	}
-	priv->gpio[RSET] = *gpio;
-	if (gpio_is_valid(gpio->gpio))
-		gpio_set_value(gpio->gpio, 0);
-
-	return 0;
-}
-
 static int s5k4ecgx_init_v4l2_ctrls(struct s5k4ecgx *priv)
 {
 	const struct v4l2_ctrl_ops *ops = &s5k4ecgx_ctrl_ops;
@@ -965,11 +885,17 @@ static int s5k4ecgx_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = s5k4ecgx_config_gpios(priv, pdata);
-	if (ret) {
-		dev_err(&client->dev, "Failed to set gpios\n");
-		goto out_err1;
-	}
+	priv->stby = devm_gpiod_get(&client->dev, "standby", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->stby))
+		dev_err_probe(&client->dev, PTR_ERR(priv->stby),
+			      "failed to request gpio S5K4ECGX_STBY\n");
+	gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY");
+	priv->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		dev_err_probe(&client->dev, PTR_ERR(priv->reset),
+			      "failed to request gpio S5K4ECGX_RST\n");
+	gpiod_set_consumer_name(priv->reset, "S5K4ECGX_RST");
+
 	for (i = 0; i < S5K4ECGX_NUM_SUPPLIES; i++)
 		priv->supplies[i].supply = s5k4ecgx_supply_names[i];
 
@@ -977,20 +903,18 @@ static int s5k4ecgx_probe(struct i2c_client *client,
 				 priv->supplies);
 	if (ret) {
 		dev_err(&client->dev, "Failed to get regulators\n");
-		goto out_err2;
+		goto out_err;
 	}
 	ret = s5k4ecgx_init_v4l2_ctrls(priv);
 	if (ret)
-		goto out_err2;
+		goto out_err;
 
 	priv->curr_pixfmt = &s5k4ecgx_formats[0];
 	priv->curr_frmsize = &s5k4ecgx_prev_sizes[0];
 
 	return 0;
 
-out_err2:
-	s5k4ecgx_free_gpios(priv);
-out_err1:
+out_err:
 	media_entity_cleanup(&priv->sd.entity);
 
 	return ret;
@@ -1002,7 +926,6 @@ static void s5k4ecgx_remove(struct i2c_client *client)
 	struct s5k4ecgx *priv = to_s5k4ecgx(sd);
 
 	mutex_destroy(&priv->lock);
-	s5k4ecgx_free_gpios(priv);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&priv->handler);
 	media_entity_cleanup(&sd->entity);
diff --git a/include/media/i2c/s5k4ecgx.h b/include/media/i2c/s5k4ecgx.h
deleted file mode 100644
index 92202eb35249..000000000000
--- a/include/media/i2c/s5k4ecgx.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * S5K4ECGX image sensor header file
- *
- * Copyright (C) 2012, Linaro
- * Copyright (C) 2012, Samsung Electronics Co., Ltd.
- */
-
-#ifndef S5K4ECGX_H
-#define S5K4ECGX_H
-
-/**
- * struct s5k4ecgx_gpio - data structure describing a GPIO
- * @gpio: GPIO number
- * @level: indicates active state of the @gpio
- */
-struct s5k4ecgx_gpio {
-	int gpio;
-	int level;
-};
-
-/**
- * struct s5k4ecgx_platform_data - s5k4ecgx driver platform data
- * @gpio_reset:	 GPIO driving RESET pin
- * @gpio_stby:	 GPIO driving STBY pin
- */
-
-struct s5k4ecgx_platform_data {
-	struct s5k4ecgx_gpio gpio_reset;
-	struct s5k4ecgx_gpio gpio_stby;
-};
-
-#endif /* S5K4ECGX_H */
-- 
2.34.1

