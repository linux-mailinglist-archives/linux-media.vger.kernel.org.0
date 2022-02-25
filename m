Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0FD4C3A27
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235434AbiBYAI5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235118AbiBYAIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:55 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F96F145AF1
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:24 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id n14so2020766wrq.7
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YMyJh52bjz22zVGTjYAVVvMzXE1AZXkz4nt9vXd2P3I=;
        b=Q1ykHtu8UIFOqIE77jCE99+tkuAO7QhnWy+9V2d5yTvUaLEY2DxrDZORpzMsbNtokp
         PPz7F4WP79dHTOHWViqBdJObEIb7lSegBHy9XLqHuMPtkKrftyQwflcIps4++bcL5f5n
         NTBQlhQMSEE4FDgMovo9vecBlxuJ33OK7LutPMFYq9DD/iRd9uiPilJaG/O4Kq14HzNz
         sBY3iWXNr6AOQFjfaWSSuaSs6S5QqFqgi7P+sepCKyRMfaCGyIjxslZtO4mvj0+93/xH
         2H5cc6KMV6DeRvDTZu/ZPVcfj5vRDDbv+WiLypK6IcJh5h0dC1F7jWLTV5VEmghpbBFX
         ygNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YMyJh52bjz22zVGTjYAVVvMzXE1AZXkz4nt9vXd2P3I=;
        b=MJW0ryFWYctiLJOGt7iA1B3/tfrnHI17J7LZVs1691/M40yEb7wETTbqlelsblAeJK
         HeOpWFp6NjqKzMoqHJqO5thcfcQ9WkrYNbVbBTKiYkbgIvmeo1nwPGwBKg3z/tm4I4yD
         2SNm6ex4gstuPR4cn1H6Y0+B8H5LMhRtm9MHpuyatYk2weSNe/X559wZT8RzHZ0qJn5N
         /z3gcDQueT1nWfy6cPaa1GiNKixpjGNp9YVPwRAHCqMZmn5Nm2cU6XX2inhUVlo8vWNV
         Vx/ifsrZJ4rqXMOts/hr1Hb3Ofva8bmbV4UaTxdFuUF1A0sMk516Ma/0u6dLQbeWPh2f
         7P9w==
X-Gm-Message-State: AOAM533WZKAkHysivpsYCqBNWW4L7OEDBhncHY8bozD//dLYCikNrIf3
        7lckt649tKxYh50XWWc4AyjWxFt77As8IA==
X-Google-Smtp-Source: ABdhPJwSsLyVwVKDiawk9+FZejp3GN3KCyWW+pmvilWVqNWJBrMdlGGTeFh5VE4UaUKP9COLXCYRyQ==
X-Received: by 2002:a05:6000:16c5:b0:1ed:b04d:300 with SMTP id h5-20020a05600016c500b001edb04d0300mr4108441wrf.347.1645747702736;
        Thu, 24 Feb 2022 16:08:22 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:22 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 09/11] media: i2c: Add pm_runtime support to ov7251
Date:   Fri, 25 Feb 2022 00:07:51 +0000
Message-Id: <20220225000753.511996-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
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
Changes in v2:

	- Switched ov7251_set_power_[on|off]() to take a struct device * as the
	input parameter and used those functions for pm_runtime instead of
	adding wrappers (Sakari)

 drivers/media/i2c/ov7251.c | 81 ++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 0c6970b01c6b..724f651212f1 100644
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
 
@@ -1611,23 +1634,24 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1635,7 +1659,7 @@ static int ov7251_probe(struct i2c_client *client)
 	if (ret < 0) {
 		dev_err(dev, "could not read vflip value\n");
 		ret = -ENODEV;
-		goto power_down;
+		goto err_pm_runtime;
 	}
 
 	ret = ov7251_read_reg(ov7251, OV7251_TIMING_FORMAT2,
@@ -1643,10 +1667,12 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1658,8 +1684,11 @@ static int ov7251_probe(struct i2c_client *client)
 
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
@@ -1679,9 +1708,18 @@ static int ov7251_remove(struct i2c_client *client)
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
@@ -1699,6 +1737,7 @@ static struct i2c_driver ov7251_i2c_driver = {
 		.of_match_table = ov7251_of_match,
 		.acpi_match_table = ov7251_acpi_match,
 		.name  = "ov7251",
+		.pm = &ov7251_pm_ops,
 	},
 	.probe_new  = ov7251_probe,
 	.remove = ov7251_remove,
-- 
2.25.1

