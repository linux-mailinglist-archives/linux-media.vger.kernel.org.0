Return-Path: <linux-media+bounces-39667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEA0B23B1F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEA496E3B9B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79B12D73BC;
	Tue, 12 Aug 2025 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TVERxO53"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495C2D8DA9
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035254; cv=none; b=IW6LQwfbxulU6kDS4lnrfJxntkgAM/oWRM6oqNoPDapTtuf5KpSFaMKHWm6uNOHEmodAbD0uDg8sn9eGk0gQihp1HXkprGDVjJfLodoa1uKLs8L72eJz+RWYlVukK8YTLPELsup6pPcqAA/cKxonGpM3tDNDDcRf0hLTc/4f3eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035254; c=relaxed/simple;
	bh=tbrSSGjnSfPI5cASX2Kn8hhbCZGf8m4UrMA9s18TOvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=btls/+RxCAwqZFWEqDpJMrC4jf8bP6MhoRbhU11okMY4d9SPp/bnTrYjnMBjPcDVoRU+8e+LC5JKSkjppBeB9HOxhDhyMXn2f0ZUMuqmLvLW92Le6L1XY62G9sotsC6hqJyQbRH9IVwM5GuyNGi1Y8TjQCPrOS4g/AZOGQ6l8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TVERxO53; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 72DCD4A4;
	Tue, 12 Aug 2025 23:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035198;
	bh=tbrSSGjnSfPI5cASX2Kn8hhbCZGf8m4UrMA9s18TOvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TVERxO53BD1QxqxEe0srQJ3Lrg8ShJL/9hC2/1Z4ALdvQSHLwUS0sUxkXuqjDiLgj
	 BFbh11/kAn7v51GPQl5iI7riaJ0YYO/U4ZZE0G46mp/kMVWqyEiMDhdZ6rihBvq5k4
	 gbMtke2ajNwK7EKv5Bw9mrySdcLuQRR9wi01lfVE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 31/72] media: i2c: ov13858: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:39 +0300
Message-ID: <20250812214620.30425-32-laurent.pinchart@ideasonboard.com>
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


