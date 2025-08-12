Return-Path: <linux-media+bounces-39676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D826B23B21
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CB9588312
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC292E172C;
	Tue, 12 Aug 2025 21:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SeusJiE6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAA2D59F7
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035268; cv=none; b=l1uOCEXfJJmu4WtaqdLjk/IXJ/leIROlLJGVI7SbUElU3ym2vd73uS9S022ZW0lqlJPDnZM0fERHdZgQviQlehaT/g3ImWMwNW+MLQW1QGOxM9bgxuM9I77wH01wPbvxEi8oOIruKZD8N6lPXyRcrJTIASKDS0N7EZxJ+T6QGxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035268; c=relaxed/simple;
	bh=0Emh3Cpo+C9pyACDF1KD20v1htDcU1oE6frumMCZAPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsMxahhlmxSXQsdIJRNIbM5ubhXvIOVTC3jeZRV/msqsyZLqI3+3+OFU56gWNgjvbf4OGA4jwubj/RV0AF/E5xbODrZIxZmbEUPuDHvPgLHF78wVbKWdPwfKN08RFrvo0yd46E4eIbJw4NWmFK/TfUwGH0jC7Omzw1IZnSky7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SeusJiE6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AB8314A4;
	Tue, 12 Aug 2025 23:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035212;
	bh=0Emh3Cpo+C9pyACDF1KD20v1htDcU1oE6frumMCZAPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SeusJiE6Hp+81j9G9p8Ww387lmtahJqwuf/i0D44XKlQGfcdczgeEZtmUDZCd0E7X
	 7JAMOU2QFpsmT2NwGwjWwY7qF6gxKo0K0wff3jN8uEtetZeVDUgN/waQU2YltBrjgv
	 cMJsy/EvxnGzBoLLt5V+aCa/IWGZ1aSgGU3TenuE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 40/72] media: i2c: ov5675: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:48 +0300
Message-ID: <20250812214620.30425-41-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov5675.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index fe16d5439e39..30e27d39ee44 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1181,24 +1181,13 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	if (!fwnode)
 		return -ENXIO;
 
-	ov5675->xvclk = devm_clk_get_optional(dev, NULL);
+	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov5675->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
 				     "failed to get xvclk: %ld\n",
 				     PTR_ERR(ov5675->xvclk));
 
-	if (ov5675->xvclk) {
-		xvclk_rate = clk_get_rate(ov5675->xvclk);
-	} else {
-		ret = fwnode_property_read_u32(fwnode, "clock-frequency",
-					       &xvclk_rate);
-
-		if (ret) {
-			dev_err(dev, "can't get clock frequency");
-			return ret;
-		}
-	}
-
+	xvclk_rate = clk_get_rate(ov5675->xvclk);
 	if (xvclk_rate != OV5675_XVCLK_19_2) {
 		dev_err(dev, "external clock rate %u is unsupported",
 			xvclk_rate);
-- 
Regards,

Laurent Pinchart


