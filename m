Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D33B45A6F0E
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 23:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbiH3VVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 17:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbiH3VVf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 17:21:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACBF3F32D
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:21:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z25so17280490lfr.2
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 14:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=w2A5WHHJH3HBBk6hnCZKOCB5Baw4fe2aa4o7zIz4JCA=;
        b=zDq7ajoXYZalVT/P0QY/B9T4pgw8kHZPbr2n/jq//MSWxiGKLGLJyg2ljWdFzXvgD4
         uCD7WBFbC2mDGumoJ/uo1fJt5YOP9CTvXE+V+xGnoM+F7uWY1F+kPs7PMRpzAcBf7WoS
         jxOKFqji14y600I+HC1P+QSM4lOa0up5fa+BmsF6q00zP7eHvIVDGJzjIzv0dgnwkM2X
         2HaQ7TMndj3q4K3fEZGyu6Mfc7N2d7BtYUxfamx30wKtVIAS9iJFZomF4iM+GWIWq8JJ
         faNlq71krY3c3xwu1lU4Av2Bol/3dG9plq9KkNC/NJeRzjsjVsxFn0JwsaSDJ8N7kT72
         0uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=w2A5WHHJH3HBBk6hnCZKOCB5Baw4fe2aa4o7zIz4JCA=;
        b=ogHXCUamvgevSS11BCtlkMDhdSOzHagSbWjIB3iIa0k9gcFgzHkcHLQZn6kdakZ8qK
         EQUsUe+KZyTiyhEzSSvx3Bg1k7d5CNap2M78dtRBK69NHH/VTL3Zk/arcRB91dJAWYb6
         XLIey+xxSRdqxtKVMbTRympbuFmCo0ViZH2cfvIUZWas+MC3QjR4PabUyt3Ozv94gT9o
         C2Dk44+hhseOrUTHq9XKJrpagzLkQzllK5MhBjkwRJhjBPF3F4qDOBkzrMcDea2sMm6T
         uVdb9OBhytj2P+O76heB2vIW9F4K2/m4HcgIFbFX2mcQe7PFFw/dutd9IcJJQ8mqdmjv
         LIhA==
X-Gm-Message-State: ACgBeo1JHAVmqgk41h6kytW0DsLgvNnB/anTixKF8wn6HUcHP5IxGrKJ
        J2KnAg4F+yRePLBkRdu4RImAq37cNAcXzIqh
X-Google-Smtp-Source: AA6agR4iUXyT4buduBHYIk0ZGpvUwGGn91Wwk//aXjtoFV0C8zghEMZFPITd6I6n/5FW6iVsy4KitQ==
X-Received: by 2002:a19:911d:0:b0:494:6701:1d17 with SMTP id t29-20020a19911d000000b0049467011d17mr4769190lfd.31.1661894492525;
        Tue, 30 Aug 2022 14:21:32 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h17-20020a2ea491000000b00261eb899361sm1184853lji.23.2022.08.30.14.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:21:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] media: s5c73m3: Switch to GPIO descriptors
Date:   Tue, 30 Aug 2022 23:19:27 +0200
Message-Id: <20220830211927.398242-1-linus.walleij@linaro.org>
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
index e2b88c5e4f98..41c37a64afd8 100644
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
2.37.2

