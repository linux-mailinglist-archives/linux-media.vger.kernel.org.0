Return-Path: <linux-media+bounces-37412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCACB00ABB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 455DD4E2F7C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7262F1FC2;
	Thu, 10 Jul 2025 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S2VxJa0J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C452F19BC
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169833; cv=none; b=p1VMYLrd9VIC1He8AaiR5H6ECPn8ATkcCSxaFLfAR/Oz1Iljl6j+FB04b3bG5Bn60hQoKOOVhjw9P6IaivnnA5eXKDOfoytNRPykmyaPTtD+oYFvWEeP45as+tAoHSP0FQ/ctCFIJvxN3kg7i+sYvqWIo7kyIaPvOsVFN0bh0t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169833; c=relaxed/simple;
	bh=h9gdD/FHe7wh5cKqe8w2X4f3eStfKn2conqCS2pTHaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+PnMsXRzZ7+I661b4g9ByhaeWra4TRae5OkSDZDTi6cg/LuKig5WYJRckvm2LoeavkepFbHXbIPufPsjPXhkBLEQob+YAfR1oUOozq0nXEnuVSr4D7sYRJGiWT67uz7tufrrrFnGe2txx8rE9UFN+zbuGJby87PgU89AWMYT+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S2VxJa0J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6F2F81A9A;
	Thu, 10 Jul 2025 19:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169801;
	bh=h9gdD/FHe7wh5cKqe8w2X4f3eStfKn2conqCS2pTHaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2VxJa0JHHHpVzuAhvqDxEKL4bHm6rCCbmWWTojRudjn9g6PKVNY7YlPUiMPuJ38H
	 KR2DsKDFvAqBmztjuzVLi3ckTqsxtM1tVJedUxXfybQS8uEo4T4m+97O7qPcteb+SY
	 dAl1zr/q2y9mesEz+R2KF1lsmc1530uwVovcQVm4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 69/72] media: i2c: ov8856: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:05 +0300
Message-ID: <20250710174808.5361-70-laurent.pinchart@ideasonboard.com>
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
of the external clock programmatically. Both behaviours are valid on a
subset of ACPI platforms, but are considered deprecated on OF platforms,
and do not support ACPI platforms that implement MIPI DisCo for Imaging.
Implementing them manually in drivers is deprecated, as that can
encourage copying deprecated behaviour for OF platforms in new drivers,
and lead to differences in behaviour between drivers. Instead, drivers
that need to preserve the deprecated OF behaviour should use the
devm_v4l2_sensor_clk_get_legacy() helper.

This driver supports ACPI and OF platforms. The "clocks" and
"clock-frequency" properties were initially specified as mandatory in
the DT bindings and were both set in the upstream DT sources. The driver
retrieves the clock rate from the "clock-frequency" property. On OF
platforms, it retrieves the clock and sets its rate. If the rate does
not match the expected rate, the driver prints a warning. This is
correct behaviour for ACPI, and deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov8856.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 674ee36e394c..e2998cfa0d18 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2266,19 +2266,17 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856)
 	if (!fwnode)
 		return -ENXIO;
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &xvclk_rate);
-	if (ret)
-		return ret;
+	ov8856->xvclk = devm_v4l2_sensor_clk_get_legacy(dev, "xvclk", false, 0);
+	if (IS_ERR(ov8856->xvclk))
+		return dev_err_probe(dev, PTR_ERR(ov8856->xvclk),
+				     "could not get xvclk clock\n");
+
+	xvclk_rate = clk_get_rate(ov8856->xvclk);
+	if (xvclk_rate != OV8856_XVCLK_19_2)
+		dev_warn(dev, "external clock rate %u is unsupported",
+			 xvclk_rate);
 
 	if (!is_acpi_node(fwnode)) {
-		ov8856->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
-		if (IS_ERR(ov8856->xvclk))
-			return dev_err_probe(dev, PTR_ERR(ov8856->xvclk),
-					     "could not get xvclk clock\n");
-
-		clk_set_rate(ov8856->xvclk, xvclk_rate);
-		xvclk_rate = clk_get_rate(ov8856->xvclk);
-
 		ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 							     GPIOD_OUT_LOW);
 		if (IS_ERR(ov8856->reset_gpio))
@@ -2294,10 +2292,6 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856)
 			return ret;
 	}
 
-	if (xvclk_rate != OV8856_XVCLK_19_2)
-		dev_warn(dev, "external clock rate %u is unsupported",
-			 xvclk_rate);
-
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
-- 
Regards,

Laurent Pinchart


