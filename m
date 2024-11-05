Return-Path: <linux-media+bounces-20960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812E9BD72C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 21:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BB791F23D4A
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 20:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBBF1F9434;
	Tue,  5 Nov 2024 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f45dXm0x"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E58D1CB9E6
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730839393; cv=none; b=nqiebqh+LEma+a/Ap4bIHSgdqb43kwN3193BqikLfK5R4ItqXwWzDys5L7Lpdm+8K4EKzO7LruPE4KxPX0CI3uS/fr7cQS60I2SHONb0trHpHMybwMC89sxZtj2xRJVYlv551KscarMDV5GWfAbi1T0ivv2A5i4uENnY6nZr3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730839393; c=relaxed/simple;
	bh=mI7Vszn6HgAS0FaRXoxm0lBHSxVapWQ1gJc3fa09Drg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZ7NEqicgXPOJp2mexwyaf7pTUnIaeXKdoUcY6p6Y3Hn+EfWMjPfKOYusTVrbEVwUegtKbWU7C3YVbsjXNHJDTrF3Vk/RVonAlTXFF1RPPAOGSj+iYFoiYcYK8HiYyFcNQuKENMoqNT5PhDD2T9qfwRJqKOkfg10ZzFKkxpt5J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f45dXm0x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730839390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V8eW3oYudixQZIWtLcKztMxs84LfSKHTvEgUtap3QJs=;
	b=f45dXm0xfBLNOPSoaVVD6XfH3d6YZhf+WqJBVZ9aviQWP8bwmZ1aV4cMUtdoHr9rh6zNxN
	Y1bIxJY6zSxDCNAkqnC8/8UkvwtzIboajD7s5Y9D+cvs6xIouJygzpIV4VuumyE0Cg3xW0
	lSXj0mKc56Z1l6Pcpe7n+5rg1C7eFoo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-156-wi7O9K0hP9uYwrL-Mk608g-1; Tue,
 05 Nov 2024 15:43:06 -0500
X-MC-Unique: wi7O9K0hP9uYwrL-Mk608g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 196D41955F45;
	Tue,  5 Nov 2024 20:42:50 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.108])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E2C6619560AA;
	Tue,  5 Nov 2024 20:42:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: Add driver for AD5823 VCM
Date: Tue,  5 Nov 2024 21:42:46 +0100
Message-ID: <20241105204246.30097-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

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
index 0e0c7cfdee26..dd81de88e1e2 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -763,6 +763,14 @@ config VIDEO_AD5820
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
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 4ce92b8b0683..2518ac751117 100644
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


