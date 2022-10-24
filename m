Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD4060A004
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 13:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbiJXLPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 07:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiJXLPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 07:15:31 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179573FEC5
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:15:28 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u11so291263ljk.6
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geEB6fV3wEtS6ClYuWGPBbSqN21ssVSd8mamRsDSheM=;
        b=Eg6n60n/IeWZmARYBXZ3UA2kBl9GjKDQ2wPPeMH0m9x50UQDkv7XUBHQe5VE1kyzI9
         8SaLoYORQc+hu/1RrI1kvWurqqpQokzDnju0qipDB4eR9NVIl5LPsSyPeZoJAEAHPYzh
         OaIujSJG25qYOvpZUZq1Hu+V46MVDnmJA8IaXeC9z2F6vgQXymd+l+6A8tj5DMmQFhOd
         9kPYBCEiqPePR6g6+uI/HuQkWA2GK16IdSMmQj9aOkMbABOM9+09+N7j8BodRBOzY3ye
         cbzaVpQq5btnNrHM2Xl4nd1CozJoOYGOZlJjheDx/3LU+CjQt82EKpHtjrQ9v1UcrOyM
         lJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geEB6fV3wEtS6ClYuWGPBbSqN21ssVSd8mamRsDSheM=;
        b=xveMKzYRnzNvHaGa8HI3jRdH2EfyO2yNoEEPThR3FxCze+69d05CUGSSfl1ZiV9Jzq
         qVt+cJdm/qNkkoNjxyEUw7AekF8OWc9SZkATCT421uyfD2yEAEsCBTKQNaMBDPT+CwPY
         OKJ1m1Dt+JW6JC8ge0WQR2/1bLiNmEClz5Ro3sLXiNTqhWEzMU2j6dgSdSAv/q2nf/p2
         z1+17LKDtzzlTEsHT1lu/O0hmDbiPtrz15B5mKoE2nTIOY6V6mQRzPpVmO0wK8MERKMk
         5gbeL0ntITZKv8xbqhYEjXznk6LjDA0l0A5Qcd3me0/B+6yc/XWNywM/8A+OdJEIqghR
         fgfQ==
X-Gm-Message-State: ACrzQf3SCFmEUKAIk3U2Abu75m/0LhJE5Z56/SAJF6JQOEnN2/CHmu/c
        ek7I9voN0+RqHup+MsFefnnlzQ==
X-Google-Smtp-Source: AMsMyM64iB1h9I766HfT1pqZcz5ayi34AhWDAPGnqb4/WS3p4yTEIPAvlQgtveHrj5VEr7OTfE/euA==
X-Received: by 2002:a2e:bd86:0:b0:26d:e64e:c230 with SMTP id o6-20020a2ebd86000000b0026de64ec230mr11704383ljq.405.1666610126934;
        Mon, 24 Oct 2022 04:15:26 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id f5-20020a2e9e85000000b0026dfdcbccdasm4890211ljk.14.2022.10.24.04.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:15:26 -0700 (PDT)
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
Subject: [PATCH v5] media: s5k4ecgx: Switch to GPIO descriptors
Date:   Mon, 24 Oct 2022 13:15:23 +0200
Message-Id: <20221024111523.7289-1-linus.walleij@linaro.org>
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
Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 drivers/media/i2c/s5k4ecgx.c | 132 ++++++++---------------------------
 include/media/i2c/s5k4ecgx.h |  33 ---------
 2 files changed, 31 insertions(+), 134 deletions(-)
 delete mode 100644 include/media/i2c/s5k4ecgx.h

diff --git a/drivers/media/i2c/s5k4ecgx.c b/drivers/media/i2c/s5k4ecgx.c
index 3dddcd9dd351..24caaed30b2c 100644
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
@@ -472,23 +457,22 @@ static int __s5k4ecgx_power_on(struct s5k4ecgx *priv)
 		return ret;
 	usleep_range(30, 50);
 
-	/* The polarity of STBY is controlled by TSP */
-	if (s5k4ecgx_gpio_set_value(priv, STBY, priv->gpio[STBY].level))
-		usleep_range(30, 50);
-
-	if (s5k4ecgx_gpio_set_value(priv, RSET, priv->gpio[RSET].level))
-		usleep_range(30, 50);
+	/* De-assert standby and reset */
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
+	/* Assert reset and standby */
+	gpiod_set_value(priv->reset, 1);
+	usleep_range(30, 50);
+	gpiod_set_value(priv->stby, 1);
+	usleep_range(30, 50);
 
 	priv->streaming = 0;
 
@@ -840,68 +824,6 @@ static const struct v4l2_subdev_ops s5k4ecgx_ops = {
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
@@ -965,11 +887,22 @@ static int s5k4ecgx_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = s5k4ecgx_config_gpios(priv, pdata);
-	if (ret) {
-		dev_err(&client->dev, "Failed to set gpios\n");
-		goto out_err1;
+	/* Request GPIO lines asserted */
+	priv->stby = devm_gpiod_get(&client->dev, "standby", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->stby)) {
+		v4l2_err(sd, "failed to request gpio S5K4ECGX_STBY");
+		ret = PTR_ERR(priv->stby);
+		goto out_err;
+	}
+	gpiod_set_consumer_name(priv->stby, "S5K4ECGX_STBY");
+	priv->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset)) {
+		v4l2_err(sd, "failed to request gpio S5K4ECGX_RST");
+		ret = PTR_ERR(priv->reset);
+		goto out_err;
 	}
+	gpiod_set_consumer_name(priv->reset, "S5K4ECGX_RST");
+
 	for (i = 0; i < S5K4ECGX_NUM_SUPPLIES; i++)
 		priv->supplies[i].supply = s5k4ecgx_supply_names[i];
 
@@ -977,20 +910,18 @@ static int s5k4ecgx_probe(struct i2c_client *client,
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
@@ -1002,7 +933,6 @@ static void s5k4ecgx_remove(struct i2c_client *client)
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

