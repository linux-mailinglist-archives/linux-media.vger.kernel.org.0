Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A621620CD7
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 11:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiKHKGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Nov 2022 05:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbiKHKGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Nov 2022 05:06:11 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CA42C119
        for <linux-media@vger.kernel.org>; Tue,  8 Nov 2022 02:06:10 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id n12so37140872eja.11
        for <linux-media@vger.kernel.org>; Tue, 08 Nov 2022 02:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0kVjCer0Et0e2W7bIIoIDDSJf8WSDvWiNGBnPC4y2U=;
        b=qSFRPAowj2WaGnbZBh/vXu5w6DpvjGcVyK4fwTbiFgsT86lzL2mMg4djvBdeMqVtW2
         Nq1lKVv1g5cq0bkGjyXJ5xBdkrLrYTkN7a3fqrZ4nHfoBx9uDsGIhu+lctSR26586sHX
         kyIm53wDseA41SM209IPSwyxHaqZzQCXsQJXAF4VdKVjBM1724QkRMIJY7wTXkkLhUNB
         mqASBO1KvpP+dOsEOQY1ZpnKfkU88H96pDuCytm+mRE71dXUpT2449W/SNBTWuUAMkJJ
         g6IcgAqmAoqkyk5huOZ8g50kgd/+TwRpMIGwSeA2iXDSlxueZ7/o61/vaFVJQerovFYQ
         S3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0kVjCer0Et0e2W7bIIoIDDSJf8WSDvWiNGBnPC4y2U=;
        b=n6pj5cISa8gxfBAa6yROZgubZYlN0kLiCmjsIDV5wWlmatVzNbaF34irb0Eny2VBsy
         QNjVuUWwTs/SLr4A6KlkJmxEyvfqZUdOz03JG7PI67lAhAYPgUGEYk4SFcTQjq0CpME7
         mX5a17Ls9ureiM68dVu8BClRVZH7RYKjzkW19tGSiM3C2jFNTdoPfJiCeBn6JMifLsQj
         1jeqVoTy8vzTylDD9gcifpe7FibmXftyuAb55o5yQ3qIk2X77uPoE9IxhCfZ8SNAmkSe
         I9jnm6e24gVC+Z5v7/auuPP3hmcLXcD0I3kpimt/dLzQWlwOfbj8ayu2/9i/O6psyauA
         l3kw==
X-Gm-Message-State: ACrzQf1HM+nCxdNIn0u+W/wPfEm/Xgw4QO6+15JwtuvRYNQsQzgSXZFQ
        UBDASGicmrbLdG3ZjxhW0zeo7w==
X-Google-Smtp-Source: AMsMyM7DieQ5xVGptiPBmb+Zzg4p4ScHfkFu9SAS4Nf9KGFEN+o9gzRFZjaUYquSuHIS/9Pt7q9BfQ==
X-Received: by 2002:a17:907:2bdb:b0:7ad:95e5:ce80 with SMTP id gv27-20020a1709072bdb00b007ad95e5ce80mr52592132ejc.625.1667901968914;
        Tue, 08 Nov 2022 02:06:08 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906218200b00781d411a63csm4437071eju.151.2022.11.08.02.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 02:06:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4] media: s5c73m3: Switch to GPIO descriptors
Date:   Tue,  8 Nov 2022 11:06:04 +0100
Message-Id: <20221108100604.1500909-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
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
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Drop some comments and use dev_err_probe().
- Collect Andrzej's Reviewed-by tag.
ChangeLog v2->v3:
- Rebase on v6.1-rc1
ChangeLog v1->v2:
- Collect Krzysztof's ACK
- Rebase on v6.0-rc1
---
 drivers/media/i2c/s5c73m3/s5c73m3-core.c  | 107 ++++------------------
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c |   1 -
 drivers/media/i2c/s5c73m3/s5c73m3.h       |  10 +-
 include/media/i2c/s5c73m3.h               |  15 ---
 4 files changed, 23 insertions(+), 110 deletions(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index d96ba58ce1e5..59b03b0860d5 100644
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
@@ -1386,10 +1367,9 @@ static int __s5c73m3_power_on(struct s5c73m3 *state)
 	v4l2_dbg(1, s5c73m3_dbg, &state->oif_sd, "clock frequency: %ld\n",
 					clk_get_rate(state->clock));
 
-	s5c73m3_gpio_deassert(state, STBY);
+	gpiod_set_value(state->stby, 0);
 	usleep_range(100, 200);
-
-	s5c73m3_gpio_deassert(state, RSET);
+	gpiod_set_value(state->reset, 0);
 	usleep_range(50, 100);
 
 	return 0;
@@ -1404,11 +1384,10 @@ static int __s5c73m3_power_off(struct s5c73m3 *state)
 {
 	int i, ret;
 
-	if (s5c73m3_gpio_assert(state, RSET))
-		usleep_range(10, 50);
-
-	if (s5c73m3_gpio_assert(state, STBY))
-		usleep_range(100, 200);
+	gpiod_set_value(state->reset, 1);
+	usleep_range(10, 50);
+	gpiod_set_value(state->stby, 1);
+	usleep_range(100, 200);
 
 	clk_disable_unprepare(state->clock);
 
@@ -1543,58 +1522,10 @@ static const struct v4l2_subdev_ops oif_subdev_ops = {
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
@@ -1608,8 +1539,6 @@ static int s5c73m3_get_platform_data(struct s5c73m3 *state)
 		}
 
 		state->mclk_frequency = pdata->mclk_frequency;
-		state->gpio[STBY] = pdata->gpio_stby;
-		state->gpio[RSET] = pdata->gpio_reset;
 		return 0;
 	}
 
@@ -1624,9 +1553,17 @@ static int s5c73m3_get_platform_data(struct s5c73m3 *state)
 					state->mclk_frequency);
 	}
 
-	ret = s5c73m3_parse_gpios(state);
-	if (ret < 0)
-		return -EINVAL;
+	/* Request GPIO lines asserted */
+	state->stby = devm_gpiod_get(dev, "standby", GPIOD_OUT_HIGH);
+	if (IS_ERR(state->stby))
+		return dev_err_probe(dev, PTR_ERR(state->stby),
+				     "failed to request gpio S5C73M3_STBY\n");
+	gpiod_set_consumer_name(state->stby, "S5C73M3_STBY");
+	state->reset = devm_gpiod_get(dev, "xshutdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(state->reset))
+		return dev_err_probe(dev, PTR_ERR(state->reset),
+				     "failed to request gpio S5C73M3_RST\n");
+	gpiod_set_consumer_name(state->reset, "S5C73M3_RST");
 
 	node_ep = of_graph_get_next_endpoint(node, NULL);
 	if (!node_ep) {
@@ -1708,10 +1645,6 @@ static int s5c73m3_probe(struct i2c_client *client)
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

