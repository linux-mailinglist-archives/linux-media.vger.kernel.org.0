Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0B13609FFD
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 13:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiJXLOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 07:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiJXLNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 07:13:47 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58FF558F6
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:13:41 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b18so12230030ljr.13
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQBhMfU9yAtMBMLsn5TqDPcK0uuy56RHbwQClF+P3Xw=;
        b=tE6AcGD5HnQE9c6x6CQkkdicNOKjhu51CT9+dhLOeWcAXlIk5Fiy0E6X3LAbpBr3yK
         9/YecfRlYtfiNLEXdibP2t/AWbn23KCqZCh1vdNrFox0vfwsOoIFCiVk2ePJZlBcPund
         gTqWM8H31RUFuPkwa3vGQLWOL+l5tB5+q3XQHevOOn5cS/X//TGBmvraB2xcG3JBpGVE
         +t/vrdeJRjIFYI2eJhgNVDQOq2iTu/eB2pIo5f8w3DUnR8azrlW03NwSstGlYQlW1iIF
         UWHkj7Wxjqd+LgdMHviTzhB66P7FadWzNFkllXHSN3z0RCravY63jZgMKAX15/zB057/
         GuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQBhMfU9yAtMBMLsn5TqDPcK0uuy56RHbwQClF+P3Xw=;
        b=4AkMevqLw2vZi3qgBi8JOi6u+YAotrPdqL3jU0RewMdRqmnGjluWgkVM/O8s43xyb2
         l2n494TNUES/AiXbN6B4RerfG6gSb/M3HwAAxrrnEw8jKB5P0zENR671dPCiDfQ5TnNX
         Q1tNHmqCinPa35GBOZmBHmibaG6MzlzqaArpch1L9syg3b7oVaMoP281Z1ao/BPylJZu
         bwzncCqF3AD/pRfw51gw1Yx4MwKcf+Ns1cNi1JyFzUIl2rusZipkAbwqXRS1rmor6AVS
         Z87jkPRWaLovRxJbKZdDbB+WUAO2+Wf4jVuhfAyOIrSlkxVJfrTX1TKlqBdOfctbNUF8
         P6sw==
X-Gm-Message-State: ACrzQf3J87WgpKcOA9Hb4BypH6admzMlmorpPOPJkXbvytPSGkbKRDhP
        2Z+X+NEztKC39YYnTo0KXVEZv0oYaDJ9Cg==
X-Google-Smtp-Source: AMsMyM7oZvG9HGmzSTOSuwHqNSbHOarrC2UMcsxU2V957p7k6KdSSFfDncgJf3nRdqY5/trWAd1rWg==
X-Received: by 2002:a2e:7303:0:b0:277:c7c:9c61 with SMTP id o3-20020a2e7303000000b002770c7c9c61mr1366077ljc.274.1666610019556;
        Mon, 24 Oct 2022 04:13:39 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id t28-20020a05651c205c00b0026e02eb613csm4889676ljo.18.2022.10.24.04.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:13:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] media: s5c73m3: Switch to GPIO descriptors
Date:   Mon, 24 Oct 2022 13:13:34 +0200
Message-Id: <20221024111334.7207-1-linus.walleij@linaro.org>
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
data but this is not used in the kernel so delete this. Get
GPIO descriptors using the standard API and simplify the code,
gpiolib will handle any inversions.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebase on v6.1-rc1
ChangeLog v1->v2:
- Collect Krzysztof's ACK
- Rebase on v6.0-rc1
---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c  | 116 ++++++----------------
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c |   1 -
 drivers/media/i2c/s5c73m3/s5c73m3.h       |  10 +-
 include/media/i2c/s5c73m3.h               |  15 ---
 4 files changed, 32 insertions(+), 110 deletions(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index d96ba58ce1e5..3319ef865bb3 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -10,12 +10,11 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/media.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sizes.h>
@@ -1347,24 +1346,6 @@ static int s5c73m3_oif_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	return 0;
 }
 
-static int s5c73m3_gpio_set_value(struct s5c73m3 *priv, int id, u32 val)
-{
-	if (!gpio_is_valid(priv->gpio[id].gpio))
-		return 0;
-	gpio_set_value(priv->gpio[id].gpio, !!val);
-	return 1;
-}
-
-static int s5c73m3_gpio_assert(struct s5c73m3 *priv, int id)
-{
-	return s5c73m3_gpio_set_value(priv, id, priv->gpio[id].level);
-}
-
-static int s5c73m3_gpio_deassert(struct s5c73m3 *priv, int id)
-{
-	return s5c73m3_gpio_set_value(priv, id, !priv->gpio[id].level);
-}
-
 static int __s5c73m3_power_on(struct s5c73m3 *state)
 {
 	int i, ret;
@@ -1386,10 +1367,12 @@ static int __s5c73m3_power_on(struct s5c73m3 *state)
 	v4l2_dbg(1, s5c73m3_dbg, &state->oif_sd, "clock frequency: %ld\n",
 					clk_get_rate(state->clock));
 
-	s5c73m3_gpio_deassert(state, STBY);
+	/*
+	 * Deassert standby and reset GPIO lines, gpiolib will handle inversion
+	 */
+	gpiod_set_value(state->stby, 0);
 	usleep_range(100, 200);
-
-	s5c73m3_gpio_deassert(state, RSET);
+	gpiod_set_value(state->reset, 0);
 	usleep_range(50, 100);
 
 	return 0;
@@ -1404,11 +1387,14 @@ static int __s5c73m3_power_off(struct s5c73m3 *state)
 {
 	int i, ret;
 
-	if (s5c73m3_gpio_assert(state, RSET))
-		usleep_range(10, 50);
-
-	if (s5c73m3_gpio_assert(state, STBY))
-		usleep_range(100, 200);
+	/*
+	 * Assert reset and then standby GPIO lines, gpiolib will handle
+	 * inversion.
+	 */
+	gpiod_set_value(state->reset, 1);
+	usleep_range(10, 50);
+	gpiod_set_value(state->stby, 1);
+	usleep_range(100, 200);
 
 	clk_disable_unprepare(state->clock);
 
@@ -1543,58 +1529,10 @@ static const struct v4l2_subdev_ops oif_subdev_ops = {
 	.video	= &s5c73m3_oif_video_ops,
 };
 
-static int s5c73m3_configure_gpios(struct s5c73m3 *state)
-{
-	static const char * const gpio_names[] = {
-		"S5C73M3_STBY", "S5C73M3_RST"
-	};
-	struct i2c_client *c = state->i2c_client;
-	struct s5c73m3_gpio *g = state->gpio;
-	int ret, i;
-
-	for (i = 0; i < GPIO_NUM; ++i) {
-		unsigned int flags = GPIOF_DIR_OUT;
-		if (g[i].level)
-			flags |= GPIOF_INIT_HIGH;
-		ret = devm_gpio_request_one(&c->dev, g[i].gpio, flags,
-					    gpio_names[i]);
-		if (ret) {
-			v4l2_err(c, "failed to request gpio %s\n",
-				 gpio_names[i]);
-			return ret;
-		}
-	}
-	return 0;
-}
-
-static int s5c73m3_parse_gpios(struct s5c73m3 *state)
-{
-	static const char * const prop_names[] = {
-		"standby-gpios", "xshutdown-gpios",
-	};
-	struct device *dev = &state->i2c_client->dev;
-	struct device_node *node = dev->of_node;
-	int ret, i;
-
-	for (i = 0; i < GPIO_NUM; ++i) {
-		enum of_gpio_flags of_flags;
-
-		ret = of_get_named_gpio_flags(node, prop_names[i],
-					      0, &of_flags);
-		if (ret < 0) {
-			dev_err(dev, "failed to parse %s DT property\n",
-				prop_names[i]);
-			return -EINVAL;
-		}
-		state->gpio[i].gpio = ret;
-		state->gpio[i].level = !(of_flags & OF_GPIO_ACTIVE_LOW);
-	}
-	return 0;
-}
-
 static int s5c73m3_get_platform_data(struct s5c73m3 *state)
 {
-	struct device *dev = &state->i2c_client->dev;
+	struct i2c_client *c = state->i2c_client;
+	struct device *dev = &c->dev;
 	const struct s5c73m3_platform_data *pdata = dev->platform_data;
 	struct device_node *node = dev->of_node;
 	struct device_node *node_ep;
@@ -1608,8 +1546,6 @@ static int s5c73m3_get_platform_data(struct s5c73m3 *state)
 		}
 
 		state->mclk_frequency = pdata->mclk_frequency;
-		state->gpio[STBY] = pdata->gpio_stby;
-		state->gpio[RSET] = pdata->gpio_reset;
 		return 0;
 	}
 
@@ -1624,9 +1560,19 @@ static int s5c73m3_get_platform_data(struct s5c73m3 *state)
 					state->mclk_frequency);
 	}
 
-	ret = s5c73m3_parse_gpios(state);
-	if (ret < 0)
-		return -EINVAL;
+	/* Request GPIO lines asserted */
+	state->stby = devm_gpiod_get(dev, "standby", GPIOD_OUT_HIGH);
+	if (IS_ERR(state->stby)) {
+		v4l2_err(c, "failed to request gpio S5C73M3_STBY");
+		return PTR_ERR(state->stby);
+	}
+	gpiod_set_consumer_name(state->stby, "S5C73M3_STBY");
+	state->reset = devm_gpiod_get(dev, "xshutdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(state->reset)) {
+		v4l2_err(c, "failed to request gpio S5C73M3_RST");
+		return PTR_ERR(state->reset);
+	}
+	gpiod_set_consumer_name(state->reset, "S5C73M3_RST");
 
 	node_ep = of_graph_get_next_endpoint(node, NULL);
 	if (!node_ep) {
@@ -1708,10 +1654,6 @@ static int s5c73m3_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = s5c73m3_configure_gpios(state);
-	if (ret)
-		goto out_err;
-
 	for (i = 0; i < S5C73M3_MAX_SUPPLIES; i++)
 		state->supplies[i].supply = s5c73m3_supply_names[i];
 
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c b/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
index 141ad0ba7f5a..e3543ae384ed 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c
@@ -10,7 +10,6 @@
 #include <linux/sizes.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/media.h>
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3.h b/drivers/media/i2c/s5c73m3/s5c73m3.h
index c3fcfdd3ea66..1fc7df41c5ee 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3.h
+++ b/drivers/media/i2c/s5c73m3/s5c73m3.h
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
@@ -351,12 +352,6 @@ struct s5c73m3_ctrls {
 	struct v4l2_ctrl *scene_mode;
 };
 
-enum s5c73m3_gpio_id {
-	STBY,
-	RSET,
-	GPIO_NUM,
-};
-
 enum s5c73m3_resolution_types {
 	RES_ISP,
 	RES_JPEG,
@@ -383,7 +378,8 @@ struct s5c73m3 {
 	u32 i2c_read_address;
 
 	struct regulator_bulk_data supplies[S5C73M3_MAX_SUPPLIES];
-	struct s5c73m3_gpio gpio[GPIO_NUM];
+	struct gpio_desc *stby;
+	struct gpio_desc *reset;
 
 	struct clk *clock;
 
diff --git a/include/media/i2c/s5c73m3.h b/include/media/i2c/s5c73m3.h
index a51f1025ba1c..df0769d64523 100644
--- a/include/media/i2c/s5c73m3.h
+++ b/include/media/i2c/s5c73m3.h
@@ -20,21 +20,9 @@
 #include <linux/videodev2.h>
 #include <media/v4l2-mediabus.h>
 
-/**
- * struct s5c73m3_gpio - data structure describing a GPIO
- * @gpio:  GPIO number
- * @level: indicates active state of the @gpio
- */
-struct s5c73m3_gpio {
-	int gpio;
-	int level;
-};
-
 /**
  * struct s5c73m3_platform_data - s5c73m3 driver platform data
  * @mclk_frequency: sensor's master clock frequency in Hz
- * @gpio_reset:  GPIO driving RESET pin
- * @gpio_stby:   GPIO driving STBY pin
  * @bus_type:    bus type
  * @nlanes:      maximum number of MIPI-CSI lanes used
  * @horiz_flip:  default horizontal image flip value, non zero to enable
@@ -44,9 +32,6 @@ struct s5c73m3_gpio {
 struct s5c73m3_platform_data {
 	unsigned long mclk_frequency;
 
-	struct s5c73m3_gpio gpio_reset;
-	struct s5c73m3_gpio gpio_stby;
-
 	enum v4l2_mbus_type bus_type;
 	u8 nlanes;
 	u8 horiz_flip;
-- 
2.34.1

