Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 538E967CB2D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 13:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236651AbjAZMrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 07:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236436AbjAZMrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1504066F9A
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 04:47:06 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 988AD12EB;
        Thu, 26 Jan 2023 13:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674737217;
        bh=o9clG9a88/QK30VzBfKxP8Z8jrXljbu41u2Pu5WojQY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=grqOIDexGEhBxVrOmxk+wHfWOSzA+omTb7Y7kKdm3MH6eBnr4Fb0LYe9wXVIrLCzq
         qNsFC//olJya5LFUB+Oj4H/y8Cf1kJLo77EQxTCre8oYzllrukKb/5ItO2+2J8zO1O
         HZ5gxAI+PuARdIY8Byp1WAzUWW+0ZqqNxORl0EW0=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 6/9] media: i2c: ov5670: Add runtime_pm operations
Date:   Thu, 26 Jan 2023 13:46:29 +0100
Message-Id: <20230126124632.45842-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the power up and power down routines and install them as
runtime_pm handler for runtime_suspend and runtime_resume operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 79 +++++++++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 6843b2d9a2d4..12091a5c992e 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017 Intel Corporation.
 
+#include <asm/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
@@ -15,6 +17,8 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
+#define OV5670_XVCLK_FREQ		19200000
+
 #define OV5670_REG_CHIP_ID		0x300a
 #define OV5670_CHIP_ID			0x005670
 
@@ -1841,6 +1845,9 @@ struct ov5670 {
 	/* Current mode */
 	const struct ov5670_mode *cur_mode;
 
+	/* xvclk input clock */
+	struct clk *xvclk;
+
 	/* Regulators */
 	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
 
@@ -2424,6 +2431,48 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int __maybe_unused ov5670_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov5670 *ov5670 = to_ov5670(sd);
+	unsigned long delay_us;
+	int ret;
+
+	ret = clk_prepare_enable(ov5670->xvclk);
+	if (ret)
+		return ret;
+
+	ret = regulator_bulk_enable(OV5670_NUM_SUPPLIES, ov5670->supplies);
+	if (ret) {
+		clk_disable_unprepare(ov5670->xvclk);
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 0);
+	gpiod_set_value_cansleep(ov5670->reset_gpio, 0);
+
+	/* 8192 * 2 clock pulses before the first SCCB transaction. */
+	delay_us = DIV_ROUND_UP(8192 * 2, OV5670_XVCLK_FREQ / 1000 / 1000);
+	fsleep(delay_us);
+
+	return 0;
+}
+
+static int __maybe_unused ov5670_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov5670 *ov5670 = to_ov5670(sd);
+
+	gpiod_set_value_cansleep(ov5670->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 1);
+	regulator_bulk_disable(OV5670_NUM_SUPPLIES, ov5670->supplies);
+	clk_disable_unprepare(ov5670->xvclk);
+
+	return 0;
+}
+
 static int __maybe_unused ov5670_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -2522,7 +2571,6 @@ static int ov5670_probe(struct i2c_client *client)
 	struct ov5670 *ov5670;
 	const char *err_msg;
 	u32 input_clk = 0;
-	struct clk *clk;
 	bool full_power;
 	int ret;
 
@@ -2535,18 +2583,19 @@ static int ov5670_probe(struct i2c_client *client)
 
 	/* OF uses the common clock framework, ACPI uses "clock-frequency". */
 	if (is_of_node(dev_fwnode(&client->dev))) {
-		clk = devm_clk_get(&client->dev, NULL);
-		if (IS_ERR(clk))
-			return dev_err_probe(&client->dev, PTR_ERR(clk),
+		ov5670->xvclk = devm_clk_get(&client->dev, NULL);
+		if (IS_ERR(ov5670->xvclk))
+			return dev_err_probe(&client->dev,
+					     PTR_ERR(ov5670->xvclk),
 					     "error getting clock\n");
 
-		input_clk = clk_get_rate(clk);
+		input_clk = clk_get_rate(ov5670->xvclk);
 	} else {
 		device_property_read_u32(&client->dev, "clock-frequency",
 					 &input_clk);
 	}
 
-	if (input_clk != 19200000) {
+	if (input_clk != OV5670_XVCLK_FREQ) {
 		dev_err(&client->dev,
 			"Unsupported clock frequency %u\n", input_clk);
 		return -EINVAL;
@@ -2569,12 +2618,20 @@ static int ov5670_probe(struct i2c_client *client)
 
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
+		ret = ov5670_runtime_resume(&client->dev);
+		if (ret) {
+			err_msg = "Power up failed";
+			goto error_print;
+		}
+
 		/* Check module identity */
 		ret = ov5670_identify_module(ov5670);
 		if (ret) {
 			err_msg = "ov5670_identify_module() error";
-			goto error_print;
+			goto error_power_off;
 		}
+
+		pm_runtime_set_active(&client->dev);
 	}
 
 	mutex_init(&ov5670->mutex);
@@ -2611,9 +2668,6 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ov5670->streaming = false;
 
-	/* Set the device's state to active if it's in D0 state. */
-	if (full_power)
-		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -2628,6 +2682,9 @@ static int ov5670_probe(struct i2c_client *client)
 error_mutex_destroy:
 	mutex_destroy(&ov5670->mutex);
 
+error_power_off:
+	ov5670_runtime_suspend(&client->dev);
+
 error_print:
 	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
 
@@ -2644,11 +2701,13 @@ static void ov5670_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	mutex_destroy(&ov5670->mutex);
 
+	ov5670_runtime_suspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 }
 
 static const struct dev_pm_ops ov5670_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
+	SET_RUNTIME_PM_OPS(ov5670_runtime_suspend, ov5670_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.39.0

