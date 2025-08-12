Return-Path: <linux-media+bounces-39671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3DB23B24
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 741E66E6028
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E21A2E543D;
	Tue, 12 Aug 2025 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r4Rrf0PX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F4C2D8DA9
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035260; cv=none; b=mI83Ou7LTVtGAftqSUrdgATvFY2QziS+hpc3x583jH3iYk5eurzRBIS7UVFiK0dtZW20DAi6xVIxR/4IL5yza6QBitqR2c+6yemBfrBdViTvHHR2EDI36mKaQJ/0sevndjv8h0ML+Lp60v5vGdMuONBm/GU21QV4Uh1ySDZQ4zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035260; c=relaxed/simple;
	bh=NAabA9OqRbudwpnSo5xb6LsqSQNUZa6Ys9rydOfIr3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnxSbncP+yZ7fwX5BJB7mel8eDwIrflEiWI2Bt++ThoJJp+Bj1ZFOas1pmYLspVETBbHpFQkJaK791+naU/yHmeshXgECOxUK6RyBKqiK0ou1VaBWhIVgY7WYVcNGAhItb45TVlnsY/oJiuoc2jqnbCobDB0hwN2pu9PeLTXSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r4Rrf0PX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DF51615BF;
	Tue, 12 Aug 2025 23:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035205;
	bh=NAabA9OqRbudwpnSo5xb6LsqSQNUZa6Ys9rydOfIr3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r4Rrf0PXNsu3wSuviBHxIcGivcWSDVYtGWYsMuOx9sNUaiKX2VN4xDhTfryxOlMfJ
	 7yefEj2Hl9/EEIyWXG9lwkXiLZ47tY4TVjsjg7v7FdlLLfBjDt34dM7QbJ0kv0hyye
	 AYPugvYcMiA5q1AvC24Ae5c8Bj46Bqu+BXLjAfTc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 35/72] media: i2c: ov2740: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:43 +0300
Message-ID: <20250812214620.30425-36-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI platforms only. It retrieves the clock if
present, and retrieves the clock rate from the "clock-frequency"
property. If the rate does not match the expected rate, the driver fails
probing. This is correct behaviour for ACPI.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index aedf62df6e93..fb590dfadda1 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1133,7 +1133,6 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 mclk;
 	int ret;
 	unsigned int i, j;
 
@@ -1146,20 +1145,6 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for fwnode graph endpoint\n");
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-	if (ret) {
-		fwnode_handle_put(ep);
-		return dev_err_probe(dev, ret,
-				     "reading clock-frequency property\n");
-	}
-
-	if (mclk != OV2740_MCLK) {
-		fwnode_handle_put(ep);
-		return dev_err_probe(dev, -EINVAL,
-				     "external clock %d is not supported\n",
-				     mclk);
-	}
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
@@ -1342,6 +1327,7 @@ static int ov2740_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov2740 *ov2740;
+	unsigned long freq;
 	bool full_power;
 	unsigned int i;
 	int ret;
@@ -1379,11 +1365,17 @@ static int ov2740_probe(struct i2c_client *client)
 		msleep(20);
 	}
 
-	ov2740->clk = devm_clk_get_optional(dev, "clk");
+	ov2740->clk = devm_v4l2_sensor_clk_get(dev, "clk");
 	if (IS_ERR(ov2740->clk))
 		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
 				     "failed to get clock\n");
 
+	freq = clk_get_rate(ov2740->clk);
+	if (freq != OV2740_MCLK)
+		return dev_err_probe(dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
 	for (i = 0; i < ARRAY_SIZE(ov2740_supply_name); i++)
 		ov2740->supplies[i].supply = ov2740_supply_name[i];
 
-- 
Regards,

Laurent Pinchart


