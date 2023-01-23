Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A778677BED
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbjAWMze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbjAWMzd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:55:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1FA5B9C
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674478484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3Tj9yV9iaIL01PeQ9tN5zdZrLKlXPfL3vEAN29ZZ+QM=;
        b=LkloiQGiIj/RLHStjb4A/dQ0oyiM4jUdNVBtEdJv5c8DyYhaPjuM8pdqn3R3Vny9q1mWb7
        zBaL2yqNUxa5O6WFzlqZR7WPQenzZPVyou8nmpRw6Ebn8rxvHRvLVaRSkuNRW4xyjRq+Ws
        ykzhQ3NUEC8w4QhfrHEqtpCW2P7x9W0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-YMSTKFJNNNe0_MMdFFEEBA-1; Mon, 23 Jan 2023 07:54:38 -0500
X-MC-Unique: YMSTKFJNNNe0_MMdFFEEBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F5DF885620;
        Mon, 23 Jan 2023 12:54:38 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 80435C15BA0;
        Mon, 23 Jan 2023 12:54:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 50/57] media: atomisp: ov2680: Switch over to ACPI powermanagement
Date:   Mon, 23 Jan 2023 13:51:58 +0100
Message-Id: <20230123125205.622152-51-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
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

This has been tested on:
-Trekstor Surftab duo W1 10.1, CHT, AXP288 PMIC, 2x ov2680 sensor
-Asus T101HA, CHT, TI PMIC, 1x ov2680 sensor
-MPMAN Converter 9, BYT, AXP288 PMIC, ov2680 back, gc0310 front sensor

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 231 ++++--------------
 drivers/staging/media/atomisp/i2c/ov2680.h    |   3 +-
 2 files changed, 53 insertions(+), 181 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 2b4673092b6a..c5bd7ba1b502 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -17,6 +17,8 @@
 
 #include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -184,145 +186,6 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
 	return ret;
 }
 
-static int power_ctrl(struct v4l2_subdev *sd, bool flag)
-{
-	int ret = 0;
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-	if (!dev || !dev->platform_data)
-		return -ENODEV;
-
-	dev_dbg(&client->dev, "%s: %s", __func__, flag ? "on" : "off");
-
-	if (flag) {
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
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-
-	if (!dev || !dev->platform_data)
-		return -ENODEV;
-
-	/*
-	 * The OV2680 documents only one GPIO input (#XSHUTDN), but
-	 * existing integrations often wire two (reset/power_down)
-	 * because that is the way other sensors work.  There is no
-	 * way to tell how it is wired internally, so existing
-	 * firmwares expose both and we drive them symmetrically.
-	 */
-	if (flag) {
-		ret = dev->platform_data->gpio0_ctrl(sd, 1);
-		usleep_range(10000, 15000);
-		/* Ignore return from second gpio, it may not be there */
-		dev->platform_data->gpio1_ctrl(sd, 1);
-		usleep_range(10000, 15000);
-	} else {
-		dev->platform_data->gpio1_ctrl(sd, 0);
-		ret = dev->platform_data->gpio0_ctrl(sd, 0);
-	}
-	return ret;
-}
-
-static int power_up(struct v4l2_subdev *sd)
-{
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
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
-	/* according to DS, at least 5ms is needed between DOVDD and PWDN */
-	usleep_range(5000, 6000);
-
-	/* gpio ctrl */
-	ret = gpio_ctrl(sd, 1);
-	if (ret) {
-		ret = gpio_ctrl(sd, 1);
-		if (ret)
-			goto fail_power;
-	}
-
-	/* flis clock control */
-	ret = dev->platform_data->flisclk_ctrl(sd, 1);
-	if (ret)
-		goto fail_clk;
-
-	/* according to DS, 20ms is needed between PWDN and i2c access */
-	msleep(20);
-
-	ret = ov2680_init_registers(sd);
-	if (ret)
-		goto fail_init_registers;
-
-	return 0;
-
-fail_init_registers:
-	dev->platform_data->flisclk_ctrl(sd, 0);
-fail_clk:
-	gpio_ctrl(sd, 0);
-fail_power:
-	power_ctrl(sd, 0);
-	dev_err(&client->dev, "sensor power-up failed\n");
-
-	return ret;
-}
-
-static int power_down(struct v4l2_subdev *sd)
-{
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	if (!dev->platform_data) {
-		dev_err(&client->dev,
-			"no camera_sensor_platform_data");
-		return -ENODEV;
-	}
-
-	ret = dev->platform_data->flisclk_ctrl(sd, 0);
-	if (ret)
-		dev_err(&client->dev, "flisclk failed\n");
-
-	/* gpio ctrl */
-	ret = gpio_ctrl(sd, 0);
-	if (ret) {
-		ret = gpio_ctrl(sd, 0);
-		if (ret)
-			dev_err(&client->dev, "gpio failed 2\n");
-	}
-
-	/* power control */
-	ret = power_ctrl(sd, 0);
-	if (ret) {
-		dev_err(&client->dev, "vprog failed.\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static struct v4l2_mbus_framefmt *
 __ov2680_get_pad_format(struct ov2680_device *sensor,
 			struct v4l2_subdev_state *state,
@@ -593,20 +456,10 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int ov2680_s_config(struct v4l2_subdev *sd,
-			   int irq, void *platform_data)
+static int ov2680_s_config(struct v4l2_subdev *sd)
 {
-	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	if (!platform_data)
-		return -ENODEV;
-
-	sensor->platform_data =
-	    (struct camera_sensor_platform_data *)platform_data;
-
-	mutex_lock(&sensor->input_lock);
+	int ret;
 
 	ret = pm_runtime_get_sync(&client->dev);
 	if (ret < 0) {
@@ -614,29 +467,13 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
 		goto fail_power_on;
 	}
 
-	ret = sensor->platform_data->csi_cfg(sd, 1);
-	if (ret)
-		goto fail_csi_cfg;
-
 	/* config & detect sensor */
 	ret = ov2680_detect(client);
-	if (ret) {
+	if (ret)
 		dev_err(&client->dev, "ov2680_detect err s_config.\n");
-		goto fail_csi_cfg;
-	}
 
-	/* turn off sensor, after probed */
-	pm_runtime_put(&client->dev);
-	mutex_unlock(&sensor->input_lock);
-
-	return 0;
-
-fail_csi_cfg:
-	sensor->platform_data->csi_cfg(sd, 0);
 fail_power_on:
 	pm_runtime_put(&client->dev);
-	dev_err(&client->dev, "sensor power-gating failed\n");
-	mutex_unlock(&sensor->input_lock);
 	return ret;
 }
 
@@ -774,19 +611,32 @@ static void ov2680_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "ov2680_remove...\n");
 
-	sensor->platform_data->csi_cfg(sd, 0);
-
+	atomisp_unregister_subdev(sd);
 	v4l2_device_unregister_subdev(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	pm_runtime_disable(&client->dev);
 }
 
+/*
+ * Unlike other sensors which have both a rest and powerdown input pins,
+ * the OV2680 only has a powerdown input. But some ACPI tables still list
+ * 2 GPIOs for the OV2680 and it is unclear which to use. So try to get
+ * up to 2 GPIOs (1 mandatory, 1 optional) and control them in sync.
+ */
+static const struct acpi_gpio_params ov2680_first_gpio = { 0, 0, true };
+static const struct acpi_gpio_params ov2680_second_gpio = { 1, 0, true };
+
+static const struct acpi_gpio_mapping ov2680_gpio_mapping[] = {
+	{ "powerdown-gpios", &ov2680_first_gpio, 1 },
+	{ "powerdown-alt-gpios", &ov2680_second_gpio, 1 },
+	{ },
+};
+
 static int ov2680_probe(struct i2c_client *client)
 {
 	struct ov2680_device *sensor;
 	int ret;
-	void *pdata;
 
 	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
 	if (!sensor)
@@ -797,18 +647,24 @@ static int ov2680_probe(struct i2c_client *client)
 	sensor->client = client;
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
 
-	pdata = gmin_camera_platform_data(&sensor->sd,
-					  ATOMISP_INPUT_FORMAT_RAW_10,
-					  atomisp_bayer_order_bggr);
-	if (!pdata)
-		return -EINVAL;
+	ret = devm_acpi_dev_add_driver_gpios(&client->dev, ov2680_gpio_mapping);
+	if (ret)
+		return ret;
+
+	sensor->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->powerdown))
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown), "getting powerdown GPIO\n");
+
+	sensor->powerdown_alt = devm_gpiod_get_optional(&client->dev, "powerdown-alt", GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->powerdown_alt))
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown_alt), "getting powerdown-alt GPIO\n");
 
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
 
-	ret = ov2680_s_config(&sensor->sd, client->irq, pdata);
+	ret = ov2680_s_config(&sensor->sd);
 	if (ret)
 		return ret;
 
@@ -830,7 +686,8 @@ static int ov2680_probe(struct i2c_client *client)
 
 	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
 
-	ret = atomisp_register_i2c_module(&sensor->sd, pdata, RAW_CAMERA);
+	ret = atomisp_register_sensor_no_gmin(&sensor->sd, 1, ATOMISP_INPUT_FORMAT_RAW_10,
+					      atomisp_bayer_order_bggr);
 	if (ret) {
 		ov2680_remove(client);
 		return ret;
@@ -842,15 +699,29 @@ static int ov2680_probe(struct i2c_client *client)
 static int ov2680_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 
-	return power_down(sd);
+	gpiod_set_value_cansleep(sensor->powerdown, 1);
+	gpiod_set_value_cansleep(sensor->powerdown_alt, 1);
+	return 0;
 }
 
 static int ov2680_resume(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2680_device *sensor = to_ov2680_sensor(sd);
 
-	return power_up(sd);
+	/* according to DS, at least 5ms is needed after DOVDD (enabled by ACPI) */
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(sensor->powerdown, 0);
+	gpiod_set_value_cansleep(sensor->powerdown_alt, 0);
+
+	/* according to DS, 20ms is needed between PWDN and i2c access */
+	msleep(20);
+
+	ov2680_init_registers(sd);
+	return 0;
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov2680_pm_ops, ov2680_suspend, ov2680_resume, NULL);
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 58593da50f6f..a2ed5a1edf35 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -119,7 +119,8 @@ struct ov2680_device {
 	struct media_pad pad;
 	struct mutex input_lock;
 	struct i2c_client *client;
-	struct camera_sensor_platform_data *platform_data;
+	struct gpio_desc *powerdown;
+	struct gpio_desc *powerdown_alt;
 	bool is_streaming;
 
 	struct ov2680_mode {
-- 
2.39.0

