Return-Path: <linux-media+bounces-39669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904FB23B19
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A57A587151
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EE12E541A;
	Tue, 12 Aug 2025 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ex2nnVEH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A22D8DA9
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035257; cv=none; b=knFthOJNMnTKSwBBDqa7JTYDSRftgPpSRYcWep7Vzbow/01rE9rb8Tsx+P8/xgwV5sMWmK6MSpcBqfqfPmNXKp/H6eplKy1UNuwSL5L9CLXYvjzRu7FqhW/wy0bYF1r7Nbm6hL5hsKD1hYsqNLQ2mX0O6sYEoMfkN5jJ3/HIWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035257; c=relaxed/simple;
	bh=qsVsSy3GnZk7EgBlp10ku9QNRkwJGa8UQT4lx3MfFbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dc+KKVq1xKRHlmWq/e+DbuqqGWlpPTGTrIMjFGnD6iAW2FWtqFhEuvGYgdpSZrNBv9PiiGge+iADcNON+IHmyieYzJmp9RhA5NS2x338c/xb321FBkzQGYd0TemxjZw8fjTEW5eR2cZF+goCz9c/cfXsWrKHK3m0rdSazC1nVwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ex2nnVEH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CB0344A4;
	Tue, 12 Aug 2025 23:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035202;
	bh=qsVsSy3GnZk7EgBlp10ku9QNRkwJGa8UQT4lx3MfFbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ex2nnVEH2jp+VwERb1bfJrfx+0ulgRVVmf/ghzD8Nu4jaGN+zE1rSAwquwgJ5Weqe
	 U3cPgGLX+c7ezwVEmMQfaRBlRXWq/7kPEMsmZCQbBLeJ1irWk25OIHb9zRbWqeJR7y
	 6xFwossnC/sLf9h1x6NimeBFB2PiGxVy5p6Iq7Z0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>
Subject: [PATCH v2 33/72] media: i2c: ov13b10: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:41 +0300
Message-ID: <20250812214620.30425-34-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov13b10.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 3f17cdd9f42c..869bc78ed792 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1472,6 +1472,7 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
 
 static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 {
+	unsigned long freq;
 	int ret;
 
 	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
@@ -1479,11 +1480,17 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
 		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
 				     "failed to get reset gpio\n");
 
-	ov13b->img_clk = devm_clk_get_optional(ov13b->dev, NULL);
+	ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, NULL);
 	if (IS_ERR(ov13b->img_clk))
 		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->img_clk),
 				     "failed to get imaging clock\n");
 
+	freq = clk_get_rate(ov13b->img_clk);
+	if (freq != OV13B10_EXT_CLK)
+		return dev_err_probe(ov13b->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
 	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
 	if (IS_ERR(ov13b->avdd)) {
 		ret = PTR_ERR(ov13b->avdd);
@@ -1506,7 +1513,6 @@ static int ov13b10_check_hwcfg(struct ov13b10 *ov13b)
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	unsigned int i, j;
 	int ret;
-	u32 ext_clk;
 	u8 dlane;
 
 	if (!fwnode)
@@ -1516,19 +1522,6 @@ static int ov13b10_check_hwcfg(struct ov13b10 *ov13b)
 	if (!ep)
 		return -EPROBE_DEFER;
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &ext_clk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		return ret;
-	}
-
-	if (ext_clk != OV13B10_EXT_CLK) {
-		dev_err(dev, "external clock %d is not supported",
-			ext_clk);
-		return -EINVAL;
-	}
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
Regards,

Laurent Pinchart


