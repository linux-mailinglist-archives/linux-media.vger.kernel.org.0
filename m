Return-Path: <linux-media+bounces-50090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D1CFBFBB
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644B130EFECC
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3298724A078;
	Wed,  7 Jan 2026 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGpJL8iX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435525783A
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760232; cv=none; b=BbowJxDxRzm1w2LpUTgXPCvhP6fJ8MDx1IFpe2Ldw2io/yyzvtZJHV6CB00MxIedRSY1h/umagSAL49LapUydpH7hwKofFxzSVoas+NQ/ah/iNIzc9JFTHovQ6nDD8wbRtB2pe721q/jpxJmOrYZC90j6oBmMIPt7Kr3PVABYds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760232; c=relaxed/simple;
	bh=fDVcLsjtaSQrcZIbZdkcTcovh9DZTWgcaFEXLUhSgvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vr5VvkxatZcb2T7cL180ppqurnQKhJ2fxXlXg4EprT/wXK0VjslocgTwiiTNz2IElzCUh9tPIVSMeDov9cZYAas/g6pk1j9MkLHfKb6CoB4T5YbBY1sA0Ki6/prAGrTzb4SEaUFzwcdiB6Vf9nQArkKampJ3jlld0T6OZKFI18Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGpJL8iX; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8bc53dae8c2so221638685a.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760229; x=1768365029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hGaL0MxK+NmABcI5TTIgjIohzsC70UY7Qw6Wih7kXI=;
        b=jGpJL8iXJJ0aqjIb0M0fcz7AiK2TmrD69DWQMF2mUOMwPvmdRk8qIgSrBuXj6D/6bH
         Vy35pl6BvUCBVv8XBB8kaDcnOg3ZcIK0hO/LcuJGmmz4U15dvi7fkZ0ovJecIpGI8v2D
         wRpCgJMecAEOi/aDSRiUxnj2+51D0l/JVPSZBSQ0mjHoeIgL7dHPJJ5tJU7CiO28Z6ls
         QNoc9zyGqXn3HmT7SZs6bKHy/upZsvtR4onZi61UPV3mD7HH/ahA5xSA43z2N3YQMEch
         Kb2YbH5JHa341+Cm694sSvJC+ulktypqv0wpPC4uJA0xZuUtmcwqbOJwRN+qUMuV3Nv+
         IhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760229; x=1768365029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hGaL0MxK+NmABcI5TTIgjIohzsC70UY7Qw6Wih7kXI=;
        b=KLXDvHzbPpHpfZ75niUOHcblqkJThLL00wAhKBiIgrJQM1/dbbj6pVt2qd+fy/vwav
         gICwQ1qtwlrLw8StMHdm8RtClHYVRiidpmADum0PIvUO8ogPMb07Tvqwohm1RCue1Qv+
         ZI0C1xGzRy5ZviTyhqWP+sRsr72fD0Z1CKFrbXOaU3djHZUXap4mhsCTyLBQX5f/TgEL
         OW3BJR9lw1Olp1qKzU+Qi4SwoYQHujHGzLuhoDFuF0S1n5k58kSQd6ZZ3JOEOj1x+Z9M
         4HsAj48wwne06eWFsiIyAvo0xrhwQdEkTYFUlxJdH5nO9lnScERLvKzuil3vDHcJ1Ybt
         vUaA==
X-Forwarded-Encrypted: i=1; AJvYcCVhErEkkmUvnz8LUxEVs2EuNk9fKcCmzUFkIJvWMuO8cPLdkLZHnPwbbu3wn7Y3b8I5kpAX2wrOfXFg0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhlTy5cW26ehe76trma9A4Wc+n/cAfrlbKZlesgwi+k+GYzHgm
	sBe9OBri/bglKLTLDtzVJYvDJngoQichwLb1T93mVFQgLdKinb05ygq+
X-Gm-Gg: AY/fxX4fmRHYx7YMJ7HC+ByW+an9jX+7rPB5S3mpl2ZXyR428gRVC31UZIqUtTlZmvo
	igPmBoAoHhDokMIGBGfQsE+tsoIUy1NLns5zVAQv6lVczC0YPpvACO/Ss2DIXyNYVdQLD5g3CaX
	eSlFdevkI5SOQiRCQIznZ/hYXWaEwdSi6tIxR1obRFUVekujvOj/ZG8+47jTIVrjYcnIObgM1MN
	5xCpksZHilel5N6F6TcWlLbH5MeUt/aZL6JaZ6xc5uAiGQGlOel9CQxMY1gy1nBdsmGGPpKZSD1
	snwD1JG7bRGa7A4ZM3eVLm7VaJGaZr3Z5LgZ7T5/VnTLdBQ214VnTtROO3GjkXweePrr1E3T27u
	uMenoQBYpqFYe9LFnH+UMlEgb7JnZyKWfZA7+U7xREAk+REW4oqSWbjvxpIADyVE/4LojJo5alX
	Q7Jf4lo6WS/33pLHpwRi4v3FcKaH7R+OltDtRs96rH3AozOKCFrYcUZGBuVlkubxlI6QfHVjCYB
	Lw=
X-Google-Smtp-Source: AGHT+IEud5ZgaGMtj39i8NtiPek1sxZaWg0gmVmp2ihrTT9ZWXwJJriiz+SVjRHkqwT7lsJZxEyGqA==
X-Received: by 2002:a05:622a:1e13:b0:4ed:b82b:1984 with SMTP id d75a77b69052e-4ffb4854e7fmr17317691cf.30.1767760228801;
        Tue, 06 Jan 2026 20:30:28 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39950sm24478311cf.1.2026.01.06.20.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:28 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power management
Date: Tue,  6 Jan 2026 23:30:41 -0500
Message-ID: <20260107043044.92485-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107043044.92485-1-mailingradian@gmail.com>
References: <20260107043044.92485-1-mailingradian@gmail.com>
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
Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/media/i2c/imx355.c | 116 ++++++++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 776107efe386..4ac8495d1a3d 100644
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
+	usleep_range(5000, 5100);
+	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
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
@@ -1689,16 +1751,26 @@ static int imx355_probe(struct i2c_client *client)
 				     "external clock %lu is not supported\n",
 				     freq);
 
-	/* Initialize subdev */
-	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
-
-	/* Check module identity */
-	ret = imx355_identify_module(imx355);
+	ret = devm_regulator_bulk_get_const(imx355->dev,
+				      ARRAY_SIZE(imx355_supplies),
+				      imx355_supplies,
+				      &imx355->supplies);
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


