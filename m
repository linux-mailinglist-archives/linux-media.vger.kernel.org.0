Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF054D47BF
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242292AbiCJNJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242291AbiCJNJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:09:57 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DE84D629
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:08:55 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2F0C720014;
        Thu, 10 Mar 2022 13:08:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH 5/6] media: i2c: ov5670: Add runtime_pm operations
Date:   Thu, 10 Mar 2022 14:08:28 +0100
Message-Id: <20220310130829.96001-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310130829.96001-1-jacopo@jmondi.org>
References: <20220310130829.96001-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the power up and power down routines and install them as
runtime_pm handler for runtime_suspend and runtime_resume operations.

Rework the runtime_pm enablement and the chip power handling during
probe, as calling pm_runtime_idle() in a driver that registers no
idle callback is a nop.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 59 ++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index ca5191d043ce..c9f69ffef210 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2,6 +2,8 @@
 // Copyright (c) 2017 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -2422,6 +2424,39 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int __maybe_unused ov5670_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov5670 *ov5670 = to_ov5670(sd);
+	int ret = 0;
+
+	ret = regulator_bulk_enable(OV5670_NUM_SUPPLIES, ov5670->supplies);
+	if (ret)
+		return ret;
+
+	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 0);
+	gpiod_set_value_cansleep(ov5670->reset_gpio, 0);
+
+	/* 8192 * 2 clock pulses before the first SCCB transaction. */
+	usleep_range(1000, 1500);
+
+	return 0;
+}
+
+static int __maybe_unused ov5670_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov5670 *ov5670 = to_ov5670(sd);
+
+	gpiod_set_value_cansleep(ov5670->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov5670->pwdn_gpio, 1);
+	regulator_bulk_disable(OV5670_NUM_SUPPLIES, ov5670->supplies);
+
+	return 0;
+}
+
 static int __maybe_unused ov5670_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -2549,14 +2584,25 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_print;
 	}
 
+	pm_runtime_enable(&client->dev);
+
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret) {
+			err_msg = "Failed to power on";
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
+		/* Set the device's state to active if it's in D0 state. */
+		pm_runtime_set_active(&client->dev);
 	}
 
 	mutex_init(&ov5670->mutex);
@@ -2593,11 +2639,7 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ov5670->streaming = false;
 
-	/* Set the device's state to active if it's in D0 state. */
-	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_suspend(&client->dev);
 
 	return 0;
 
@@ -2610,6 +2652,9 @@ static int ov5670_probe(struct i2c_client *client)
 error_mutex_destroy:
 	mutex_destroy(&ov5670->mutex);
 
+error_power_off:
+	pm_runtime_put(&client->dev);
+
 error_print:
 	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
 
@@ -2626,6 +2671,7 @@ static int ov5670_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	mutex_destroy(&ov5670->mutex);
 
+	pm_runtime_put(&client->dev);
 	pm_runtime_disable(&client->dev);
 
 	return 0;
@@ -2633,6 +2679,7 @@ static int ov5670_remove(struct i2c_client *client)
 
 static const struct dev_pm_ops ov5670_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
+	SET_RUNTIME_PM_OPS(ov5670_power_off, ov5670_power_on, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.35.1

