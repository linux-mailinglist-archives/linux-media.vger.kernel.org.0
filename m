Return-Path: <linux-media+bounces-48607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFFCCB4799
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 02:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE4E3038947
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 01:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E35F26B0B7;
	Thu, 11 Dec 2025 01:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDiMcAKj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA020F079
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417739; cv=none; b=HjreywTl75Uya579YUbUiasIdgN+OHRFept6m8yNgGMEu8kAG3Y5ow3p0cP8jId9bgCQTDqbvYq1wde0KjZJKN4NBVRP3lLKfFApJvHgYR64079vuJNB2WzVhxWsC1qAngbdQniXEpw4/nBY9PBY9b1VW9YYePbuDbtBcoIf/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417739; c=relaxed/simple;
	bh=5MekM4wnWt3V5sjUG5FO0tQe+T6oQGfdT11Ipp7BIic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScoXCCGE7xBH7lXV3XgoV9PmK+8OegeXNnaW6SymhxSqFnQXAOh8skWV6e5L2Lzpvw6muc8U6EzaRyuxwJhl6pVZtqsqpCSvz/NlI7/OWQYtg3/wCxnEHvW3GUvE5zzix5IXC8IRJAlxCY/+t1ixiwuL2dj+nFcSrUGMhZona2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDiMcAKj; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b28f983333so53371985a.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765417737; x=1766022537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEI/TDA9RuaQuNOKsu3UcI/lBvXx5e4df+fKE/DAHu4=;
        b=hDiMcAKj7+C1++imki3C7aJuRlaY7S5gLj9rKdAJ95lgIky5egYn1zHZaEcGAhDtHB
         epFzVk9E5xbw/P9jjYThhxZfgYhyhz17CNBPY7xuqS67DUXieBJUb+96mG30/Pwpq+EK
         TsGoU4YhOBbPTFrweciXbS9/+GxtTXpsrf8ZBL9xEpdCB4qA7/om8IlAtmpqhZFLKq/c
         gN821qiVFV8D1o8dmWlSPxQc5wHsE/xh2se7z3Jv6l4AsLbDWn78tOx2GtjmFXMtef7q
         4UlJoULbgYKZ+gRM7rkd24N/xita7taYYV6sKw4p6ql6X8DlHiJhFpqUQeOTwWnvEfqr
         sn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417737; x=1766022537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZEI/TDA9RuaQuNOKsu3UcI/lBvXx5e4df+fKE/DAHu4=;
        b=qBSmqWSxVwQODLUtTi2WLLWT3ws5io2eKMgse9t1NyLXgVdKYcCbTkoHNrppfJVJBu
         9ayMCdDS5+EsWNTCZ/dc16Vj2ZhRzQooqf0fbuyvD1IHK21UE0AkkYvtB6gF2Qf1LSiX
         NEmH1f+Zw/fgrbNpJLdPuHr2LZh9PS0k21G5yBT+0xSOdI1ZOi40CiX+hSSZeq5IDe2v
         VJiI2yIWrLANRiJzghfn18D5JJACO06+C4FUl1YENQgpNROHU/SM8zOla/hZ1GkzUmoj
         566EBH0OL0efYo0KAAGj2mOp4OD+TzEsMOyfygLRG7kwGxv5xTmm5HIWFPNJHzVUXIBM
         n5EQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3TxwFJqqpi4tl1PJPI0e5Y9Mg4WYLW6KsaOY+PzzaOWLbK9bCG506lduIzAOp4vDITWq27Fe917C1PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUbEN8ylWF0NCEhtKTXQEm1vv6RioHFE+3M3t/qeRKd1eblmcH
	ThBqkCkWJ0/tUZv5YU6jecTuZI/A9RVm7ACthEx/0qkQc4wWdqL03XNp
X-Gm-Gg: ASbGnctkVUrRNDSpKGy2mAP9hw4q580bfKsAsBAfTPmbmWr+FvqyeSP9Q3rWyZBczvZ
	p6AhhgQmqG5nCXN9L04nqqQYXKa4DYqtdE6Qs6osW4cuE0zmTyMaShEHjuWJQcIQziKT9FRFKU4
	KeEEklTKWSIuJBPqxUPnAyIVtuu+fSe/4EwlByXbQQ76RifvScDTqWWjoghtaydL4kdo+AA2hwi
	X5kRPBbpsxmO2Sr3NtvjuGyN+cZPB52soC58Qr2ACAuYM0WU7SXfS988GcG6kT8RGKtNeriGuoh
	VnCzZDCvOD4r4nOMr0AZ1FJyiAnCRVI6AC6HZLpvwwkniX189mX2a0P0W1E9KyMH7O02+QVSqdC
	sDbpseXV8NGNrUe6pqn2amjeiEnBOgZ3DsbfwBZd5VHITNxHUT9xk3+QIgScK8dmx6sEFoELkKe
	UkXTE9jmmDiDvBVg==
X-Google-Smtp-Source: AGHT+IFIbBWXx2prf3L63/VMLVLYvYdUaI7SLOuUqClOeBLUtStROYnkPoiSKfHNBiSDpzIMrxiGbw==
X-Received: by 2002:a05:620a:2942:b0:8b2:1568:82e8 with SMTP id af79cd13be357-8ba39f3fa28mr709223985a.35.1765417736914;
        Wed, 10 Dec 2025 17:48:56 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab566610esm96625585a.16.2025.12.10.17.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:48:56 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/5] media: i2c: imx355: Support devicetree and power management
Date: Wed, 10 Dec 2025 20:48:43 -0500
Message-ID: <20251211014846.16602-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211014846.16602-1-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
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
 drivers/media/i2c/imx355.c | 118 ++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 776107efe386..c225bb8959bd 100644
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
+	struct regulator_bulk_data supplies[3];
+};
+
+static const char * const imx355_supply_names[] = {
+	"avdd",
+	"dvdd",
+	"dovdd",
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
@@ -1515,6 +1528,54 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 	.open = imx355_open,
 };
 
+static int imx355_power_off(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);
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
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		goto error_disable_clocks;
+	}
+
+	usleep_range(5000, 5100);
+	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+	usleep_range(8000, 8100);
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
@@ -1668,6 +1729,7 @@ static int imx355_probe(struct i2c_client *client)
 {
 	struct imx355 *imx355;
 	unsigned long freq;
+	size_t i;
 	int ret;
 
 	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
@@ -1678,7 +1740,7 @@ static int imx355_probe(struct i2c_client *client)
 
 	mutex_init(&imx355->mutex);
 
-	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, NULL);
+	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, "mclk");
 	if (IS_ERR(imx355->clk))
 		return dev_err_probe(imx355->dev, PTR_ERR(imx355->clk),
 				     "failed to get clock\n");
@@ -1689,16 +1751,28 @@ static int imx355_probe(struct i2c_client *client)
 				     "external clock %lu is not supported\n",
 				     freq);
 
-	/* Initialize subdev */
-	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
+	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
+		imx355->supplies[i].supply = imx355_supply_names[i];
 
-	/* Check module identity */
-	ret = imx355_identify_module(imx355);
+	ret = devm_regulator_bulk_get(imx355->dev,
+				      ARRAY_SIZE(imx355->supplies),
+				      imx355->supplies);
 	if (ret) {
-		dev_err(imx355->dev, "failed to find sensor: %d", ret);
+		dev_err_probe(imx355->dev, ret, "could not get regulators");
 		goto error_probe;
 	}
 
+	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
+						     GPIOD_OUT_LOW);
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
@@ -1706,13 +1780,26 @@ static int imx355_probe(struct i2c_client *client)
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
@@ -1752,6 +1839,9 @@ static int imx355_probe(struct i2c_client *client)
 error_handler_free:
 	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
 
+error_power_off:
+	imx355_power_off(imx355->dev);
+
 error_probe:
 	mutex_destroy(&imx355->mutex);
 
@@ -1768,7 +1858,11 @@ static void imx355_remove(struct i2c_client *client)
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
@@ -1779,10 +1873,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
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
+		.of_match_table = imx355_match_table,
+		.pm = &imx355_pm_ops,
 	},
 	.probe = imx355_probe,
 	.remove = imx355_remove,
-- 
2.52.0


