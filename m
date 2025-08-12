Return-Path: <linux-media+bounces-39665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E9B23B1C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 443A46E7D27
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560412E336E;
	Tue, 12 Aug 2025 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r3mMPfS+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F3D2D739E
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035250; cv=none; b=ltH0OsJvlS/QWxmPAnwlNl2eTVWwiTamAOITN7HpEuFgOxRm6HyZWQqNFq/ZUvby0Aia0L6+fa2tjZyy2WyOHFMkab5NBHxRLFwmoxTcoLFe9MRRN2uEpYK1yKVbzByy0kYjykdkO0XiYar/ig2EDHn8vruYR0mb+y4B5lwEsDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035250; c=relaxed/simple;
	bh=9LQGFUkMIn71ukASyS/nxppE5FgKTzCyC+1taqj3zOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/rvFEY11A9315fT2P6mqXT8IVHbQjmSnCnixeoicpvEhQn9H3qE9R4DRz90Mnmt0VDaRNNrmU19wXvohpXuPYbgeS+Dw2w1ujOQvoUEk6ZIyt4sDJRqw6LO9diao8ALyomVuAW6W96qOktQo3FY2wERVx6jA6NNp17B5OcC27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r3mMPfS+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 156F615BF;
	Tue, 12 Aug 2025 23:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035195;
	bh=9LQGFUkMIn71ukASyS/nxppE5FgKTzCyC+1taqj3zOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r3mMPfS+atyALuONjYOcSMWpKBictQwSmuzlfjSSBAfEi/1/hHnGfaNWG074Q9Rh4
	 6RZty0SVgOOrmo0nqOC1wOU4goRZsuY1GoWVhcJXJX898dY5W570Cu/lNaLsGmVIwl
	 vI91d2NAOMO+sjbZ8DADxcaWkC7JCG+9v9VToMZk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jason Chen <jason.z.chen@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 29/72] media: i2c: ov08x40: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:37 +0300
Message-ID: <20250812214620.30425-30-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI and OF platforms. The "clocks" property is
specified as mandatory in the DT bindings and the "clock-frequency"
property is not allowed. The driver retrieves the clock and its rate if
present, and falls back to retrieving the rate from the
"clock-frequency" property otherwise. If the rate does not match the
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
 drivers/media/i2c/ov08x40.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 15504344a4b1..3a4bd8513db4 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2230,23 +2230,14 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x)
 	if (ret)
 		goto out_err;
 
-	ov08x->xvclk = devm_clk_get_optional(dev, NULL);
+	ov08x->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov08x->xvclk)) {
 		ret = dev_err_probe(dev, PTR_ERR(ov08x->xvclk),
 				    "getting xvclk\n");
 		goto out_err;
 	}
-	if (ov08x->xvclk) {
-		xvclk_rate = clk_get_rate(ov08x->xvclk);
-	} else {
-		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-					       &xvclk_rate);
-		if (ret) {
-			dev_err(dev, "can't get clock frequency\n");
-			goto out_err;
-		}
-	}
 
+	xvclk_rate = clk_get_rate(ov08x->xvclk);
 	if (xvclk_rate != OV08X40_XVCLK) {
 		dev_err(dev, "external clock %d is not supported\n",
 			xvclk_rate);
-- 
Regards,

Laurent Pinchart


