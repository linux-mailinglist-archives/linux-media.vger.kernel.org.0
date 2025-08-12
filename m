Return-Path: <linux-media+bounces-39680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57341B23B23
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D40BA5887A8
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A602DE6EA;
	Tue, 12 Aug 2025 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IZsXahev"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9532D59F7
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035274; cv=none; b=YqCXQv9k93QJTpm5KrWXtqEfLqKfOgnWZULfj7jLTFZ0e5r4/qrYJJSbh6oynpuAmfWfBThoh4XLzO0LmnvKLH7F4bV1Ato3dY9Cu2QGB+WAUDIjBa+VMs9uEbH+PGp3+MtfDSXB1WpCS4cezimhjA5fS310u0oXUsv6YhsEItE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035274; c=relaxed/simple;
	bh=qOpFqjdhVkh1imppI4QBH2Ydbk0LNOSiY4RP4bjz+DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsUdlJT1yVEc7ELgTwukRmzSR0FJqHFv0oN2xixepiWTBXBBjPtinxzlE0OFSaYQ9xkuvlcjDNazgP4LdoqdWm3wz1zrT8KKGndoewnFtf296ytV6y7SN+oPpDlyN5PG3sOrT6vyM2psK07Tykm73LluoRn0dV+OTpcNXzBCrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IZsXahev; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F083610D4;
	Tue, 12 Aug 2025 23:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035219;
	bh=qOpFqjdhVkh1imppI4QBH2Ydbk0LNOSiY4RP4bjz+DI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZsXahevPjXKulglgUo3hCE9QFmK5qTMSSJunv2Rn2kR0CznayyYvaRi1XyOy+2aD
	 VFXB5JDcdiBK14pkhMSI+DwcjsBEV8JGuPDswkA0LE3EulohL7qGgbt5ritBV7k+Kc
	 xrGkdp3DEc0UQGozuzvZroI01w4323XjXcjkg6bI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 44/72] media: i2c: ov9734: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:52 +0300
Message-ID: <20250812214620.30425-45-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov9734.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index d74d99344210..0eaf33807fc9 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2020 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -323,6 +324,7 @@ static const struct ov9734_mode supported_modes[] = {
 
 struct ov9734 {
 	struct device *dev;
+	struct clk *clk;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -828,22 +830,12 @@ static int ov9734_check_hwcfg(struct device *dev)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 mclk;
 	int ret;
 	unsigned int i, j;
 
 	if (!fwnode)
 		return -ENXIO;
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-	if (ret)
-		return ret;
-
-	if (mclk != OV9734_MCLK) {
-		dev_err(dev, "external clock %d is not supported", mclk);
-		return -EINVAL;
-	}
-
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -896,6 +888,7 @@ static void ov9734_remove(struct i2c_client *client)
 static int ov9734_probe(struct i2c_client *client)
 {
 	struct ov9734 *ov9734;
+	unsigned long freq;
 	int ret;
 
 	ret = ov9734_check_hwcfg(&client->dev);
@@ -911,6 +904,17 @@ static int ov9734_probe(struct i2c_client *client)
 
 	ov9734->dev = &client->dev;
 
+	ov9734->clk = devm_v4l2_sensor_clk_get(ov9734->dev, NULL);
+	if (IS_ERR(ov9734->clk))
+		return dev_err_probe(ov9734->dev, PTR_ERR(ov9734->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(ov9734->clk);
+	if (freq != OV9734_MCLK)
+		return dev_err_probe(ov9734->dev, -EINVAL,
+				     "external clock %lu is not supported",
+				     freq);
+
 	v4l2_i2c_subdev_init(&ov9734->sd, client, &ov9734_subdev_ops);
 	ret = ov9734_identify_module(ov9734);
 	if (ret) {
-- 
Regards,

Laurent Pinchart


