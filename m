Return-Path: <linux-media+bounces-41022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27629B343B0
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 296647AD651
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B433002AC;
	Mon, 25 Aug 2025 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OTHcLK6P"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D982FF669;
	Mon, 25 Aug 2025 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131982; cv=none; b=AHxVcvQiSNXmGN3lYwQeKBrUtQ6c/AeMthOGuXjvYnzW+UCaYmj5JjzynzuQVOrRKsWWAt681y3b4gJmZrMxxrTjAw7klwudg8vrerNMLPLeBje7bxc1Y9HrS/2dK/roVOe11D7B15i8QL9GbVlY8bsNsSkiEVOfS9uUA/tu4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131982; c=relaxed/simple;
	bh=y5c7ZNZi3L7/reZkaeePMtjgdTn7C1EldmJFKN4CuyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sh2zPKl+dufAAMmvfuSZ62p5HOC/X1IHbrHIr7C7GpJ5gbMmch775M4RTZqzyJkpGdHhG0lT5ThCvhkDdNdOaCjabO43T8bK7vnbCtu7Cupl85O8bv+jukaEMgu4c5UHbwHAT6DqlaILsSQJafP+UsylBbkUlMv6ohCntpI07fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OTHcLK6P; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEQ7VI826676;
	Mon, 25 Aug 2025 09:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756131967;
	bh=oiVZ7IC48GKfvfJx7HJNmkYC/6w7HvA9zxZFF1Zjlmg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OTHcLK6P2wPmYH9MCc01GAMqDIHRx55db9Y9E3UWNMV+s1C34o55yap+CSd6gxHXB
	 sLVsXFMkkQFEQG8yok4fp6ibVxiDZthpuF2T8aASidJeL3STCsKLUqIhX748i6nRIj
	 dSE56QTBsPDv6Xi4vnRktYExfvGlzKrzLJd9GDjY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEQ7HX1235807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:26:07 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:26:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:26:06 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEPN3t3747540;
	Mon, 25 Aug 2025 09:26:00 -0500
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
Subject: [PATCH v5 06/14] media: ti: j721e-csi2rx: add a subdev for the core device
Date: Mon, 25 Aug 2025 19:55:14 +0530
Message-ID: <20250825142522.1826188-7-r-donadkar@ti.com>
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

With single stream capture, it was simpler to use the video device as
the media entity representing the main TI CSI2RX device. Now with multi
stream capture coming into the picture, the model has shifted to each
video device having a link to the main device's subdev. The routing
would then be set on this subdev.

Add this subdev, link each context to this subdev's entity and link the
subdev's entity to the source. Also add an array of media pads. It will
have one sink pad and source pads equal to the number of contexts.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 259 +++++++++++++++---
 1 file changed, 228 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4b5e49c2244e..4e1c9db0dcf5 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -55,6 +55,11 @@
 #define MAX_WIDTH_BYTES			SZ_16K
 #define MAX_HEIGHT_LINES		SZ_16K
 
+#define TI_CSI2RX_PAD_SINK		0
+#define TI_CSI2RX_PAD_FIRST_SOURCE	1
+#define TI_CSI2RX_NUM_SOURCE_PADS	1
+#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
@@ -103,6 +108,7 @@ struct ti_csi2rx_ctx {
 	struct mutex			mutex; /* To serialize ioctls. */
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
+	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
 };
@@ -110,12 +116,15 @@ struct ti_csi2rx_ctx {
 struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
+	struct mutex			mutex; /* To serialize ioctls. */
+	unsigned int			enable_count;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pad;
+	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
+	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
@@ -126,6 +135,22 @@ struct ti_csi2rx_dev {
 	} drain;
 };
 
+static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ti_csi2rx_dev, subdev);
+}
+
+static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
+	.width = 640,
+	.height = 480,
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_SRGB,
+};
+
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 	{
 		.fourcc			= V4L2_PIX_FMT_YUYV,
@@ -427,6 +452,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
 	int ret, i;
 
+	/* Create link from source to subdev */
+	ret = media_create_pad_link(&csi->source->entity,
+				    CSI2RX_BRIDGE_SOURCE_PAD,
+				    &csi->subdev.entity,
+				    TI_CSI2RX_PAD_SINK,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		return ret;
+
+	/* Create and link video nodes for all DMA contexts */
 	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
@@ -434,15 +470,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (ret)
 			goto unregister_dev;
-	}
 
-	ret = media_create_pad_link(&csi->source->entity,
-				    CSI2RX_BRIDGE_SOURCE_PAD,
-				    &vdev->entity, csi->pad.index,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		goto unregister_dev;
+		ret = media_create_pad_link(&csi->subdev.entity,
+					    TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					    &vdev->entity, 0,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			video_unregister_device(vdev);
+			goto unregister_dev;
+		}
+	}
 
 	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 	if (ret)
@@ -452,8 +490,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 
 unregister_dev:
 	i--;
-	for (; i >= 0; i--)
+	for (; i >= 0; i--) {
+		media_entity_remove_links(&csi->ctx[i].vdev.entity);
 		video_unregister_device(&csi->ctx[i].vdev);
+	}
 	return ret;
 }
 
@@ -498,14 +538,13 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
 }
 
 /* Request maximum possible pixels per clock from the bridge */
-static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
+static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
 {
-	struct ti_csi2rx_dev *csi = ctx->csi;
 	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
 	struct media_pad *pad;
 	int ret;
 
-	pad = media_entity_remote_source_pad_unique(&ctx->vdev.entity);
+	pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!pad)
 		return;
 
@@ -531,7 +570,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	writel(reg, csi->shim + SHIM_CNTL);
 
 	/* Negotiate pixel count from the source */
-	ti_csi2rx_request_max_ppc(ctx);
+	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
@@ -885,7 +924,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
 	if (ret)
 		goto err_dma;
 
@@ -913,7 +952,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
@@ -929,8 +968,114 @@ static const struct vb2_ops csi_vb2_qops = {
 	.stop_streaming = ti_csi2rx_stop_streaming,
 };
 
+static int ti_csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	if (code_enum->index >= ARRAY_SIZE(ti_csi2rx_formats))
+		return -EINVAL;
+
+	code_enum->code = ti_csi2rx_formats[code_enum->index].code;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	/* No transcoding, don't allow setting source fmt */
+	if (format->pad > TI_CSI2RX_PAD_SINK)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	if (!find_format_by_code(format->format.code))
+		format->format.code = ti_csi2rx_formats[0].code;
+
+	format->format.field = V4L2_FIELD_NONE;
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
+					   format->stream);
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
+	*fmt = ti_csi2rx_default_fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
+	*fmt = ti_csi2rx_default_fmt;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	int ret = 0;
+
+	mutex_lock(&csi->mutex);
+
+	if (enable) {
+		if (csi->enable_count > 0) {
+			csi->enable_count++;
+			goto out;
+		}
+
+		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+		if (ret)
+			goto out;
+
+		csi->enable_count++;
+	} else {
+		if (csi->enable_count == 0) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (--csi->enable_count > 0)
+			goto out;
+
+		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	}
+
+out:
+	mutex_unlock(&csi->mutex);
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
+	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ti_csi2rx_sd_set_fmt,
+};
+
+static const struct v4l2_subdev_video_ops ti_csi2rx_subdev_video_ops = {
+	.s_stream = ti_csi2rx_sd_s_stream,
+};
+
+static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
+	.video = &ti_csi2rx_subdev_video_ops,
+	.pad = &ti_csi2rx_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops = {
+	.init_state = ti_csi2rx_sd_init_state,
+};
+
 static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 {
+	v4l2_subdev_cleanup(&csi->subdev);
 	media_device_unregister(&csi->mdev);
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_cleanup(&csi->mdev);
@@ -988,14 +1133,22 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 	struct v4l2_subdev_format source_fmt = {
 		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad	= link->source->index,
+		.stream = 0,
 	};
+	struct v4l2_subdev_state *state;
 	const struct ti_csi2rx_fmt *ti_fmt;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(csi->source, pad,
-					    get_fmt, &source_fmt);
-	if (ret)
-		return ret;
+	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
+	ret = v4l2_subdev_call(&csi->subdev, pad, get_fmt, state, &source_fmt);
+	v4l2_subdev_unlock_state(state);
+
+	if (ret) {
+		dev_dbg(csi->dev,
+			"Skipping validation as no format present on \"%s\":%u:0\n",
+			link->source->entity->name, link->source->index);
+		return 0;
+	}
 
 	if (source_fmt.format.width != csi_fmt->width) {
 		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
@@ -1025,8 +1178,9 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 
 	if (ti_fmt->fourcc != csi_fmt->pixelformat) {
 		dev_dbg(csi->dev,
-			"Cannot transform source fmt 0x%x to sink fmt 0x%x\n",
-			ti_fmt->fourcc, csi_fmt->pixelformat);
+			"Cannot transform \"%s\":%u format %p4cc to %p4cc\n",
+			link->source->entity->name, link->source->index,
+			&ti_fmt->fourcc, &csi_fmt->pixelformat);
 		return -EPIPE;
 	}
 
@@ -1037,6 +1191,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
 	.link_validate = ti_csi2rx_link_validate,
 };
 
+static const struct media_entity_operations ti_csi2rx_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct dma_slave_config cfg = {
@@ -1062,6 +1220,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 {
 	struct media_device *mdev = &csi->mdev;
+	struct v4l2_subdev *sd = &csi->subdev;
 	int ret;
 
 	mdev->dev = csi->dev;
@@ -1074,16 +1233,51 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 
 	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
 	if (ret)
-		return ret;
+		goto cleanup_media;
 
 	ret = media_device_register(mdev);
-	if (ret) {
-		v4l2_device_unregister(&csi->v4l2_dev);
-		media_device_cleanup(mdev);
-		return ret;
-	}
+	if (ret)
+		goto unregister_v4l2;
+
+	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
+	sd->internal_ops = &ti_csi2rx_internal_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
+	sd->dev = csi->dev;
+	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
+
+	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
+	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
+	     i < TI_CSI2RX_NUM_PADS; i++)
+		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+				     csi->pads);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_device_register_subdev(&csi->v4l2_dev, sd);
+	if (ret)
+		goto cleanup_subdev;
 
 	return 0;
+
+cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+unregister_media:
+	media_device_unregister(mdev);
+unregister_v4l2:
+	v4l2_device_unregister(&csi->v4l2_dev);
+cleanup_media:
+	media_device_cleanup(mdev);
+
+	return ret;
 }
 
 static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
@@ -1110,9 +1304,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
 
-	csi->pad.flags = MEDIA_PAD_FL_SINK;
+	ctx->pad.flags = MEDIA_PAD_FL_SINK;
 	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
-	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
+	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
 	if (ret)
 		return ret;
 
@@ -1173,6 +1367,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	mutex_init(&csi->mutex);
+
 	ret = ti_csi2rx_v4l2_init(csi);
 	if (ret)
 		goto err_v4l2;
@@ -1205,6 +1401,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
 err_v4l2:
+	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1220,7 +1417,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 
 	ti_csi2rx_cleanup_notifier(csi);
 	ti_csi2rx_cleanup_v4l2(csi);
-
+	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 }
-- 
2.34.1


