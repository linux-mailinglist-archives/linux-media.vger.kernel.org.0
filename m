Return-Path: <linux-media+bounces-50936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE4D38C17
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 05:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D70D5303C9B5
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 04:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AB23126B3;
	Sat, 17 Jan 2026 04:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbdRNql8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC4830BF6A
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 04:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622806; cv=none; b=mjl0/bUCw8LWAUFk+7dcCDePDEMRcgA9Oxp5TGelhVLV+z42RlyLk9yUS5NSCaoh8z0FjnenLQWPcZQvQPOJD5E3gsp/xe9FqgrBZ20uZ6xurR2dkDBUMddNm0aNyLFkknvjs9c7crrxX9YD2GFCtLcudsNjmMNGpfoFxnqg20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622806; c=relaxed/simple;
	bh=JOlQ96NJcQ9WqBWC+odzZHxXWUjTEa9IMsvQfvNGCto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJXuReWU5j1sp6K4+zxLkQZh7VTU+gHOphzo9TqdmS/3EmW56okwKo1HQ/VtnbK15i+4wzQ4D8+vYFtYoHS8u/U9ikA05oS1casIhXjvdNDwTbmNqz+edXewZIXuGt2/oVK84hoSM1B5sYJajpj/dxlO8xgGuQV53O/MNrQ8oa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbdRNql8; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c5389c3cd2so292669785a.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622804; x=1769227604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf+jvLCJJOJoojEtmxyeWIw57LiHEmAdAqVecpslvUk=;
        b=MbdRNql8Y2bd26ymNAXN1YLrAzlKk3cYwYTMSSVc0KEYR+6ij59kvHgVBcIUpxz6in
         W7XKs97J9LAfOaEZrlGe2GCrv9zK36I1yrRnyj73sGEzJ+XO+ev1A+Kgrcun5Op6k4sM
         4gl+lclxKbht/3Z3ED07Cb964EN6ZNcHaOXepPE7adULEjLHkDtVgUBz247CG22HLjSM
         1oaDk9ccrmnxXvZKRFtle/OkfFwb6Pxvz/+Tv/qJMKA/YCDzVCRUcZp33T9jXNlPsMtu
         ehd1shzcps2O7lrI7gXusukr1Qnod9zrboqwZgn4XZ150euxpMtueNJYZtgCMxWB2lDx
         aB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622804; x=1769227604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tf+jvLCJJOJoojEtmxyeWIw57LiHEmAdAqVecpslvUk=;
        b=MxZzqyW3Q2rAj3lK3Z0Eq0mW14+xmVz1a8P0WmZVMDMjn20WlEZlGeEnUdGOja0wLg
         WHNmq9lnlCNHg4rY4NyXP7ZsizMnaLNKhUBA6ObYzeeSAC94FMkAVe8M7Om+WGHKIXmY
         jqzjDOY51T1R3IJBrBzvalgQB5GhTz4aOwYecUAgGijt42rt8AEXH35bhGimAM4PCNDe
         AZFJcYoF38Qkh52G871d9aU53Y+FE9x6bcs6hkctzrOsDYUzrUtMta0b+BQKYH6eQsRM
         GUHKbCLMhjUwXdRQUQc0Tq7QHX5BMMc9L3gIsuPxauSh1nvDao1+AygjYvNYV/hyJ4BL
         CHPg==
X-Forwarded-Encrypted: i=1; AJvYcCXeLZlBffv0t5vlt4SwEedXnhNkOhcKCU0oVXadfZln7GHnkf5iwg0EEH+VXhE9pqZvRdXx40hjBEbVtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq2AWqxeZH91+hIty7qAWiojCnX0QtEtkNxGTGbYNrFLA2sA19
	DMEBMGv87HlD4KLk2tFR31HOJO4jefJyPD0uG/l1X9IQuGhWZ5unw5RGYNKFCw==
X-Gm-Gg: AY/fxX4TBy+cMrbYfKV2Obe3THAGqv3HQctO+DlNIMz2pIJdUzmydt/yC3ktv7xpnE7
	x0W2Q06siEz/y/bBeRH6N5iL+QU0JGD2lAyjOEHe1altojDGv+H3cR21aqMVVN/2RmMXqNuteZd
	NqCCjK6PeqIRCpClZoE3PV0Ahdhsew9rDJQDstI0zGapW3dWRWZjYz5zMkqhlh4IycDktCe2ILX
	CPc99Jkh2macQ3UeGWESy+K6H2tulZsS0k6/MveY0qUHFJOq84RxSe+QOHjwHBdTyJT4HuD7+0+
	ymyQlN1SiQfHyIbZCWjjXvDTn8ouQpT0X08lRIA7QiA4QFNucsHoFXD2K7IOiReG10JCI8Thsme
	TxWR4hFKVNsuAFEJZ5kFRV5QHyQVY6JqZp7Tgp3D83Wo99wk7/Uy8v7eqPipSOG+hDeYDFpsRv+
	YwnsUerVGCmQskbPsmJ4E/BKc9YsTICwAqdQnozhLkdf+xJHQ3n/boIGyZT5yAzeuzlvqvDSclY
	JE=
X-Received: by 2002:a05:620a:6cc1:b0:8c5:3202:8bc2 with SMTP id af79cd13be357-8c6a6717fb6mr743115785a.35.1768622804038;
        Fri, 16 Jan 2026 20:06:44 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c274csm369814985a.21.2026.01.16.20.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:43 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power management
Date: Fri, 16 Jan 2026 23:06:54 -0500
Message-ID: <20260117040657.27043-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A device tree compatible makes it possible for this driver to be used on
Open Firmware devices. Initialization of power-managed resources such as
the reset GPIO and voltage regulators can be specified in the device
tree and handled by the driver. Add support for this so the Pixel 3a can
use the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 116 ++++++++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 776107efe386..5a8da035ba5f 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -3,9 +3,13 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
 
 #include <media/v4l2-ctrls.h>
@@ -125,6 +129,15 @@ struct imx355 {
 	 * Protect access to sensor v4l2 controls.
 	 */
 	struct mutex mutex;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data imx355_supplies[] = {
+	{ .supply = "avdd" },
+	{ .supply = "dvdd" },
+	{ .supply = "dovdd" },
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
@@ -1515,6 +1528,55 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 	.open = imx355_open,
 };
 
+static int imx355_power_off(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx355_supplies), imx355->supplies);
+	clk_disable_unprepare(imx355->clk);
+
+	return 0;
+}
+
+static int imx355_power_on(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+	int ret;
+
+	ret = clk_prepare_enable(imx355->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		goto error_disable_clocks;
+	}
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
+	usleep_range(10000, 11000);
+
+	return 0;
+
+error_disable_clocks:
+	clk_disable_unprepare(imx355->clk);
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_power_off,
+				 imx355_power_on, NULL);
+
 /* Initialize control handlers */
 static int imx355_init_controls(struct imx355 *imx355)
 {
@@ -1689,16 +1751,26 @@ static int imx355_probe(struct i2c_client *client)
 				     "external clock %lu is not supported\n",
 				     freq);
 
-	/* Initialize subdev */
-	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
-
-	/* Check module identity */
-	ret = imx355_identify_module(imx355);
+	ret = devm_regulator_bulk_get_const(imx355->dev,
+					    ARRAY_SIZE(imx355_supplies),
+					    imx355_supplies,
+					    &imx355->supplies);
 	if (ret) {
-		dev_err(imx355->dev, "failed to find sensor: %d", ret);
+		dev_err_probe(imx355->dev, ret, "could not get regulators");
 		goto error_probe;
 	}
 
+	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx355->reset_gpio)) {
+		ret = dev_err_probe(imx355->dev, PTR_ERR(imx355->reset_gpio),
+				    "failed to get gpios");
+		goto error_probe;
+	}
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
+
 	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
@@ -1706,13 +1778,26 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_probe;
 	}
 
+	ret = imx355_power_on(imx355->dev);
+	if (ret) {
+		dev_err(imx355->dev, "failed to power on sensor: %d", ret);
+		goto error_probe;
+	}
+
+	/* Check module identity */
+	ret = imx355_identify_module(imx355);
+	if (ret) {
+		dev_err(imx355->dev, "failed to find sensor: %d", ret);
+		goto error_power_off;
+	}
+
 	/* Set default mode to max resolution */
 	imx355->cur_mode = &supported_modes[0];
 
 	ret = imx355_init_controls(imx355);
 	if (ret) {
 		dev_err(imx355->dev, "failed to init controls: %d", ret);
-		goto error_probe;
+		goto error_power_off;
 	}
 
 	/* Initialize subdev */
@@ -1752,6 +1837,9 @@ static int imx355_probe(struct i2c_client *client)
 error_handler_free:
 	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
 
+error_power_off:
+	imx355_power_off(imx355->dev);
+
 error_probe:
 	mutex_destroy(&imx355->mutex);
 
@@ -1768,7 +1856,11 @@ static void imx355_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(imx355->dev);
-	pm_runtime_set_suspended(imx355->dev);
+
+	if (!pm_runtime_status_suspended(imx355->dev)) {
+		imx355_power_off(imx355->dev);
+		pm_runtime_set_suspended(imx355->dev);
+	}
 
 	mutex_destroy(&imx355->mutex);
 }
@@ -1779,10 +1871,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
 
+static const struct of_device_id imx355_match_table[] = {
+	{ .compatible = "sony,imx355", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx355_match_table);
+
 static struct i2c_driver imx355_i2c_driver = {
 	.driver = {
 		.name = "imx355",
 		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
+		.of_match_table = imx355_match_table,
+		.pm = &imx355_pm_ops,
 	},
 	.probe = imx355_probe,
 	.remove = imx355_remove,
-- 
2.52.0


