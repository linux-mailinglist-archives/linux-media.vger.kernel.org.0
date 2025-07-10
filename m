Return-Path: <linux-media+bounces-37378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEA4B00A93
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C40BD3ADA94
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E972F3C0E;
	Thu, 10 Jul 2025 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bPz8BYKl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E0C2F0C72
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169778; cv=none; b=ImN9VXhj+yYN7y5bvUMVE4nHtj3AV7fa7fc+TlvlhXUC9S831xO2ApMscFiw+Ko66ZI+9dAWw7gq8p1OITf8xb5DB1Jacjaki7lU0K8qgCdaUEjfFFHG2xbDE9iLAGlQpy6j0acA8D1Cz4Q+ypbvbBtGcDY1d3IM507FW4aacOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169778; c=relaxed/simple;
	bh=FI2/OkS7Fbat522nWhSmSXIHzDmp2CAtkx6CW7Agf9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpXGnN4qXNY5FT3vrX6fM4693iGrZC4pVnUnaSMuFBexMeZ0Y3Ksm4mPLQowu0YLZFuS4fsLoJA+WQ6yWZqNML+Tveho1sZxg01NbczQWaSpouwJUmE9+HOdViDEzHjVtsGIgc039kRPFtvEaxG+rty67SgAHt3Yt9z99rt29mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bPz8BYKl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 49A823DC;
	Thu, 10 Jul 2025 19:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169746;
	bh=FI2/OkS7Fbat522nWhSmSXIHzDmp2CAtkx6CW7Agf9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPz8BYKlxtbxTTDwLi7knw+SuaSVd+jg7JdSrFrXarfiJDtmbq5XtG3ihOZLzswpa
	 5VdRBJveWZ6nxpPBPjID9fP2SXo/zr8KDj/tFV1lRujMQzFFM/JBsOzDaKOEh8e4nu
	 x4NjmcDHl5yrr68CjfAWyTGnseWtuWlR/DNPnLJ4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 35/72] media: i2c: ov02e10: Use V4L2 sensor clock helper
Date: Thu, 10 Jul 2025 20:47:31 +0300
Message-ID: <20250710174808.5361-36-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov02e10.c | 38 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 3dcb169dfaa3..7d7f43e77864 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -749,7 +749,6 @@ static int ov02e10_check_hwcfg(struct ov02e10 *ov02e10)
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	unsigned long link_freq_bitmap;
-	u32 ext_clk;
 	int ret;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -762,31 +761,6 @@ static int ov02e10_check_hwcfg(struct ov02e10 *ov02e10)
 	if (ret)
 		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
-	ov02e10->img_clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(ov02e10->img_clk)) {
-		ret = dev_err_probe(dev, PTR_ERR(ov02e10->img_clk),
-				    "failed to get imaging clock\n");
-		goto out_err;
-	}
-
-	if (ov02e10->img_clk) {
-		ext_clk = clk_get_rate(ov02e10->img_clk);
-	} else {
-		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-					       &ext_clk);
-		if (ret) {
-			dev_err(dev, "can't get clock frequency\n");
-			goto out_err;
-		}
-	}
-
-	if (ext_clk != OV02E10_MCLK) {
-		dev_err(dev, "external clock %d is not supported\n",
-			ext_clk);
-		ret = -EINVAL;
-		goto out_err;
-	}
-
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV02E10_DATA_LANES) {
 		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
@@ -838,6 +812,7 @@ static void ov02e10_remove(struct i2c_client *client)
 static int ov02e10_probe(struct i2c_client *client)
 {
 	struct ov02e10 *ov02e10;
+	unsigned long freq;
 	int ret;
 
 	ov02e10 = devm_kzalloc(&client->dev, sizeof(*ov02e10), GFP_KERNEL);
@@ -846,6 +821,17 @@ static int ov02e10_probe(struct i2c_client *client)
 
 	ov02e10->dev = &client->dev;
 
+	ov02e10->img_clk = devm_v4l2_sensor_clk_get(ov02e10->dev, NULL);
+	if (IS_ERR(ov02e10->img_clk))
+		return dev_err_probe(ov02e10->dev, PTR_ERR(ov02e10->img_clk),
+				     "failed to get imaging clock\n");
+
+	freq = clk_get_rate(ov02e10->img_clk);
+	if (freq != OV02E10_MCLK)
+		return dev_err_probe(ov02e10->dev, -EINVAL,
+				     "external clock %lu is not supported",
+				     freq);
+
 	v4l2_i2c_subdev_init(&ov02e10->sd, client, &ov02e10_subdev_ops);
 
 	/* Check HW config */
-- 
Regards,

Laurent Pinchart


