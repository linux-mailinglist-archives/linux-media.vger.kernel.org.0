Return-Path: <linux-media+bounces-37407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7BB00AC8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FB47BE9BB
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FEE2F4A0D;
	Thu, 10 Jul 2025 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nuPSb4tt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EDB2F19AB
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169825; cv=none; b=bIZOhJ/k2cATkC6BJykYKWh/WsNORArkmL374mHbBerxgghbxfW3VcCCe29/7Xkl8VBiKOKdqtqqiepV/0QKyVR40VapwC1jlkK1cMayfjxm9g94yKEWMAcrnz10C+Cebhjdts8RFA/rtVYdj4ZZjDyXSmMx/wEA4d6CX/4xf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169825; c=relaxed/simple;
	bh=sUWsE38o6jCcqKjFdXWNeUOI6T5hN6CwId7pazYIAl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOSLqUtGYj11u+jz9OkhTXE99gSdYPmNxAwg9fPx8P9ABCPoWnxTWDmqNchnJ4KLXSu8pOTDCvrQY2RaTmK3/3YpbIDFwg4WeSpiLlYjgBRBagxsZj+iC59Jv7mdnehdQBCom8J/6g0sS25tqKgD/R/wc2uIzv6ax1BXDbNRjTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nuPSb4tt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5E18F111D;
	Thu, 10 Jul 2025 19:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169793;
	bh=sUWsE38o6jCcqKjFdXWNeUOI6T5hN6CwId7pazYIAl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nuPSb4ttKyELP8gnGQVgFSgoujH/p6Pai2/yAKQDFa+qWVIPDe+w4Adx1gyOvL8MG
	 lY/jfkolCRYIjrrZ6Zywh68K6l/rO9QNPFMXlKZs5ocaqLtCIq89bf6lxQZ5bTsWOr
	 /XwPcPrvZu1+an+OJjp8akHRx9dDLeBh+EnF1RnE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 64/72] media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:00 +0300
Message-ID: <20250710174808.5361-65-laurent.pinchart@ideasonboard.com>
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


