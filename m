Return-Path: <linux-media+bounces-18923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C298BD3F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81992835E2
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0761C3F00;
	Tue,  1 Oct 2024 13:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t92aafPO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ACC1C57A9
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788566; cv=none; b=GotM06He5fZHOyrY4l9ZihPeUq7NjWG/DvB2TXehi9folBBfFYihcgwLe+SJnOQ8XSSiGnOfss74wWoOyQJKpXHajAeO2G14fKWVU2Yun2vTw9PFBIMrAm0aXgKgIdocwdGdT2Yx9OyG7EK6lWZThhnbp2q/fCyXnKPfYUCP2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788566; c=relaxed/simple;
	bh=LL6t0/fJmZI9eHhzlG/ZhWayuHRs6YWaQKrP0a5lAkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCBnGV9fDT0fOntHAXETmbpt+GURfwk4Fp13cyGO9j2YCHHpA4E5+QE6cN0pQZfYWpO1yyZoQiAqS7ihk5O/SGx162EBTm2hC5bXEq3e5pudOMoagVD5CxziZDWBqIXAypdASjpTYOrxWUca3gr0aTXicolAv/QWpTTHTqoZIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t92aafPO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso54274181fa.1
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727788562; x=1728393362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1exe6gHY7SXzDJNE6ebEB1h7PVHhMSJMUSH5bL4x90=;
        b=t92aafPO8lXXO4JTCAZCb9BAj6ZGgVJ4kLfUv1URtW/vkvycDnzF99VJ6JXvTDXuS+
         uOmR6Fe8d2VtcU4W3FdCzHrYghuaDKr8j417yS/nd3Z7f+pHGARKTHYN0xokbAJgQy3h
         5MVojq40UDG3Lyjl+8Wv3zffa544sJ0mJ+uYul0aO4STuWY7wM9+WEm+TplVTIo/7+k/
         NkdWzBdvbU1W3lcVcnXduPbx09gPxH8KZPjTlilFztAU+9ZkMw7jfQAp7v9ivCnuYCIk
         MHxKIaxYO8uLya9OPbpk/lOOa3Z0mcTseQwdNFKB8f72Q/a6a7fPlODZX9kwQuP+TeE4
         0sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788562; x=1728393362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1exe6gHY7SXzDJNE6ebEB1h7PVHhMSJMUSH5bL4x90=;
        b=VjUk6gh04sC8ZbmE4Ks8e51Tf2HLD6ietbb+zxwl1gTANqhIv6vgQ72SL76hlFkf5I
         P7/JsKvOJ4fIqTAhVmheivgnzB/uzgvnrUDJNPCotqyM+lqktDrBfBRfc975+PN8N+1g
         ESimRFBDwC1b2y0HrszN9tFyKhkRSTymTAEqo21lQVIDL5Buc8eogtGcgcLF5VeffkN2
         IZCq2PPcF3QN0ySNX2XmEYciH+sZ/CdoyhnOetrguQwv3M0AS+r6oQRO6DdsgWLuPEsL
         Y4lfwg0enqYk2ObZqIeziTGowoia/N+c57OhiPC7PKSP0lHoi0S/zJqoob6BVN6tr84m
         bfcQ==
X-Gm-Message-State: AOJu0Yzm37tS+n8sW0Si22AvnTeQVag2O1TDBiwSgXei9SCS/joj+acI
	xQ179uU1j2BRNXbdIHptYCBAvAPtVgp+DF9bNU1ee/C4vRsmELvW3aINhekcKCw=
X-Google-Smtp-Source: AGHT+IFSxbUgwp5T17L4lfEcoZQa3j03UrqKT6wM0D3H8uIMQWJVbmmi8XefknZ5MF5QWzyA0y4HnA==
X-Received: by 2002:a2e:be24:0:b0:2fa:d4ef:f234 with SMTP id 38308e7fff4ca-2fad4eff502mr40485041fa.1.1727788562110;
        Tue, 01 Oct 2024 06:16:02 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88248abf5sm6170875a12.77.2024.10.01.06.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:16:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 01 Oct 2024 14:15:52 +0100
Subject: [PATCH v2 4/4] media: ov08x40: Add OF probe support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-b4-master-24-11-25-ov08x40-v2-4-e478976b20c1@linaro.org>
References: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
In-Reply-To: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7175;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=LL6t0/fJmZI9eHhzlG/ZhWayuHRs6YWaQKrP0a5lAkU=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm+/YIZ0w1u6sevaDtTjqQmx7Q16jGK5DFZBZuS
 yCUJLddqVWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvv2CAAKCRAicTuzoY3I
 Ouj5EACf19CU1PV2xw0MW/aNL/RLtrzd0vVfTlp8YuyWIQis4lTrI0+uNccandpCK2TWv+12VwN
 B2F9ZLcwr4JptwMuz6494Jx/bRic7pHBA2FOEXJN1k9NDomcKmhWw80z2YuEbH6eNSq0ldGRL7l
 7lhf/qjwUlKlsgJ7Mq0yYBUAnEOxQzZxQ53a1NnqigU0917Od+Y2H3qbDaYzPx/z6mNyy8/jSed
 pi3TdY69Uw8dPQLokOggPZP6HrZ8FiJTQ2NV+dhXb6Bys8XzWR0cJVwpivNqoeCrdiuxbhkVef8
 /RR7MveRh0REEaP1uh/ZyAuV7T6chHTAIlfjjKbhNUbYuorQEtQoZhgO71AjZ5AR2SKqFD3wSzL
 JTZFc4rCDz8GLSmn0qQr02NkD5ePne/B8RqXB9+KfOK4xwDL09SLDVpRX4vTokOPNeT/OUNId87
 sOmoOjKDshRfNdivDdCC0FkQdy+uhwLOnUzpvfaTWZQ27v1ijjBgIvFhrSa2kN7Fw/yf+M2Yt6A
 84qmoiwg179ykuZHA8EL0gEDTrWamwcfxn0lYi2u4aBMiPTmWo5Vvn4o2f2MLCUqywYZFX6YQIp
 ScsvTLUK7qXLT/3Rp6BE6/+Ij9qw+J8GcX+SZHWUHBYpeRpCcmj++u0/xv34fuo3CHjoC0COVoK
 9zKGTFX0jdTHszQ==
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
 drivers/media/i2c/ov08x40.c | 138 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 3ab8b51df157af78fcccc1aaef73aedb2ae759c9..821102287580acecd544402254cfe0fb5c8dc299 100644
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


