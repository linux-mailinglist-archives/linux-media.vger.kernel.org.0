Return-Path: <linux-media+bounces-37916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A3B07E03
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 21:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3165718909CF
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 19:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FF72E7BCB;
	Wed, 16 Jul 2025 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL7Dz2cV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9E02C0323;
	Wed, 16 Jul 2025 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694337; cv=none; b=jE5FBE2wZkBc/fnXJwz9gH1y6nnoKGMrCsKN+wY4KtpewCA85M+AAhy/BQYKeVT9n4g5rr5mtpxQc23BPq2GBQHGrGrHUeeuaP71KzakcPMRGNtJW0XtjQOwG/be0YVGWQQ/56BrvWg8xdQ2dovQay6acUuX20cn3BhDs0jVH8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694337; c=relaxed/simple;
	bh=7Sh7EAbAU9kma2QUic7wH9gBLsHCdO1j7d6yJKIZamk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CHqXiJwPwHONHVJlVMBwctcuKU65KykaGAxhZtk06GNJCUQ8c5eSbvhBzw1aB5QWdJhNW+ssnOA+a1yCq/w/TXEtYRVIaMFBDeqGm6g7xhWk3e6nlVySCYCa7/2Mixwz4foCVDnL67xa5a2a2H27WGVas63lMpZwV6G2bstT+3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL7Dz2cV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae3a604b43bso38661066b.0;
        Wed, 16 Jul 2025 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694332; x=1753299132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD1E1+0Icn3HXPMJB8OtVJkHH0kOWkjneMIoK98K23U=;
        b=iL7Dz2cVtkSZoLVTcdIQHjBzC8+YxenB+i3VY3Bi6qFtkWz0e+8mA62lVzAYN1WHFm
         UnV5khUNCgub1Yjv7L6GB7824kgCNMBJ5OXKz2eGz0f/NkGoWOVwwqLoxVuDvD20GWT2
         NpZXLCJjDi57dYonRbwt/dX59rAUy9jX7inyitNtPHwncCCYqZ5JOCmCnbObgITk9Upg
         tD/1qA2/fnNwgDqSfuqyS4sL8Rb00d91/3ZwePoMapeEiWaBVCb5NgUKz6Kkb4jXAiFE
         ih1ubHn2F5gh+211fIrXcPNv57OLHpIXL4QZEO99cChY05fBywGB9wLH93nxwmqmWxAl
         ADxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694332; x=1753299132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AD1E1+0Icn3HXPMJB8OtVJkHH0kOWkjneMIoK98K23U=;
        b=upHkOyGpO0fmzZCQswhL2lWvVSxlz5bS1SWrrfqLfdehDjPtpExF9tcMTGagVfUcM6
         BYr400IMY2QeOrRRslTuoEs6mjCTtGP02HEyELRFhmSOPLQA1zULPFYaYmojy4KJQA9S
         hiK2BZGjzu+bcUVAjBUQJAbh/FgB1OQnSKJZz7I6TBOgviF0CPLdgC78DkIKKjJHcJ17
         XqV/orCyfyJKDxlsv5W3lMh1lq5VzaHvUHjvkIQ0uIBiQ4cLXdl6x83jTpopSh9WEXD/
         kpBzjCNA17Kh195AS48Z6xFVVVZUjfKIMF0QMfEfjbb2k+TDx2fIlWve1AQLzAV08+7w
         ZHbA==
X-Forwarded-Encrypted: i=1; AJvYcCWr6C7BQrHg0wFZAqPWd6Hagv7WbYoA+dChEkEoAgXoT7a0gzjuuwFk/odBVnQm1AdOSZffuwTL5YpSDw==@vger.kernel.org, AJvYcCXjArVV3PiTt0FawHokfcVJWYGoxfr0uuQHoyO7Qz83HmzAYk8C5WiDmEXc6NDngVFkVoOVfwhIQ7dq1DzS@vger.kernel.org, AJvYcCXmMhRy857ndqXq7XvUWvQW0CdbN1CkAr3ZN09nAsr340PDhR+6Ige/jAe2U9ORL6/fCo9DbJGtclh/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gihLxvozoSrI5sWksVj5WHwTAHBjhlc29BRe11Ei6dpNyJ/d
	zFOLehedUWTP0ghIvn2tDCk8dky0ZWH3nD76aBIuSUg3ofHG23HJNbSN
X-Gm-Gg: ASbGnctlD1exGnXDidT1pHdP7Ip+W/biIlLzmnSVOGcd4m9K2DACUzoHLasvAHs3FSn
	iseRFl9IPNevGGtuKf9NFh22yAEXERrrRL4gsAwqeEnGIkVXF0O8fAAulwqoGrgoJb2gfnT43lB
	Tz6am1EbKWj0UjCWDbWtYDKY1ubCetGx2PLkptDWwWs7SSSIby9sd5sAbLj7cXwcrtD5B5oMJTu
	sD4SXXF6K/6B6aewYsW/Ra8gnTyeEsfcQuB3AfDfzQtSMEDMcWWO0UYnuocOu8pYlgUEsvHyRMR
	o58wpQDlbFvjI4RKbn0HBYXR7Aw6ABP+9+Z7Ek5+oKlStbD9vRWbpWiwt3zM8UfIkwVQDAo4Vkq
	FDaOLcQG3AN1JpckLSQOuTp6DUGQknLcNCL8=
X-Google-Smtp-Source: AGHT+IHl526G13qdD6m1dVsFkTOTIUIi41zBrksYPPlJXKQdazUBBueM2yxtyLd4gEfEI7vTarQw6w==
X-Received: by 2002:a17:907:724c:b0:ae3:6028:e4d0 with SMTP id a640c23a62f3a-ae9cddb0405mr417796066b.7.1752694331859;
        Wed, 16 Jul 2025 12:32:11 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:32:11 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v6 22/24] staging: media: remove MAX96712 driver
Date: Wed, 16 Jul 2025 22:31:07 +0300
Message-ID: <20250716193111.942217-23-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the staging MAX96712 driver.
Its functionality has been moved to the MAX96724 driver which makes use
of the Maxim GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                               |   1 -
 drivers/staging/media/Kconfig             |   2 -
 drivers/staging/media/Makefile            |   1 -
 drivers/staging/media/max96712/Kconfig    |  14 -
 drivers/staging/media/max96712/Makefile   |   2 -
 drivers/staging/media/max96712/max96712.c | 487 ----------------------
 6 files changed, 507 deletions(-)
 delete mode 100644 drivers/staging/media/max96712/Kconfig
 delete mode 100644 drivers/staging/media/max96712/Makefile
 delete mode 100644 drivers/staging/media/max96712/max96712.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c75a5c195c28..ff0c7fe22ce6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14751,7 +14751,6 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
-F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index ab250c89cd4d4..edcec810433de 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -30,8 +30,6 @@ source "drivers/staging/media/ipu3/Kconfig"
 
 source "drivers/staging/media/ipu7/Kconfig"
 
-source "drivers/staging/media/max96712/Kconfig"
-
 source "drivers/staging/media/meson/vdec/Kconfig"
 
 source "drivers/staging/media/starfive/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 4a073938b2b2d..e38421c81d0e7 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -2,7 +2,6 @@
 obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE)	+= deprecated/atmel/
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
-obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+= starfive/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
deleted file mode 100644
index 117fadf81bd08..0000000000000
--- a/drivers/staging/media/max96712/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config VIDEO_MAX96712
-	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
-	depends on I2C
-	depends on OF_GPIO
-	depends on VIDEO_DEV
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	select MEDIA_CONTROLLER
-	help
-	  This driver supports the Maxim MAX96712 Quad GMSL2 Deserializer.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called max96712.
diff --git a/drivers/staging/media/max96712/Makefile b/drivers/staging/media/max96712/Makefile
deleted file mode 100644
index 70c1974ce3f05..0000000000000
--- a/drivers/staging/media/max96712/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIDEO_MAX96712) += max96712.o
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
deleted file mode 100644
index 0751b2e048958..0000000000000
--- a/drivers/staging/media/max96712/max96712.c
+++ /dev/null
@@ -1,487 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Maxim MAX96712 Quad GMSL2 Deserializer Driver
- *
- * Copyright (C) 2021 Renesas Electronics Corporation
- * Copyright (C) 2021 Niklas Söderlund
- */
-
-#include <linux/delay.h>
-#include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/of_graph.h>
-#include <linux/regmap.h>
-
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-fwnode.h>
-#include <media/v4l2-subdev.h>
-
-#define DEBUG_EXTRA_REG			0x09
-#define DEBUG_EXTRA_PCLK_25MHZ		0x00
-#define DEBUG_EXTRA_PCLK_75MHZ		0x01
-
-enum max96712_pattern {
-	MAX96712_PATTERN_CHECKERBOARD = 0,
-	MAX96712_PATTERN_GRADIENT,
-};
-
-struct max96712_info {
-	unsigned int dpllfreq;
-	bool have_debug_extra;
-};
-
-struct max96712_priv {
-	struct i2c_client *client;
-	struct regmap *regmap;
-	struct gpio_desc *gpiod_pwdn;
-
-	const struct max96712_info *info;
-
-	bool cphy;
-	struct v4l2_mbus_config_mipi_csi2 mipi;
-
-	struct v4l2_subdev sd;
-	struct v4l2_ctrl_handler ctrl_handler;
-	struct media_pad pads[1];
-
-	enum max96712_pattern pattern;
-};
-
-static int max96712_write(struct max96712_priv *priv, unsigned int reg, u8 val)
-{
-	int ret;
-
-	ret = regmap_write(priv->regmap, reg, val);
-	if (ret)
-		dev_err(&priv->client->dev, "write 0x%04x failed\n", reg);
-
-	return ret;
-}
-
-static int max96712_update_bits(struct max96712_priv *priv, unsigned int reg,
-				u8 mask, u8 val)
-{
-	int ret;
-
-	ret = regmap_update_bits(priv->regmap, reg, mask, val);
-	if (ret)
-		dev_err(&priv->client->dev, "update 0x%04x failed\n", reg);
-
-	return ret;
-}
-
-static int max96712_write_bulk(struct max96712_priv *priv, unsigned int reg,
-			       const void *val, size_t val_count)
-{
-	int ret;
-
-	ret = regmap_bulk_write(priv->regmap, reg, val, val_count);
-	if (ret)
-		dev_err(&priv->client->dev, "bulk write 0x%04x failed\n", reg);
-
-	return ret;
-}
-
-static int max96712_write_bulk_value(struct max96712_priv *priv,
-				     unsigned int reg, unsigned int val,
-				     size_t val_count)
-{
-	unsigned int i;
-	u8 values[4];
-
-	for (i = 1; i <= val_count; i++)
-		values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;
-
-	return max96712_write_bulk(priv, reg, &values, val_count);
-}
-
-static void max96712_reset(struct max96712_priv *priv)
-{
-	max96712_update_bits(priv, 0x13, 0x40, 0x40);
-	msleep(20);
-}
-
-static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
-{
-	if (enable) {
-		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
-	} else {
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
-		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
-	}
-}
-
-static void max96712_mipi_configure(struct max96712_priv *priv)
-{
-	unsigned int i;
-	u8 phy5 = 0;
-
-	max96712_mipi_enable(priv, false);
-
-	/* Select 2x4 mode. */
-	max96712_write(priv, 0x8a0, 0x04);
-
-	/* TODO: Add support for 2-lane and 1-lane configurations. */
-	if (priv->cphy) {
-		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xa0);
-
-		/* Configure C-PHY timings. */
-		max96712_write(priv, 0x8ad, 0x3f);
-		max96712_write(priv, 0x8ae, 0x7d);
-	} else {
-		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xc0);
-	}
-
-	/* Configure lane mapping for PHY0 and PHY1. */
-	/* TODO: Add support for lane swapping. */
-	max96712_write(priv, 0x8a3, 0xe4);
-
-	/* Configure lane polarity for PHY0 and PHY1. */
-	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
-		if (priv->mipi.lane_polarities[i])
-			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
-	max96712_write(priv, 0x8a5, phy5);
-
-	/* Set link frequency for PHY0 and PHY1. */
-	max96712_update_bits(priv, 0x415, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
-	max96712_update_bits(priv, 0x418, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
-
-	/* Enable PHY0 and PHY1 */
-	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
-}
-
-static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
-{
-	const u32 h_active = 1920;
-	const u32 h_fp = 88;
-	const u32 h_sw = 44;
-	const u32 h_bp = 148;
-	const u32 h_tot = h_active + h_fp + h_sw + h_bp;
-
-	const u32 v_active = 1080;
-	const u32 v_fp = 4;
-	const u32 v_sw = 5;
-	const u32 v_bp = 36;
-	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
-
-	if (!enable) {
-		max96712_write(priv, 0x1051, 0x00);
-		return;
-	}
-
-	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
-	if (priv->info->have_debug_extra)
-		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
-
-	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
-	max96712_write_bulk_value(priv, 0x1052, 0, 3);
-	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x1058,
-				  (v_active + v_fp + + v_bp) * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x105b, 0, 3);
-	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
-	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
-	max96712_write_bulk_value(priv, 0x1064,
-				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
-	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
-	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
-
-	/* Generate VS, HS and DE in free-running mode. */
-	max96712_write(priv, 0x1050, 0xfb);
-
-	/* Configure Video Pattern Generator. */
-	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
-		/* Set checkerboard pattern size. */
-		max96712_write(priv, 0x1074, 0x3c);
-		max96712_write(priv, 0x1075, 0x3c);
-		max96712_write(priv, 0x1076, 0x3c);
-
-		/* Set checkerboard pattern colors. */
-		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
-		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
-
-		/* Generate checkerboard pattern. */
-		max96712_write(priv, 0x1051, 0x10);
-	} else {
-		/* Set gradient increment. */
-		max96712_write(priv, 0x106d, 0x10);
-
-		/* Generate gradient pattern. */
-		max96712_write(priv, 0x1051, 0x20);
-	}
-}
-
-static int max96712_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
-
-	if (enable) {
-		max96712_pattern_enable(priv, true);
-		max96712_mipi_enable(priv, true);
-	} else {
-		max96712_mipi_enable(priv, false);
-		max96712_pattern_enable(priv, false);
-	}
-
-	return 0;
-}
-
-static const struct v4l2_subdev_video_ops max96712_video_ops = {
-	.s_stream = max96712_s_stream,
-};
-
-static int max96712_init_state(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *state)
-{
-	static const struct v4l2_mbus_framefmt default_fmt = {
-		.width          = 1920,
-		.height         = 1080,
-		.code           = MEDIA_BUS_FMT_RGB888_1X24,
-		.colorspace     = V4L2_COLORSPACE_SRGB,
-		.field          = V4L2_FIELD_NONE,
-		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
-		.quantization   = V4L2_QUANTIZATION_DEFAULT,
-		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
-	};
-	struct v4l2_mbus_framefmt *fmt;
-
-	fmt = v4l2_subdev_state_get_format(state, 0);
-	*fmt = default_fmt;
-
-	return 0;
-}
-
-static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
-	.init_state = max96712_init_state,
-};
-
-static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
-};
-
-static const struct v4l2_subdev_ops max96712_subdev_ops = {
-	.video = &max96712_video_ops,
-	.pad = &max96712_pad_ops,
-};
-
-static const char * const max96712_test_pattern[] = {
-	"Checkerboard",
-	"Gradient",
-};
-
-static int max96712_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct max96712_priv *priv =
-		container_of(ctrl->handler, struct max96712_priv, ctrl_handler);
-
-	switch (ctrl->id) {
-	case V4L2_CID_TEST_PATTERN:
-		priv->pattern = ctrl->val ?
-			MAX96712_PATTERN_GRADIENT :
-			MAX96712_PATTERN_CHECKERBOARD;
-		break;
-	}
-	return 0;
-}
-
-static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
-	.s_ctrl = max96712_s_ctrl,
-};
-
-static int max96712_v4l2_register(struct max96712_priv *priv)
-{
-	long pixel_rate;
-	int ret;
-
-	priv->sd.internal_ops = &max96712_internal_ops;
-	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-
-	v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);
-
-	/*
-	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
-	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
-	 */
-	pixel_rate = priv->info->dpllfreq / priv->mipi.num_data_lanes * 1000000;
-	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
-
-	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(max96712_test_pattern) - 1,
-				     0, 0, max96712_test_pattern);
-
-	priv->sd.ctrl_handler = &priv->ctrl_handler;
-	ret = priv->ctrl_handler.error;
-	if (ret)
-		goto error;
-
-	priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
-	if (ret)
-		goto error;
-
-	v4l2_set_subdevdata(&priv->sd, priv);
-
-	priv->sd.state_lock = priv->ctrl_handler.lock;
-	ret = v4l2_subdev_init_finalize(&priv->sd);
-	if (ret)
-		goto error;
-
-	ret = v4l2_async_register_subdev(&priv->sd);
-	if (ret < 0) {
-		dev_err(&priv->client->dev, "Unable to register subdevice\n");
-		goto error;
-	}
-
-	return 0;
-error:
-	v4l2_ctrl_handler_free(&priv->ctrl_handler);
-
-	return ret;
-}
-
-static int max96712_parse_dt(struct max96712_priv *priv)
-{
-	struct fwnode_handle *ep;
-	struct v4l2_fwnode_endpoint v4l2_ep = {
-		.bus_type = V4L2_MBUS_UNKNOWN,
-	};
-	unsigned int supported_lanes;
-	int ret;
-
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
-					     0, 0);
-	if (!ep) {
-		dev_err(&priv->client->dev, "Not connected to subdevice\n");
-		return -EINVAL;
-	}
-
-	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
-	fwnode_handle_put(ep);
-	if (ret) {
-		dev_err(&priv->client->dev, "Could not parse v4l2 endpoint\n");
-		return -EINVAL;
-	}
-
-	switch (v4l2_ep.bus_type) {
-	case V4L2_MBUS_CSI2_DPHY:
-		supported_lanes = 4;
-		priv->cphy = false;
-		break;
-	case V4L2_MBUS_CSI2_CPHY:
-		supported_lanes = 3;
-		priv->cphy = true;
-		break;
-	default:
-		dev_err(&priv->client->dev, "Unsupported bus-type %u\n",
-			v4l2_ep.bus_type);
-		return -EINVAL;
-	}
-
-	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != supported_lanes) {
-		dev_err(&priv->client->dev, "Only %u data lanes supported\n",
-			supported_lanes);
-		return -EINVAL;
-	}
-
-	priv->mipi = v4l2_ep.bus.mipi_csi2;
-
-	return 0;
-}
-
-static const struct regmap_config max96712_i2c_regmap = {
-	.reg_bits = 16,
-	.val_bits = 8,
-	.max_register = 0x1f00,
-};
-
-static int max96712_probe(struct i2c_client *client)
-{
-	struct max96712_priv *priv;
-	int ret;
-
-	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->info = of_device_get_match_data(&client->dev);
-
-	priv->client = client;
-
-	priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
-
-	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
-						   GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpiod_pwdn))
-		return PTR_ERR(priv->gpiod_pwdn);
-
-	gpiod_set_consumer_name(priv->gpiod_pwdn, "max96712-pwdn");
-	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
-
-	if (priv->gpiod_pwdn)
-		usleep_range(4000, 5000);
-
-	max96712_reset(priv);
-
-	ret = max96712_parse_dt(priv);
-	if (ret)
-		return ret;
-
-	max96712_mipi_configure(priv);
-
-	return max96712_v4l2_register(priv);
-}
-
-static void max96712_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
-
-	v4l2_async_unregister_subdev(&priv->sd);
-
-	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
-}
-
-static const struct max96712_info max96712_info_max96712 = {
-	.dpllfreq = 1000,
-	.have_debug_extra = true,
-};
-
-static const struct max96712_info max96712_info_max96724 = {
-	.dpllfreq = 1200,
-};
-
-static const struct of_device_id max96712_of_table[] = {
-	{ .compatible = "maxim,max96712", .data = &max96712_info_max96712 },
-	{ .compatible = "maxim,max96724", .data = &max96712_info_max96724 },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, max96712_of_table);
-
-static struct i2c_driver max96712_i2c_driver = {
-	.driver	= {
-		.name = "max96712",
-		.of_match_table	= of_match_ptr(max96712_of_table),
-	},
-	.probe = max96712_probe,
-	.remove = max96712_remove,
-};
-
-module_i2c_driver(max96712_i2c_driver);
-
-MODULE_DESCRIPTION("Maxim MAX96712 Quad GMSL2 Deserializer Driver");
-MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
-MODULE_LICENSE("GPL");
-- 
2.50.1


