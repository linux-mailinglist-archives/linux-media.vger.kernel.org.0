Return-Path: <linux-media+bounces-39687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8FB23B1A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E01318904D6
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725D72E6134;
	Tue, 12 Aug 2025 21:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jqctMO+r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7232E0400
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035287; cv=none; b=WpVQXoc1/mCXwQ4SGU03/YX/qg+8oz6dIJmrq4fmueahlAPCJI1Db3MkGbMS1q1zcJLkS4nSR8WBNdvP2wt4kcCOYxhGaR5Knl/qRH3t8vNLE2CF/zuC8UklgA7ZsQV2aGPC94suIDcW8e5FIn6/TzY6FGFuDvJpqVxvJQqya8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035287; c=relaxed/simple;
	bh=geTL4U3gzn7iwseATuF047JHA7eMCtfltNCUs/D4PNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYfrLbD2OeZzdL0v3bW0Sp5wamvNSBUYlOAFFWER0bZar8BckxNglCI7Zdv80A3Ocb9HuO5RoEaTso0OwK+P3bmAgFrE2cxTnXGORTlXduNclmZab6Z/gU6/iVuMr3ckWI4/mAUDJ8FdX2RQ4gHKiNPrJjqa05R4jrWoeJ5x9VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jqctMO+r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3BCA51123;
	Tue, 12 Aug 2025 23:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035232;
	bh=geTL4U3gzn7iwseATuF047JHA7eMCtfltNCUs/D4PNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jqctMO+rj6+jOpoeF6m8Y0ri6Jt8Y8rOzGNg4l+G9x8ZU086ZGJNZG9nhcYgxq2LJ
	 E6hd7H+FTYcPV8u7Tq/h51ClXB899vmu6W/zIPdmeQaP7nKt2px1Yq3Zu65fTG/uED
	 lmmZnqFIr96M1rGA8lF0wTe9JEDoec6NPJjO7YA0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 51/72] media: i2c: imx258: Use V4L2 legacy sensor clock helper
Date: Wed, 13 Aug 2025 00:45:59 +0300
Message-ID: <20250812214620.30425-52-laurent.pinchart@ideasonboard.com>
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
of the external clock programmatically. Both behaviours are valid on a
subset of ACPI platforms, but are considered deprecated on OF platforms,
and do not support ACPI platforms that implement MIPI DisCo for Imaging.
Implementing them manually in drivers is deprecated, as that can
encourage copying deprecated behaviour for OF platforms in new drivers,
and lead to differences in behaviour between drivers. Instead, drivers
that need to preserve the deprecated OF behaviour should use the
devm_v4l2_sensor_clk_get_legacy() helper.

This driver supports ACPI and OF platforms. The "clocks" property was
not initially specified as mandatory in the DT bindings, and the
"clock-frequency" property has never been  allowed. The driver retrieves
the clock and its rate if present, and falls back to retrieving the rate
from the "clock-frequency" property otherwise. If the rate does not
match the expected rate, the driver fails probing. This is correct
behaviour for ACPI, and deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 88d0d7f9d4be..e50dcfd830f5 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1375,18 +1375,13 @@ static int imx258_probe(struct i2c_client *client)
 		return dev_err_probe(imx258->dev, ret,
 				     "failed to get regulators\n");
 
-	imx258->clk = devm_clk_get_optional(imx258->dev, NULL);
+	imx258->clk = devm_v4l2_sensor_clk_get_legacy(imx258->dev, NULL, false,
+						      0);
 	if (IS_ERR(imx258->clk))
 		return dev_err_probe(imx258->dev, PTR_ERR(imx258->clk),
 				     "error getting clock\n");
-	if (!imx258->clk) {
-		dev_dbg(imx258->dev,
-			"no clock provided, using clock-frequency property\n");
 
-		device_property_read_u32(imx258->dev, "clock-frequency", &val);
-	} else {
-		val = clk_get_rate(imx258->clk);
-	}
+	val = clk_get_rate(imx258->clk);
 
 	switch (val) {
 	case 19200000:
-- 
Regards,

Laurent Pinchart


