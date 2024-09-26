Return-Path: <linux-media+bounces-18650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31D9876DA
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 17:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C7A01F225CB
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E4715DBB6;
	Thu, 26 Sep 2024 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UpbGAjl4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F3C15A4B0
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365611; cv=none; b=Fgvf0qhdady/Ub0yiwUa9v2bn09K3ArosOnDEbRipii64sgJdpi+k0m+/BgWxsBju31rzOaIB6WyGqcAD240yojp1LDVQlHbdzF1ptgc/FBKwgwKSE8HVv+eTQH5WJLmBH5aYEfX/6H+TQ1v0Zu9K6KS803pGbeza/fyLZ2Yzvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365611; c=relaxed/simple;
	bh=hN9nY+XO5LtlmRfoeHlDSRP5jauzJNqdIys8SDwpCh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvomNoQCr+rpjZLf7GI2Q5qJi5Gl5hiTr6LlEOvl8qaRXAPOZ3sd8grNtAdvBaTuF5AOdWCNEBe2xQ2Dwf9JbGxN+7EKuUtnqIWaWpglNgXUzrHm0sDMUyJyq/ogyFvFAqOa4msy+Bkuo6tYVzxotj+a1NYVBKwiyRNCPndZAGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UpbGAjl4; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso15508681fa.0
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727365607; x=1727970407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6iOEHBavDXZv+5TUc6CX9qNRyXsARZk7ltgBWtHLzk=;
        b=UpbGAjl44MX16siuz189l2ZJZNaaGPMxT8CNoCyispcTdXzzF3756XerC7zhOLgX7I
         bLU9DJcElzjCG5MWSh8wEOvQHiL018fPQ7N9QRkeBcqc9HijaZ74hqo/5pRliw/wLFCf
         8f/NePoW/JnUKmsrmE5HzjynuMnjFOF13Jp/5HK0kVNwc+QxuvYm3h9kSVjsNid9kKH0
         6UjnD9sxJeHFVgc76In3rcKiE9iN0fEj8caufHcjmv5KOySds1eT3FP+3Lrl4OkqKnki
         uHYGhEYccbyUxdH+UuHFpaLBTQ+JZqDXJpYwuUyNTlofCJS1Rrbh9h+rVZ8lx4vImF1s
         6veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365607; x=1727970407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6iOEHBavDXZv+5TUc6CX9qNRyXsARZk7ltgBWtHLzk=;
        b=Ho6yxCbzfPhgIXwkuVKlLxwXV3GbpdhZ6frQhWUumVkquZQePOsORe9lMl/dyGXjXA
         lGkAl9T+McqsuC9Q9cHsxUrbUaxptq1z0Nz022IKDf9iX1ZpfGYEBA2E5Rvfsovi7iIn
         bPxeJAySfWLNECsau3OptC2Mm250Fg1XKTxO/IwX/dlE1aAFNyrsSIxCHaLZcsvu63Vr
         2dRaHsAMi56z85mmvtqIG2P4PputoM5gxkiMLGNqkyVHrhZrVlUfR28ciNpr/Vn0aYy4
         edH3d8sgjC+ewGY2iwFHm/S75/l5zYnryPfCtaQ7nX3lyZbwCk1jfoQVV5jNpyhQ4od/
         m1yQ==
X-Gm-Message-State: AOJu0YyAL+DphPBhvb0+W3tJlPUrgNK51rMlqAtvwYUo7Sv383IT5BNW
	ko5yxyklpWqFB3i1PjiN90ap3CDAfbx8k/VS8qxc74qZaPHs0c75qld6GNOU4ilG0kOiIM5DIR/
	Y1T4=
X-Google-Smtp-Source: AGHT+IHdgeSXa45u5y9ZzGSWTYrTnjjBxy62mASnauaIT1zo42jL8IDegwXdw4/dS3sHfWkCuYrF/A==
X-Received: by 2002:a2e:4a0a:0:b0:2f9:c0be:3b14 with SMTP id 38308e7fff4ca-2f9d4198afbmr446111fa.42.1727365607045;
        Thu, 26 Sep 2024 08:46:47 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405166sm75744a12.9.2024.09.26.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:46:46 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Sep 2024 16:46:40 +0100
Subject: [PATCH 4/4] media: ov08x40: Add OF probe support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-b4-master-24-11-25-ov08x40-v1-4-e4d5fbd3b58a@linaro.org>
References: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
In-Reply-To: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6908;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=hN9nY+XO5LtlmRfoeHlDSRP5jauzJNqdIys8SDwpCh8=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm9YHhO6JO2EG17aLieP8wWpbxTnUs7hM0lfg+v
 MT//8mekzeJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvWB4QAKCRAicTuzoY3I
 OnjVD/46onL+Bo654zVCWSOXL4wyz2BLGbp8rKtbs15MFsfaj48iu8FSTv8qg4fvZ5iSFpex08f
 gjKEv+VCBRq742MpE6OL5HQ9CzUkxvpBB/X33FBSC1K5/xLunnIxqF9jKlg17AZ3xpPT57o1jpx
 H4nPwOTXMohVJW9EhJEUxkQycyLMxT5a6ffDLxHGTisvBCRh1zYrWXf08rJrkoQazYQVvsLhNS/
 WHAvyWZxsxZI9HEqX1Ab6DJsU0ytkFmUQ8T9dA/LS1GWHw+caeWKRbgl0Jn0XccM+WSJGTE6gdk
 MLLJFr3HBFuoqTRte4orJmhk8esmUqleHHYW2bF92rgdlD+7BkfCEo/M4vvEJCCPZZStH6MNe11
 Err4J9grs9GLV/+uQSKiwmpsKoE7uKYK6z2rSEKJ3tdN4Qj6Fvl8KPxcwOrjQleneoUro+/TpsW
 Z03s/HxxiZFa4Sx5s6ybF6lBvTiA5+p92r9swxALe8FBnnvOTmHjM4Sm0AI+ZTdVDU7giYQUx1K
 0VXFLNq6Wca6Z06u2j/Vp8XMnNWDp4hqiL45BygcQw7BIJvNGMQrX9k5xroeNtuuxt2wBdb7vyv
 OYqES1wAarXU41xBFht2wdhEbxe2YyOkm+TPCv/+QZguA91/3DWGdMBjn4eSmqhZbwUsaMphyBf
 VjlSbfzeT0I+tww==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The ACPI version of this driver "just works" on dts based systems with a
few extensions to facilitate.

- Add support for DT based probing
- Add support for taking the part out of reset via a GPIO reset pin
- Add in regulator bulk on/off logic for the power rails.

Once done this sensor works nicely on a Qualcomm X1E80100 CRD.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e80100-crd
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov08x40.c | 129 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 120 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 3ab8b51df157af78fcccc1aaef73aedb2ae759c9..7e1f473a6661c2beb890ac81b72ba4782f29b076 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -3,10 +3,13 @@
 
 #include <asm-generic/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -1279,6 +1282,12 @@ static const struct ov08x40_mode supported_modes[] = {
 	},
 };
 
+static const char * const ov08x40_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov08x40 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -1291,6 +1300,10 @@ struct ov08x40 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
 
+	struct clk		*xvclk;
+	struct gpio_desc	*reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov08x40_supply_names)];
+
 	/* Current mode */
 	const struct ov08x40_mode *cur_mode;
 
@@ -1303,6 +1316,61 @@ struct ov08x40 {
 
 #define to_ov08x40(_sd)	container_of(_sd, struct ov08x40, sd)
 
+static int ov08x40_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov08x40 *ov08x = to_ov08x40(sd);
+	int ret;
+
+	if (is_acpi_node(dev_fwnode(dev)))
+		return 0;
+
+	ret = clk_prepare_enable(ov08x->xvclk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable xvclk\n");
+		return ret;
+	}
+
+	if (ov08x->reset_gpio) {
+		gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
+		usleep_range(1000, 2000);
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov08x40_supply_names),
+				    ov08x->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		goto disable_clk;
+	}
+
+	gpiod_set_value_cansleep(ov08x->reset_gpio, 0);
+	usleep_range(1500, 1800);
+
+	return 0;
+
+disable_clk:
+	gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
+	clk_disable_unprepare(ov08x->xvclk);
+
+	return ret;
+}
+
+static int ov08x40_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov08x40 *ov08x = to_ov08x40(sd);
+
+	if (is_acpi_node(dev_fwnode(dev)))
+		return 0;
+
+	gpiod_set_value_cansleep(ov08x->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ov08x40_supply_names),
+			       ov08x->supplies);
+	clk_disable_unprepare(ov08x->xvclk);
+
+	return 0;
+}
+
 /* Read registers up to 4 at a time */
 static int ov08x40_read_reg(struct ov08x40 *ov08x,
 			    u16 reg, u32 len, u32 *val)
@@ -2072,7 +2140,7 @@ static void ov08x40_free_controls(struct ov08x40 *ov08x)
 	mutex_destroy(&ov08x->mutex);
 }
 
-static int ov08x40_check_hwcfg(struct device *dev)
+static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
@@ -2093,6 +2161,32 @@ static int ov08x40_check_hwcfg(struct device *dev)
 		return ret;
 	}
 
+	if (!is_acpi_node(fwnode)) {
+		ov08x->xvclk = devm_clk_get(dev, "xvclk");
+		if (IS_ERR(ov08x->xvclk)) {
+			dev_err(dev, "could not get xvclk clock (%pe)\n",
+				ov08x->xvclk);
+			return PTR_ERR(ov08x->xvclk);
+		}
+
+		clk_set_rate(ov08x->xvclk, xvclk_rate);
+		xvclk_rate = clk_get_rate(ov08x->xvclk);
+
+		ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+							    GPIOD_OUT_LOW);
+		if (IS_ERR(ov08x->reset_gpio))
+			return PTR_ERR(ov08x->reset_gpio);
+
+		for (i = 0; i < ARRAY_SIZE(ov08x40_supply_names); i++)
+			ov08x->supplies[i].supply = ov08x40_supply_names[i];
+
+		ret = devm_regulator_bulk_get(dev,
+					      ARRAY_SIZE(ov08x40_supply_names),
+					      ov08x->supplies);
+		if (ret)
+			return ret;
+	}
+
 	if (xvclk_rate != OV08X40_XVCLK) {
 		dev_err(dev, "external clock %d is not supported",
 			xvclk_rate);
@@ -2143,32 +2237,37 @@ static int ov08x40_check_hwcfg(struct device *dev)
 }
 
 static int ov08x40_probe(struct i2c_client *client)
-{
-	struct ov08x40 *ov08x;
+{	struct ov08x40 *ov08x;
 	int ret;
 	bool full_power;
 
+	ov08x = devm_kzalloc(&client->dev, sizeof(*ov08x), GFP_KERNEL);
+	if (!ov08x)
+		return -ENOMEM;
+
 	/* Check HW config */
-	ret = ov08x40_check_hwcfg(&client->dev);
+	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
 	if (ret) {
 		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
 		return ret;
 	}
 
-	ov08x = devm_kzalloc(&client->dev, sizeof(*ov08x), GFP_KERNEL);
-	if (!ov08x)
-		return -ENOMEM;
-
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
 
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
+		ret = ov08x40_power_on(&client->dev);
+		if (ret) {
+			dev_err(&client->dev, "failed to power on\n");
+			return ret;
+		}
+
 		/* Check module identity */
 		ret = ov08x40_identify_module(ov08x);
 		if (ret) {
 			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
-			return ret;
+			goto probe_power_off;
 		}
 	}
 
@@ -2210,6 +2309,9 @@ static int ov08x40_probe(struct i2c_client *client)
 error_handler_free:
 	ov08x40_free_controls(ov08x);
 
+probe_power_off:
+	ov08x40_power_off(&client->dev);
+
 	return ret;
 }
 
@@ -2224,6 +2326,8 @@ static void ov08x40_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+
+	ov08x40_power_off(&client->dev);
 }
 
 #ifdef CONFIG_ACPI
@@ -2235,10 +2339,17 @@ static const struct acpi_device_id ov08x40_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, ov08x40_acpi_ids);
 #endif
 
+static const struct of_device_id ov08x40_of_match[] = {
+	{ .compatible = "ovti,ov08x40" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov08x40_of_match);
+
 static struct i2c_driver ov08x40_i2c_driver = {
 	.driver = {
 		.name = "ov08x40",
 		.acpi_match_table = ACPI_PTR(ov08x40_acpi_ids),
+		.of_match_table = ov08x40_of_match,
 	},
 	.probe = ov08x40_probe,
 	.remove = ov08x40_remove,

-- 
2.46.2


