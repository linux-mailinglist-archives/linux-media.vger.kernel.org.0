Return-Path: <linux-media+bounces-33675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C95BAC90AC
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F371C01B43
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A6C231830;
	Fri, 30 May 2025 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dXDi4mnV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34D230BC9;
	Fri, 30 May 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613106; cv=none; b=jYkurqB7IALCilKSpqiNxzTIhIf7QS/nFf1J9zu3ja7Pc3tQk9Fyuf2pLXZx1kW3zTxjTfhwfBVZCvoEUIL5ekKXKujs8eQq21SMRRLAAF32Mok7+WVkcJOlvIn/LgcuPQVvb7YKyUUAF4sQ7GuGPndbQY7Q88Msbi+N3mzK+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613106; c=relaxed/simple;
	bh=eGxXrbQ8I7Tnu7ZgQwBPljss30FabnTKNMEZW47YvvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9H7y/rWX1uST7wpVkjKq+RNRFSJTOVMQyFoNajRUCnc1z6nC31TOH9eYfePS04ubKIC4Xkw2ng7SaQe0udgusF56BZOUAIbkp858bLJUW7qhP0ZOM7lYtRMJC6Yal7jJ7TMX0urObzAGeEvQ/L6TDDIpL3YfyQVa0ClRPVsX1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dXDi4mnV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE18B192D;
	Fri, 30 May 2025 15:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613067;
	bh=eGxXrbQ8I7Tnu7ZgQwBPljss30FabnTKNMEZW47YvvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dXDi4mnVI9GpHdSFLpPRYPVr4swS2UbjPSSnvnXZHfk6djxjO8LmP9JJl1z8kVOqy
	 tx025GPVigR4gbY40P5ieUKo2BbpaGiU25nJ9JpU/cGa0FSyhLvMEwm2RgqsVZ0maO
	 gZab07Ds9LxJJCEySW2wv8DPV7ZObHFuvyvPUUj0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:37 +0300
Subject: [PATCH v3 08/15] media: rcar-csi2: Switch to Streams API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-8-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4215;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eGxXrbQ8I7Tnu7ZgQwBPljss30FabnTKNMEZW47YvvU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfd/p4ubr3zmsUbKGBLOTaSAc+w1REz+jCt5
 BMlTyLEkVuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33QAKCRD6PaqMvJYe
 9UsSD/9gkjCE70TGoPwZtu7N7/bgachPzt5D1V5jryQxrKE9BmnuPHQP0MIdrHEXd+52l+piojj
 cmDniOflk2s15onpxVyNQtx011834gZymbG11JEjOl9R/RXOBbMCTVKw1ndnLsD0+7MymoGEEtV
 Ato3Cli8rE7oPO8Lcani7Kka6g234Dhjvr6h0TSzXzYM2wx9QV9ixS2xjNELQcQPTVmwSwHn+4n
 J7pUqZdKE1Df39Rt/+Pvt8r9+acVQN15Rd44D3eR1zUh4v6PusU0AkJ7j0phAM9LJEQdJQEAsk6
 RPOqasAL4Mwj0dk4jTMfYeEOXstnpszoojwn4+jaxQNhs/O9M9/rHsQojToDj9QC3y09OFU1lZ6
 zzdSDIhHFn4n51myhTn4TjQrG0pPLVggURQ9SZURxcCvE6HD+w+Q1PPCHPkC+J2obNivuzUlNgy
 ajmqP853y8SZw3RWznmaUdLEFjEDamhiozFN+45tsUAV+qgnPGw5ufCWUBZBB2n62WQ2Atvb2qn
 AkZFnFQPIxuFrt7uzmD9QHN+kVUzMh3NDYgEko2Xi0DLSvR8NEnNbIXf9Ymu3jQi/6PAFIyW6C2
 aZe4HIgOdIqAC1/sWTFpze/bHdfMmZjE/+yGQAsr3GgyyYrdPmCfJWP33GPaWwtp6vByFvvs4oF
 nbeFbNa2GkRvMmw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Switch to Streams API with a single hardcoded route. This breaks any
existing userspace which depended on the custom rcar streams
implementation, but a single camera use case should continue to work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 47 +++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index e0a0fd96459b..20bd44274bd2 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1028,7 +1028,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 		if (ret)
 			return ret;
 
-		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
 		if (!fmt)
 			return -EINVAL;
 
@@ -1069,7 +1069,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	int mbps, ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
 
 	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
 		fmt->width, fmt->height,
@@ -1650,8 +1650,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	struct v4l2_mbus_framefmt *fmt;
 
 	if (format->pad > RCAR_CSI2_SINK)
 		return v4l2_subdev_get_fmt(sd, state, format);
@@ -1659,11 +1658,20 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
+	/* Set sink format */
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	/* Propagate to source format */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
 
-	/* Propagate the format to the source pads. */
-	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
-		*v4l2_subdev_state_get_format(state, i) = format->format;
+	*fmt = format->format;
 
 	return 0;
 }
@@ -1683,8 +1691,15 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
 static int rcsi2_init_state(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	unsigned int num_pads = rcsi2_num_pads(priv);
+	static struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_CSI2_SOURCE_VC0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
 
 	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
 		.width		= 1920,
@@ -1697,10 +1712,13 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
 		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
 	};
 
-	for (unsigned int i = RCAR_CSI2_SINK; i < num_pads; i++)
-		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
+	static const struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
 
-	return 0;
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&rcar_csi2_default_fmt);
 }
 
 static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
@@ -2356,7 +2374,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_STREAMS;
 
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;

-- 
2.43.0


