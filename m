Return-Path: <linux-media+bounces-37409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 760AEB00AB4
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AA96189BADA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF7A2F5085;
	Thu, 10 Jul 2025 17:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tymXovJ8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1346C2F4A16
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169828; cv=none; b=DsoQQ0sOcSgqfegH/15BKvdECsQfs6OJoTigsmvKus4wxRyUNR92imCgv8KiuCiP7v/tHu6b4M/fGpjO1UcHA99HhO1XRxoDCDq5nPrcbeze2UmpRfyJPXEGshICJsc7AXX3FUq/3E95BjxVU6L1hLzCQekd/tSEJahT+XXWTmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169828; c=relaxed/simple;
	bh=mJq7J8nV31F6G2mMkb4YgGBs5cQNZxd9UErbxARXrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmkQh4Skj8eMeIWJ4+JMh85pQIvpUMW2rw/U/Q+/1BbKGqlPZm4rR6WGFgceryaLn38d04pe6FD5/qnBNlVbMc/16NdnxNljaxh9y2N6CzWayqi9cfscqvckzIN1fsEti1bFiS+jqqlx/mB88/AGdeWisibd/TCmZSHezAaS0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tymXovJ8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C3C3C111D;
	Thu, 10 Jul 2025 19:49:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169797;
	bh=mJq7J8nV31F6G2mMkb4YgGBs5cQNZxd9UErbxARXrb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tymXovJ8opOiMX/gtPshYazlcF+6kmBeqvQ8HxbXgN627773StLSCE8wOmh+L+uAz
	 BGa28CDD0A5MPmD5ZJyJuVDq4JLEEReFX/3Kiw92jBmDdexR6oxWcMYFhHeLiWBdoJ
	 szfoFh5Jet90LeFf/sKh84Njg4DAk5JoKsTZgwr4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 66/72] media: i2c: ov5645: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:02 +0300
Message-ID: <20250710174808.5361-67-laurent.pinchart@ideasonboard.com>
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
property has always been optional. Both the "clocks" and
"clock-frequency" properties are set in the upstream DT sources. The
driver retrieves the clock, retrieves the clock rate from the
"clock-frequency" property, and sets the clock rate to the retrieved
rate. If the rate does not match the expected rates, the driver fails
probing. This is deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 70b4cdb1b9af..a383e1a41b17 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1044,27 +1044,18 @@ static int ov5645_probe(struct i2c_client *client)
 				     "invalid bus type, must be CSI2\n");
 
 	/* get system clock (xclk) */
-	ov5645->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	ov5645->xclk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, false, 0);
 	if (IS_ERR(ov5645->xclk))
 		return dev_err_probe(dev, PTR_ERR(ov5645->xclk),
 				     "could not get xclk");
 
-	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "could not get xclk frequency\n");
-
 	/* external clock must be 24MHz, allow 1% tolerance */
+	xclk_freq = clk_get_rate(ov5645->xclk);
 	if (xclk_freq < 23760000 || xclk_freq > 24240000)
 		return dev_err_probe(dev, -EINVAL,
 				     "unsupported xclk frequency %u\n",
 				     xclk_freq);
 
-	ret = clk_set_rate(ov5645->xclk, xclk_freq);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "could not set xclk frequency\n");
-
 	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
 		ov5645->supplies[i].supply = ov5645_supply_name[i];
 
-- 
Regards,

Laurent Pinchart


