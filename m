Return-Path: <linux-media+bounces-19122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 115AB991601
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353AD1C21BBA
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 10:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EE61537DA;
	Sat,  5 Oct 2024 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ensFfRQa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171B14BFA2
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728124277; cv=none; b=WsWQSarshcpQob/l1kAXk5x6Y6Z/BcmoGG8imQonyX1PE+s4NBWVX0xRw2+2Xv4K3VoUFzR2OGlA2whP4bo3xN+bnuBW8khfRGdtbEM++2viAH4vqTv7M08Dwt2GUK25WWyVwFKqILmbDMNHrv/hK0GqzQJEEAsKS/5Gub3IKuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728124277; c=relaxed/simple;
	bh=MZdA/sRLAsmvUPZP3TphhP3dJzkLom00eAxDcabblxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTK0YX3gyVBCujV+or0RN5Z1jb6RAqShpwsAAyD3978yxDrmMKVs2rSbSy4ZSeJNBHDbpMQKXN+M6tNPG1j3yXfuwH5hIDBZdPWhx2dh8W7ajT/DbaAtL6agG7KSdDRAu3wcrgWUxvBfTVFPHThgVLq+A0/WTyY/zMQKXOhrwNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ensFfRQa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9943897c07so10536566b.3
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2024 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728124273; x=1728729073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pseR3SnwJF/ltwSCthgN9v3QXyD9/cz3sKkOTqoReDs=;
        b=ensFfRQa3eqA32dNxca6TT/6FIAnSIpIS9vBe7YwVSFb9Po2PUZ1kYIvkrwCsy3gDu
         ZSBIv2ky6rSV/fobclDah8S1f82MbND5I8VPxlJpVGt1OqDkx6UWNlgnmAua7OQLJam7
         6yDiIreYhL57xtE06sOhpplXISQD0OIQg7l/sfGtBCj6ctS5fy3PNYVXzSCaEH9C2of6
         NSgIqlF9yBXfCum2tvT+YyynVF3J7iRRWAx/wPi1WvaUvohMlodvKsAB4u24UI94pF6F
         tmbgeUmeRbrLZs8moZHxLQ90SpTpU7XRQeYRFN5Vpg8rFz/DgCeQ4NTCnExbBYeurSFY
         YE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728124273; x=1728729073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pseR3SnwJF/ltwSCthgN9v3QXyD9/cz3sKkOTqoReDs=;
        b=QefabneSnAzx7u6BDBIuNBYoU2H2mBziNEL6c1D8eIfMcqdqJEGuhl6YaNztOISJ6k
         x7sqnc7uVOBuSOgfsSRDrXKzx8Kfh4nX3fpv25lJZkQvzTmurAt/GjEZL+1k2b8ZIgAX
         61U6LDb5f7Qt3MDJbd/b+ZpdorMXISa47Ri0cC7aEZh6AJpvRiYVcwzqzKgQQmkKiez4
         aM26ylxP0StcKvIcLdHqKnt+vjDYXfBIpU4gSBrcNO1H6MOgYqlO2JiscZhqno/0zvz4
         YRrpXNp22dCs84i2JWgJDDJ/kOi+bSljBdRK/DnQ54ZweTJMsnoC4yTXBckrb3pSP6KP
         ZHtA==
X-Gm-Message-State: AOJu0YzNY9hstNzNhKXUcHWaw18L2e28ZqIpubehyYqJAfZFifR+hAUr
	flQHiwiYOsIeWy27bLuMWJOhJqyGBCCc1WpoMoHsjr4OgayInhiGAXfU1Krak9RK25HNJDN1A3p
	73zk=
X-Google-Smtp-Source: AGHT+IGnpJbRkaeEp++fKU34EvopNpr/tyBn+AeOlnfao3/er+hs2WZEx+AXO2rdZ+yVQjSYpLNcaA==
X-Received: by 2002:a17:907:36c4:b0:a8d:1303:2283 with SMTP id a640c23a62f3a-a991bd7a123mr567894066b.30.1728124273102;
        Sat, 05 Oct 2024 03:31:13 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7856bfsm116315566b.138.2024.10.05.03.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 03:31:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 05 Oct 2024 11:31:06 +0100
Subject: [PATCH v5 4/4] media: ov08x40: Add OF probe support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241005-b4-master-24-11-25-ov08x40-v5-4-5f1eb2e11036@linaro.org>
References: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
In-Reply-To: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7427;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=MZdA/sRLAsmvUPZP3TphhP3dJzkLom00eAxDcabblxk=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBnARVqi35DN6gUi+5keNREXE36RVNzvmSK5VLjs
 2TziUE2nCOJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZwEVagAKCRAicTuzoY3I
 OkdrD/4jdS4d6RhXojZ416uinCFqyvFUj5cpzuo4DlDXoY/1Nz6azwXPh95o1T1PkVuFGgoSCOs
 YSQWGGnw9G9o48NdyDr/xzI0h1d4EoSL6LjhxMGtlF6IJv/rabmp/F1xNR3yK1grurvlwLQbmtK
 /jwkYznAN2F7XDmvcPbnsPXxojP5loPJI/mNl9tpJujm+OEimW15qfikNXZD/9JFBJPNBEaHbTG
 goBm7fgleoveZZjkV1Y/3csyg6+rergqZ3Vm96mxnaXMR/Eo/qtalOOm/L/WGtjXqyZNW+FL2q8
 akyJqfada7b0VrAuZjhjVzUQg+4+ENcoLdinozxfTdU1J7CPTPYCaWbRDVNE3Qby/fbD7kYM/j1
 kfDNAS4fRG9WiV/bNFR+y341m2i/pO3M6Dfq1aUo1yYdAdhLESTrERrTQhI4IDa6Usxk5qEvnD/
 eHrDxJHlFeTaNi8sjyDJb3moKNZPMM8P1X/vEUMEYv18q2Rp8L3UnH6MWpQnJHsl+YO/NP7KDta
 phphJ2FP5Hg2xSe0R+hqUhdq2/1KjwvF4UmrflSqa4NW8Fdpodv4pm07lvnI2UkIoELDIi+h3Jk
 YlR+EbZEYxMRrTKqNofm600ZrpyaazuWo6wfaCcgyYxNU8IhUcM6B6LNrKdxg4bypOAHIQAM6oh
 N2899CZzi1+AL/w==
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
 drivers/media/i2c/ov08x40.c | 140 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 125 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 3ab8b51df157af78fcccc1aaef73aedb2ae759c9..ff17e09a1f96175d598c395bcae0cdf01d68a79f 100644
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
@@ -2086,11 +2154,36 @@ static int ov08x40_check_hwcfg(struct device *dev)
 	if (!fwnode)
 		return -ENXIO;
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &xvclk_rate);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		return ret;
+	if (!is_acpi_node(fwnode)) {
+		ov08x->xvclk = devm_clk_get(dev, NULL);
+		if (IS_ERR(ov08x->xvclk)) {
+			dev_err(dev, "could not get xvclk clock (%pe)\n",
+				ov08x->xvclk);
+			return PTR_ERR(ov08x->xvclk);
+		}
+
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
+	} else {
+		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+					       &xvclk_rate);
+		if (ret) {
+			dev_err(dev, "can't get clock frequency");
+			return ret;
+		}
 	}
 
 	if (xvclk_rate != OV08X40_XVCLK) {
@@ -2143,32 +2236,37 @@ static int ov08x40_check_hwcfg(struct device *dev)
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
 
@@ -2177,7 +2275,7 @@ static int ov08x40_probe(struct i2c_client *client)
 
 	ret = ov08x40_init_controls(ov08x);
 	if (ret)
-		return ret;
+		goto probe_power_off;
 
 	/* Initialize subdev */
 	ov08x->sd.internal_ops = &ov08x40_internal_ops;
@@ -2210,6 +2308,9 @@ static int ov08x40_probe(struct i2c_client *client)
 error_handler_free:
 	ov08x40_free_controls(ov08x);
 
+probe_power_off:
+	ov08x40_power_off(&client->dev);
+
 	return ret;
 }
 
@@ -2224,6 +2325,8 @@ static void ov08x40_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+
+	ov08x40_power_off(&client->dev);
 }
 
 #ifdef CONFIG_ACPI
@@ -2235,10 +2338,17 @@ static const struct acpi_device_id ov08x40_acpi_ids[] = {
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


