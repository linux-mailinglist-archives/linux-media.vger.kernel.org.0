Return-Path: <linux-media+bounces-37410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E05F2B00AC5
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB5E77BEB9A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1742F5087;
	Thu, 10 Jul 2025 17:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YKmeTB0u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C07A2F19BC
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169830; cv=none; b=XooBs3swu08XRezfQe+2agc2q8PCb9FMkzfMKDlOUsnmCnrbHUG5yPIUCrD0SsZpz6C6QMXDZRtHS9AbwmCiZXmKYpwYuMrki0ZpXEwpVWZ3CDgAyzd/Kw1O3MxfleXqVhYolcAwj2fR4bKcmUdGGROpnZBK5eT4Y3pO/6QJ3Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169830; c=relaxed/simple;
	bh=PeOM5/SApmW7QJULujeDAc7RCbtT8CEHXob9QA9MiQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpLxLoaXDQo6s8elAjy4K7/fo1GLeVbZ4CCR6Fn7+vAlcKCeq+81wvI9q7ZBPb4jKmsxwjIUiXJHhl1M0JGPJn5MSwPQ9Ny1evKDfR5Q+YDBY6JYCuB9tTegjdXQiBiZtFjAMpH3nvwg4OxAIAVEcWJRnYZmzfhJpLfGwfSQX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YKmeTB0u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4F53F3DC;
	Thu, 10 Jul 2025 19:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169798;
	bh=PeOM5/SApmW7QJULujeDAc7RCbtT8CEHXob9QA9MiQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YKmeTB0uiqEkB45fAtsA9C5/g0EWNtAouA3J+E/dXcLYA1/++jTg3YOmbCYzY0gqC
	 gXZ+fqQtc+tLJWjQz2U//SzjmYoKUn/xkFjWb6GpqaELlGF6PPrVPyxodnWbxmKmTZ
	 Yk9VoN8rTYHqcmBqqoQ6YfnLMDJkX4pE7EAKsT60=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>
Subject: [PATCH 67/72] media: i2c: ov5695: Use V4L2 legacy sensor clock helper
Date: Thu, 10 Jul 2025 20:48:03 +0300
Message-ID: <20250710174808.5361-68-laurent.pinchart@ideasonboard.com>
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
property has never been allowed. The "clocks" property is set in the
upstream DT sources and the "clock-frequency" property isn't. The driver
retrieves the clock and sets its rate to a fixed value. It then
retrieves the rate from the clock, and fails probing if the value
doesn't match. This is deprecated behaviour for OF.

Switch to using the devm_v4l2_sensor_clk_get_legacy() helper. This
preserves setting the clock rate on OF platforms. Should support for OF
platforms that set the clock rate through clock-frequency be considered
unneeded in the future, the driver will only need to switch to
devm_v4l2_sensor_clk_get() without any other change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5695.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index fe7ad7b2c05a..5bb6ce7b3237 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1264,16 +1264,12 @@ static int ov5695_probe(struct i2c_client *client)
 	ov5695->client = client;
 	ov5695->cur_mode = &supported_modes[0];
 
-	ov5695->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
+	ov5695->xvclk = devm_v4l2_sensor_clk_get_legacy(dev, "xvclk", true,
+							OV5695_XVCLK_FREQ);
 	if (IS_ERR(ov5695->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov5695->xvclk),
 				     "Failed to get xvclk\n");
 
-	ret = clk_set_rate(ov5695->xvclk, OV5695_XVCLK_FREQ);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set xvclk rate (24MHz)\n");
-		return ret;
-	}
 	if (clk_get_rate(ov5695->xvclk) != OV5695_XVCLK_FREQ)
 		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
-- 
Regards,

Laurent Pinchart


