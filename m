Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A4B51CC76
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386576AbiEEXIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386559AbiEEXIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:05 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA605EDCA
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:21 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x18so7905999wrc.0
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v2ntq5+o84ys/7XkopTay1Bh9yp01vCZFVX0Ak5FvkY=;
        b=BzeP0UuLloeAwqzyr7L9C5Fc9fFt8rgs5xtNfRKeiQfYxeV1R32dEiXZzeyKabP/Ks
         72vWkNn2yjLrOnCamtNk/NY6IHsILqzg4MUXsYSmT2hFVczGl9Ln5tM3J8UERoVDoweu
         +ZHSMhf7npE+tHg2pYzEGpjSpW38x2ggHgBQJG9eseREF0uQLNaceFHQxRJjt3bLmjh/
         c4URzPbnb/4JyL+sLE2WEh089rDQmx654oDxWE4qLpjhskFPDNrMbc2Y68QalE02qmGc
         LpSHIGtUAbwNxsctOXIi8+yspElOjg0FDKLGG6LNvKJD0IBaRtUBKF2vWn/I3hc8vDAR
         xOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v2ntq5+o84ys/7XkopTay1Bh9yp01vCZFVX0Ak5FvkY=;
        b=1YeKsAPF5J+rd26hQJpWL3QgxMKUeCoNrjSoNAhJIc2+Gpl97PtbRRWyOw6RpH6tTp
         Ie+Vs57POJpU8ZqnAGXnea7k6Gh69+OYQ2Nn3+cuVIY55h7Hqq606XpdRAeUrK84+su6
         vU80BnELqx/AJuZ1V7B2L7/qjAaCKdWTdFjWOPUvmQzPBp+DGi4IKH7elmNIKk+sTi3N
         Lw8uTehHVAufigEll9bhFld9/JTIkBdvgEloD8QpcxnreVpuN0XaOHLGcvxTchOeOpRw
         /K+yi14TBxFH8jxGqYaVfzPCpcRApyjwFwEG+SdAiAQ0L2WXTsABy4RJKBs3Q8NppK7U
         W1cg==
X-Gm-Message-State: AOAM5327b5VxlefEKmHgJj4JlbjKFuLYl+VqWIDdtGZOYjva3qcbZhJt
        DfXGAqBBIyBEkKyfj/SGlHvWIPrZQbs=
X-Google-Smtp-Source: ABdhPJyGxvidO5nHU3A6dy2UY9oV2Qnml6MTD01I7IoJ3M998pblQLSNE/KYDrbRQ7veIMv/iUcYkw==
X-Received: by 2002:adf:d22f:0:b0:20a:d8e7:41ae with SMTP id k15-20020adfd22f000000b0020ad8e741aemr284001wrh.708.1651791860178;
        Thu, 05 May 2022 16:04:20 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:19 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 09/15] media: i2c: Add pm_runtime support to ov7251
Date:   Fri,  6 May 2022 00:03:56 +0100
Message-Id: <20220505230402.449643-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
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
Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- Switched ov7251_set_power_[on|off]() to take a struct device * as the
	input parameter and used those functions for pm_runtime instead of
	adding wrappers (Sakari)

 drivers/media/i2c/ov7251.c | 81 ++++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 88875275b7b4..1713c6e22ccd 100644
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
 
@@ -1612,23 +1635,24 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1636,7 +1660,7 @@ static int ov7251_probe(struct i2c_client *client)
 	if (ret < 0) {
 		dev_err(dev, "could not read vflip value\n");
 		ret = -ENODEV;
-		goto power_down;
+		goto err_pm_runtime;
 	}
 
 	ret = ov7251_read_reg(ov7251, OV7251_TIMING_FORMAT2,
@@ -1644,10 +1668,12 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1659,8 +1685,11 @@ static int ov7251_probe(struct i2c_client *client)
 
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
@@ -1680,9 +1709,18 @@ static int ov7251_remove(struct i2c_client *client)
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
@@ -1700,6 +1738,7 @@ static struct i2c_driver ov7251_i2c_driver = {
 		.of_match_table = ov7251_of_match,
 		.acpi_match_table = ov7251_acpi_match,
 		.name  = "ov7251",
+		.pm = &ov7251_pm_ops,
 	},
 	.probe_new  = ov7251_probe,
 	.remove = ov7251_remove,
-- 
2.25.1

