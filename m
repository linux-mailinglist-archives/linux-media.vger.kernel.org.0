Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3EA51B1EE
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379022AbiEDWeg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379017AbiEDWe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:27 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466FE2CCB2
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:49 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q23so3819219wra.1
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QaTy596hjpCuJ4YtlTzP5tm8cIDyNQDsq0OFIc7xRfU=;
        b=h/Kvzn4FHfNyrxUAhRrPTO9fryIxl/c608jum2ANU7QZ7cUDcLTr8S84coVIEOXAaI
         HV5NKoCsoWD4B5fNircPIITR4I2ddUhBQhbO7xIJA1NTQ1AWVJD3daGvnhukoqPo/CwL
         v4cvF7/NZxDXD+hfeldWiaei03YJaJH0KafKzEm8LBGAS420EONEdc1zdYz629weorIw
         nKvnBXpISRc7PFbUw3mLaT5EU5IJ8C4mPXQetLeMXb5aSb9LWFvy6QaEg48Erum249JT
         Gh0xPY+DvLDOx7EYuV7jGcZVUWaRqg7T4bPo7mArx9Kbfn2RApLbWYRM/UggbHXyIYlt
         CePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QaTy596hjpCuJ4YtlTzP5tm8cIDyNQDsq0OFIc7xRfU=;
        b=nvu5zyPrx4wyoQBRn74naKgHtGlYyaRTUP7Lmsh5AQnoGvjlNg7YzkLJfjbl6WqKi6
         AyyQKXnTYK/tjpbWTQmeTnCKMYg8EPXyNyHppyZFLa4b7Vrpo+oKZZ1wfZgz5vCil4SV
         ZEcDzJQCoGSZRGh69ETW+sHEZ+qoVtO/WIupPm6S3kdnjooi4DTcHcD87aINNDAVfzP7
         +GK5e1ZDJvtkvKUMkQ90VC88gUFaas3xina2pFzvfzxA5nwfUjWcQYD7/ZhdFBrpxI43
         eddxUtwaCiBFmhNhcjOS4N6gCwxXF9+H+n5IDb1qO9W/+5vKXY87+1BB736Hh7IZ6KKy
         MjBg==
X-Gm-Message-State: AOAM532QkZKMFsrOzOR1b7goymk3H4hDeLCO3M8DmmQKgMvVFID9BRxv
        1mxroaMDrr81ufKA34jWFEG/igdtIQI=
X-Google-Smtp-Source: ABdhPJw5UTX+aSBxpoBVJP8+YFq2T8R10qOwXAsPnlTZmO8yzxkQbjFLfHQbheoyxseKtlMxf84bOw==
X-Received: by 2002:a5d:6d0b:0:b0:20c:4ec7:8e84 with SMTP id e11-20020a5d6d0b000000b0020c4ec78e84mr18001779wrq.281.1651703448882;
        Wed, 04 May 2022 15:30:48 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:48 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 09/15] media: i2c: Add pm_runtime support to ov7251
Date:   Wed,  4 May 2022 23:30:21 +0100
Message-Id: <20220504223027.3480287-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add pm_runtime support to the ov7251 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

Changes in v2:

	- Switched ov7251_set_power_[on|off]() to take a struct device * as the
	input parameter and used those functions for pm_runtime instead of
	adding wrappers (Sakari)

 drivers/media/i2c/ov7251.c | 81 ++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index ff31629839f9..a9e890181200 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -883,8 +884,11 @@ static int ov7251_set_register_array(struct ov7251 *ov7251,
 	return 0;
 }
 
-static int ov7251_set_power_on(struct ov7251 *ov7251)
+static int ov7251_set_power_on(struct device *dev)
 {
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov7251 *ov7251 = to_ov7251(sd);
 	int ret;
 	u32 wait_us;
 
@@ -909,11 +913,17 @@ static int ov7251_set_power_on(struct ov7251 *ov7251)
 	return 0;
 }
 
-static void ov7251_set_power_off(struct ov7251 *ov7251)
+static int ov7251_set_power_off(struct device *dev)
 {
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov7251 *ov7251 = to_ov7251(sd);
+
 	clk_disable_unprepare(ov7251->xclk);
 	gpiod_set_value_cansleep(ov7251->enable_gpio, 0);
 	ov7251_regulators_disable(ov7251);
+
+	return 0;
 }
 
 static int ov7251_s_power(struct v4l2_subdev *sd, int on)
@@ -928,7 +938,7 @@ static int ov7251_s_power(struct v4l2_subdev *sd, int on)
 		goto exit;
 
 	if (on) {
-		ret = ov7251_set_power_on(ov7251);
+		ret = ov7251_set_power_on(ov7251->dev);
 		if (ret < 0)
 			goto exit;
 
@@ -937,13 +947,13 @@ static int ov7251_s_power(struct v4l2_subdev *sd, int on)
 					ARRAY_SIZE(ov7251_global_init_setting));
 		if (ret < 0) {
 			dev_err(ov7251->dev, "could not set init registers\n");
-			ov7251_set_power_off(ov7251);
+			ov7251_set_power_off(ov7251->dev);
 			goto exit;
 		}
 
 		ov7251->power_on = true;
 	} else {
-		ov7251_set_power_off(ov7251);
+		ov7251_set_power_off(ov7251->dev);
 		ov7251->power_on = false;
 	}
 
@@ -1017,7 +1027,7 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* v4l2_ctrl_lock() locks our mutex */
 
-	if (!ov7251->power_on)
+	if (!pm_runtime_get_if_in_use(ov7251->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -1041,6 +1051,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put(ov7251->dev);
+
 	return ret;
 }
 
@@ -1283,10 +1295,15 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 	mutex_lock(&ov7251->lock);
 
 	if (enable) {
+		ret = pm_runtime_get_sync(ov7251->dev);
+		if (ret < 0)
+			goto unlock_out;
+
 		ret = ov7251_pll_configure(ov7251);
-		if (ret)
-			return dev_err_probe(ov7251->dev, ret,
-					     "error configuring PLLs\n");
+		if (ret) {
+			dev_err(ov7251->dev, "error configuring PLLs\n");
+			goto err_power_down;
+		}
 
 		ret = ov7251_set_register_array(ov7251,
 					ov7251->current_mode->data,
@@ -1295,23 +1312,29 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 			dev_err(ov7251->dev, "could not set mode %dx%d\n",
 				ov7251->current_mode->width,
 				ov7251->current_mode->height);
-			goto exit;
+			goto err_power_down;
 		}
 		ret = __v4l2_ctrl_handler_setup(&ov7251->ctrls);
 		if (ret < 0) {
 			dev_err(ov7251->dev, "could not sync v4l2 controls\n");
-			goto exit;
+			goto err_power_down;
 		}
 		ret = ov7251_write_reg(ov7251, OV7251_SC_MODE_SELECT,
 				       OV7251_SC_MODE_SELECT_STREAMING);
+		if (ret)
+			goto err_power_down;
 	} else {
 		ret = ov7251_write_reg(ov7251, OV7251_SC_MODE_SELECT,
 				       OV7251_SC_MODE_SELECT_SW_STANDBY);
+		pm_runtime_put(ov7251->dev);
 	}
 
-exit:
+unlock_out:
 	mutex_unlock(&ov7251->lock);
+	return ret;
 
+err_power_down:
+	pm_runtime_put_noidle(ov7251->dev);
 	return ret;
 }
 
@@ -1614,23 +1637,24 @@ static int ov7251_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
-	ret = ov7251_s_power(&ov7251->sd, true);
-	if (ret < 0) {
-		dev_err(dev, "could not power up OV7251\n");
+	ret = ov7251_set_power_on(ov7251->dev);
+	if (ret)
 		goto free_entity;
-	}
 
 	ret = ov7251_detect_chip(ov7251);
 	if (ret)
 		goto power_down;
 
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_get_noresume(&client->dev);
+	pm_runtime_enable(&client->dev);
 
 	ret = ov7251_read_reg(ov7251, OV7251_PRE_ISP_00,
 			      &ov7251->pre_isp_00);
 	if (ret < 0) {
 		dev_err(dev, "could not read test pattern value\n");
 		ret = -ENODEV;
-		goto power_down;
+		goto err_pm_runtime;
 	}
 
 	ret = ov7251_read_reg(ov7251, OV7251_TIMING_FORMAT1,
@@ -1638,7 +1662,7 @@ static int ov7251_probe(struct i2c_client *client)
 	if (ret < 0) {
 		dev_err(dev, "could not read vflip value\n");
 		ret = -ENODEV;
-		goto power_down;
+		goto err_pm_runtime;
 	}
 
 	ret = ov7251_read_reg(ov7251, OV7251_TIMING_FORMAT2,
@@ -1646,10 +1670,12 @@ static int ov7251_probe(struct i2c_client *client)
 	if (ret < 0) {
 		dev_err(dev, "could not read hflip value\n");
 		ret = -ENODEV;
-		goto power_down;
+		goto err_pm_runtime;
 	}
 
-	ov7251_s_power(&ov7251->sd, false);
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	ret = v4l2_async_register_subdev(&ov7251->sd);
 	if (ret < 0) {
@@ -1661,8 +1687,11 @@ static int ov7251_probe(struct i2c_client *client)
 
 	return 0;
 
+err_pm_runtime:
+	pm_runtime_disable(ov7251->dev);
+	pm_runtime_put_noidle(ov7251->dev);
 power_down:
-	ov7251_s_power(&ov7251->sd, false);
+	ov7251_set_power_off(ov7251->dev);
 free_entity:
 	media_entity_cleanup(&ov7251->sd.entity);
 free_ctrl:
@@ -1682,9 +1711,18 @@ static int ov7251_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
 	mutex_destroy(&ov7251->lock);
 
+	pm_runtime_disable(ov7251->dev);
+	if (!pm_runtime_status_suspended(ov7251->dev))
+		ov7251_set_power_off(ov7251->dev);
+	pm_runtime_set_suspended(ov7251->dev);
+
 	return 0;
 }
 
+static const struct dev_pm_ops ov7251_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov7251_set_power_off, ov7251_set_power_on, NULL)
+};
+
 static const struct of_device_id ov7251_of_match[] = {
 	{ .compatible = "ovti,ov7251" },
 	{ /* sentinel */ }
@@ -1702,6 +1740,7 @@ static struct i2c_driver ov7251_i2c_driver = {
 		.of_match_table = ov7251_of_match,
 		.acpi_match_table = ov7251_acpi_match,
 		.name  = "ov7251",
+		.pm = &ov7251_pm_ops,
 	},
 	.probe_new  = ov7251_probe,
 	.remove = ov7251_remove,
-- 
2.25.1

