Return-Path: <linux-media+bounces-27527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D7A4ED64
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 960997A8794
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FEE276D3C;
	Tue,  4 Mar 2025 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Y6vRqh4L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF68260384;
	Tue,  4 Mar 2025 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116749; cv=none; b=m1lsRBBGLRRDWbaI8WLnoOyD6GdbNYFKlOy1DI+Zw4s3H0AVa/zvvzRtGaMi9HH2/QixuGBmuDON59oe51+D4H/AsTjiEKGKaS1Wlb9Xm9OluaQkre3a4mbqyPHLszU+qMAbwZNgJ5prcQ/7TT9mr0mGWfSM19nPydgMH9qQUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116749; c=relaxed/simple;
	bh=yq0FNK2cRC707WXhZqTcNMaGYykukvLuH96mp4sMtns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tMkiD8XlD9NjjatRqYhWr62ZHLyc9S9+kwSLAa19ohk2oT8W5xpppqQvgpj96pgA0+/xCme9SR068Aaly0S3pZMk5esY/wiDVU3YC+dYnmMFCCb0FaCtNyDgKt7vr3B15eXSs0UV2EZ1qB4vdZiVU8ruP763/S0RnfMy9V1hUc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Y6vRqh4L; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.78] (unknown [45.136.247.92])
	by mail.mainlining.org (Postfix) with ESMTPSA id A316CBBEE8;
	Tue,  4 Mar 2025 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741116745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckPssTrKMktRUpJ0aj4vrjrbuYXucVZeA/vL65l1sN0=;
	b=Y6vRqh4LGdEKdfRW3oQmhP2qS7E1lJXoTNimK24gFieFiU3bb2SYdVTpneEtaP64jygAaR
	qEHwUM8mnj9WN6wSnpYa3Rs/vPNe1EHI4h2XMNsAbjzyKd9YGyPQCPGf7tnU7sAMFsHfHp
	dT5A5xLH9dPJ5gWGKr7kw4284Tlgiq2HiC+p+c5OAdm8wozNNh0liTOohBMP1eRDbh93gm
	QLNirJgNYsR23hm3rUMh5y43ucJO2fsI4A0g8x6UDr7FE878c3tHZTRNXkaVH49Cf+NgD/
	tH2NEL4JlJ8CstsOTQjbtjmd0oJgvejZPipK6WSKpoGYSSxHhfdRPVEoTTq/aw==
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Tue, 04 Mar 2025 22:32:20 +0300
Subject: [PATCH v2 3/3] media: i2c: Add driver for LC898217XC VCM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-media-i2c-lc898217xc-initial-driver-v2-3-6a463cef3ea8@mainlining.org>
References: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
In-Reply-To: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux@mainlining.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8861;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=yq0FNK2cRC707WXhZqTcNMaGYykukvLuH96mp4sMtns=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNKPh7rMEnvfeP3mlqrq+Srn5EoWZ4vtLnXUXr8k2/nyn
 dz2UDG+jlIWBjEuBlkxRRabjR6zxfLDJSdNe6oAM4eVCWQIAxenAEzkJDfDX6mqHEGXLNaus0eM
 zsRblf93OsZzSS0v/5ZXntfkcLMTGgz/DPldJ1Z5Pz4ft/v7xyALdZvGqyby+v+K3jyTfbNASEO
 DDQA=
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582

LC898217XC is a 11 bit DAC, designed for linear control
of voice coil motor. This driver creates a V4L2 subdevice
and provides control to set the desired focus.

Tested on Oneplus 6 (oneplus-enchilada)

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 drivers/media/i2c/Kconfig      |  11 ++
 drivers/media/i2c/Makefile     |   1 +
 drivers/media/i2c/lc898217xc.c | 240 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 252 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 85ecb2aeefdbfff744c8de86866560518abeace1..aa16d4729ba914e774da2ada228b00cfd2462080 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -794,6 +794,17 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_LC898217XC
+	tristate "LC898217XC lens voice coil support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
+	help
+	  This is a driver for the LC898217XC camera lens voice coil.
+	  LC898217XC is a 11 bit DAC with 110mA output current sink
+	  capability. This is designed for linear control of
+	  voice coil motors, controlled via I2C serial interface.
 endmenu
 
 menu "Flash devices"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fbb988bd067a1b8b577248811f18a15671eb8932..514b61a7e8769457c2e831df4cbe3c4aabc6ed1c 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_VIDEO_IMX415) += imx415.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
+obj-$(CONFIG_VIDEO_LC898217XC) += lc898217xc.o
 obj-$(CONFIG_VIDEO_LM3560) += lm3560.o
 obj-$(CONFIG_VIDEO_LM3646) += lm3646.o
 obj-$(CONFIG_VIDEO_M52790) += m52790.o
diff --git a/drivers/media/i2c/lc898217xc.c b/drivers/media/i2c/lc898217xc.c
new file mode 100644
index 0000000000000000000000000000000000000000..86afbf88e72a078da131a26ac0bc89ec2a2c92ff
--- /dev/null
+++ b/drivers/media/i2c/lc898217xc.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2025 Vasiliy Doylov <nekocwd@mainlining.org>
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-async.h>
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
+
+#define LC898217XC_MSB_ADDR 132
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
+
+	return i2c_smbus_write_word_swapped(client, LC898217XC_MSB_ADDR, val);
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
+	struct lc898217xc *lc898217xc =
+		container_of(ctrl->handler, struct lc898217xc, ctrls);
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
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&lc898217xc->sd, client, &lc898217xc_ops);
+
+	for (i = 0; i < ARRAY_SIZE(lc898217xc_supply_names); i++)
+		lc898217xc->supplies[i].supply = lc898217xc_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(lc898217xc_supply_names),
+				      lc898217xc->supplies);
+
+	if (ret) {
+		dev_err(dev, "failed to get regulators\n");
+		return ret;
+	}
+
+	/* Initialize controls */
+	ret = lc898217xc_init_controls(lc898217xc);
+	if (ret)
+		goto err_free_handler;
+
+	/* Initialize subdev */
+	lc898217xc->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+				V4L2_SUBDEV_FL_HAS_EVENTS;
+	lc898217xc->sd.internal_ops = &lc898217xc_int_ops;
+
+	ret = media_entity_pads_init(&lc898217xc->sd.entity, 0, NULL);
+	if (ret < 0)
+		goto err_free_handler;
+
+	lc898217xc->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	pm_runtime_enable(dev);
+	ret = v4l2_async_register_subdev(&lc898217xc->sd);
+
+	if (ret < 0) {
+		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
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
2.48.1


