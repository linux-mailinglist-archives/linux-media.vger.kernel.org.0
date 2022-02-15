Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 353394B7B04
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244336AbiBOXIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243426AbiBOXIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935017673
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:59 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id v129so182815wme.2
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iv+bUBoKf/lNxici8br7gTJshq/us8jPfldYaC2Vdfc=;
        b=nNGh1YophE67cY2vO2LDTrPg06FEJ/gW4QFNX7Y42Rlzlmn0ft47oal6Hd1AcGLCgf
         NwOn5JS3cbzAGAfTyvnJ587EGG/KW8gcULBUdlKgLc6VZac+zCJKqal1Ddmn3G2pEm1N
         EcIz70uigBZzOP3xPI18OxOeBrbzIDMzybaMOU9jPgXK9BjCOzTjOvi6zEAT0D5go7nI
         gP77sh03EEfdaJi5UJ8ZS82UqSjJjj7mjJ0vesh/Mx3jNd7tPHoFmlPjrlGEeL124Ais
         7bQj2JxCt9ye5/aAeD77zbfH08NL65IlfVMTgsYuSU6jD3N2+/KcZmooXmTfCQGAZUsO
         4OMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iv+bUBoKf/lNxici8br7gTJshq/us8jPfldYaC2Vdfc=;
        b=Tx8n/rKwJ4VLqnQaW2VwgLQLFNH/I84NAskIzHhHpqaSI/i2N7mNiOBSUfSSlp+qwu
         hti0ML8LfypFw1UvyXcSbRUvOastC2MVRhk3XSa+OF8Su/NK7uvmHRYy2oA6NE6OG/C8
         byaxhawcYoazYiIg4KcA2/IkFr1yz8Q/p45Y2hf869+jc/EYnFV7i31DkqbtOZi4QmLO
         jMKyhZzpqmJnx9zdpGtxbQhuciwYXrKognT9V6sAlxlWAogOZZlGhDdBcWSCCEe2LyoV
         efit+v7og/TPiuGsGfZvX0dWeTQ9pSPMc7wP6KoONc1JbZD9P+KpUjspddB4NHLSqdy/
         ehuQ==
X-Gm-Message-State: AOAM530GmWMuJ7kfq85ruln/EqvcHUYcuXrmbYXOVzI/B83U3XyDadve
        4ofI8Bl/iEnv0g8TsESTiki/4UVMJshqmA==
X-Google-Smtp-Source: ABdhPJzL01EsitoQnTF7QU5CyqHgx3RmUYtrWjlUD99f0CjwRe9eOO+8OOdz4yiykvCMdUI+3pu7rA==
X-Received: by 2002:a1c:4443:0:b0:34d:a9d6:884 with SMTP id r64-20020a1c4443000000b0034da9d60884mr5044885wma.50.1644966478238;
        Tue, 15 Feb 2022 15:07:58 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:57 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 08/10] media: i2c: Add pm_runtime support to ov7251
Date:   Tue, 15 Feb 2022 23:07:35 +0000
Message-Id: <20220215230737.1870630-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov7251.c | 78 ++++++++++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f137a1e87537..d620ed6a4e42 100644
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
@@ -884,6 +885,24 @@ static void ov7251_set_power_off(struct ov7251 *ov7251)
 	ov7251_regulators_disable(ov7251);
 }
 
+static int __maybe_unused ov7251_sensor_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov7251 *ov7251 = to_ov7251(sd);
+
+	ov7251_set_power_off(ov7251);
+
+	return 0;
+}
+
+static int __maybe_unused ov7251_sensor_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov7251 *ov7251 = to_ov7251(sd);
+
+	return ov7251_set_power_on(ov7251);
+}
+
 static int ov7251_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct ov7251 *ov7251 = to_ov7251(sd);
@@ -985,7 +1004,7 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* v4l2_ctrl_lock() locks our mutex */
 
-	if (!ov7251->power_on)
+	if (!pm_runtime_get_if_in_use(ov7251->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -1009,6 +1028,8 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put(ov7251->dev);
+
 	return ret;
 }
 
@@ -1261,10 +1282,15 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 	mutex_lock(&ov7251->lock);
 
 	if (enable) {
+		ret = pm_runtime_get_sync(ov7251->dev);
+		if (ret < 0)
+			return ret;
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
@@ -1273,23 +1299,29 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
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
 	mutex_unlock(&ov7251->lock);
+	return ret;
 
+err_power_down:
+	pm_runtime_put_noidle(ov7251->dev);
+	mutex_unlock(&ov7251->lock);
 	return ret;
 }
 
@@ -1604,23 +1636,24 @@ static int ov7251_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
-	ret = ov7251_s_power(&ov7251->sd, true);
-	if (ret < 0) {
-		dev_err(dev, "could not power up OV7251\n");
+	ret = ov7251_set_power_on(ov7251);
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
@@ -1628,7 +1661,7 @@ static int ov7251_probe(struct i2c_client *client)
 	if (ret < 0) {
 		dev_err(dev, "could not read vflip value\n");
 		ret = -ENODEV;
-		goto power_down;
+		goto err_pm_runtime;
 	}
 
 	ret = ov7251_read_reg(ov7251, OV7251_TIMING_FORMAT2,
@@ -1636,10 +1669,12 @@ static int ov7251_probe(struct i2c_client *client)
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
@@ -1651,6 +1686,9 @@ static int ov7251_probe(struct i2c_client *client)
 
 	return 0;
 
+err_pm_runtime:
+	pm_runtime_disable(ov7251->dev);
+	pm_runtime_put_noidle(ov7251->dev);
 power_down:
 	ov7251_s_power(&ov7251->sd, false);
 free_entity:
@@ -1672,9 +1710,18 @@ static int ov7251_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
 	mutex_destroy(&ov7251->lock);
 
+	pm_runtime_disable(ov7251->dev);
+	if (!pm_runtime_status_suspended(ov7251->dev))
+		ov7251_set_power_off(ov7251);
+	pm_runtime_set_suspended(ov7251->dev);
+
 	return 0;
 }
 
+static const struct dev_pm_ops ov7251_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov7251_sensor_suspend, ov7251_sensor_resume, NULL)
+};
+
 static const struct of_device_id ov7251_of_match[] = {
 	{ .compatible = "ovti,ov7251" },
 	{ /* sentinel */ }
@@ -1692,6 +1739,7 @@ static struct i2c_driver ov7251_i2c_driver = {
 		.of_match_table = ov7251_of_match,
 		.acpi_match_table = ov7251_acpi_match,
 		.name  = "ov7251",
+		.pm = &ov7251_pm_ops,
 	},
 	.probe_new  = ov7251_probe,
 	.remove = ov7251_remove,
-- 
2.25.1

