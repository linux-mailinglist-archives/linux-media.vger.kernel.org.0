Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574526D31C5
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjDAPBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjDAPA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309EE1E73D
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361208;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TKKh7czIRUQddklBJSPQE3QDh4P3NeHxHDOsxHwxqrY=;
        b=VzhQDefuCirwUzr9lDiQBG4P+07o/I+x5h1SEDvrQ/eulcLb2nBm1LRMLPAYKcKPnQqOtb
        ohWB42U02W6VUw6KBwI5bQO5QCQC+VOsPA0oKDGvtu0XjY6bnNO9NxBK5e13tUW3GkIsEb
        n8wFUE7in3vJ49cHz0nOsQX4t+2wbxE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-Hk4ZOGNMOuyvZikwOw_FcA-1; Sat, 01 Apr 2023 11:00:05 -0400
X-MC-Unique: Hk4ZOGNMOuyvZikwOw_FcA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A73A85A5A3;
        Sat,  1 Apr 2023 15:00:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1592C400F59;
        Sat,  1 Apr 2023 15:00:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 16/28] media: atomisp: gc0310: Add runtime-pm support
Date:   Sat,  1 Apr 2023 16:59:14 +0200
Message-Id: <20230401145926.596216-17-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add runtime-pm support. This is a preparation patch for letting
ACPI deal with the regulators and clocks instead of the DIY code
in atomisp_gmin_platform.c.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 91 +++++++++++--------
 drivers/staging/media/atomisp/i2c/gc0310.h    |  2 +-
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 305d43b9815b..1224213d4195 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/moduleparam.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-device.h>
 #include <linux/io.h>
 #include "../include/linux/atomisp_gmin_platform.h"
@@ -100,7 +101,8 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 		container_of(ctrl->handler, struct gc0310_device, ctrls.handler);
 	int ret;
 
-	if (!dev->power_on)
+	/* Only apply changes to the controls if the device is powered up */
+	if (!pm_runtime_get_if_in_use(dev->sd.dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -115,6 +117,7 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
+	pm_runtime_put(dev->sd.dev);
 	return ret;
 }
 
@@ -188,9 +191,6 @@ static int power_up(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
-	if (dev->power_on)
-		return 0; /* Already on */
-
 	/* power control */
 	ret = power_ctrl(sd, 1);
 	if (ret)
@@ -211,7 +211,6 @@ static int power_up(struct v4l2_subdev *sd)
 
 	msleep(100);
 
-	dev->power_on = true;
 	return 0;
 
 fail_gpio:
@@ -236,9 +235,6 @@ static int power_down(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
-	if (!dev->power_on)
-		return 0; /* Already off */
-
 	/* gpio ctrl */
 	ret = gpio_ctrl(sd, 0);
 	if (ret) {
@@ -256,7 +252,6 @@ static int power_down(struct v4l2_subdev *sd)
 	if (ret)
 		dev_err(&client->dev, "vprog failed.\n");
 
-	dev->power_on = false;
 	return ret;
 }
 
@@ -338,15 +333,20 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
+	int ret = 0;
 
 	dev_dbg(&client->dev, "%s S enable=%d\n", __func__, enable);
 	mutex_lock(&dev->input_lock);
 
+	if (dev->is_streaming == enable) {
+		dev_warn(&client->dev, "stream already %s\n", enable ? "started" : "stopped");
+		goto error_unlock;
+	}
+
 	if (enable) {
-		ret = power_up(sd);
-		if (ret)
-			goto error_unlock;
+		ret = pm_runtime_get_sync(&client->dev);
+		if (ret < 0)
+			goto error_power_down;
 
 		ret = gc0310_write_reg_array(client, gc0310_reset_register,
 					     ARRAY_SIZE(gc0310_reset_register));
@@ -383,13 +383,15 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 		goto error_power_down;
 
 	if (!enable)
-		power_down(sd);
+		pm_runtime_put(&client->dev);
 
+	dev->is_streaming = enable;
 	mutex_unlock(&dev->input_lock);
 	return 0;
 
 error_power_down:
-	power_down(sd);
+	pm_runtime_put(&client->dev);
+	dev->is_streaming = false;
 error_unlock:
 	mutex_unlock(&dev->input_lock);
 	return ret;
@@ -409,19 +411,9 @@ static int gc0310_s_config(struct v4l2_subdev *sd,
 	    (struct camera_sensor_platform_data *)platform_data;
 
 	mutex_lock(&dev->input_lock);
-	/* power off the module, then power on it in future
-	 * as first power on by board may not fulfill the
-	 * power on sequqence needed by the module
-	 */
-	dev->power_on = true; /* force power_down() to run */
-	ret = power_down(sd);
-	if (ret) {
-		dev_err(&client->dev, "gc0310 power-off err.\n");
-		goto fail_power_off;
-	}
 
-	ret = power_up(sd);
-	if (ret) {
+	ret = pm_runtime_get_sync(&client->dev);
+	if (ret < 0) {
 		dev_err(&client->dev, "gc0310 power-up err.\n");
 		goto fail_power_on;
 	}
@@ -438,11 +430,7 @@ static int gc0310_s_config(struct v4l2_subdev *sd,
 	}
 
 	/* turn off sensor, after probed */
-	ret = power_down(sd);
-	if (ret) {
-		dev_err(&client->dev, "gc0310 power-off err.\n");
-		goto fail_csi_cfg;
-	}
+	pm_runtime_put(&client->dev);
 	mutex_unlock(&dev->input_lock);
 
 	return 0;
@@ -450,9 +438,7 @@ static int gc0310_s_config(struct v4l2_subdev *sd,
 fail_csi_cfg:
 	dev->platform_data->csi_cfg(sd, 0);
 fail_power_on:
-	power_down(sd);
-	dev_err(&client->dev, "sensor power-gating failed\n");
-fail_power_off:
+	pm_runtime_put(&client->dev);
 	mutex_unlock(&dev->input_lock);
 	return ret;
 }
@@ -554,6 +540,7 @@ static void gc0310_remove(struct i2c_client *client)
 	v4l2_device_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
+	pm_runtime_disable(&client->dev);
 	kfree(dev);
 }
 
@@ -579,13 +566,22 @@ static int gc0310_probe(struct i2c_client *client)
 		goto out_free;
 	}
 
+	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+
 	ret = gc0310_s_config(&dev->sd, client->irq, pdata);
-	if (ret)
-		goto out_free;
+	if (ret) {
+		gc0310_remove(client);
+		return ret;
+	}
 
 	ret = atomisp_register_i2c_module(&dev->sd, pdata, RAW_CAMERA);
-	if (ret)
-		goto out_free;
+	if (ret) {
+		gc0310_remove(client);
+		return ret;
+	}
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -608,6 +604,22 @@ static int gc0310_probe(struct i2c_client *client)
 	return ret;
 }
 
+static int gc0310_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+
+	return power_down(sd);
+}
+
+static int gc0310_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+
+	return power_up(sd);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_suspend, gc0310_resume, NULL);
+
 static const struct acpi_device_id gc0310_acpi_match[] = {
 	{"XXGC0310"},
 	{"INT0310"},
@@ -618,6 +630,7 @@ MODULE_DEVICE_TABLE(acpi, gc0310_acpi_match);
 static struct i2c_driver gc0310_driver = {
 	.driver = {
 		.name = "gc0310",
+		.pm = pm_sleep_ptr(&gc0310_pm_ops),
 		.acpi_match_table = gc0310_acpi_match,
 	},
 	.probe_new = gc0310_probe,
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 1d22fd25e165..485a060b40ff 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -94,7 +94,7 @@ struct gc0310_device {
 	struct mutex input_lock;
 
 	struct camera_sensor_platform_data *platform_data;
-	bool power_on;
+	bool is_streaming;
 
 	struct gc0310_mode {
 		struct v4l2_mbus_framefmt fmt;
-- 
2.39.1

