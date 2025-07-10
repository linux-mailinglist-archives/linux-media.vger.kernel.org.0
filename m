Return-Path: <linux-media+bounces-37374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7230B00A8E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C8D5C2874
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1F62F3656;
	Thu, 10 Jul 2025 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8k2R3Hx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B82F0C72
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169772; cv=none; b=WXCwSOHprFAZi3E+SL/3OqedJvY5+Rp7U0Ko+Ovx7ipMzKA3L4IMnHoTG2IODjU15g+aMatxVMMxO4sA4I7E77XUGpDlox2Gx/mnp7Q8WPGrfOUeJL8BsQmHtUhUpTRww4XH79dmQoaiGSQKDbh3IYvwdj+KTNFUK5cdRE1HXRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169772; c=relaxed/simple;
	bh=yZdhLAP4Y/uEsouC+1zSE9uhM96XS0URj5+GonKUBi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQzNql5l3VFyFNNLl5cgXVGA4NRO3OyPC6wd5w6sCR5CoeZKnw/aUTfy1pKvCi/a9PveMUYZNO1FG7nx8z4aMjsWjwuTCCSHAovDM9Pb2pgWnkZQwEgAwvbYQojvZZuvgEblFFArGtEksWWRgGoGav8sVuNcmYri7Nb6YTqCHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p8k2R3Hx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 22C8A5278;
	Thu, 10 Jul 2025 19:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169740;
	bh=yZdhLAP4Y/uEsouC+1zSE9uhM96XS0URj5+GonKUBi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p8k2R3HxiGJcXPSWlsmNpFPlOK7PymnS80clTy0+HMrnFeGx+GRItZ0rGBo24tIfF
	 HGiKe6YqYlqL60Tw+lbRthRn7VkCU6GK5wul7nsvKD4JB6K9PaiCjB5Sm+Ji5T4hl6
	 wyP5db3NcR9fpbmsbt5hw4kCGZsePoSvvRjn85/8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 31/72] media: i2c: og01a1b: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:27 +0300
Message-ID: <20250710174808.5361-32-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI and OF platforms. The "clocks" property is
specified as mandatory in the DT bindings and the "clock-frequency"
property is not allowed. The driver retrieves the clock if present,
retrieves the clock rate from the "clock-frequency" property and falls
back to retrieving it from the clock. If the rate does not match the
expected rate, the driver fails probing. This is correct behaviour for
ACPI, and for OF platforms that comply with the documented DT bindings.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

The behaviour is also unchanged on OF platforms that comply with the DT
bindings. Non-compliant platforms are not expected, but any regression
could easily be handled by switching to the
devm_v4l2_sensor_clk_get_legacy() helper designed to preserve
non-compliant behaviour.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/og01a1b.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 59688bad7c98..fe96ca9bb108 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -910,28 +910,12 @@ static int og01a1b_check_hwcfg(struct og01a1b *og01a1b)
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
-		if (!og01a1b->xvclk) {
-			dev_err(dev, "can't get clock frequency");
-			return ret;
-		}
-
-		mclk = clk_get_rate(og01a1b->xvclk);
-	}
-
-	if (mclk != OG01A1B_MCLK) {
-		dev_err(dev, "external clock %d is not supported", mclk);
-		return -EINVAL;
-	}
-
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -1067,6 +1051,7 @@ static void og01a1b_remove(struct i2c_client *client)
 static int og01a1b_probe(struct i2c_client *client)
 {
 	struct og01a1b *og01a1b;
+	unsigned long freq;
 	int ret;
 
 	og01a1b = devm_kzalloc(&client->dev, sizeof(*og01a1b), GFP_KERNEL);
@@ -1077,13 +1062,19 @@ static int og01a1b_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&og01a1b->sd, client, &og01a1b_subdev_ops);
 
-	og01a1b->xvclk = devm_clk_get_optional(og01a1b->dev, NULL);
+	og01a1b->xvclk = devm_v4l2_sensor_clk_get(og01a1b->dev, NULL);
 	if (IS_ERR(og01a1b->xvclk)) {
 		ret = PTR_ERR(og01a1b->xvclk);
 		dev_err(og01a1b->dev, "failed to get xvclk clock: %d\n", ret);
 		return ret;
 	}
 
+	freq = clk_get_rate(og01a1b->xvclk);
+	if (freq != OG01A1B_MCLK)
+		return dev_err_probe(og01a1b->dev, -EINVAL,
+				     "external clock %lu is not supported",
+				     freq);
+
 	ret = og01a1b_check_hwcfg(og01a1b);
 	if (ret) {
 		dev_err(og01a1b->dev, "failed to check HW configuration: %d",
-- 
Regards,

Laurent Pinchart


