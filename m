Return-Path: <linux-media+bounces-37713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79144B048F9
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74FA1A626FA
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707E326A095;
	Mon, 14 Jul 2025 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8vcVSkB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2369C22F389;
	Mon, 14 Jul 2025 21:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526976; cv=none; b=FiRFUJwhMqLKRO8f+RSQ5031jVFDDNi8KuXuL3RR9jwX7Kzv7SP54cKuwz0YvhGVVb0ykG1gxXwaHFmbAVBbKVFvaPNdzg1AxcgpBxaWOnoFs0SOkc8+C+OkAnSpkzEE18v1CEYOi2P9WIYuAgkRd3ksrhHiqyaRtDdB9wzl+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526976; c=relaxed/simple;
	bh=bjYeROkbG0AHCabpCFzVrD2PiPtXpO7CjFdZLnPJplU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdMz1lSRy/t4xLwXPQhOYVgrlNYe0LHYrVmrUZOjgmV0OA5eha82qeHdSnAm5S2paLwFi+J5alC1DRYlukRR45Kt06SSeiC0GNwTdUk3MMxrKpJ8US136Qq8EmSUsmXduOWkadMGuJMw/bbP4hzEYepdDBhRIP2Rwb16xjWMU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8vcVSkB; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6facacf521eso40934146d6.3;
        Mon, 14 Jul 2025 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752526974; x=1753131774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PK3eIViJJf5k3VLsoofkBecBk744pg+x+gvHkEiU+iM=;
        b=A8vcVSkB0G4brwKAP8KP2fZt97kGYwWG0ts10JtcPjmDihtjvC3H5QU/ccFVcfDgHj
         +f3WEnVcrbp6NGZP9efTQj/kZu561a3mIsNrCnLucOfEksGhwIpQiL5ydKZPfaXdTUFG
         mfkFfKIhvuiw+nDPfItL6S9E3BRpV3O3Hdkt3mMtIKVz7Kxhz8AUEGLDTU6bL3eTWH4u
         EfJSZflEV+QbyCXExZ7WLU3mb7ToJHU+2kXsyhxtQnFgzE+6lkg+TIXAWHD1xwDb1S9s
         smzxEOfrcqat0o7FtbWg3jnvFDb0ZegOyNYIFuknUM53fnmiZCujxTlONSLuJR0XQdGP
         mOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752526974; x=1753131774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PK3eIViJJf5k3VLsoofkBecBk744pg+x+gvHkEiU+iM=;
        b=TlXMb13BVla079MPGU9jIoLe7YYIQjLINVk7fn8hlDA3YjH206OYz+9Sgyyi1nb4Gu
         grbmosWXq7Czqz1lqKO5wemsQl804pvRBfH8Em97LhyR73JNGu9IMVwzzWmV/vXXzsZI
         n0ZvqxXbwluTrddEComLZWOMEzR7KdUzX3ejRFP54JXw/3803v4amQFtyFtnoJaR8Zvp
         ERrxr06fJtSSvtmr/jtK8vpu44YzyG7EVZ8ZFaMUl+U+guDJdTLE3MM7vb2FnfAYS4Lv
         8L66Q1ZkarnlEIXseVo+rJ1xq0mP1Mt+HCkjZ+wiY70TOTSOHW6BuIrsk6d+NAM5+211
         zaUA==
X-Forwarded-Encrypted: i=1; AJvYcCUXMGzHB5JwmEaX8MAuVtctJpD196dUhyMS/bD7fE20wwVgcDOtCKrx2eKdZw/ouy2chwev9SGJ4axa7jw=@vger.kernel.org, AJvYcCUtmRYcNdI0RAZD8lLC+w9z0k1qV5ivWOxy98u4jua8fZrAFGSW5+oeC2/FAk59mNhaB4aznwzTL+um@vger.kernel.org, AJvYcCWsycf7U5oZAnq/+2LM/g/LfrJ6DsRXNERqXRnpzZ9W3TSI4fOPMA5ggDOFiBECzJo5k8N61kJmz3o9NdysJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/gDoCCtwTBiZzZug517M5kLTj4Ph08SgzzLrI6iX4ISQKrOC
	ZRFzfQGudPRYlr9q7gbc4BGQUCGKdPeErvHeVr5LoKfRasDtK5TrhikS
X-Gm-Gg: ASbGnctu/W55LdMzDsaouLYbEV96p2l+7XYbtPuz+RIflL6kTkid5XsGHzFHauNiYBH
	aA71CGat3I7AkYRAO3sJy4iDV7Vd2qN/sgSlfQhzcFNIctS7qWL9qkA7WVUOZsUW3dMl2mY9f5O
	sLRbsSamAsoFP0rl5ERrUHF2rjZJo7rouA4/dXEuUUscUZnrWvPdO4aNhQ/8zNvwmn20JyLc3AK
	TGkw3xBcT5qJiaLp0KXL3exyHsetWVtPdz+14n96WaiiE1FHJuMH3DwDpi5cbGG6hvCeGrplStP
	FZRSkQvmrU0KVi7IyHIRCSfGAIm8TJCtBPiG6lneSIbTA35pA0R1OiGAO/p/W1SOckcnmdJPQ/2
	tH1JQdq0kUA==
X-Google-Smtp-Source: AGHT+IGJQ2mBdcKTF1UhkeOFw1hSzriFFZesv14U4UeXC2oKzn8MbMfCzjhYEr7FiwyWYiSxK+Lj3g==
X-Received: by 2002:a05:6214:3107:b0:704:81a4:2847 with SMTP id 6a1803df08f44-704a360b0fcmr237196476d6.17.1752526973675;
        Mon, 14 Jul 2025 14:02:53 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e2bea878e7sm170247885a.72.2025.07.14.14.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:02:53 -0700 (PDT)
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
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/4] media: i2c: imx355: Support devicetree and power management
Date: Mon, 14 Jul 2025 17:02:30 -0400
Message-ID: <20250714210227.714841-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714210227.714841-6-mailingradian@gmail.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
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

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 143 +++++++++++++++++++++++++++++++++----
 1 file changed, 131 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b2dce67c0b6b..6244e1a5876f 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -3,9 +3,14 @@
 
 #include <linux/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -121,6 +126,16 @@ struct imx355 {
 	 * Protect access to sensor v4l2 controls.
 	 */
 	struct mutex mutex;
+
+	struct clk *mclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[3];
+};
+
+static const char * const imx355_supply_names[] = {
+	"avdd",
+	"dvdd",
+	"dovdd",
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
@@ -1516,6 +1531,58 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 	.open = imx355_open,
 };
 
+static int imx355_power_off(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+
+	clk_disable_unprepare(imx355->mclk);
+
+	if (imx355->reset_gpio)
+		gpiod_set_value_cansleep(imx355->reset_gpio, 0);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);
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
+	ret = clk_prepare_enable(imx355->mclk);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		goto error_disable_clocks;
+	}
+
+	if (imx355->reset_gpio) {
+		usleep_range(5000, 5100);
+		gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+		usleep_range(8000, 8100);
+	}
+
+	return 0;
+
+error_disable_clocks:
+	clk_disable_unprepare(imx355->mclk);
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_power_off,
+				 imx355_power_on, NULL);
+
 /* Initialize control handlers */
 static int imx355_init_controls(struct imx355 *imx355)
 {
@@ -1623,7 +1690,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 	return ret;
 }
 
-static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
+static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev, struct imx355 *imx355)
 {
 	struct imx355_hwcfg *cfg;
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1648,11 +1715,15 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &cfg->ext_clk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		goto out_err;
+	if (imx355->mclk) {
+		cfg->ext_clk = clk_get_rate(imx355->mclk);
+	} else {
+		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+					       &cfg->ext_clk);
+		if (ret) {
+			dev_err(dev, "can't get clock frequency");
+			goto out_err;
+		}
 	}
 
 	dev_dbg(dev, "ext clk: %d", cfg->ext_clk);
@@ -1683,6 +1754,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 static int imx355_probe(struct i2c_client *client)
 {
 	struct imx355 *imx355;
+	size_t i;
 	int ret;
 
 	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
@@ -1694,27 +1766,59 @@ static int imx355_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
-	/* Check module identity */
-	ret = imx355_identify_module(imx355);
+	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
+		imx355->supplies[i].supply = imx355_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(imx355->supplies),
+				      imx355->supplies);
 	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		dev_err_probe(&client->dev, ret, "could not get regulators");
 		goto error_probe;
 	}
 
-	imx355->hwcfg = imx355_get_hwcfg(&client->dev);
+	imx355->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(imx355->reset_gpio)) {
+		ret = dev_err_probe(&client->dev, PTR_ERR(imx355->reset_gpio),
+				    "failed to get gpios");
+		goto error_probe;
+	}
+
+	imx355->mclk = devm_clk_get_optional(&client->dev, "mclk");
+	if (IS_ERR(imx355->mclk)) {
+		ret = dev_err_probe(&client->dev, PTR_ERR(imx355->mclk),
+				    "failed to get mclk");
+		goto error_probe;
+	}
+
+	imx355->hwcfg = imx355_get_hwcfg(&client->dev, imx355);
 	if (!imx355->hwcfg) {
 		dev_err(&client->dev, "failed to get hwcfg");
 		ret = -ENODEV;
 		goto error_probe;
 	}
 
+	ret = imx355_power_on(&client->dev);
+	if (ret) {
+		dev_err(&client->dev, "failed to power on sensor: %d", ret);
+		goto error_probe;
+	}
+
+	/* Check module identity */
+	ret = imx355_identify_module(imx355);
+	if (ret) {
+		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		goto error_power_off;
+	}
+
 	/* Set default mode to max resolution */
 	imx355->cur_mode = &supported_modes[0];
 
 	ret = imx355_init_controls(imx355);
 	if (ret) {
 		dev_err(&client->dev, "failed to init controls: %d", ret);
-		goto error_probe;
+		goto error_power_off;
 	}
 
 	/* Initialize subdev */
@@ -1754,6 +1858,9 @@ static int imx355_probe(struct i2c_client *client)
 error_handler_free:
 	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
 
+error_power_off:
+	imx355_power_off(&client->dev);
+
 error_probe:
 	mutex_destroy(&imx355->mutex);
 
@@ -1770,7 +1877,11 @@ static void imx355_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		imx355_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	mutex_destroy(&imx355->mutex);
 }
@@ -1781,10 +1892,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
 
+static const struct of_device_id imx355_match_table[] __maybe_unused = {
+	{ .compatible = "sony,imx355", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx355_match_table);
+
 static struct i2c_driver imx355_i2c_driver = {
 	.driver = {
 		.name = "imx355",
 		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
+		.of_match_table = of_match_ptr(imx355_match_table),
+		.pm = &imx355_pm_ops,
 	},
 	.probe = imx355_probe,
 	.remove = imx355_remove,
-- 
2.50.1


