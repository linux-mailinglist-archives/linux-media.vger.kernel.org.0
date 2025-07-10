Return-Path: <linux-media+bounces-37415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D1B00AD6
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8121F7BE536
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB21A2F50B6;
	Thu, 10 Jul 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D3JC8kUD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1C2F50AC
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169838; cv=none; b=jDfLIYzY1MLS5fNmkzCayEXQzLnNtuIk+aCVvPdhZ31vU6ugCBIi6LEGnhIQTInCvkvgn7O1qEYH62IcZdLOe6q6yi/fRMLJ1qT/VaA9Q0FJMOHLxdbuwzW5S1aXs/tWZBKCD31cFKsLwMqmqm95BjldXBTQasUcY7zItyJh8YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169838; c=relaxed/simple;
	bh=b+DruLZae+ULFooHqWHAv9a27DgIN2BmnRSKqMHJylE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6vg8GbB2rFN49Xjf4l6wzhCgxqXgc5F2/u/l0VoymxOnjOKrzLHCF4U8eUCQZRZydPj0Qvb1HdFdMJ54PXkz/dt1+uqGwtWNW89+PO/lTQOpdMdlAj6u9iEPMb/foVh71MCSjMWJpFEC7lwSlkFlJa5MP1DDa1MxDTBZTY2fTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D3JC8kUD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7DDC5111D;
	Thu, 10 Jul 2025 19:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169806;
	bh=b+DruLZae+ULFooHqWHAv9a27DgIN2BmnRSKqMHJylE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3JC8kUDDwqmYxnwmw101mr9nlRvJ9jTy/cPayT8kTHN2fv2AdiGynRODbkqWMuUk
	 M8ZUyWOl/4TkG2qtdV16ft3DYoOThzTZNtMirmuaxld5siM7XtTo24IlvkEWcd5fAJ
	 8blz7ZurtoX01PFGAWP7hr/vB0pvqjng2WKWKDO4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 72/72] media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:08 +0300
Message-ID: <20250710174808.5361-73-laurent.pinchart@ideasonboard.com>
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

This driver supports OF platforms only. The "clocks" property has always
been specified as mandatory in the DT bindings and the "clock-frequency"
property has initially been optional. Both properties were initially set
in the upstream DT sources. The driver retrieves the clock, retrieves
the clock rate from the "clock-frequency" property if available or uses
a fixed default otherwise, and sets the clock rate. This is deprecated
behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/s5k6a3.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index 4bf5f122b113..ba6477e88da3 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -51,7 +51,6 @@ enum {
  * @lock: mutex protecting the structure's members below
  * @format: media bus format at the sensor's source pad
  * @clock: pointer to &struct clk.
- * @clock_frequency: clock frequency
  * @power_count: stores state if device is powered
  */
 struct s5k6a3 {
@@ -63,7 +62,6 @@ struct s5k6a3 {
 	struct mutex lock;
 	struct v4l2_mbus_framefmt format;
 	struct clk *clock;
-	u32 clock_frequency;
 	int power_count;
 };
 
@@ -192,10 +190,6 @@ static int __s5k6a3_power_on(struct s5k6a3 *sensor)
 	int i = S5K6A3_SUPP_VDDA;
 	int ret;
 
-	ret = clk_set_rate(sensor->clock, sensor->clock_frequency);
-	if (ret < 0)
-		return ret;
-
 	ret = pm_runtime_get(sensor->dev);
 	if (ret < 0)
 		goto error_rpm_put;
@@ -292,7 +286,9 @@ static int s5k6a3_probe(struct i2c_client *client)
 	mutex_init(&sensor->lock);
 	sensor->dev = dev;
 
-	sensor->clock = devm_v4l2_sensor_clk_get(sensor->dev, S5K6A3_CLK_NAME);
+	sensor->clock = devm_v4l2_sensor_clk_get_legacy(sensor->dev,
+							S5K6A3_CLK_NAME, false,
+							S5K6A3_DEFAULT_CLK_FREQ);
 	if (IS_ERR(sensor->clock))
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clock),
 				     "failed to get extclk\n");
@@ -302,13 +298,6 @@ static int s5k6a3_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	if (of_property_read_u32(dev->of_node, "clock-frequency",
-				 &sensor->clock_frequency)) {
-		sensor->clock_frequency = S5K6A3_DEFAULT_CLK_FREQ;
-		dev_info(dev, "using default %u Hz clock frequency\n",
-					sensor->clock_frequency);
-	}
-
 	for (i = 0; i < S5K6A3_NUM_SUPPLIES; i++)
 		sensor->supplies[i].supply = s5k6a3_supply_names[i];
 
-- 
Regards,

Laurent Pinchart


