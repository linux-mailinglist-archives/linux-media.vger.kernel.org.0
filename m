Return-Path: <linux-media+bounces-10439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552B8B6FE4
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CAC11C21A0D
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A23912CD9C;
	Tue, 30 Apr 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rLO9MGl5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4B912C49D;
	Tue, 30 Apr 2024 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473636; cv=none; b=ECxrzXsLr2P6c6aR5RwDnTsBbJ7DYyYv3+f3hxghrjcbqV5wBIHxEktL4IAe7ve/BSulhhH32VoUzBKEubw977bRABT0Pm31swnPsFCzEXE0MrvIOK8YDwvtbU/g88dfNb1bbJYxKKipwu3LwfKqTPOJERzBmEBm/zS+QCS9+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473636; c=relaxed/simple;
	bh=aHNOEa4NUUVZSf59ce2/tFJ4/4rn+zCYOxeoU2vjNSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DRarRs6Fs/+nS/BWBIVyZeWTt8s8pLBubiA38VN0ETvPSbwvS5zpQ6nU64Neo8XwWyfGxogR78/ASe6GxR7LE95McJ7e8doGZ71w13cvVSi+vgq5sRGpTi9RBICNY2I9vHb50cy1Pfa9Zt9skD8jbfq+NCC+LgUuhV/CqT8LznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rLO9MGl5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 687362B62;
	Tue, 30 Apr 2024 12:39:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473564;
	bh=aHNOEa4NUUVZSf59ce2/tFJ4/4rn+zCYOxeoU2vjNSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLO9MGl5abBOLS51XeTVidT1Y0OOnPXivfxMAD33R3f7VDtHGYteUO2NfgYVPFp7B
	 5DFsXayg7zq8HWN/DaSaaC9PuJrdnk/iR4Fx3fCFgH2ZhcO3YmMrOvwl0Ue0GV6iYj
	 AuZ8vHycW73zwyEiEEGh4gpToayAMWmlGyZFpfik=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 15/19] media: rcar-csi2: Add support for multiplexed streams
Date: Tue, 30 Apr 2024 12:39:51 +0200
Message-ID: <20240430103956.60190-16-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create and initialize the v4l2_subdev_state for the R-Car CSI-2 receiver
in order to prepare to support multiplexed transmitters.

Create the subdevice state with v4l2_subdev_init_finalize() and
implement the init_state() operation to guarantee the state is initialized.

The routing table within the R-Car CSI-2 receiver is fixed, streams
received on source_stream X will be directed to pad (X + 1) by default.
Initialize a static routing table with such routes set as active.

While at it, disable runtime_pm() in the probe() function error path.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 74 +++++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 582d5e35db0e..82dc0b92b8d3 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1226,6 +1226,65 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
 	.pad	= &rcar_csi2_pad_ops,
 };
 
+static int rcsi2_init_state(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state)
+{
+	/*
+	 * Routing is fixed for this device: streams sent on sink_stream X
+	 * are directed to pad (X + 1). Which streams goes to the next
+	 * processing block (VIN) is controlled by link enablement between the
+	 * CSI-2 and the VIN itself and not by the CSI-2 routing table.
+	 *
+	 * The routing table is then fixed, as stream X will be directed to
+	 * csi:(X + 1)/0 and will be transmitted to VINs the on media link
+	 * csi2:(x + 1)->vin:0.
+	 *
+	 * For example, to route stream #3 to VIN #1 : "csi2:4/0 -> vin1:0" and
+	 * to route stream #2 to VIN #4 : "csi2:3/0 -> vin4:0".
+	 */
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_CSI2_SOURCE_VC0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 1,
+			.source_pad = RCAR_CSI2_SOURCE_VC1,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 2,
+			.source_pad = RCAR_CSI2_SOURCE_VC2,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 3,
+			.source_pad = RCAR_CSI2_SOURCE_VC3,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing(sd, state, &routing);
+}
+
+static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
+	.init_state = rcsi2_init_state,
+};
+
 static irqreturn_t rcsi2_irq(int irq, void *data)
 {
 	struct rcar_csi2 *priv = data;
@@ -1887,11 +1946,13 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	priv->subdev.owner = THIS_MODULE;
 	priv->subdev.dev = &pdev->dev;
+	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
 	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_STREAMS;
 
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
@@ -1912,14 +1973,22 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = v4l2_subdev_init_finalize(&priv->subdev);
+	if (ret)
+		goto error_pm_runtime;
+
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto error_async;
+		goto error_subdev;
 
 	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
 
 	return 0;
 
+error_subdev:
+	v4l2_subdev_cleanup(&priv->subdev);
+error_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -1936,6 +2005,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
+	v4l2_subdev_cleanup(&priv->subdev);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.44.0


