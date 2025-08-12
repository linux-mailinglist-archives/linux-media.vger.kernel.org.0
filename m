Return-Path: <linux-media+bounces-39649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2CEB23B07
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B1F75810E4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9545B2E0B5C;
	Tue, 12 Aug 2025 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eKUhu8aX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7382D2384
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035226; cv=none; b=pGDVamEBQExNY6zWZYPyRPgu0aZ9T0o/d25h39C4IklYzgoGYrU95kO18hteUxR0LVSMEmGP98b/JrvuK1UDJ3MFNvOtyrmJkUId61Wsg7xq9JbQZ0pCPDr5VVg7lKpda/b7rThJ+m738uUIrhTMSQjeqx9BqjChbVNIBz86Amw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035226; c=relaxed/simple;
	bh=/3DoSjYOBKkvBUTOBYe178RXSG4fWhlQlTquB2gW6c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urGhoFb3GL51PNWTkjejkcp8hDHMPT7Ir7tjQpObDNedDCStWhd8qoTrgFg5LY3ZFXBcoMfXacqnUeNxV+Bir91WAJhX5AlRLy7cDVRcZreoCDVCcj+0BpUytXKUmm0UOVeWXp15jBxJ83ylBqf9orA5aEvwN7+DoisLVGK7oSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eKUhu8aX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 898FB4A4;
	Tue, 12 Aug 2025 23:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035167;
	bh=/3DoSjYOBKkvBUTOBYe178RXSG4fWhlQlTquB2gW6c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eKUhu8aXNa2er3z1FVnV/0O49ucOwH4O4kqltQTd8wzO3/d3Xa5v7Hv57wFTK9UWY
	 nL6mog5qK+Tx9Ii8XNMozACs4MaD1gwt4eU+poCa0aVXuhRkl6YGtAMakvmJ+9XxSg
	 N2GrWz7+OBI77LkTBjB0VbwmaL5x/92Q+5DfsNK4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 13/72] media: i2c: hi847: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:21 +0300
Message-ID: <20250812214620.30425-14-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/hi847.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 384ccfc171c2..def01aa07b2f 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2022 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -2168,6 +2169,7 @@ static const struct hi847_mode supported_modes[] = {
 
 struct hi847 {
 	struct device *dev;
+	struct clk *clk;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -2789,24 +2791,12 @@ static int hi847_check_hwcfg(struct device *dev)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 mclk;
 	int ret;
 	unsigned int i, j;
 
 	if (!fwnode)
 		return -ENXIO;
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		return ret;
-	}
-
-	if (mclk != HI847_MCLK) {
-		dev_err(dev, "external clock %d is not supported", mclk);
-		return -EINVAL;
-	}
-
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -2865,6 +2855,7 @@ static void hi847_remove(struct i2c_client *client)
 static int hi847_probe(struct i2c_client *client)
 {
 	struct hi847 *hi847;
+	unsigned long freq;
 	int ret;
 
 	hi847 = devm_kzalloc(&client->dev, sizeof(*hi847), GFP_KERNEL);
@@ -2873,6 +2864,17 @@ static int hi847_probe(struct i2c_client *client)
 
 	hi847->dev = &client->dev;
 
+	hi847->clk = devm_v4l2_sensor_clk_get(hi847->dev, NULL);
+	if (IS_ERR(hi847->clk))
+		return dev_err_probe(hi847->dev, PTR_ERR(hi847->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(hi847->clk);
+	if (freq != HI847_MCLK)
+		return dev_err_probe(hi847->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
 	ret = hi847_check_hwcfg(hi847->dev);
 	if (ret) {
 		dev_err(hi847->dev, "failed to get HW configuration: %d",
-- 
Regards,

Laurent Pinchart


