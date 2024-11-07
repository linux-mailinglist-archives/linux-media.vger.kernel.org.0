Return-Path: <linux-media+bounces-21046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B059C02E5
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 11:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C24B4B230A7
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4568E1EF943;
	Thu,  7 Nov 2024 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STEkhW8l"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30971E9068
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976581; cv=none; b=j1PAxNEWAGQyLSc3R4/fUjCFL41g0R3sl6pFnVxNlouETt0A5yViT+9R0p1XYuuTlVhXv2hLNn33fXatzOL45Rb/PtBnG7pSHQXE8T/fpamlgdhS8kmCjUSdoWDQv7aSdoQQn77VS44qHFwOoO4wFlQQyYbGrq04ZUpcu2Y3+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976581; c=relaxed/simple;
	bh=e4nvSgZedHChoFvznaRfnLYobEuVahuE0RYeUGf2RNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exGpACpE6H/sec4d+/borjYTjxzzxF8SS1cY9EYUk9mfuV2zmxH2H3NhdnyrRZO82Klc4EIllyr9LguHuJcYMLq93aNVIoW0jFAtguyRWg7vEqhA95ucbpmxNvjOIglCZx722Ml38r1heTxh8D98sr+0H1tvcMay93IrOoDl+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STEkhW8l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730976578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9oMEyd1DBbZfglJ5VDJvGMAnQbX+glDypiNb4tvdyY=;
	b=STEkhW8lBSkV6Ca6PQZYYrRWiyIzlOz9EhHNLeIq5ApAm4IxiH+3kyYAMOkBSR134yjZLk
	Q25WiFyn5xd5RB8RZwoe/bOuaiuwHof6Dr6afGkHuCCnqXsM6AHHqUxMfequwuh25QEWFG
	QfodG9EoatXuvB5mUarcDYQgOkir+Mg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-43-iV5WqIJ7OGGVIoEo0MFj6w-1; Thu,
 07 Nov 2024 05:49:35 -0500
X-MC-Unique: iV5WqIJ7OGGVIoEo0MFj6w-1
X-Mimecast-MFC-AGG-ID: iV5WqIJ7OGGVIoEo0MFj6w
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 132AF1955EA1;
	Thu,  7 Nov 2024 10:49:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 83ED81953880;
	Thu,  7 Nov 2024 10:49:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: Add driver for AD5823 VCM
Date: Thu,  7 Nov 2024 11:49:26 +0100
Message-ID: <20241107104926.257636-3-hdegoede@redhat.com>
In-Reply-To: <20241107104926.257636-1-hdegoede@redhat.com>
References: <20241107104926.257636-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add a driver for the AD5823 VCM. The driver creates a v4l2 subdevice
and registers a control to set the desired focus.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/Kconfig  |   8 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/ad5823.c | 312 +++++++++++++++++++++++++++++++++++++
 3 files changed, 321 insertions(+)
 create mode 100644 drivers/media/i2c/ad5823.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 0a30f309cd6b..d5b43755d8dc 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -759,6 +759,14 @@ config VIDEO_AD5820
 	  This is a driver for the AD5820 camera lens voice coil.
 	  It is used for example in Nokia N900 (RX-51).
 
+config VIDEO_AD5823
+	tristate "AD5823 lens voice coil support"
+	select V4L2_CCI_I2C
+	help
+	  This is a driver for the AD5823 camera lens voice coil / VCM.
+	  This is designed for linear control of voice coil motors,
+	  controlled via I2C serial interface.
+
 config VIDEO_AK7375
 	tristate "AK7375 lens voice coil support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 815b4983a8be..38d5b69279cf 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -4,6 +4,7 @@ msp3400-objs	:=	msp3400-driver.o msp3400-kthreads.o
 
 obj-$(CONFIG_SDR_MAX2175) += max2175.o
 obj-$(CONFIG_VIDEO_AD5820) += ad5820.o
+obj-$(CONFIG_VIDEO_AD5823) += ad5823.o
 obj-$(CONFIG_VIDEO_ADP1653) += adp1653.o
 obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
 obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
diff --git a/drivers/media/i2c/ad5823.c b/drivers/media/i2c/ad5823.c
new file mode 100644
index 000000000000..96e7ff3a8583
--- /dev/null
+++ b/drivers/media/i2c/ad5823.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Analog Devices AD5823 VCM driver
+ * Copyright 2023 - 2024 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#define AD5823_MAX_FOCUS_POS		1023
+
+#define AD5823_RESET			CCI_REG8(1)
+#define AD5823_RESET_RESET		BIT(0)
+
+#define AD5823_MODE			CCI_REG8(2)
+#define AD5823_ARC_RES1			0x01
+
+#define AD5823_VCM_MOVE_TIME		CCI_REG8(3)
+#define AD5823_VCM_MOVE_TIME_DEFAULT	0x80
+#define AD5823_RESONANCE_PERIOD		100000	/* in 0.1 us units */
+#define AD5823_RESONANCE_COEF		512	/* in 0.1 us units */
+
+#define AD5823_RESONANCE_OFFSET		0x80	/* for reg 0x02 bit 5 == 0 */
+
+#define AD5823_VCM_CODE			CCI_REG16(4)
+#define AD5823_VCM_CODE_RING_CTRL	BIT(10)
+
+#define AD5823_VCM_THRESHOLD		CCI_REG16(6)
+#define AD5823_VCM_THRESHOLD_DEFAULT	0x10
+
+#define to_ad5823_device(x) container_of(x, struct ad5823_device, sd)
+
+struct ad5823_device {
+	struct v4l2_subdev sd;
+	struct regmap *regmap;
+	struct regulator *regulator;
+	u32 arc_mode;
+	u32 resonance_period;	/* in 0.1 us units */
+
+	struct ad5823_v4l2_ctrls {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *focus;
+	} ctrls;
+};
+
+static int ad5823_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ad5823_device *ad5823 = container_of(ctrl->handler,
+						    struct ad5823_device,
+						    ctrls.handler);
+	int ret;
+
+	/* Only apply changes to the controls if the device is powered up */
+	if (!pm_runtime_get_if_in_use(ad5823->sd.dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_FOCUS_ABSOLUTE:
+		ret = cci_write(ad5823->regmap, AD5823_VCM_CODE,
+				AD5823_VCM_CODE_RING_CTRL | ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(ad5823->sd.dev);
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ad5823_ctrl_ops = {
+	.s_ctrl = ad5823_set_ctrl,
+};
+
+static int ad5823_power_down(struct ad5823_device *ad5823)
+{
+	return regulator_disable(ad5823->regulator);
+}
+
+static int ad5823_power_up(struct ad5823_device *ad5823, bool detect)
+{
+	u64 vcm_move_time, vcm_threshold;
+	int ret;
+
+	ret = regulator_enable(ad5823->regulator);
+	if (ret)
+		return ret;
+
+	cci_write(ad5823->regmap, AD5823_RESET, BIT(0), &ret);
+
+	if (detect) {
+		/* There is no id register, check for default reg values. */
+		cci_read(ad5823->regmap, AD5823_VCM_MOVE_TIME, &vcm_move_time, &ret);
+		cci_read(ad5823->regmap, AD5823_VCM_THRESHOLD, &vcm_threshold, &ret);
+
+		if (!ret && (vcm_move_time != AD5823_VCM_MOVE_TIME_DEFAULT ||
+			     vcm_threshold != AD5823_VCM_THRESHOLD_DEFAULT)) {
+			dev_err(ad5823->sd.dev, "Failed to detect AD5823 got move-time 0x%02llx vcm-threshold 0x%02llx\n",
+				vcm_move_time, vcm_threshold);
+			ret = -ENXIO;
+		}
+	}
+
+	vcm_move_time = ad5823->resonance_period / AD5823_RESONANCE_COEF -
+			AD5823_RESONANCE_OFFSET;
+
+	dev_dbg(ad5823->sd.dev, "mode 0x%02x move-time 0x%02llx\n",
+		ad5823->arc_mode, vcm_move_time);
+
+	cci_write(ad5823->regmap, AD5823_MODE, ad5823->arc_mode, &ret);
+	cci_write(ad5823->regmap, AD5823_VCM_MOVE_TIME, vcm_move_time, &ret);
+	if (ret)
+		ad5823_power_down(ad5823);
+
+	return ret;
+}
+
+static int ad5823_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ad5823_device *ad5823 = to_ad5823_device(sd);
+
+	return ad5823_power_down(ad5823);
+}
+
+static int ad5823_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ad5823_device *ad5823 = to_ad5823_device(sd);
+	int ret;
+
+	ret = ad5823_power_up(ad5823, false);
+	if (ret)
+		return ret;
+
+	/* Restore value of ctrls */
+	ret = v4l2_ctrl_handler_setup(&ad5823->ctrls.handler);
+	if (ret < 0)
+		dev_warn(dev, "Failed to restore focus ctrl value: %d\n", ret);
+
+	return 0;
+}
+
+static int ad5823_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int ad5823_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_put(sd->dev);
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops ad5823_internal_ops = {
+	.open = ad5823_open,
+	.close = ad5823_close,
+};
+
+static const struct v4l2_subdev_ops ad5823_ops = { };
+
+static int ad5823_init_controls(struct ad5823_device *ad5823)
+{
+	const struct v4l2_ctrl_ops *ops = &ad5823_ctrl_ops;
+	int ret;
+
+	v4l2_ctrl_handler_init(&ad5823->ctrls.handler, 1);
+
+	ad5823->ctrls.focus = v4l2_ctrl_new_std(&ad5823->ctrls.handler, ops,
+						V4L2_CID_FOCUS_ABSOLUTE, 0,
+						AD5823_MAX_FOCUS_POS, 1, 0);
+
+	if (ad5823->ctrls.handler.error) {
+		dev_err(ad5823->sd.dev, "Error initialising v4l2 ctrls\n");
+		ret = ad5823->ctrls.handler.error;
+		goto err_free_handler;
+	}
+
+	ad5823->sd.ctrl_handler = &ad5823->ctrls.handler;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&ad5823->ctrls.handler);
+	return ret;
+}
+
+static int ad5823_probe(struct i2c_client *client)
+{
+	struct ad5823_device *ad5823;
+	int ret;
+
+	ad5823 = devm_kzalloc(&client->dev, sizeof(*ad5823), GFP_KERNEL);
+	if (!ad5823)
+		return -ENOMEM;
+
+	ad5823->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(ad5823->regmap))
+		return PTR_ERR(ad5823->regmap);
+
+	ad5823->arc_mode = AD5823_ARC_RES1;
+	ad5823->resonance_period = AD5823_RESONANCE_PERIOD;
+
+	/* Optional indication of ARC mode select */
+	device_property_read_u32(&client->dev, "adi,arc-mode",
+				 &ad5823->arc_mode);
+
+	/* Optional indication of VCM resonance period */
+	device_property_read_u32(&client->dev, "adi,resonance-period",
+				 &ad5823->resonance_period);
+
+	ad5823->regulator = devm_regulator_get(&client->dev, "vdd");
+	if (IS_ERR(ad5823->regulator))
+		return dev_err_probe(&client->dev, PTR_ERR(ad5823->regulator),
+				     "getting regulator\n");
+
+	v4l2_i2c_subdev_init(&ad5823->sd, client, &ad5823_ops);
+	ad5823->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ad5823->sd.internal_ops = &ad5823_internal_ops;
+
+	ret = ad5823_init_controls(ad5823);
+	if (ret)
+		return ret;
+
+	ret = media_entity_pads_init(&ad5823->sd.entity, 0, NULL);
+	if (ret < 0)
+		goto err_free_ctrl_handler;
+
+	ad5823->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	/*
+	 * We need the driver to work in the event that pm runtime is disable in
+	 * the kernel, so power up and verify the chip now. In the event that
+	 * runtime pm is disabled this will leave the chip on, so that the lens
+	 * will work.
+	 */
+
+	ret = ad5823_power_up(ad5823, true);
+	if (ret)
+		goto err_cleanup_media;
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_get_noresume(&client->dev);
+	pm_runtime_enable(&client->dev);
+
+	ret = v4l2_async_register_subdev(&ad5823->sd);
+	if (ret < 0)
+		goto err_pm_runtime;
+
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+
+err_pm_runtime:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_put_noidle(&client->dev);
+	ad5823_power_down(ad5823);
+err_cleanup_media:
+	media_entity_cleanup(&ad5823->sd.entity);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&ad5823->ctrls.handler);
+
+	return ret;
+}
+
+static void ad5823_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ad5823_device *ad5823 =
+		container_of(sd, struct ad5823_device, sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_ctrl_handler_free(&ad5823->ctrls.handler);
+	media_entity_cleanup(&ad5823->sd.entity);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ad5823_power_down(ad5823);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct i2c_device_id ad5823_id_table[] = {
+	{ "ad5823" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ad5823_id_table);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ad5823_pm_ops, ad5823_suspend, ad5823_resume,
+				 NULL);
+
+static struct i2c_driver ad5823_i2c_driver = {
+	.driver = {
+		.name = "ad5823",
+		.pm = pm_sleep_ptr(&ad5823_pm_ops),
+	},
+	.probe = ad5823_probe,
+	.remove = ad5823_remove,
+	.id_table = ad5823_id_table,
+};
+module_i2c_driver(ad5823_i2c_driver);
+
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_DESCRIPTION("AD5823 VCM Driver");
+MODULE_LICENSE("GPL");
-- 
2.47.0


