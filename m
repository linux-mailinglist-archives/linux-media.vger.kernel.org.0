Return-Path: <linux-media+bounces-20463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3429B3C1B
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 21:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2F1B283983
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACA21E0DE8;
	Mon, 28 Oct 2024 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EfKf0YZa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50EE1E0095
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 20:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730148298; cv=none; b=st1un0vmYCOWQ3HuOHKPhRMUMcDY2paZJI6eFkpXU4u/Ki3Brn2zXRBSS8g2vozkGd+vfyUBLl8RJvLR57Ql/R+CC4fphIRAPiG9dxFBM935SgfH6BhZ7j24t+7AWG784KhkWEBl00vL4y8JkWoHvD8uzVppAkG/GNkTb3EPpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730148298; c=relaxed/simple;
	bh=PHUZyHbAfre9zN4ZJr1MdEPvBypP6rCHMPtKkZsSrzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vn/49GCpTbKZLtakfZkDsFsc565Jzh0v0XHrnanAnxypj9ptH3CdObedBC2kjfNFUnb+Eqydhr1fzCiJ/szq0m1nq78gBUQtPbzAx9JG543bxhL3lzv3D79wrUNpuHSEzNXy1nZgF2toGMr+l4ELekRXj1FnBVedq5EaWsAlzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EfKf0YZa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E05451BF5;
	Mon, 28 Oct 2024 21:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730148292;
	bh=PHUZyHbAfre9zN4ZJr1MdEPvBypP6rCHMPtKkZsSrzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfKf0YZaxD5zZMkZb0e7sLdpUh9072ybE4Qq/Kju6OxMIQki83xxO8RwbEC3fIFgE
	 N8Zafxix4J/g3PGNHpqfWnGPHyqosy3faPd5BI0ZFzKcjYYHg6xzqZVLHbhRe+022B
	 q1pcz6k8oTRM1VcKOLT4TfcbOPjU5AvMDK4UBQLE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Subject: [PATCH v2 3/3] media: i2c: mt9p031: Switch from OF to fwnode API
Date: Mon, 28 Oct 2024 22:44:43 +0200
Message-ID: <20241028204443.22426-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
References: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the direct dependency on OF by using the fwnode API. This makes
the driver usable on non-OF systems, such as ACPI-based platforms.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9p031.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index e6353a5667ea..da1b90f03253 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -17,9 +17,8 @@
 #include <linux/log2.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_graph.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
@@ -1058,28 +1057,27 @@ static const struct v4l2_subdev_internal_ops mt9p031_subdev_internal_ops = {
  * Driver initialization and probing
  */
 
-static int mt9p031_parse_of(struct mt9p031 *mt9p031, struct device *dev)
+static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
 {
-	struct device_node *np;
 	struct v4l2_fwnode_endpoint endpoint = {
 		.bus_type = V4L2_MBUS_PARALLEL
 	};
+	struct fwnode_handle *np;
 	int ret;
 
-	if (!dev->of_node)
-		return -EINVAL;
-
-	np = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	np = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!np)
-		return -EINVAL;
+		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint);
-	of_node_put(np);
+	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
+	fwnode_handle_put(np);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
 
-	of_property_read_u32(np, "input-clock-frequency", &mt9p031->ext_freq);
-	of_property_read_u32(np, "pixel-clock-frequency", &mt9p031->target_freq);
+	fwnode_property_read_u32(np, "input-clock-frequency",
+				 &mt9p031->ext_freq);
+	fwnode_property_read_u32(np, "pixel-clock-frequency",
+				 &mt9p031->target_freq);
 
 	mt9p031->pixclk_pol = !!(endpoint.bus.parallel.flags &
 				 V4L2_MBUS_PCLK_SAMPLE_RISING);
@@ -1104,11 +1102,9 @@ static int mt9p031_probe(struct i2c_client *client)
 	if (mt9p031 == NULL)
 		return -ENOMEM;
 
-	ret = mt9p031_parse_of(mt9p031, &client->dev);
-	if (ret) {
-		dev_err(&client->dev, "Failed to parse DT properties\n");
+	ret = mt9p031_parse_properties(mt9p031, &client->dev);
+	if (ret)
 		return ret;
-	}
 
 	mt9p031->output_control	= MT9P031_OUTPUT_CONTROL_DEF;
 	mt9p031->mode2 = MT9P031_READ_MODE_2_ROW_BLC;
-- 
Regards,

Laurent Pinchart


