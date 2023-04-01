Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0E36D31C7
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjDAPBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjDAPBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39241EA20
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361213;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BqJKkLsXsmCFZRxGHR6LcIOaTsfjdyIt7f7GnhSFl+c=;
        b=PgngNECUyfStkZBLicpikpH8ub4hK2QbVba6J9yrs6fAnuSBE1/BJJ4hx0UzepX7FMIrLU
        AmZd2Jfyopgqd6NlM9FinIPUPS16MLOYrk95DLhBdEj0nifKJcgkaiennT2/JMtdl3jAer
        4gWb2PbW9bcgW3R8CPwJJIIVBhir8co=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-phDG4cvGMUKg5_T6Tl2CLg-1; Sat, 01 Apr 2023 11:00:08 -0400
X-MC-Unique: phDG4cvGMUKg5_T6Tl2CLg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2942D101A550;
        Sat,  1 Apr 2023 15:00:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 99E26400F59;
        Sat,  1 Apr 2023 15:00:06 +0000 (UTC)
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
Subject: [PATCH 18/28] media: atomisp: gc0310: Switch over to ACPI powermanagement
Date:   Sat,  1 Apr 2023 16:59:16 +0200
Message-Id: <20230401145926.596216-19-hdegoede@redhat.com>
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

The DSDT of all Windows BYT / CHT devices which I have seen has proper
ACPI powermagement for the clk and regulators used by the sensors.

So there is no need for the whole custom atomisp_gmin custom code to
disable the ACPI pm and directly poke at the PMIC for this.

Replace all the atomisp_gmin usage with using the new
atomisp_register_sensor_no_gmin() / atomisp_unregister_subdev()
helpers which allow registering a sensor with the atomisp code
without using any of the atomisp_gmin power-management code.

Note eventually these calls should be replaced by the standard
v4l2_async_register_subdev_sensor() mechanism.

But this first requires a bunch of work to the atomisp main code
to make it set the necessary fwnodes up, similar to how
drivers/media/pci/intel/ipu3/cio2-bridge.c does this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 234 ++++--------------
 drivers/staging/media/atomisp/i2c/gc0310.h    |   5 +-
 2 files changed, 50 insertions(+), 189 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 5016e0b65af1..a134ef24ba8b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -3,6 +3,7 @@
  * Support for GalaxyCore GC0310 VGA camera sensor.
  *
  * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
+ * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License version
@@ -26,6 +27,8 @@
 #include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/moduleparam.h>
 #include <linux/pm_runtime.h>
@@ -125,136 +128,6 @@ static const struct v4l2_ctrl_ops ctrl_ops = {
 	.s_ctrl = gc0310_s_ctrl,
 };
 
-static int power_ctrl(struct v4l2_subdev *sd, bool flag)
-{
-	int ret = 0;
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-
-	if (!dev || !dev->platform_data)
-		return -ENODEV;
-
-	if (flag) {
-		/* The upstream module driver (written to Crystal
-		 * Cove) had this logic to pulse the rails low first.
-		 * This appears to break things on the MRD7 with the
-		 * X-Powers PMIC...
-		 *
-		 *     ret = dev->platform_data->v1p8_ctrl(sd, 0);
-		 *     ret |= dev->platform_data->v2p8_ctrl(sd, 0);
-		 *     mdelay(50);
-		 */
-		ret |= dev->platform_data->v1p8_ctrl(sd, 1);
-		ret |= dev->platform_data->v2p8_ctrl(sd, 1);
-		usleep_range(10000, 15000);
-	}
-
-	if (!flag || ret) {
-		ret |= dev->platform_data->v1p8_ctrl(sd, 0);
-		ret |= dev->platform_data->v2p8_ctrl(sd, 0);
-	}
-	return ret;
-}
-
-static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
-{
-	int ret;
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-
-	if (!dev || !dev->platform_data)
-		return -ENODEV;
-
-	/* GPIO0 == "reset" (active low), GPIO1 == "power down" */
-	if (flag) {
-		/* Pulse reset, then release power down */
-		ret = dev->platform_data->gpio0_ctrl(sd, 0);
-		usleep_range(5000, 10000);
-		ret |= dev->platform_data->gpio0_ctrl(sd, 1);
-		usleep_range(10000, 15000);
-		ret |= dev->platform_data->gpio1_ctrl(sd, 0);
-		usleep_range(10000, 15000);
-	} else {
-		ret = dev->platform_data->gpio1_ctrl(sd, 1);
-		ret |= dev->platform_data->gpio0_ctrl(sd, 0);
-	}
-	return ret;
-}
-
-static int power_up(struct v4l2_subdev *sd)
-{
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	if (!dev->platform_data) {
-		dev_err(&client->dev,
-			"no camera_sensor_platform_data");
-		return -ENODEV;
-	}
-
-	/* power control */
-	ret = power_ctrl(sd, 1);
-	if (ret)
-		goto fail_power;
-
-	/* flis clock control */
-	ret = dev->platform_data->flisclk_ctrl(sd, 1);
-	if (ret)
-		goto fail_clk;
-
-	/* gpio ctrl */
-	ret = gpio_ctrl(sd, 1);
-	if (ret) {
-		ret = gpio_ctrl(sd, 1);
-		if (ret)
-			goto fail_gpio;
-	}
-
-	msleep(100);
-
-	return 0;
-
-fail_gpio:
-	dev->platform_data->flisclk_ctrl(sd, 0);
-fail_clk:
-	power_ctrl(sd, 0);
-fail_power:
-	dev_err(&client->dev, "sensor power-up failed\n");
-
-	return ret;
-}
-
-static int power_down(struct v4l2_subdev *sd)
-{
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	if (!dev->platform_data) {
-		dev_err(&client->dev,
-			"no camera_sensor_platform_data");
-		return -ENODEV;
-	}
-
-	/* gpio ctrl */
-	ret = gpio_ctrl(sd, 0);
-	if (ret) {
-		ret = gpio_ctrl(sd, 0);
-		if (ret)
-			dev_err(&client->dev, "gpio failed 2\n");
-	}
-
-	ret = dev->platform_data->flisclk_ctrl(sd, 0);
-	if (ret)
-		dev_err(&client->dev, "flisclk failed\n");
-
-	/* power control */
-	ret = power_ctrl(sd, 0);
-	if (ret)
-		dev_err(&client->dev, "vprog failed.\n");
-
-	return ret;
-}
-
 static struct v4l2_mbus_framefmt *
 gc0310_get_pad_format(struct gc0310_device *dev,
 		      struct v4l2_subdev_state *state,
@@ -348,6 +221,8 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 		if (ret < 0)
 			goto error_power_down;
 
+		msleep(100);
+
 		ret = gc0310_write_reg_array(client, gc0310_reset_register,
 					     ARRAY_SIZE(gc0310_reset_register));
 		if (ret)
@@ -397,49 +272,16 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int gc0310_s_config(struct v4l2_subdev *sd,
-			   int irq, void *platform_data)
+static int gc0310_s_config(struct v4l2_subdev *sd)
 {
-	struct gc0310_device *dev = to_gc0310_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	if (!platform_data)
-		return -ENODEV;
-
-	dev->platform_data =
-	    (struct camera_sensor_platform_data *)platform_data;
-
-	mutex_lock(&dev->input_lock);
+	int ret;
 
 	ret = pm_runtime_get_sync(&client->dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "gc0310 power-up err.\n");
-		goto fail_power_on;
-	}
-
-	ret = dev->platform_data->csi_cfg(sd, 1);
-	if (ret)
-		goto fail_csi_cfg;
-
-	/* config & detect sensor */
-	ret = gc0310_detect(client);
-	if (ret) {
-		dev_err(&client->dev, "gc0310_detect err s_config.\n");
-		goto fail_csi_cfg;
-	}
-
-	/* turn off sensor, after probed */
-	pm_runtime_put(&client->dev);
-	mutex_unlock(&dev->input_lock);
-
-	return 0;
+	if (ret >= 0)
+		ret = gc0310_detect(client);
 
-fail_csi_cfg:
-	dev->platform_data->csi_cfg(sd, 0);
-fail_power_on:
 	pm_runtime_put(&client->dev);
-	mutex_unlock(&dev->input_lock);
 	return ret;
 }
 
@@ -535,8 +377,7 @@ static void gc0310_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "gc0310_remove...\n");
 
-	dev->platform_data->csi_cfg(sd, 0);
-
+	atomisp_unregister_subdev(sd);
 	v4l2_device_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrls.handler);
@@ -548,34 +389,35 @@ static int gc0310_probe(struct i2c_client *client)
 {
 	struct gc0310_device *dev;
 	int ret;
-	void *pdata;
 
 	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
+	ret = v4l2_get_acpi_sensor_info(&client->dev, NULL);
+	if (ret)
+		return ret;
+
+	dev->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(dev->reset))
+		return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
+				     "getting reset GPIO\n");
+
+	dev->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(dev->powerdown))
+		return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown),
+				     "getting powerdown GPIO\n");
+
 	mutex_init(&dev->input_lock);
 	v4l2_i2c_subdev_init(&dev->sd, client, &gc0310_ops);
 	gc0310_fill_format(&dev->mode.fmt);
 
-	pdata = gmin_camera_platform_data(&dev->sd,
-					  ATOMISP_INPUT_FORMAT_RAW_8,
-					  atomisp_bayer_order_grbg);
-	if (!pdata)
-		return -EINVAL;
-
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
 
-	ret = gc0310_s_config(&dev->sd, client->irq, pdata);
-	if (ret) {
-		gc0310_remove(client);
-		return ret;
-	}
-
-	ret = atomisp_register_i2c_module(&dev->sd, pdata, RAW_CAMERA);
+	ret = gc0310_s_config(&dev->sd);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
@@ -592,24 +434,42 @@ static int gc0310_probe(struct i2c_client *client)
 	}
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret)
+	if (ret) {
 		gc0310_remove(client);
+		return ret;
+	}
 
-	return ret;
+	ret = atomisp_register_sensor_no_gmin(&dev->sd, 1, ATOMISP_INPUT_FORMAT_RAW_8,
+					      atomisp_bayer_order_grbg);
+	if (ret) {
+		gc0310_remove(client);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int gc0310_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gc0310_device *gc0310_dev = to_gc0310_sensor(sd);
 
-	return power_down(sd);
+	gpiod_set_value_cansleep(gc0310_dev->powerdown, 1);
+	gpiod_set_value_cansleep(gc0310_dev->reset, 1);
+	return 0;
 }
 
 static int gc0310_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gc0310_device *gc0310_dev = to_gc0310_sensor(sd);
+
+	usleep_range(10000, 15000);
+	gpiod_set_value_cansleep(gc0310_dev->reset, 0);
+	usleep_range(10000, 15000);
+	gpiod_set_value_cansleep(gc0310_dev->powerdown, 0);
 
-	return power_up(sd);
+	return 0;
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_suspend, gc0310_resume, NULL);
diff --git a/drivers/staging/media/atomisp/i2c/gc0310.h b/drivers/staging/media/atomisp/i2c/gc0310.h
index 485a060b40ff..d40406289598 100644
--- a/drivers/staging/media/atomisp/i2c/gc0310.h
+++ b/drivers/staging/media/atomisp/i2c/gc0310.h
@@ -92,10 +92,11 @@ struct gc0310_device {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct mutex input_lock;
-
-	struct camera_sensor_platform_data *platform_data;
 	bool is_streaming;
 
+	struct gpio_desc *reset;
+	struct gpio_desc *powerdown;
+
 	struct gc0310_mode {
 		struct v4l2_mbus_framefmt fmt;
 	} mode;
-- 
2.39.1

