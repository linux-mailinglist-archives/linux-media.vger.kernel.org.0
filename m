Return-Path: <linux-media+bounces-37370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A2B00A8B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C435D5C21D6
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F0F2F3638;
	Thu, 10 Jul 2025 17:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k+7K5Thu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D62F0C72
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169766; cv=none; b=UMXqeG6+G0lDqKCorhckFYLxgD3eJTqtiWgw0sWjqex/geTKPGFwKjVSFf8XnPPXjtKfjrbnOzilPrtxxsUDYKeWX+yDGOatYM3Ht54z7fZIrtEE4erSEZ6ru3HQIY4pM0k7B53Sf4BMhedFl0eULtpz/7X5pWpHyWQ8VrjlaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169766; c=relaxed/simple;
	bh=QvKK12vr28KZUdgQj8pI2PQyaZF+YHOD6LH+mRm+PPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqZSHLmJZlgeswD4O+S48w2ysF3IdMHTbN9IaW9E/MKTuwrqI+8URgsFWwKpb1Ix6cjjUho2tTQqoSjDR61beVgaOGoTAqDX8bmmACgDDpsvl9R0A3L2aRHC0avyCpZzPfckTo/i2J21B4uwtLLvY8SDp9kkEYhkL/5AFgChfo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k+7K5Thu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7BF0F111D;
	Thu, 10 Jul 2025 19:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169733;
	bh=QvKK12vr28KZUdgQj8pI2PQyaZF+YHOD6LH+mRm+PPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k+7K5ThudJWE71NB/HMVuRYNsvPaqY6wegjsOp0aJXLlVy6yt2NEalw2aS7AyMZxV
	 BtgvKQVoAz8Y9HgGTYV13Jxl1iEDooIZVxA+Ts7IcsjROi8bFq7wAaN0ZOaxAIHETu
	 /qT+QiODYwgQNYhgdrbmN2jMSlIdbVlP2imj77PU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 27/72] media: i2c: imx319: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:23 +0300
Message-ID: <20250710174808.5361-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
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


