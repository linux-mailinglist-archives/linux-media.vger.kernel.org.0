Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FCD67D249
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbjAZQ7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbjAZQ7i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:59:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384C337F06
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:59:37 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C31112EB;
        Thu, 26 Jan 2023 17:59:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674752371;
        bh=etZLu/Pi/HvDShjHXwOdx2sKwP0SJg35QHhOkWej2MQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GjZLwuXPQvxT1fCDWeWTdH1QlsTYhrdJZAaKhTZPHkzKHU5bDzrM/XPpY1js3xg9L
         IxnSjtooulz0lD9w9UOM3SjLBJgdOFE2Ah9xI2u/gWaLlrSVKUWQZR1oJmAdcSuoTk
         QwULNmuaRF3fS4DtWQOie1mG5F8qRk0kxUAtz1yk=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 6/9] media: i2c: ov5670: Add runtime_pm operations
Date:   Thu, 26 Jan 2023 17:59:06 +0100
Message-Id: <20230126165909.121302-7-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
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

Implement the runtime resume and suspend routines and install them as
runtime_pm handlers.

While at it rework the probe() sequence in order to enable runtime_pm
before registering the async subdevice.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 78 +++++++++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 0290f33f619d..47fedbe37ced 100644
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
@@ -2429,6 +2431,49 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
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
+	delay_us = DIV_ROUND_UP(8192 * 2 * 1000,
+				DIV_ROUND_UP(OV5670_XVCLK_FREQ, 1000));
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
@@ -2570,11 +2615,17 @@ static int ov5670_probe(struct i2c_client *client)
 
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
 	}
 
@@ -2603,24 +2654,27 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	/* Async register for subdev */
-	ret = v4l2_async_register_subdev_sensor(&ov5670->sd);
-	if (ret < 0) {
-		err_msg = "v4l2_async_register_subdev() error";
-		goto error_entity_cleanup;
-	}
-
 	ov5670->streaming = false;
 
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
 		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
+
+	/* Async register for subdev */
+	ret = v4l2_async_register_subdev_sensor(&ov5670->sd);
+	if (ret < 0) {
+		err_msg = "v4l2_async_register_subdev() error";
+		goto error_pm_disable;
+	}
+
 	pm_runtime_idle(&client->dev);
 
 	return 0;
 
-error_entity_cleanup:
+error_pm_disable:
+	pm_runtime_disable(&client->dev);
+
 	media_entity_cleanup(&ov5670->sd.entity);
 
 error_handler_free:
@@ -2629,6 +2683,10 @@ static int ov5670_probe(struct i2c_client *client)
 error_mutex_destroy:
 	mutex_destroy(&ov5670->mutex);
 
+error_power_off:
+	if (full_power)
+		ov5670_runtime_suspend(&client->dev);
+
 error_print:
 	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
 
@@ -2646,10 +2704,12 @@ static void ov5670_remove(struct i2c_client *client)
 	mutex_destroy(&ov5670->mutex);
 
 	pm_runtime_disable(&client->dev);
+	ov5670_runtime_suspend(&client->dev);
 }
 
 static const struct dev_pm_ops ov5670_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
+	SET_RUNTIME_PM_OPS(ov5670_runtime_suspend, ov5670_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.39.0

