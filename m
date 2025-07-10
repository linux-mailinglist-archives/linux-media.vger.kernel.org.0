Return-Path: <linux-media+bounces-37366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798CB00A88
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C85605C1761
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0926A2F2C76;
	Thu, 10 Jul 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qWNrMmD0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132A2F0C72
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169760; cv=none; b=Ui9bAW4YnR/OEme8fik/aUUb+xLV3TforV0hrSre68qx5gbmiO58XWldcs1LoBjFveQunOYmwl1upu+1uTa2XH5tjxK/9DTAKFYO4bE16o7rEOYf3NzAOlgL+WfHHu+jNmMysndOS39i0TqF9IiaRZktRCa6o+bfAlnvKJ01wxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169760; c=relaxed/simple;
	bh=/3DoSjYOBKkvBUTOBYe178RXSG4fWhlQlTquB2gW6c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCNhwI9nWWe38775u85+F5TIMTCXKJxYT6Et9ESHNKw1vY7flLZETAdzadWS0XFCVzYiqr6yD8npmFVkPF+Yk+Jp2/Au8hRU1FrKh5uh4pXmJAbqDPtV38YVYYWC1+LEWbfOjJ1dp0iUtj8O/4YHHQLGiRwioqLqeiFIfPLmMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qWNrMmD0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 118FC527C;
	Thu, 10 Jul 2025 19:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169727;
	bh=/3DoSjYOBKkvBUTOBYe178RXSG4fWhlQlTquB2gW6c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qWNrMmD0cyfmyvLjU7CK2PLLJcJeCWsh0bvRZ7VUmvRNXWWwd03NNrDmzeYJxwf6j
	 aNrPnTEHt/isMFO7GR/GuWe+uanmvIZrhSeYiaaoL0h9ZAo0Ou2Nxy1GYLuISpaBja
	 t/5QtLAP0IQxXoTX0PfHVNX6IMNHBSLUKWmijILk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 23/72] media: i2c: hi847: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:19 +0300
Message-ID: <20250710174808.5361-24-laurent.pinchart@ideasonboard.com>
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


