Return-Path: <linux-media+bounces-37391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86261B00AB3
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE79D7BDD49
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941F02F0E56;
	Thu, 10 Jul 2025 17:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gH/RATKI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6B12F0E4A
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169800; cv=none; b=jbgOTRX6aAjHDPX3CiY7AQBPobymqFj4//Adalf0VzlXqljkPdkaRJ06cdAUsydPrKy56h3lwcl52BY071mM9JG3Ht2oQZL+DxIUgTO8nSuKdMtVcmQdKvpvT5ZRA42h9qPoW61o6YYlM9lucIJDefGQj+vu3ekMQeFDLbPL/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169800; c=relaxed/simple;
	bh=EO5ZLwR4nwyc5ELyCSB67uzO356lh0kShY+aIPgHxgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofrGICRWhBDEsQcqnomBC+ggUgpDFfnp1lFuRri5B2dKUdn1nuBvW7kA8Rgw6iBx8nmDrC4Hot+BfpFvLvdzwbdR8pMjqYr5UjYCsxog7Ga/T198m0pKQFIzk6Vh1hadoO1QQOkPbceH/l4o3Dhl/PODE6OpT6BFdnM12rPIC44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gH/RATKI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E53A91AD5;
	Thu, 10 Jul 2025 19:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169768;
	bh=EO5ZLwR4nwyc5ELyCSB67uzO356lh0kShY+aIPgHxgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gH/RATKID6xg4afw5fCiFPP+es/6cQ8sv6fXXKepqktWvy1WJc0cCK+15LxZc8jdj
	 imCSwr1TsT/tk7AbzGWEJScvBSgRVKYedB29jXIrQji7yt6vak5g9vxxpJg7d9ApAp
	 ZsgZf13d3d2w2MrgtW9RqrxdX/OCcea1QZBqvTOc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 48/72] media: i2c: ov5670: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:44 +0300
Message-ID: <20250710174808.5361-49-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov5670.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index f4af89bda902..04b3183b7bcb 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2655,16 +2655,12 @@ static int ov5670_probe(struct i2c_client *client)
 
 	ov5670->dev = &client->dev;
 
-	ov5670->xvclk = devm_clk_get_optional(ov5670->dev, NULL);
-	if (!IS_ERR_OR_NULL(ov5670->xvclk))
-		input_clk = clk_get_rate(ov5670->xvclk);
-	else if (!ov5670->xvclk || PTR_ERR(ov5670->xvclk) == -ENOENT)
-		device_property_read_u32(ov5670->dev, "clock-frequency",
-					 &input_clk);
-	else
+	ov5670->xvclk = devm_v4l2_sensor_clk_get(ov5670->dev, NULL);
+	if (IS_ERR(ov5670->xvclk))
 		return dev_err_probe(ov5670->dev, PTR_ERR(ov5670->xvclk),
 				     "error getting clock\n");
 
+	input_clk = clk_get_rate(ov5670->xvclk);
 	if (input_clk != OV5670_XVCLK_FREQ) {
 		dev_err(ov5670->dev,
 			"Unsupported clock frequency %u\n", input_clk);
-- 
Regards,

Laurent Pinchart


