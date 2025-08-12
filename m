Return-Path: <linux-media+bounces-39653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE755B23B12
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176826E6D6E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8961F2E172F;
	Tue, 12 Aug 2025 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OD8+c2E7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B142E11B5
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035232; cv=none; b=aD+FgT/5/1IkoYLwcZRuKvwG/WvsnjijvxRQo3Vp/t1VOBLHeoSy7IwVdR9qQsjnqnMJf/FoOfqFZww3FCv/q9BiRNgRe945jKWH4FBy3OIpiLtNsvOeYB2Wb9YZqeOYJdAqNcqhr99n9Hj9yiODBL0nhgLq4duOuIEiMfhdl74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035232; c=relaxed/simple;
	bh=QvKK12vr28KZUdgQj8pI2PQyaZF+YHOD6LH+mRm+PPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNkjRLCHDtP9gSEqAAoQ9uB09coNViXInrK12kaJcvgGr6mAJwwVUB4d5S834sbt2C3Lg6mo/9a4W3Lsbq4Aj+8EtpD+4z1EWt7hfVL9G2AYGqAJON9aMrDRO5i2hSp5wWqs9iPzegdTC5scUH6UBe2Emo6vHO+RBj1qskjB8Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OD8+c2E7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8B5A71738;
	Tue, 12 Aug 2025 23:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035174;
	bh=QvKK12vr28KZUdgQj8pI2PQyaZF+YHOD6LH+mRm+PPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OD8+c2E7h8oomJi7pb+B8koyHah8wF7eiUGKVeaymd+b/BKnVLUxEKmBeYM89lfzB
	 +owjjImlB7ZlDwoxlX0kNDiW0NuhGF+C2vjZPuZqVdo0DgU5cIsOK2oPpPYwF+gASw
	 GYPHH3JIC+euQqOfahsssAj8ngdqkB0w/0hNpcjM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 17/72] media: i2c: imx319: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:25 +0300
Message-ID: <20250812214620.30425-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several camera sensor drivers access the "clock-frequency" property
directly to retrieve the external clock rate, or modify the clock rate
of the external clock programmatically. Both behaviours are valid on
a subset of ACPI platforms, but are considered deprecated on OF
platforms, and do not support ACPI platforms that implement MIPI DisCo
for Imaging. Implementing them manually in drivers is deprecated, as
that can encourage cargo-cult and lead to differences in behaviour
between drivers. Instead, drivers should use the
devm_v4l2_sensor_clk_get() helper.

This driver supports ACPI platforms only. It retrieves the clock rate
from the "clock-frequency" property. If the rate does not match the
expected rate, the driver fails probing. This is correct behaviour for
ACPI.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx319.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index f404d053873c..953310ef3046 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2018 Intel Corporation
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -107,7 +108,6 @@ struct imx319_mode {
 };
 
 struct imx319_hwcfg {
-	u32 ext_clk;			/* sensor external clk */
 	unsigned long link_freq_bitmap;
 };
 
@@ -2347,20 +2347,6 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 	if (!cfg)
 		goto out_err;
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &cfg->ext_clk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		goto out_err;
-	}
-
-	dev_dbg(dev, "ext clk: %d", cfg->ext_clk);
-	if (cfg->ext_clk != IMX319_EXT_CLK) {
-		dev_err(dev, "external clock %d is not supported",
-			cfg->ext_clk);
-		goto out_err;
-	}
-
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       link_freq_menu_items,
@@ -2382,6 +2368,8 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct device *dev)
 static int imx319_probe(struct i2c_client *client)
 {
 	struct imx319 *imx319;
+	unsigned long freq;
+	struct clk *clk;
 	bool full_power;
 	int ret;
 
@@ -2393,6 +2381,17 @@ static int imx319_probe(struct i2c_client *client)
 
 	mutex_init(&imx319->mutex);
 
+	clk = devm_v4l2_sensor_clk_get(imx319->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(imx319->dev, PTR_ERR(clk),
+				     "failed to acquire clock\n");
+
+	freq = clk_get_rate(clk);
+	if (freq != IMX319_EXT_CLK)
+		return dev_err_probe(imx319->dev, -EINVAL,
+				     "external clock %lu is not supported",
+				     freq);
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx319->sd, client, &imx319_subdev_ops);
 
-- 
Regards,

Laurent Pinchart


