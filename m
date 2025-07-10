Return-Path: <linux-media+bounces-37400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699FDB00AAF
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0390D4804E7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFB92F49E0;
	Thu, 10 Jul 2025 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PpnjStJm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09212F4339
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169814; cv=none; b=Wk2zexxsUF5URZJ+2A/n7S46KtP44dlUBXuPOrrAEc5gG8MSTG5tuTx7CWyuiLsp4SFlCuEoSkOu7stPchq0JFs08Mper7/7cMsMSnXJ5bHlj7fJE2O66y+N4E5HBq2Uh697vcbuUNRlXXgtC7khZbkpKdsOQk2Tf2x6LfAEgP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169814; c=relaxed/simple;
	bh=4M3cjpMtY3OEixT1axG/eU55H13m1p2hBvBROVHdp6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxLcmT3rleMs19975H3OSdixXgFtwQ/+DLDRVX2VqJMSNOGum+vcyymVSIlKjkaeWlqo4yWCbkJpUbceTiaoxnmlatp/qyyRrzAz6eYgCRrZM6PBbpKiEtvy3qiEgI4QYv6Wt7kHWbj8Zf/LcINX2XKD1NVPGYLlIVJAlCG/ZgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PpnjStJm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 854A43DC;
	Thu, 10 Jul 2025 19:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169782;
	bh=4M3cjpMtY3OEixT1axG/eU55H13m1p2hBvBROVHdp6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PpnjStJmpq4C8M8sXa6mYyG/1zOjHYBQ+X9c7QvbNOT4Euntsl4hkdJI8PYIiin38
	 HKhaWL79L8+LcCCx33dUOfgO/c53JoAe59CNogXqjEMdIcMiRXvvlRLrqSU8W4TTKd
	 fvcGHUDlywBTbcPLOlDzfjfDW4Y3xzktzdNWe/zA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Pavel Machek <pavel@kernel.org>
Subject: [PATCH 57/72] media: i2c: et8ek8: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:47:53 +0300
Message-ID: <20250710174808.5361-58-laurent.pinchart@ideasonboard.com>
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

This driver supports OF platforms only. The "clocks" and
"clock-frequency" properties were initially mandatory in the DT bindings
and were both set in the upstream DT sources. The driver retrieves the
clock, retrieves and ignores the clock rate from the clock-frequency
property, and sets the clock rate to a fixed value. This is deprecated
behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index d46fe7a0eec2..2cb7b718782b 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -816,7 +816,6 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
 {
 	struct v4l2_subdev *subdev = &sensor->subdev;
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	unsigned int xclk_freq = 9600000;
 	int val, rval;
 
 	rval = regulator_enable(sensor->vana);
@@ -825,12 +824,6 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
 		return rval;
 	}
 
-	rval = clk_set_rate(sensor->ext_clk, xclk_freq);
-	if (rval < 0) {
-		dev_err(&client->dev, "unable to set extclk clock freq to %u\n",
-			xclk_freq);
-		goto out;
-	}
 	rval = clk_prepare_enable(sensor->ext_clk);
 	if (rval < 0) {
 		dev_err(&client->dev, "failed to enable extclk\n");
@@ -844,7 +837,7 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
 
 	gpiod_set_value(sensor->reset, 1);
 
-	msleep(5000 * 1000 / xclk_freq + 1); /* Wait 5000 cycles */
+	msleep(5000 * 1000 / sensor->xclk_freq + 1); /* Wait 5000 cycles */
 
 	rval = et8ek8_i2c_reglist_find_write(client, &meta_reglist,
 					     ET8EK8_REGLIST_POWERON);
@@ -1425,17 +1418,13 @@ static int et8ek8_probe(struct i2c_client *client)
 		return PTR_ERR(sensor->vana);
 	}
 
-	sensor->ext_clk = devm_v4l2_sensor_clk_get(dev, NULL);
+	sensor->ext_clk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, true,
+							  9600000);
 	if (IS_ERR(sensor->ext_clk))
 		return dev_err_probe(&client->dev, PTR_ERR(sensor->ext_clk),
 				     "could not get clock\n");
 
-	ret = of_property_read_u32(dev->of_node, "clock-frequency",
-				   &sensor->xclk_freq);
-	if (ret) {
-		dev_warn(dev, "can't get clock-frequency\n");
-		return ret;
-	}
+	sensor->xclk_freq = clk_get_rate(sensor->ext_clk);
 
 	mutex_init(&sensor->power_lock);
 
-- 
Regards,

Laurent Pinchart


