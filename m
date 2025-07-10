Return-Path: <linux-media+bounces-37394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8CBB00AA8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2BA53B0999
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFB72F4320;
	Thu, 10 Jul 2025 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L1uVzH/p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F150B2F4317
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169804; cv=none; b=TBU5UJgghWPasqI7gNDD3QXvaMzXo8vp4JWxz3soGdjl5+nuuGDIMKo+fljsQPFahOvAYth+iNJ1jTu8CJv+o9SWB9mtWCWGy0nblgiCvaegSPKrHqrizkd3GgjCfTXYrQWYfdsJavysQ77uFULaKueznp3XNGv6HmTjpl6JQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169804; c=relaxed/simple;
	bh=CF28i01Vg6DXTnN/N+zeoG6l9F7zswZ7/w/BeTmpqVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IecwO3c8La/RTYJeGOgFCtG41/ZVNRk7cixt/AA5jwhbotZntzhdSGjElfOZfhDLkhFcYGTrEQysWAzh91GRylb+IWdFR6uOpkqMSzTPiofFUlpzKVsZm2zZSixnDtm6oamcQW8PO/I/qFd2c2uI7KQ51QfIOpRSq4fK0VFyeHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L1uVzH/p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 713543DC;
	Thu, 10 Jul 2025 19:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169772;
	bh=CF28i01Vg6DXTnN/N+zeoG6l9F7zswZ7/w/BeTmpqVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1uVzH/pJyxWkbNs7qOb0UZkXJXs9noacT0/5z26kbChHGXSwZfxkwF8zyJC4dmLU
	 7CZN+RQH1BHjCbqDQ7uZ3QFP46Q66uEz2Y73rRmiJFveVFYj8N1Km2UMn4qU9NxMSi
	 YrWD8xJylEieXeKf+07jUi1qtN/4b3+I9KQrv2yo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>
Subject: [PATCH 51/72] media: i2c: ov5693: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:47 +0300
Message-ID: <20250710174808.5361-52-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI and OF platforms. The "clocks" property has
always been specified as mandatory in the DT bindings, and the
"clock-frequency" property has never been allowed. The driver retrieves
the clock and its rate if present, and falls back to retrieving the rate
from the "clock-frequency" property otherwise. If the rate does not
match the expected rate, the driver fails probing. This is correct
behaviour for ACPI, and for OF platforms that comply with the documented
DT bindings.

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
 drivers/media/i2c/ov5693.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 485efd15257e..d294477f9dd3 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1289,25 +1289,13 @@ static int ov5693_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
 
-	ov5693->xvclk = devm_clk_get_optional(&client->dev, "xvclk");
+	ov5693->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 	if (IS_ERR(ov5693->xvclk))
 		return dev_err_probe(&client->dev, PTR_ERR(ov5693->xvclk),
 				     "failed to get xvclk: %ld\n",
 				     PTR_ERR(ov5693->xvclk));
 
-	if (ov5693->xvclk) {
-		xvclk_rate = clk_get_rate(ov5693->xvclk);
-	} else {
-		ret = fwnode_property_read_u32(dev_fwnode(&client->dev),
-				     "clock-frequency",
-				     &xvclk_rate);
-
-		if (ret) {
-			dev_err(&client->dev, "can't get clock frequency");
-			return ret;
-		}
-	}
-
+	xvclk_rate = clk_get_rate(ov5693->xvclk);
 	if (xvclk_rate != OV5693_XVCLK_FREQ)
 		dev_warn(&client->dev, "Found clk freq %u, expected %u\n",
 			 xvclk_rate, OV5693_XVCLK_FREQ);
-- 
Regards,

Laurent Pinchart


