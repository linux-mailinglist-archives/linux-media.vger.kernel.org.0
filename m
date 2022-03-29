Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C018E4EA9FF
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbiC2JEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiC2JEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:04:46 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8377921FC59
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:03:03 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DF803100007;
        Tue, 29 Mar 2022 09:02:59 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v3 6/8] media: i2c: ov5670: Add runtime_pm operations
Date:   Tue, 29 Mar 2022 11:01:31 +0200
Message-Id: <20220329090133.338073-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329090133.338073-1-jacopo@jmondi.org>
References: <20220329090133.338073-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
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
 drivers/media/i2c/ov5670.c | 58 ++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 9e69b4008917..b63b07d8ca2f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -4,6 +4,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
+#include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -2424,6 +2425,39 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int __maybe_unused ov5670_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov5670 *ov5670 = to_ov5670(sd);
+	int ret;
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
+static int __maybe_unused ov5670_runtime_suspend(struct device *dev)
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
@@ -2564,14 +2598,25 @@ static int ov5670_probe(struct i2c_client *client)
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
@@ -2608,11 +2653,7 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ov5670->streaming = false;
 
-	/* Set the device's state to active if it's in D0 state. */
-	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
+	pm_runtime_suspend(&client->dev);
 
 	return 0;
 
@@ -2625,6 +2666,9 @@ static int ov5670_probe(struct i2c_client *client)
 error_mutex_destroy:
 	mutex_destroy(&ov5670->mutex);
 
+error_power_off:
+	pm_runtime_put(&client->dev);
+
 error_print:
 	dev_err(&client->dev, "%s: %s %d\n", __func__, err_msg, ret);
 
@@ -2641,6 +2685,7 @@ static int ov5670_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	mutex_destroy(&ov5670->mutex);
 
+	pm_runtime_put(&client->dev);
 	pm_runtime_disable(&client->dev);
 
 	return 0;
@@ -2648,6 +2693,7 @@ static int ov5670_remove(struct i2c_client *client)
 
 static const struct dev_pm_ops ov5670_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov5670_suspend, ov5670_resume)
+	SET_RUNTIME_PM_OPS(ov5670_runtime_suspend, ov5670_runtime_resume, NULL)
 };
 
 #ifdef CONFIG_ACPI
-- 
2.35.1

