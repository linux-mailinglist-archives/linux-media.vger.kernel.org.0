Return-Path: <linux-media+bounces-41029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96525B343CD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AB001A825A6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6232FA0CC;
	Mon, 25 Aug 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="esaF9UKF"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A93019A3;
	Mon, 25 Aug 2025 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132013; cv=none; b=lHCkaSgSjBfg75nMNYUJ3KT8LJRP3PssVpdWikv3Pp4Oe63rxwRaTi+YP63P+JDhnf5HlBRVoBskGpvotasqzw6CtpBZvJZdPUX0kMGgYWYR/RLbXtK14GB9BfWx24rWg8KwXp5saVVXn5d8JNmRvRFV7KGw5nScaFeujlNtiJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132013; c=relaxed/simple;
	bh=xWrebglU/LtiN1uS3lmGhD3JSWrvwGDNr3DFShGQDuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AeIq+p4IZd3OwrrZfK5DBRLehTka7JmVb6adyT0n2QADAR23xubFhstwJ+/TJ+S3mmYpTf88dAAv6xvOLe8AUhq44KVoB56p88DqhCXUHbRMwhYZ8gSWwzzPeXT2Wx7TAos+bmEBc/7hLLbE42QBORRhEELZK+7AHWa+EoQk+sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=esaF9UKF; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEQcTC826910;
	Mon, 25 Aug 2025 09:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756131998;
	bh=7m7iIqSXh2e2mQMXBvtPizLEiOR5IG5aLxpj3hTbLJg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=esaF9UKFCs9kVLd5hSgpY8XKb56FPjg5UiEWOcoFV+JJv7J3FtxDnk9j9g5QtFTF3
	 c0ur8pyuONMq+lF8SsKRHDwRqBG7M5UmvpbIno9ChiZrsbeRq+imeKcpeB/0W7y600
	 yYHKazEpVicTMYvHA82xWHy4GtIVqwzZ73nOFQxQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEQbvH669431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:26:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:26:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:26:37 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEPN403747540;
	Mon, 25 Aug 2025 09:26:31 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <s-jain1@ti.com>, <vigneshr@ti.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v5 11/14] media: ti: j721e-csi2rx: add multistream support
Date: Mon, 25 Aug 2025 19:55:19 +0530
Message-ID: <20250825142522.1826188-12-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825142522.1826188-1-r-donadkar@ti.com>
References: <20250825142522.1826188-1-r-donadkar@ti.com>
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

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 194 ++++++++++++------
 1 file changed, 136 insertions(+), 58 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 45e9001fa35b..0d3b10a0e3fa 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -146,17 +146,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
 	return container_of(sd, struct ti_csi2rx_dev, subdev);
 }
 
-static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
-	.width = 640,
-	.height = 480,
-	.code = MEDIA_BUS_FMT_UYVY8_1X16,
-	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_SRGB,
-	.ycbcr_enc = V4L2_YCBCR_ENC_601,
-	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-	.xfer_func = V4L2_XFER_FUNC_SRGB,
-};
-
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 	{
 		.fourcc			= V4L2_PIX_FMT_YUYV,
@@ -572,8 +561,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
 	/* De-assert the pixel interface reset. */
-	reg = SHIM_CNTL_PIX_RST;
-	writel(reg, csi->shim + SHIM_CNTL);
+	if (!csi->enable_count) {
+		reg = SHIM_CNTL_PIX_RST;
+		writel(reg, csi->shim + SHIM_CNTL);
+	}
 
 	/* Negotiate pixel count from the source */
 	ti_csi2rx_request_max_ppc(csi);
@@ -1027,7 +1018,10 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
+	/* Start stream 0, we don't allow multiple streams on the source pad */
+	ret = v4l2_subdev_enable_streams(&csi->subdev,
+					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					 BIT(0));
 	if (ret)
 		goto err_dma;
 
@@ -1050,19 +1044,26 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	int ret;
 
-	video_device_pipeline_stop(&ctx->vdev);
+	mutex_lock(&csi->mutex);
 
-	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
-	mutex_lock(&csi->mutex);
-	csi->vc_cached = false;
-	mutex_unlock(&csi->mutex);
+	/* assert pixel reset to prevent stale data */
+	if (csi->enable_count == 1) {
+		writel(0, csi->shim + SHIM_CNTL);
+		csi->vc_cached = false;
+	}
 
-	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
+	video_device_pipeline_stop(&ctx->vdev);
+
+	ret = v4l2_subdev_disable_streams(&csi->subdev,
+					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					  BIT(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
+	mutex_unlock(&csi->mutex);
+
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
 }
@@ -1105,74 +1106,151 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
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
 
-static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *state)
+static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_krouting *routing)
 {
-	struct v4l2_mbus_framefmt *fmt;
+	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
-	*fmt = ti_csi2rx_default_fmt;
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
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
-	*fmt = ti_csi2rx_default_fmt;
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
 
-	return 0;
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
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
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
+	};
+
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
 
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
+
+	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
+					 sink_streams);
+	if (ret)
+		return ret;
+
 	mutex_lock(&csi->mutex);
+	csi->enable_count++;
+	mutex_unlock(&csi->mutex);
 
-	if (enable) {
-		if (csi->enable_count > 0) {
-			csi->enable_count++;
-			goto out;
-		}
+	return 0;
+}
 
-		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
-		if (ret)
-			goto out;
+static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct media_pad *remote_pad;
+	u64 sink_streams;
+	int ret = 0;
 
-		csi->enable_count++;
-	} else {
-		if (csi->enable_count == 0) {
-			ret = -EINVAL;
-			goto out;
-		}
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
-		if (--csi->enable_count > 0)
-			goto out;
+	if (csi->enable_count == 0)
+		return -EINVAL;
 
-		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
-	}
+	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
+					  sink_streams);
+	if (!ret)
+		--csi->enable_count;
 
-out:
-	mutex_unlock(&csi->mutex);
-	return ret;
+	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
 	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
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
 
@@ -1349,7 +1427,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
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


