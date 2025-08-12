Return-Path: <linux-media+bounces-39674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE42CB23B13
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5F781AA744A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6BD2DAFB1;
	Tue, 12 Aug 2025 21:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VxOp8hN+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A12D59F7
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035265; cv=none; b=hO9rwIDx0jnoXByicaFezN0Eyl34BsTC3N1CIIXJMd9NT1pbfTv6XyyrfOlK/PxK/2hSm1NbvLbAI0V+xUTQ/BwuA9L6ZP6vb7f6fcsNwFu3kwhdBvn51Kxf1BoNn0I+sD1yenyWnOPxgH5kw7H66bwTjyViNhlL+WM8drEM/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035265; c=relaxed/simple;
	bh=EO5ZLwR4nwyc5ELyCSB67uzO356lh0kShY+aIPgHxgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ruoE6C8KIqQ5q69+r8Dmh3B92aUQ11k5OALUnJEH3Mag51G7tJNjB3dggt6gbB71nbsEoBt8HLCvlYna1/WG7e0NRrzJVbNbz7e/Ir5N5RDknyJGwiB8iHWZawZ38B291pHq35d0RZD79t8j/8lDKMAu0KMboFEA4m2kDDAIljM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VxOp8hN+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 94B0A1123;
	Tue, 12 Aug 2025 23:46:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035209;
	bh=EO5ZLwR4nwyc5ELyCSB67uzO356lh0kShY+aIPgHxgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxOp8hN+1K/N2zH+3zIkRkU4gDpTl1H3yugENjEmSfNAiYLPkKBojY3yHndZ3TidC
	 0aZwR+/pIHlHCbId41hVZvdB0Udcu9oIdPb30TRnHHc/+HY1ULzk4UxamT80632jfA
	 2Aak0D5THyaXPolxBPfJ8kGFcD4r9chD/Q+XLdsw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 38/72] media: i2c: ov5670: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:46 +0300
Message-ID: <20250812214620.30425-39-laurent.pinchart@ideasonboard.com>
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


