Return-Path: <linux-media+bounces-14255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B691A796
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87A5AB2687A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E68A194136;
	Thu, 27 Jun 2024 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="idCEbP6Z"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5691922ED;
	Thu, 27 Jun 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493860; cv=none; b=cinNNIp8bVOsKKMh0lt/4Wjt0Ha/6FoIhwZSPHOjbb6siMEftgPzv58LDk1TlpF61ew9Xd5yJKi9Iah/gN/WD4c62cYxf4OlE405+L2VrSmMwa5OY8iE+3X+IZOvC++6Kksd3AupwFfGGPz1I0QVIf1uMofFnZXUW2BrJHF+OAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493860; c=relaxed/simple;
	bh=1ILCKrJLk9yaR4g/99eHvsKhfmfkthRxGFvcqEtG0NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HEB5KCv74g7M0d/aR6r7oP1q7444PlsPNZGYtwryus5lJFU4XzTG49eTZp7bJyiKLJ/cjaFSIIaH8nzZnm9V/E57Tu6hS+YeqPPxbGoGGoQ0+d6UlyU7MyVNZSViF2zwZTl74PWwt3gGMgtjBn3ZX8LJr8l0eJZrSB/Cc6RoJ58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=idCEbP6Z; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAhI5118853;
	Thu, 27 Jun 2024 08:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493843;
	bh=eqpXbGgbSDm8LbfkG0ZxunuOipJ1J05Yvt9OotQs7a8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=idCEbP6Z/ulilRRAFS2BPfu+i27lbFIH0qVd5Mp6F2D8FxkSf3UV9uzdUmCrkNvTA
	 iurUEl0CjQpJaPgBcF2RLqrk/ZKgE9EJkT6nk4MUYH+zZpVpOenGawsWWKajc0dMKT
	 /kAJ3uVUenwZMevo5fXN1boVk3LswqVxjnylAcYY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAhwE029395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:43 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:42 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAgTC072577;
	Thu, 27 Jun 2024 08:10:42 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:07 +0530
Subject: [PATCH v2 12/13] media: ti: j721e-csi2rx: add multistream support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-12-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=11269; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=1ILCKrJLk9yaR4g/99eHvsKhfmfkthRxGFvcqEtG0NI=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS9xlUOGi/ECwQK3YAyanGnwOtFrNvGwsBJi
 qG+4jiLD0WJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kvQAKCRBD3pH5JJpx
 RdhGEADBveKpD0i+iHxWxXWsVueUUedeG39hSYdb/OmQoU15I8X6qtX6COKX5g2ejnEt9mRtY/P
 DayQZrCQ+RzCfjFou4cZ+sGtLNQXa5AF2KCrTwKSysMVPdJodoIdSYHfMjGuBzHlDumI+PIR+2X
 nd2HsxF8F99lzCMe0xc/Zbtj5//Qdik6Qu23jbsoTJGIZYxQJNMqVSrhY3cyDkEwdzVMDtD594R
 XClUG/6i2CyWgaZxWnX04ooehJwzRf5H7Pwcyvx2/xJt64auMcRPIAajTMGmBaP2twz7LFsNi9H
 9/1DqNPDygMSeksapc1+ChDUOd3xQ7Dbg2YC1txQ5Q9KNMf+Z7B5MHUpyPzRQYq07sBSYAy4HL/
 37PJs5NzZfvwCfpdKxTDp3WE3xFrx30i0WfM/K47HN/gpzEMiJaFHr29H8u9JSxJdFnpugcCyjk
 ZL90NN3lexonahQ5rQ8Ew8X+r8gY0YYa47zrWoEpR26NSwY46gwu0j5Tv2GxBlRK3EU/AUMnwcs
 k7KSzeRG+iDAZlPn9dLIwziR1DunqW3unGnnzbnJKfUr6Eaq035r2q9BjIQDCx4/cQmo+9suvDp
 /HGgUDL1skGoZhjxkhIhn+Luo3LFVG/I+2o+P49IXKw3PMS328SF8EYfkIqbubdIAQsXycCdf0R
 cmfrHRyLS+NOrHg==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

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
instead of s_stream() hook. We wait for the userspace to start capturing
on all video nodes that have active routes, and once all video nodes are
STREAMON, we request the source to enable_stream() for all the sink
streams.

Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 231 +++++++++++++++++----
 1 file changed, 185 insertions(+), 46 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index c0916ca1a6f8..84b972c251e8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -124,6 +124,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
+	u64				streams_mask; /* Enabled sink streams */
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
 		void			*vaddr;
@@ -535,10 +536,6 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
-	/* De-assert the pixel interface reset. */
-	reg = SHIM_CNTL_PIX_RST;
-	writel(reg, csi->shim + SHIM_CNTL);
-
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
 
@@ -881,8 +878,12 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct ti_csi2rx_buffer *buf;
+	struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_route *route = NULL;
+	struct media_pad *remote_pad;
 	unsigned long flags;
-	int ret = 0;
+	int ret = 0, i;
+	struct v4l2_subdev_state *state;
 
 	spin_lock_irqsave(&dma->lock, flags);
 	if (list_empty(&dma->queue))
@@ -895,6 +896,40 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
+	for (i = 0; i < routing->num_routes; i++) {
+		struct v4l2_subdev_route *r = &routing->routes[i];
+
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
@@ -921,7 +956,10 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
+	/* Start stream 0, we don't allow multiple streams on the source pad */
+	ret = v4l2_subdev_enable_streams(&csi->subdev,
+					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					 BIT(0));
 	if (ret)
 		goto err_dma;
 
@@ -944,12 +982,16 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	int ret;
 
-	video_device_pipeline_stop(&ctx->vdev);
-
+	/* assert pixel reset to prevent stale data */
 	writel(0, csi->shim + SHIM_CNTL);
+
+	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
-	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
+	ret = v4l2_subdev_disable_streams(&csi->subdev,
+					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					  BIT(0));
+
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
@@ -995,8 +1037,8 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
 	}
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
-					   format->stream);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
 	if (!fmt) {
 		ret = -EINVAL;
 		goto out;
@@ -1007,72 +1049,169 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
 	return ret;
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
+	struct v4l2_subdev_route *route;
+	struct media_pad *remote_pad;
+	u64 sink_streams;
 	int ret = 0;
+	u32 reg;
 
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 	mutex_lock(&csi->mutex);
 
-	if (enable) {
-		if (csi->enable_count > 0) {
-			csi->enable_count++;
+	csi->streams_mask |= sink_streams;
+	/*
+	 * Check if all active streams are enabled, and only then start
+	 * streaming on the source
+	 */
+	for_each_active_route(&state->routing, route) {
+		if (!(csi->streams_mask & BIT_ULL(route->sink_stream)))
 			goto out;
-		}
+	}
 
-		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
-		if (ret)
-			goto out;
+	/* De-assert the pixel interface reset. */
+	reg = SHIM_CNTL_PIX_RST;
+	writel(reg, csi->shim + SHIM_CNTL);
 
+	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
+					 csi->streams_mask);
+out:
+	if (!ret)
 		csi->enable_count++;
-	} else {
-		if (csi->enable_count == 0) {
-			ret = -EINVAL;
-			goto out;
-		}
+	mutex_unlock(&csi->mutex);
 
-		if (--csi->enable_count > 0)
-			goto out;
+	return ret;
+}
+
+static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct v4l2_subdev_route *route;
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+	int ret = 0;
 
-		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
+
+	mutex_lock(&csi->mutex);
+	if (csi->enable_count == 0) {
+		ret = -EINVAL;
+		goto out;
 	}
 
+	/* Check if any of the active streams are already disabled */
+	for_each_active_route(&state->routing, route) {
+		if (!(csi->streams_mask & BIT_ULL(route->sink_stream))) {
+			--csi->enable_count;
+			goto out;
+		}
+	}
+	/* Disable all streams on the source */
+	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
+					  csi->streams_mask);
+	if (!ret)
+		--csi->enable_count;
 out:
+	csi->streams_mask &= ~sink_streams;
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
 
@@ -1264,7 +1403,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
 	sd->internal_ops = &ti_csi2rx_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
 	sd->dev = csi->dev;
 	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;

-- 
2.43.0


