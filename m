Return-Path: <linux-media+bounces-30419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC0AA9148A
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3FB190646B
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71FA2222DD;
	Thu, 17 Apr 2025 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kr5ti1G+"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4871E2222CD;
	Thu, 17 Apr 2025 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873040; cv=none; b=gNNF9dE2pSqrMvJj+LykstU5jVFO92DPygvQC/RjVD/VbeQEwrsooIB0GhnoKLQCrj//ZVqBkwWPNo6IDf5sBlBiAo1cVgcEKmQ0JrWlnV3sA9oPH8OH2tpcvtmmvDA8m8Dr2Mp5MHgKRc7eieVDhzsNk+PfU4Ts69q+tctkSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873040; c=relaxed/simple;
	bh=z0lmvbr+ZO0pq8Is9Gh0LMTOLMNWpnTgnIw7IR24lzM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktpz8RWz8wYV+a2B/7ExiRwsglfnadMKnnMlHt6l7vqW3/EAhKZ+X52iQ84EM+1ECTxgt8MdDz0LEtLLYppJ2m+dglgXJo0u5zOYPYtby4ZWALYZ42AqrX4UitV49VJ29fCE3X7R/g80/yuN7crBt2zCt4VmXCzvneMIvqtF0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kr5ti1G+; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6v6DG564368
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 01:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744873026;
	bh=8fyvYEVlAIypCFxL3nux1L23nLIOZe2e/fj3QMLhfR8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kr5ti1G+/4bzS3831gpYc84nHvpoy9x+T2JiJrxfmVe1jTrQaUdCJzSyTsZW7TpWA
	 KqAhBEIwnDI16w3gy70S209/KS5q5HJC1FvBEMQCq+bocRygDx2tRAdUuaIvd2Ma4+
	 BVkrC+P/cd3gLwCQK5H6D8997QI0PFgHY9MH8KiA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6v60P004441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 01:57:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 01:57:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 01:57:05 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H6tsxB035403;
	Thu, 17 Apr 2025 01:57:00 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <mripard@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <r-donadkar@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 11/13] media: ti: j721e-csi2rx: add multistream support
Date: Thu, 17 Apr 2025 12:25:52 +0530
Message-ID: <20250417065554.437541-12-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417065554.437541-1-r-donadkar@ti.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Jai Luthra <j-luthra@ti.com>

Each CSI2 stream can be multiplexed into 4 independent streams, each
identified by its virtual channel number. To capture this multiplexed
stream, the application needs to tell the driver how it wants to route
the data. It needs to specify which context should process which stream.
This is done via the new routing APIs.

Add ioctls to accept routing information from the application and save
that in the driver. This can be used when starting streaming on a
context to determine which route and consequently which virtual channel
it should process.

Support the new enable_stream()/disable_stream() APIs in the subdev
instead of s_stream() hook.

De-assert the pixel interface reset on first start_streaming() and assert
it on the last stop_streaming().

Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 212 ++++++++++++++----
 1 file changed, 166 insertions(+), 46 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 3e2a0517a9096..d00b5a1848043 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -538,8 +538,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
 	/* De-assert the pixel interface reset. */
-	reg = SHIM_CNTL_PIX_RST;
-	writel(reg, csi->shim + SHIM_CNTL);
+	if (!csi->enable_count) {
+		reg = SHIM_CNTL_PIX_RST;
+		writel(reg, csi->shim + SHIM_CNTL);
+	}
 
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
@@ -883,8 +885,12 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct ti_csi2rx_buffer *buf;
+	struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_route *route = NULL, *r;
+	struct media_pad *remote_pad;
 	unsigned long flags;
 	int ret = 0;
+	struct v4l2_subdev_state *state;
 
 	spin_lock_irqsave(&dma->lock, flags);
 	if (list_empty(&dma->queue))
@@ -897,6 +903,38 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	remote_pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
+	if (!remote_pad) {
+		ret = -ENODEV;
+		goto err;
+	}
+
+	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
+
+	routing = &state->routing;
+
+	/* Find the stream to process. */
+	for_each_active_route(routing, r) {
+		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if (r->source_pad != remote_pad->index)
+			continue;
+
+		route = r;
+		break;
+	}
+
+	if (!route) {
+		ret = -ENODEV;
+		v4l2_subdev_unlock_state(state);
+		goto err;
+	}
+
+	ctx->stream = route->sink_stream;
+
+	v4l2_subdev_unlock_state(state);
+
 	ret = ti_csi2rx_get_vc(ctx);
 	if (ret == -ENOIOCTLCMD)
 		ctx->vc = 0;
@@ -923,7 +961,10 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
+	/* Start stream 0, we don't allow multiple streams on the source pad */
+	ret = v4l2_subdev_enable_streams(&csi->subdev,
+					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					 BIT(0));
 	if (ret)
 		goto err_dma;
 
@@ -946,12 +987,16 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	int ret;
 
+	/* assert pixel reset to prevent stale data */
+	if (csi->enable_count == 1)
+		writel(0, csi->shim + SHIM_CNTL);
+
 	video_device_pipeline_stop(&ctx->vdev);
 
-	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+	ret = v4l2_subdev_disable_streams(&csi->subdev,
+					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					  BIT(0));
 
-	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
@@ -990,79 +1035,154 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
-					   format->stream);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
 	return 0;
 }
 
+static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+
+	if (ret)
+		return ret;
+
+	/* Only stream ID 0 allowed on source pads */
+	for (unsigned int i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_stream != 0)
+			return -EINVAL;
+	}
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+
+	return ret;
+}
+
+static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+
+	if (csi->enable_count > 0)
+		return -EBUSY;
+
+	return _ti_csi2rx_sd_set_routing(sd, state, routing);
+}
+
 static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_format format = {
-		.pad = TI_CSI2RX_PAD_SINK,
-		.format = {
-			.width = 640,
-			.height = 480,
-			.code = MEDIA_BUS_FMT_UYVY8_1X16,
-			.field = V4L2_FIELD_NONE,
-			.colorspace = V4L2_COLORSPACE_SRGB,
-			.ycbcr_enc = V4L2_YCBCR_ENC_601,
-			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-			.xfer_func = V4L2_XFER_FUNC_SRGB,
-		},
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = routes,
 	};
 
-	return ti_csi2rx_sd_set_fmt(sd, state, &format);
+	/* Initialize routing to single route to the fist source pad */
+	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
 }
 
-static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)
+static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct media_pad *remote_pad;
+	u64 sink_streams;
 	int ret = 0;
 
-	mutex_lock(&csi->mutex);
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
-	if (enable) {
-		if (csi->enable_count > 0) {
-			csi->enable_count++;
-			goto out;
-		}
+	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
+					 sink_streams);
+	if (ret)
+		return ret;
 
-		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
-		if (ret)
-			goto out;
+	mutex_lock(&csi->mutex);
+	csi->enable_count++;
+	mutex_unlock(&csi->mutex);
 
-		csi->enable_count++;
-	} else {
-		if (csi->enable_count == 0) {
-			ret = -EINVAL;
-			goto out;
-		}
+	return 0;
+}
 
-		if (--csi->enable_count > 0)
-			goto out;
+static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+	int ret = 0;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
-		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	mutex_lock(&csi->mutex);
+	if (csi->enable_count == 0) {
+		ret = -EINVAL;
+		goto out;
 	}
 
+	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
+					  sink_streams);
+	if (!ret)
+		--csi->enable_count;
 out:
 	mutex_unlock(&csi->mutex);
 	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
+	.set_routing = ti_csi2rx_sd_set_routing,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ti_csi2rx_sd_set_fmt,
-};
-
-static const struct v4l2_subdev_video_ops ti_csi2rx_subdev_video_ops = {
-	.s_stream = ti_csi2rx_sd_s_stream,
+	.enable_streams = ti_csi2rx_sd_enable_streams,
+	.disable_streams = ti_csi2rx_sd_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
-	.video = &ti_csi2rx_subdev_video_ops,
 	.pad = &ti_csi2rx_subdev_pad_ops,
 };
 
@@ -1244,7 +1364,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
 	sd->internal_ops = &ti_csi2rx_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
 	sd->dev = csi->dev;
 	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
-- 
2.34.1


