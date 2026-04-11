Return-Path: <linux-media+bounces-58584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPPoGflI2mnWzggAu9opvQ
	(envelope-from <linux-media+bounces-58584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:13:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2F3E0131
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 15:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BACCD3022CBD
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB3126ED25;
	Sat, 11 Apr 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK3mf4XT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB42F851;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913193; cv=none; b=qBus0IfqcvJdEghST07MiRhbbcw4Kl/hFQbJw9VqOjFYT9FXnnLkMVLiFrsZVurJizdA7XmJX8/1dffdeUEDam5aOxINCCeO1VzX3ylnMNzhOWetycVwesi8LrTDt3aAnKAO3H2cjxy5pV1XcHbgoq8pehGPFZE7vgo2I3kh5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913193; c=relaxed/simple;
	bh=NPbaH7Mb+r/zpV26RDSQgYlKwVA7SmYmCbAKpHFrDCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViH/ojLwrdiSjHLigsxE8g1tr/7VvXp5E7fzGjUK9tu/pEVNiDOtzIyqPa5WO63wQQbGJlX455FaD5eMsKO4EdSpH7BTwx+Q30BABjOJbH4Fcgj2IS17sJOGS1od8+6OgRlWjz3rKg1EPhbJH8WPirmioQkxlDm7pQ1ZPLhGn+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK3mf4XT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9573C2BCB1;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775913193;
	bh=NPbaH7Mb+r/zpV26RDSQgYlKwVA7SmYmCbAKpHFrDCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CK3mf4XTf5WexYh0kgphv4HmWbfah3rA8LoSQJM+OiJ0A0vSNikcYn+CwQhpIDE+E
	 4NfLuTjK/L65jdStYXJQNL7i6J4pZowvy4fnhoODGbSsAJh71+qiZRLxuUo3aOjaBO
	 LvMVR3LQO8b4ASUtwUdZA3dYFHGa14IbPJtqHVTM7us9YjxKnr9zJ9I2VnTE4AxBKC
	 Kl6w3vO5VMlDm2jgXgBRX30VnmWuaHclMw3TVOO1BrswXkxXuz/EXdl8PjxiI0oEn7
	 id/cM4pZNGWHuN6rJhPTBq+FIpCnxXYrwJvhIFUc1Fy5x7SoabonA/yRMA75FkdKcs
	 bSpa78P4tXpwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF09F3ED51;
	Sat, 11 Apr 2026 13:13:13 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekocwd.mainlining.org@kernel.org>
Date: Sat, 11 Apr 2026 16:13:09 +0300
Subject: [PATCH v5 2/3] media: i2c: Add driver for LC898217XC VCM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-media-i2c-lc898217xc-initial-driver-v5-2-c71ddcf40bad@mainlining.org>
References: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
In-Reply-To: <20260411-media-i2c-lc898217xc-initial-driver-v5-0-c71ddcf40bad@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, david@ixit.cz
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10078;
 i=nekocwd@mainlining.org; h=from:subject:message-id;
 bh=w1xMhHNxEs24H0rzdzEcBr0nZ8bjdNTC98l7g7zZsq4=;
 b=owGbwMvMwCVmXFbadLHr1XTG02pJDJm3PF6oRpqafHtg/fJww+29cbb7NLaofvvY9mF1OMNGV
 uWfgjuFOkpZGMS4GGTFFFm63x++92AeL2up+idemDmsTCBDGLg4BWAiBwwYGb4tP9sXNuch/zLN
 zYqFSw5efJCS73n6nLFrwqSFZRqnTwkxMvSEbq5N29ikuN/oxRebXa5rt5ldfMmc5VuvKsBj7en
 ykxMA
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=8BEFC3DEE09E0D057527F20D33767582D18AEA97
X-Endpoint-Received: by B4 Relay for nekocwd@mainlining.org/default with
 auth_id=692
X-Original-From: Vasiliy Doylov <nekocwd@mainlining.org>
Reply-To: nekocwd@mainlining.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58584-lists,linux-media=lfdr.de,nekocwd.mainlining.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mainlining.org,protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[nekocwd@mainlining.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62E2F3E0131
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasiliy Doylov <nekocwd@mainlining.org>

LC898217XC is a 11 bit DAC, designed for linear control
of voice coil motor. This driver creates a V4L2 subdevice
and provides control to set the desired focus.

Tested on Oneplus 6 (oneplus-enchilada)

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 drivers/media/i2c/Kconfig      |   9 ++
 drivers/media/i2c/Makefile     |   1 +
 drivers/media/i2c/lc898217xc.c | 289 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 299 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8f2ba4121586..346dd4a14105 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -926,6 +926,15 @@ config VIDEO_DW9807_VCM
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
index 90b276a7417a..f55c44feca53 100644
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
index 000000000000..cfac7e7ce3d6
--- /dev/null
+++ b/drivers/media/i2c/lc898217xc.c
@@ -0,0 +1,289 @@
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
+	"vdd",
+	"vana",
+};
+
+struct lc898217xc {
+	struct regulator_bulk_data supplies[ARRAY_SIZE(lc898217xc_supply_names)];
+	struct v4l2_ctrl_handler ctrls;
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
+static int lc898217xc_power_on(struct lc898217xc *lc898217xc)
+{
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(lc898217xc_supply_names),
+				    lc898217xc->supplies);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(8000, 10000);
+	return 0;
+}
+
+static int lc898217xc_power_off(struct lc898217xc *lc898217xc)
+{
+	regulator_bulk_disable(ARRAY_SIZE(lc898217xc_supply_names),
+			       lc898217xc->supplies);
+	return 0;
+}
+
+static int __maybe_unused lc898217xc_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
+
+	lc898217xc_power_off(lc898217xc);
+	return 0;
+}
+
+static int __maybe_unused lc898217xc_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct lc898217xc *lc898217xc = sd_to_lc898217xc(sd);
+	int ret;
+
+	ret = lc898217xc_power_on(lc898217xc);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	__v4l2_ctrl_handler_setup(&lc898217xc->ctrls);
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
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
+			  LC898217XC_MIN_FOCUS_POS,
+			  LC898217XC_MAX_FOCUS_POS,
+			  LC898217XC_FOCUS_STEPS, 0);
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
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	ret = lc898217xc_power_on(lc898217xc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable regulators\n");
+
+	ret = lc898217xc_init_controls(lc898217xc);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to init v4l2 controls\n");
+		goto err_power_off;
+	}
+
+	/* Initialize subdev */
+	lc898217xc->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
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
+	/*
+	 * Enable runtime PM. As the device has been powered manually, mark it
+	 * as active, and increase the usage count without resuming the device.
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+
+	ret = v4l2_async_register_subdev(&lc898217xc->sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
+		goto err_pm;
+	}
+
+	/*
+	 * Finally, enable autosuspend and decrease the usage count. The device
+	 * will get suspended after the autosuspend delay, turning the power
+	 * off.
+	 */
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+err_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	media_entity_cleanup(&lc898217xc->sd.entity);
+err_free_handler:
+	v4l2_ctrl_handler_free(&lc898217xc->ctrls);
+err_power_off:
+	lc898217xc_power_off(lc898217xc);
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
+
+	/*
+	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
+	 * make sure to turn power off manually.
+	 */
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		lc898217xc_power_off(lc898217xc);
+	pm_runtime_set_suspended(dev);
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
2.50.1



