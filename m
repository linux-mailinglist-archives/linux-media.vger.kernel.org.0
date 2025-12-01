Return-Path: <linux-media+bounces-47949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 03731C9752D
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 13:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9FFBD3438B2
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 12:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD05830EF7B;
	Mon,  1 Dec 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ty+NHwCS";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aBWkb8x6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9E2550AF;
	Mon,  1 Dec 2025 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592891; cv=none; b=BOodaMi9JDJNFiVmvcTPdnRd3FvccZufPVmGyzJYyyp4KOn4PrnI+uejw+64tsuHFNsRiVfreXWp2qlQS+j9tNjtEeszCb3AGH8OE9Elqfjugmyl7yiShA8/UiHpZHnwKoDriQaDbiaSjJveqyhFJJM/IWJGOpGRmtLbpulJiek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592891; c=relaxed/simple;
	bh=OYdDEDwnJEDj578kwXWAXYO+Z3HwQ+ux9C5Q0UN7geg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sASKsXETYILOBo+mvW1fVF++BjD9MIIdpS37B8FYcmJeF6BXjIHqjKvw9twDMMA22nDj25DjlxIxnJe0Lphyou+8tsSuQNBz2hIDJBKIkNzqRSCr37jcjtRU29ri+Z5eSP1XYMenufZ4xBLngEi/ZFaOxIMN139jkK1AJGqLjfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ty+NHwCS; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aBWkb8x6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1764592856; bh=JN+ZmCkufByL3XuEAc9xzM1
	yFwWcEP3po6y+bdDdEy0=; b=Ty+NHwCSPcGZ6X9VxyeUSecHvu08k+LRi4m6WMUyGiQnCKIWyD
	gbqnuEC5tJVIVpZ1D3YHsDLF9AUUbI4Ss/nuKfZOBLFC5Pwq3H5rNyvZSWQROJvrwA7QybnWOYB
	w6msvQVjS+cdc5MbXvkX6zWa8KRIzm2hhcPXq8BhCcKxP6hbjDneeEZDqMWphcvF9ZMySb8nxTC
	hN96B8jw/+myLsI4lwOA2EgxKFohf+0KuhZMDLgcFWEyMjM3jI8xw7INQMKzk8CYetwuy7m5jZw
	B85etRPFp9XEvxr05KJ2uvXdhpoE5zzZM7m4ae7idP61RkTUWsbOKXAKXISxu8X5IQA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1764592856; bh=JN+ZmCkufByL3XuEAc9xzM1
	yFwWcEP3po6y+bdDdEy0=; b=aBWkb8x6grSGOCxGBYpEleaLg2/8AXgefk1igtGpWD3W529sjE
	7+bD08xUqVh7pYCMDYdhma3eTFWznm6h5zAQ==;
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Mon, 01 Dec 2025 15:40:44 +0300
Subject: [PATCH v3 2/3] media: i2c: Add driver for LC898217XC VCM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-media-i2c-lc898217xc-initial-driver-v3-2-46e23897e921@mainlining.org>
References: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
In-Reply-To: <20251201-media-i2c-lc898217xc-initial-driver-v3-0-46e23897e921@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9154;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=OYdDEDwnJEDj578kwXWAXYO+Z3HwQ+ux9C5Q0UN7geg=;
 b=owGbwMvMwCXGd//xporA/cmMp9WSGDJ1e65H/bpXs/L+3cX7FINsJzDIbOlwq1oWpKy2/v1nz
 Xq5E15HO0pZGMS4GGTFFFn+Gy6SO3BD2bMuN/UZzBxWJpAhDFycAjAR/ypGhq9vdM4HLkzY2VB4
 t/pjn4TX1tiT37buKxLKnC+2XKMoTp+RYbNe4XLNGXosGyUmKW/bFVbfpfCG54z/nq02jF/YsrL
 iGAE=
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=FF31A21EC0D823497E6D65E60EDFE3B27851BF63

LC898217XC is a 11 bit DAC, designed for linear control
of voice coil motor. This driver creates a V4L2 subdevice
and provides control to set the desired focus.

Tested on Oneplus 6 (oneplus-enchilada)

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 drivers/media/i2c/Kconfig      |   9 ++
 drivers/media/i2c/Makefile     |   1 +
 drivers/media/i2c/lc898217xc.c | 254 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 264 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..ee071505223f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -866,6 +866,15 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_LC898217XC
+	tristate "LC898217XC lens voice coil support"
+	select V4L2_CCI_I2C
+	help
+	  This is a driver for the LC898217XC camera lens voice coil.
+	  LC898217XC is a 11 bit DAC with 110mA output current sink
+	  capability. This is designed for linear control of
+	  voice coil motors, controlled via I2C serial interface.
+
 endif
 
 menu "Flash devices"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index c5f17602454f..a17774eeb43c 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_IMX415) += imx415.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
+obj-$(CONFIG_VIDEO_LC898217XC) += lc898217xc.o
 obj-$(CONFIG_VIDEO_LM3560) += lm3560.o
 obj-$(CONFIG_VIDEO_LM3646) += lm3646.o
 obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
diff --git a/drivers/media/i2c/lc898217xc.c b/drivers/media/i2c/lc898217xc.c
new file mode 100644
index 000000000000..c2d75bd36ddb
--- /dev/null
+++ b/drivers/media/i2c/lc898217xc.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2025 Vasiliy Doylov <nekocwd@mainlining.org>
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-event.h>
+
+#define LC898217XC_NAME "lc898217xc"
+/* Actuator has 11 bit resolution */
+#define LC898217XC_MAX_FOCUS_POS (2048 - 1)
+#define LC898217XC_MIN_FOCUS_POS 0
+#define LC898217XC_FOCUS_STEPS 1
+#define LC898217XC_DAC_ADDR CCI_REG16(0x84)
+
+static const char *const lc898217xc_supply_names[] = {
+	"vcc",
+};
+
+struct lc898217xc {
+	struct regulator_bulk_data supplies[ARRAY_SIZE(lc898217xc_supply_names)];
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *focus;
+	struct v4l2_subdev sd;
+	struct regmap *regmap;
+};
+
+static inline struct lc898217xc *sd_to_lc898217xc(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct lc898217xc, sd);
+}
+
+static int lc898217xc_set_dac(struct lc898217xc *lc898217xc, u16 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&lc898217xc->sd);
+	int ret;
+
+	ret = cci_write(lc898217xc->regmap, LC898217XC_DAC_ADDR, val, NULL);
+	if (ret)
+		dev_err(&client->dev, "failed to set DAC: %d\n", ret);
+
+	return ret;
+}
+
+static int __maybe_unused lc898217xc_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
+
+	regulator_bulk_disable(ARRAY_SIZE(lc898217xc_supply_names),
+			       lc898217xc->supplies);
+
+	return 0;
+}
+
+static int __maybe_unused lc898217xc_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(lc898217xc_supply_names),
+				    lc898217xc->supplies);
+
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	usleep_range(8000, 10000);
+
+	return ret;
+}
+
+static int lc898217xc_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct lc898217xc *lc898217xc = container_of(ctrl->handler,
+						     struct lc898217xc, ctrls);
+
+	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
+		return lc898217xc_set_dac(lc898217xc, ctrl->val);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops lc898217xc_ctrl_ops = {
+	.s_ctrl = lc898217xc_set_ctrl,
+};
+
+static int lc898217xc_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int lc898217xc_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_mark_last_busy(sd->dev);
+	pm_runtime_put_autosuspend(sd->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops lc898217xc_int_ops = {
+	.open = lc898217xc_open,
+	.close = lc898217xc_close,
+};
+
+static const struct v4l2_subdev_core_ops lc898217xc_core_ops = {
+	.log_status = v4l2_ctrl_subdev_log_status,
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops lc898217xc_ops = {
+	.core = &lc898217xc_core_ops,
+};
+
+static int lc898217xc_init_controls(struct lc898217xc *lc898217xc)
+{
+	struct v4l2_ctrl_handler *hdl = &lc898217xc->ctrls;
+	const struct v4l2_ctrl_ops *ops = &lc898217xc_ctrl_ops;
+
+	v4l2_ctrl_handler_init(hdl, 1);
+
+	lc898217xc->focus = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
+					      LC898217XC_MIN_FOCUS_POS,
+					      LC898217XC_MAX_FOCUS_POS,
+					      LC898217XC_FOCUS_STEPS, 0);
+
+	if (hdl->error)
+		return hdl->error;
+
+	lc898217xc->sd.ctrl_handler = hdl;
+
+	return 0;
+}
+
+static int lc898217xc_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct lc898217xc *lc898217xc;
+	unsigned int i;
+	int ret;
+
+	lc898217xc = devm_kzalloc(dev, sizeof(*lc898217xc), GFP_KERNEL);
+	if (!lc898217xc)
+		return -ENOMEM;
+
+	lc898217xc->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(lc898217xc->regmap))
+		return dev_err_probe(dev, PTR_ERR(lc898217xc->regmap),
+				     "failed to initialize CCI\n");
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&lc898217xc->sd, client, &lc898217xc_ops);
+
+	for (i = 0; i < ARRAY_SIZE(lc898217xc_supply_names); i++)
+		lc898217xc->supplies[i].supply = lc898217xc_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(lc898217xc_supply_names),
+				      lc898217xc->supplies);
+
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	/* Initialize controls */
+	ret = lc898217xc_init_controls(lc898217xc);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to init v4l2 controls\n");
+		goto err_free_handler;
+	}
+
+	/* Initialize subdev */
+	lc898217xc->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+				V4L2_SUBDEV_FL_HAS_EVENTS;
+	lc898217xc->sd.internal_ops = &lc898217xc_int_ops;
+
+	ret = media_entity_pads_init(&lc898217xc->sd.entity, 0, NULL);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to init media entity pads");
+		goto err_free_handler;
+	}
+
+	lc898217xc->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	pm_runtime_enable(dev);
+	ret = v4l2_async_register_subdev(&lc898217xc->sd);
+
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
+		goto err_power_off;
+	}
+
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_power_off:
+	pm_runtime_disable(dev);
+	media_entity_cleanup(&lc898217xc->sd.entity);
+err_free_handler:
+	v4l2_ctrl_handler_free(&lc898217xc->ctrls);
+
+	return ret;
+}
+
+static void lc898217xc_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
+	struct device *dev = &client->dev;
+
+	v4l2_async_unregister_subdev(&lc898217xc->sd);
+	v4l2_ctrl_handler_free(&lc898217xc->ctrls);
+	media_entity_cleanup(&lc898217xc->sd.entity);
+	pm_runtime_disable(dev);
+}
+
+static const struct of_device_id lc898217xc_of_table[] = {
+	{ .compatible = "onnn,lc898217xc" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, lc898217xc_of_table);
+
+static const struct dev_pm_ops lc898217xc_pm_ops = {
+	SET_RUNTIME_PM_OPS(lc898217xc_runtime_suspend,
+			   lc898217xc_runtime_resume, NULL)
+};
+
+static struct i2c_driver lc898217xc_i2c_driver = {
+	.driver = {
+		.name = LC898217XC_NAME,
+		.pm = &lc898217xc_pm_ops,
+		.of_match_table = lc898217xc_of_table,
+	},
+	.probe = lc898217xc_probe,
+	.remove = lc898217xc_remove,
+};
+module_i2c_driver(lc898217xc_i2c_driver);
+
+MODULE_AUTHOR("Vasiliy Doylov <nekocwd@mainlining.org>");
+MODULE_DESCRIPTION("Onsemi LC898217XC VCM driver");
+MODULE_LICENSE("GPL");

-- 
2.52.0


