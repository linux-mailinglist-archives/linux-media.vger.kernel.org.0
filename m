Return-Path: <linux-media+bounces-39647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CECD3B23AF4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3741B1AA7588
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4852D8390;
	Tue, 12 Aug 2025 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XELNbkjh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571652D739D
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035222; cv=none; b=K4wDimeZshhXwvDtsb9llf72qDALyj+wgUzJwvl5W7oaWDrMlSJwa3K3//pdamLIas4qHW7BgT4X1/9UyxPFN0fSdOmrsi3gpOZX8R56qVANIHRfqpJAMJ6pkcCRpnklvIINHMoBL6lBJpUmEE3d5doNIgaLU062VhjBaQ1/5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035222; c=relaxed/simple;
	bh=DXZKysPKz8UHJBxHgr9cu1FvKrEEU0YkCaP4NKfdpE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCaxE3yZi+w28naxcFaetz0qab3Jm3xnd0ArayP5Q4fv3Gk+pBgsuoXDoSINNRwVqrL/JHz9UvS5LWmob+n4ms3aNvbM4YlNjWD7mr6UnEDr9M6rBu0VLBDAWPjEgSbsPT6VDkB4WTN2MxyTpZEnIS07YtQWYhhAkgtp6jKXiJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XELNbkjh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4D2651123;
	Tue, 12 Aug 2025 23:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035164;
	bh=DXZKysPKz8UHJBxHgr9cu1FvKrEEU0YkCaP4NKfdpE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XELNbkjhNtpoL3eQI/8+O4lPtcKtkjf2C33mEy+BsOET/fOl6pg5hbo9SwpoJQosr
	 uhXRwJLwsnitMI/9LDmG7X+ffNtsNAcVduGg5HbGzNHjjZp6ReJm3LMiwUebYA6ALn
	 tsnXSvZAUMz+nuNux+jRjwXzO3ClaSfWPXoeID/I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 11/72] media: i2c: hi556: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:19 +0300
Message-ID: <20250812214620.30425-12-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI platforms only. It retrieves the clock if
present, and retrieves the clock rate from the "clock-frequency"
property. If the rate does not match the expected rate, the driver fails
probing. This is correct behaviour for ACPI.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/hi556.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index cd7c3e4fd39c..de573cee4451 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1213,7 +1213,6 @@ static int hi556_check_hwcfg(struct device *dev)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 mclk;
 	int ret = 0;
 	unsigned int i, j;
 
@@ -1231,18 +1230,6 @@ static int hi556_check_hwcfg(struct device *dev)
 	if (ret)
 		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency\n");
-		goto check_hwcfg_error;
-	}
-
-	if (mclk != HI556_MCLK) {
-		dev_err(dev, "external clock %d is not supported\n", mclk);
-		ret = -EINVAL;
-		goto check_hwcfg_error;
-	}
-
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
 		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
@@ -1332,6 +1319,7 @@ static int hi556_resume(struct device *dev)
 static int hi556_probe(struct i2c_client *client)
 {
 	struct hi556 *hi556;
+	unsigned long freq;
 	bool full_power;
 	int i, ret;
 
@@ -1353,11 +1341,17 @@ static int hi556_probe(struct i2c_client *client)
 		return dev_err_probe(hi556->dev, PTR_ERR(hi556->reset_gpio),
 				     "failed to get reset GPIO\n");
 
-	hi556->clk = devm_clk_get_optional(hi556->dev, "clk");
+	hi556->clk = devm_v4l2_sensor_clk_get(hi556->dev, "clk");
 	if (IS_ERR(hi556->clk))
 		return dev_err_probe(hi556->dev, PTR_ERR(hi556->clk),
 				     "failed to get clock\n");
 
+	freq = clk_get_rate(hi556->clk);
+	if (freq != HI556_MCLK)
+		return dev_err_probe(hi556->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
 	for (i = 0; i < ARRAY_SIZE(hi556_supply_names); i++)
 		hi556->supplies[i].supply = hi556_supply_names[i];
 
-- 
Regards,

Laurent Pinchart


