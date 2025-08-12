Return-Path: <linux-media+bounces-39663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35485B23B15
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F8195857F0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73232E0904;
	Tue, 12 Aug 2025 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O/k+nvVw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12F42D739E
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035247; cv=none; b=p283VBRUysFQgMgPqFrmwliKWm+cQf4ljy+G8DZ6fbhTksJdLTOcgkg91WB6+M3PWnWTNikU6dBcv9RvEWwWlEZtkh/5TPG96qeREOaZaM4rznAolMiKvgd96WlbB2+olqpPeo0bIrgeBwZn33jEkBP+MH/jNcIdfRfzfkZDXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035247; c=relaxed/simple;
	bh=MF80DzF9b9hDhiEImGeBbojdOHVXq3wY2ekNLdIQ6UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKr20vZdRANoWWXW6DdEd/bnxeeYhR88Vacrme4RQl3/hzMz+SFR7PSsmviLUgd0AotR2DGTyjVZaeFhR+eBDrCj2DjzPVYJLlmqY3jQItw85ccgfs4fTbpTiJN1/w1Nvit36u1LPczHpRfOtyG56z6xu8Tkxdvoih/dRRoIVQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O/k+nvVw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 86EBD4A4;
	Tue, 12 Aug 2025 23:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035191;
	bh=MF80DzF9b9hDhiEImGeBbojdOHVXq3wY2ekNLdIQ6UU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O/k+nvVw/hmec3YK8uBU4lN8iT+kGnqsjk60Q9knD087ZpTqUD4s3M4RjmK1+krBm
	 UVUzTenSp6hzh4dXTPDyP1Q9x21FeZW81txp7Ty6rYsfCxCrJQ7io33A9jyr0ZeSwy
	 uj3fX0BG+NsM2EgmbxOkiZRtx8mIM4vALYSsHxNc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jimmy Su <jimmy.su@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 27/72] media: i2c: ov08d10: Use V4L2 sensor clock helper
Date: Wed, 13 Aug 2025 00:45:35 +0300
Message-ID: <20250812214620.30425-28-laurent.pinchart@ideasonboard.com>
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

This driver supports ACPI platforms only. It retrieves the clock rate
from the "clock-frequency" property. If the rate does not match the
expected rate, the driver prints a warning. This is correct behaviour
for ACPI.

Switch to using the devm_v4l2_sensor_clk_get() helper. This does not
change the behaviour on ACPI platforms that specify a clock-frequency
property and don't provide a clock. On ACPI platforms that provide a
clock, the clock rate will be set to the value of the clock-frequency
property. This should not change the behaviour either as this driver
expects the clock to be set to that rate, and wouldn't operate correctly
otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov08d10.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 2523adcaacf7..43ec2a1f2fcf 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -516,13 +516,12 @@ static const char * const ov08d10_test_pattern_menu[] = {
 
 struct ov08d10 {
 	struct device *dev;
+	struct clk *clk;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
 
-	struct clk		*xvclk;
-
 	/* V4L2 Controls */
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
@@ -1309,21 +1308,12 @@ static int ov08d10_get_hwcfg(struct ov08d10 *ov08d10)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 xvclk_rate;
 	unsigned int i, j;
 	int ret;
 
 	if (!fwnode)
 		return -ENXIO;
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &xvclk_rate);
-	if (ret)
-		return ret;
-
-	if (xvclk_rate != OV08D10_XVCLK_19_2)
-		dev_warn(dev, "external clock rate %u is unsupported",
-			 xvclk_rate);
-
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
@@ -1388,6 +1378,7 @@ static void ov08d10_remove(struct i2c_client *client)
 static int ov08d10_probe(struct i2c_client *client)
 {
 	struct ov08d10 *ov08d10;
+	unsigned long freq;
 	int ret;
 
 	ov08d10 = devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
@@ -1396,6 +1387,16 @@ static int ov08d10_probe(struct i2c_client *client)
 
 	ov08d10->dev = &client->dev;
 
+	ov08d10->clk = devm_v4l2_sensor_clk_get(ov08d10->dev, NULL);
+	if (IS_ERR(ov08d10->clk))
+		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(ov08d10->clk);
+	if (freq != OV08D10_XVCLK_19_2)
+		dev_warn(ov08d10->dev,
+			 "external clock rate %lu is not supported\n", freq);
+
 	ret = ov08d10_get_hwcfg(ov08d10);
 	if (ret) {
 		dev_err(ov08d10->dev, "failed to get HW configuration: %d",
-- 
Regards,

Laurent Pinchart


