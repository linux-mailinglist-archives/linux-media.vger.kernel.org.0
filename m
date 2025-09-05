Return-Path: <linux-media+bounces-41878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C15B4663B
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 23:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 877A5A4475D
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 21:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C669F2F3601;
	Fri,  5 Sep 2025 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDE9T7Bd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8660E2ECD30;
	Fri,  5 Sep 2025 21:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757109360; cv=none; b=Ecvq5+b6OqKuNOlNWDBqz/SMxRZ9FPL77qgOZm333RBhG3lF1TGvi6DRHlOd/UVbpTXc9w5aBso8PKoISoEByUMbMegbqRo0ffgrR54GWkGMrlAcfge0aoAiLnrr9L5VP9pmo2Du8zXy5tldOMI1I6gyG0NpHE65iZgzWgVNZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757109360; c=relaxed/simple;
	bh=HHByU31w0NDTv/4d3cbxA0UO5JSAhL6I1Im3r8pA0cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOl+fEcsRshTOX0QFsZNV36RyDMH6g3q6akZhb8uuxCHhGuQLY22hvh9DsHNUShXV5izjypt02TwktIEWqlmPwSHPF1kSmIqpoxrozotMMO7Z/te2nyV7EcpsYQSfNSrW9bCSG6vAnSDZ0HwtmE8xPWtYcw7rxornIZVeVT67no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDE9T7Bd; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70ddadde494so21640566d6.1;
        Fri, 05 Sep 2025 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757109357; x=1757714157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMG63lOb6eLgES+Mv4+J7xXV04zLwZFOcbxEHpbLgQI=;
        b=eDE9T7BdbQnSAs5m3fX34zJn59MbyRVaIpNRVrQF3gdgAuw8357pSarkcVHicfZyEy
         rLaBss+OwaEhI2UrNibP1H7rZZU55PU9vymsfIbv81EMuERUqF/QB702lFw+GkGofT8n
         sfpBitmDzX2W3DtTJXy+nXwbXaY4Kl0xJldeZDj7j7Sl9m5m3N0t2Y6tyfNwXxd+GvU8
         pqBCeJM1+3XN1ePlX0l+tHyM8/bw5Z2CLo0wcoeMRuvUNHF7qkV6g17OHIV+3SxdtZTm
         WV7YtQl92omGk9VAW8t+p9hMjhvPVvrBV7ZGMyFsZ1gLFHJkDATAY6L9uKG0ZEF1qPDE
         Kc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757109357; x=1757714157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMG63lOb6eLgES+Mv4+J7xXV04zLwZFOcbxEHpbLgQI=;
        b=T7uoO7BsH2GuAWDe5irdwpxGBKZIt0g8GERWho4cGKfaQT7kPBFztaNV57SMFctlY6
         BdRoxMQDYzKoroyPZJoXexpqEWV41iz/75a8F8QbFeVWcsewo7zXL46TM1agCAck7/OJ
         SgloEReFpIgcXpmFVa4p4UK+ghn0sexHOGhODUwNxElHATkhVAinG4I9qtCN1Ldx6TVG
         zL2BryWoyblJULXCKcFxJ+fpWxzR+J1G6G4P1rDQX9tJony9ACtCANovnAG8R8mBkiNg
         1QBdz7leYkIkufuunfid0vj5f/K88+7ThGCYAQ/dyJTaRsTyYZrPfz0MV9AvSvlJehq7
         GQNw==
X-Forwarded-Encrypted: i=1; AJvYcCU4g9EkEqoOTzwG2Zr+xo+1GvrwRxEMwavk7FG79Q0o0wRRDbONjFntFoLQjAX/QxTkpCRWmYxclpcd@vger.kernel.org, AJvYcCVlXz8gqYzkndPi2mCEo8VP7vnPoJjMtXW6KUvaeluzknl5wYxiio8F87ViKeCmeKg7OGmQ5i8p6hNwjfc=@vger.kernel.org, AJvYcCW/OgLlcxkihzcxpLT/mZyREaqD9L3oHiaohK7JF48tvGupo7nOvmsvYQgOPQ9HezbXRTjG/ZDcah7wUgNUxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAFjV3tLkZOTnnE0y6Q/tzlwnRRCOypXYjW3LXP2qLqC1LNWY
	pCf55V9TSjPqQQqb3pnLO7pmGEZKuZSuigmlRHv7eE28fESUa3fPHPzM
X-Gm-Gg: ASbGncvaYofuFvXTkwIE+ZoA00BeZiQQf+W6QOUQYdppRnmOJ/ODDtvIg8eLcWrp4f5
	m3MH4nkHQdx1G/+fdaJOCq3PmnWJXbUIuLQbAWxz8xtE71oWAWJEYRDZwTyMlXC5lwDC7GPYmPq
	HQ4h7ZxbFx48B3aYKXnCgxhaIHiXkChhXNCuEg3G/QbEijwogliNSGQUfJDRBTeC/RDGoTaYDyw
	W8dHJT0EmaSC11cKwEkLipg7aZ5VpjRVIrkRxguRPe8Owo7V4T3kuvzpcOD7RDEn25krPTpS0j7
	3Je/BHRhEG6odAAtXNXg5pIQfJ3mp5O8spIfPHgfiPbc9SSHR+NBYEAXUPSxZfIJKFrMUQtknBr
	cSC2IHJ5iem4ervagcdns+pB18Zozh7GlNYS0
X-Google-Smtp-Source: AGHT+IGgFtBPR+2J5ioMg+TCwxLf68koemdKo/dtzoi9LF2eiiG0aAaXCUgmyPZxdJzrHLNQAclAwA==
X-Received: by 2002:a05:6214:409:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-73921a43c71mr5127006d6.6.1757109357187;
        Fri, 05 Sep 2025 14:55:57 -0700 (PDT)
Received: from localhost ([174.89.105.238])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-720add668bdsm72018646d6.33.2025.09.05.14.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:55:56 -0700 (PDT)
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
Subject: [PATCH v3 2/4] media: i2c: imx355: Support devicetree and power management
Date: Fri,  5 Sep 2025 17:55:19 -0400
Message-ID: <20250905215516.289998-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905215516.289998-6-mailingradian@gmail.com>
References: <20250905215516.289998-6-mailingradian@gmail.com>
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
 drivers/media/i2c/imx355.c | 135 +++++++++++++++++++++++++++++++++----
 1 file changed, 122 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b2dce67c0b6b..f7c51e50113e 100644
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
@@ -1516,6 +1531,57 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 	.open = imx355_open,
 };
 
+static int imx355_power_off(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+
+	if (imx355->reset_gpio)
+		gpiod_set_value_cansleep(imx355->reset_gpio, 0);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx355->supplies), imx355->supplies);
+	clk_disable_unprepare(imx355->mclk);
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
@@ -1623,7 +1689,7 @@ static int imx355_init_controls(struct imx355 *imx355)
 	return ret;
 }
 
-static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
+static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev, struct imx355 *imx355)
 {
 	struct imx355_hwcfg *cfg;
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1648,12 +1714,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &cfg->ext_clk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		goto out_err;
-	}
+	cfg->ext_clk = clk_get_rate(imx355->mclk);
 
 	dev_dbg(dev, "ext clk: %d", cfg->ext_clk);
 	if (cfg->ext_clk != IMX355_EXT_CLK) {
@@ -1683,6 +1744,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 static int imx355_probe(struct i2c_client *client)
 {
 	struct imx355 *imx355;
+	size_t i;
 	int ret;
 
 	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
@@ -1694,27 +1756,59 @@ static int imx355_probe(struct i2c_client *client)
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
+		goto error_probe;
+	}
+
+	imx355->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(imx355->reset_gpio)) {
+		ret = dev_err_probe(&client->dev, PTR_ERR(imx355->reset_gpio),
+				    "failed to get gpios");
+		goto error_probe;
+	}
+
+	imx355->mclk = devm_v4l2_sensor_clk_get(&client->dev, "mclk");
+	if (IS_ERR(imx355->mclk)) {
+		ret = dev_err_probe(&client->dev, PTR_ERR(imx355->mclk),
+				    "failed to get mclk");
 		goto error_probe;
 	}
 
-	imx355->hwcfg = imx355_get_hwcfg(&client->dev);
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
@@ -1754,6 +1848,9 @@ static int imx355_probe(struct i2c_client *client)
 error_handler_free:
 	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
 
+error_power_off:
+	imx355_power_off(&client->dev);
+
 error_probe:
 	mutex_destroy(&imx355->mutex);
 
@@ -1770,7 +1867,11 @@ static void imx355_remove(struct i2c_client *client)
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
@@ -1781,10 +1882,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
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
2.51.0


