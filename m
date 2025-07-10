Return-Path: <linux-media+bounces-37384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA6B00A98
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4453276047C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC99F2F2368;
	Thu, 10 Jul 2025 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U7CqlzYH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2AA2F2359
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169788; cv=none; b=hcrRZfFn+28CsliTEz0QT0FL9tGkIg1BVkBEJdqIBw6c9wfATzhwngXcpJFzVqmJs5AWEUNSBsEkWLHpxNRlkAyoDGqhDoa2jl+F+W3X/SRSQ/jD00bwxZ0d1prHc1OnogUMet+VaBj3TjEfyiga4veDbVSjS9oLvXKIHUSH5/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169788; c=relaxed/simple;
	bh=tbrSSGjnSfPI5cASX2Kn8hhbCZGf8m4UrMA9s18TOvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtNQ/Uw0Rs9P1H86575cJSQ4VDb5Y0WRoftntdlzEr0eFOj0nbSeDPLb0+NvcLyU/Ef86HaO1vbMlYns7ZWSm3epmuBUbTB1Xv6TVamJIf7qDTOGJq74luS4A8f3UEVdoC8qUoB2qKH89fKWeOwHuHBFfD1ux+qitDQr3M2XSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U7CqlzYH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7819EB2B;
	Thu, 10 Jul 2025 19:49:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169756;
	bh=tbrSSGjnSfPI5cASX2Kn8hhbCZGf8m4UrMA9s18TOvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7CqlzYHNhbf6+ER+ov6lZ+S41Ba5CIIDl47hihxzUCfgS9e25jcoseQ0Tm0/mX4X
	 8U7Q68QsPws/T/9sI34V5rB+1Gg3Gh0taMuxKwtbAq6wMYDJnWhx4l0rjq1dT20EYk
	 /IO7fGHq2iDeIJCx7TUvT8kl1zBCr693PnE5XN80=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 41/72] media: i2c: ov13858: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:37 +0300
Message-ID: <20250710174808.5361-42-laurent.pinchart@ideasonboard.com>
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
expected rate, the driver prints a warning. This is correct behaviour
for ACPI.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov13858.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index d93ad730d633..162b49046990 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -1029,6 +1030,7 @@ static const struct ov13858_mode supported_modes[] = {
 
 struct ov13858 {
 	struct device *dev;
+	struct clk *clk;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -1656,12 +1658,8 @@ static void ov13858_free_controls(struct ov13858 *ov13858)
 static int ov13858_probe(struct i2c_client *client)
 {
 	struct ov13858 *ov13858;
+	unsigned long freq;
 	int ret;
-	u32 val = 0;
-
-	device_property_read_u32(&client->dev, "clock-frequency", &val);
-	if (val != 19200000)
-		return -EINVAL;
 
 	ov13858 = devm_kzalloc(&client->dev, sizeof(*ov13858), GFP_KERNEL);
 	if (!ov13858)
@@ -1669,6 +1667,17 @@ static int ov13858_probe(struct i2c_client *client)
 
 	ov13858->dev = &client->dev;
 
+	ov13858->clk = devm_v4l2_sensor_clk_get(ov13858->dev, NULL);
+	if (IS_ERR(ov13858->clk))
+		return dev_err_probe(ov13858->dev, PTR_ERR(ov13858->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(ov13858->clk);
+	if (freq != 19200000)
+		return dev_err_probe(ov13858->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13858->sd, client, &ov13858_subdev_ops);
 
-- 
Regards,

Laurent Pinchart


