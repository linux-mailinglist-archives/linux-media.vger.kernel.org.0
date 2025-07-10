Return-Path: <linux-media+bounces-37368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EFAB00A8A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0A494E0215
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D441A2F3620;
	Thu, 10 Jul 2025 17:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pTZMtM81"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17E42F0C72
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169763; cv=none; b=j+wct87jrJotYhvQeJ8Wj9urcL+zo/eReCIpcgne+76ejrOJhJr4qLEz3bBiUO7x9+ZBjEH34vEtwAnW1XX0amXl4FpZ2dq59to6A57MShUacLAM7WkURaMtoVbE5UB9cHHHba5qd0rJz+tS91ZEhuAZ9zo2D6zPqPLn9hK5MFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169763; c=relaxed/simple;
	bh=Hi6XEuAKLllsvdFQb0ZRomIsctp9uSo6NwMRa7N3Z2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2aCU3Cc2YBP76kDcBMS2tn9MV7BQgwcPkUy01+WOqeLUlN2vf5hkTEkK4HLFyrtpIzuGvC2uHVIKXQ6EFINt8vtd0n28Xfj/K3DEHQ92B4fRZ70jGWU2AS4JaueqveXKsjt65efJHFmc3G27/ag356Mfv7gjBRYJhpMP208RCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pTZMtM81; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 674531A9A;
	Thu, 10 Jul 2025 19:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169730;
	bh=Hi6XEuAKLllsvdFQb0ZRomIsctp9uSo6NwMRa7N3Z2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTZMtM816NvZACc85UjTTkwD0sx0F+u6dcllmN7l+tcUeuhVWhPDMvjiOSI5SdP/f
	 9Nr0yT6we0Nfi+N6cbm4LP/uW7pxWXzQhwIMPr9VCwab5lUx6lQA6+AGC0jW29gjzm
	 26fkXhxN8rnH6lBFqgximH3MImg9BLYvcUrs+ug8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 25/72] media: i2c: imx208: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:21 +0300
Message-ID: <20250710174808.5361-26-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx208.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 5399a2549b3f..d5350bb46f14 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2021 Intel Corporation
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -270,6 +271,7 @@ static const struct imx208_mode supported_modes[] = {
 
 struct imx208 {
 	struct device *dev;
+	struct clk *clk;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -934,17 +936,9 @@ static void imx208_free_controls(struct imx208 *imx208)
 static int imx208_probe(struct i2c_client *client)
 {
 	struct imx208 *imx208;
+	unsigned long freq;
 	int ret;
 	bool full_power;
-	u32 val = 0;
-
-	device_property_read_u32(&client->dev, "clock-frequency", &val);
-	if (val != 19200000) {
-		dev_err(&client->dev,
-			"Unsupported clock-frequency %u. Expected 19200000.\n",
-			val);
-		return -EINVAL;
-	}
 
 	imx208 = devm_kzalloc(&client->dev, sizeof(*imx208), GFP_KERNEL);
 	if (!imx208)
@@ -952,6 +946,17 @@ static int imx208_probe(struct i2c_client *client)
 
 	imx208->dev = &client->dev;
 
+	imx208->clk = devm_v4l2_sensor_clk_get(imx208->dev, NULL);
+	if (IS_ERR(imx208->clk))
+		return dev_err_probe(imx208->dev, PTR_ERR(imx208->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(imx208->clk);
+	if (freq != 19200000)
+		return dev_err_probe(imx208->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx208->sd, client, &imx208_subdev_ops);
 
-- 
Regards,

Laurent Pinchart


