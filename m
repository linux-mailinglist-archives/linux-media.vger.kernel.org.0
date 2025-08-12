Return-Path: <linux-media+bounces-39690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB30B23B31
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A41AB5A0AB0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE662E62C4;
	Tue, 12 Aug 2025 21:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AC43/KNX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AAE2E2820
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035293; cv=none; b=MfN3EA2pakytLTE7XtF2VaGYWd1MsUAMd5s+MUZtX/DEXI2hL1KTV3bTEFDwn8WGjXK/eo2y/Ao1HO8/dTXgV7LIGHuK7X9w+kfzwHnd6IfUKpfL4QrqBF+ib/HX/d4WYYStgzuiuBaccoQ7EEArZYVdmDyVPbdDXPTW9EyrZ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035293; c=relaxed/simple;
	bh=sUWsE38o6jCcqKjFdXWNeUOI6T5hN6CwId7pazYIAl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCtSISBzMmFJeGZ0Tj57YcqRsdp+zhiV/CGZ4j4ev60inWXTlzJrb6d+/pTj6OrMVHQpRzNLdS3CRNmnmEsrnkoedJTrANRGuTGlYS7cKlZ3kowljmHuspItsK3dDRxVlN5R/RxV8Zq+Pt+W7NNqGr4I7lR+nOrHbSRd13RgriA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AC43/KNX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4E7B310D4;
	Tue, 12 Aug 2025 23:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035237;
	bh=sUWsE38o6jCcqKjFdXWNeUOI6T5hN6CwId7pazYIAl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AC43/KNXaQVEl3wKjl/uXR2Z/mEETSYeYwin40dkA5GukIfBT/FTtNOAXUSMiKwDd
	 9jRsneo/Rb02qfTqqAAE/jDkE1U9e1D0tyW6DqJGgBaksxo3WBEEXbwrecciCtQLim
	 vksp3tjkO2YgBRNRFBv8BGHcbqQ/Da7FgyvZnOSk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 54/72] media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
Date: Wed, 13 Aug 2025 00:46:02 +0300
Message-ID: <20250812214620.30425-55-laurent.pinchart@ideasonboard.com>
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

This driver supports OF platforms only. The "clocks" and
"clock-frequency" properties were initially mandatory in the DT
bindings. The driver retrieves the clock, retrieves the clock rate from
the "clock-frequency" property, and sets the clock rate to the retrieved
rate. If the rate does not match one of the expected rates, the driver
fails probing. This is deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov02a10.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 6217164a7492..70d9d7c43f18 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -102,7 +102,6 @@ struct ov02a10_mode {
 struct ov02a10 {
 	struct device *dev;
 
-	u32 eclk_freq;
 	/* Indication of MIPI transmission speed select */
 	u32 mipi_clock_voltage;
 
@@ -886,22 +885,11 @@ static int ov02a10_probe(struct i2c_client *client)
 		ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
 	}
 
-	ov02a10->eclk = devm_v4l2_sensor_clk_get(dev, "eclk");
+	ov02a10->eclk = devm_v4l2_sensor_clk_get_legacy(dev, "eclk", false, 0);
 	if (IS_ERR(ov02a10->eclk))
 		return dev_err_probe(dev, PTR_ERR(ov02a10->eclk),
 				     "failed to get eclk\n");
 
-	ret = device_property_read_u32(dev, "clock-frequency",
-				       &ov02a10->eclk_freq);
-	if (ret < 0)
-		return dev_err_probe(dev, ret,
-				     "failed to get eclk frequency\n");
-
-	ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
-	if (ret < 0)
-		return dev_err_probe(dev, ret,
-				     "failed to set eclk frequency (24MHz)\n");
-
 	if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ)
 		dev_warn(dev, "eclk mismatched, mode is based on 24MHz\n");
 
-- 
Regards,

Laurent Pinchart


