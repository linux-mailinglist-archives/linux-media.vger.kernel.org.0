Return-Path: <linux-media+bounces-41027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0DAB34400
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FBC22A1D83
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06877301466;
	Mon, 25 Aug 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QePpQFOZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B707301038;
	Mon, 25 Aug 2025 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132005; cv=none; b=C55btAAoXlJ0wrM3dXc74DHG3YpDpmg915wuBL7Vt71/OV7pR2owV2/FC++c74SiGG0LssEZrkX5j63Fd5oiR8CVm93SX7wRxYHoTLVnbb49h4r12mXWpTVcs+11i6dCBeyx2I3YBi6bIrNkDMNHcSiUYnsPxS8Dt1MGXxv6SHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132005; c=relaxed/simple;
	bh=0BuRNIlZtSAOb8yBhIguxIFmxBouDOU3SW3j7cvcXAk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5sl2d4Ee+g8GN0NmCO9FRuqn+2NOi38MtWs3JdwG0Nz80l0KNi3GKTTGvIc9lJAnSUKtLjj8KrSuiruBgF7ZYgn91r83mgaOq36bCPxSNXRclLIozRGdLhlGFXWmN1u3ET7LXOBuwttBGhaiy3ywx7gtE3K0WdTjwDyOjJ2BBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QePpQFOZ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEQPmK1311085;
	Mon, 25 Aug 2025 09:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756131985;
	bh=QtAYMwTrca6JsZLT0vIj4fSVj/DIBI1MVxQYCeLDDo8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QePpQFOZnlhUqagv2NcowGM/pKXKGH71J/pQsMQJbrkJ9pCvGTLPS6UsuQLxuoiv5
	 bG7/qnJl0fhbcwwurlEQEvKmEknRVif8nMgHWVRj7GbsJi5lK2wKJcKmrPgcBbLShx
	 e22ACVDzYAibjTAoEbZccj2BCRRXQhJldfninGxc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEQP9T1235912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:26:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:26:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:26:25 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEPN3w3747540;
	Mon, 25 Aug 2025 09:26:19 -0500
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
Subject: [PATCH v5 09/14] media: ti: j721e-csi2rx: add support for processing virtual channels
Date: Mon, 25 Aug 2025 19:55:17 +0530
Message-ID: <20250825142522.1826188-10-r-donadkar@ti.com>
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

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel instead of hardcoded one.

get_frame_desc() returns the same information when called on each stream
start, so instead get the VCs for all the routed stream at first
stream start and cache this information in the driver.

get_frame_desc() works per stream, but as we don't support multiple
streams yet, we will just always use stream 0. If the source doesn't
support get_frame_desc(), fall back to the previous method of always
capturing virtual channel 0.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6cab7642aa10..45e9001fa35b 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -32,6 +32,7 @@
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
+#define SHIM_DMACNTX_VC			GENMASK(9, 6)
 #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
 #define SHIM_DMACNTX_YUV422_MODE_11	3
 #define SHIM_DMACNTX_SIZE_8		0
@@ -103,6 +104,7 @@ struct ti_csi2rx_dev;
 
 struct ti_csi2rx_ctx {
 	struct ti_csi2rx_dev		*csi;
+	struct v4l2_subdev_route	*route;
 	struct video_device		vdev;
 	struct vb2_queue		vidq;
 	struct mutex			mutex; /* To serialize ioctls. */
@@ -111,6 +113,8 @@ struct ti_csi2rx_ctx {
 	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
+	u32				vc;
+	u32				stream;
 };
 
 struct ti_csi2rx_dev {
@@ -134,6 +138,7 @@ struct ti_csi2rx_dev {
 		dma_addr_t		paddr;
 		size_t			len;
 	} drain;
+	bool				vc_cached;
 };
 
 static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
@@ -614,6 +619,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	}
 
 	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
+	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
 
 	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
@@ -887,6 +893,83 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_route(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct media_pad *pad;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *r;
+
+	/* Get the source pad connected to this ctx */
+	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
+	if (!pad) {
+		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
+		v4l2_subdev_unlock_state(state);
+		return -ENODEV;
+	}
+
+	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
+
+	for_each_active_route(&state->routing, r) {
+		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+		if (r->source_pad != pad->index)
+			continue;
+
+		ctx->route = r;
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	if (!ctx->route)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct ti_csi2rx_ctx *curr_ctx;
+	struct v4l2_mbus_frame_desc fd;
+	struct media_pad *source_pad;
+	struct v4l2_subdev_route *curr_route;
+	int ret;
+	unsigned int i, j;
+
+	/* Get the frame desc form source */
+	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!source_pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		curr_ctx = &csi->ctx[i];
+
+		/* Capture VC 0 by default */
+		curr_ctx->vc = 0;
+
+		ret = ti_csi2rx_get_route(curr_ctx);
+		if (ret)
+			continue;
+
+		curr_route = curr_ctx->route;
+		curr_ctx->stream = curr_route->sink_stream;
+
+		for (j = 0; j < fd.num_entries; j++)
+			if (curr_ctx->stream == fd.entry[j].stream)
+				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
+	}
+
+	return 0;
+}
+
 static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
@@ -907,6 +990,25 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	/* If no stream is routed to this ctx, exit early */
+	ret = ti_csi2rx_get_route(ctx);
+	if (ret)
+		goto err;
+
+	/* Get the VC for all enabled ctx on first stream start */
+	mutex_lock(&csi->mutex);
+	if (!csi->vc_cached) {
+		ret = ti_csi2rx_get_vc(ctx);
+		if (ret == -ENOIOCTLCMD) {
+			ctx->vc = 0;
+		} else if (ret < 0) {
+			mutex_unlock(&csi->mutex);
+			goto err;
+		}
+		csi->vc_cached = true;
+	}
+	mutex_unlock(&csi->mutex);
+
 	ti_csi2rx_setup_shim(ctx);
 
 	ctx->sequence = 0;
@@ -953,6 +1055,10 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
+	mutex_lock(&csi->mutex);
+	csi->vc_cached = false;
+	mutex_unlock(&csi->mutex);
+
 	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
@@ -1306,6 +1412,8 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
 
+	ctx->route = NULL;
+
 	ctx->pad.flags = MEDIA_PAD_FL_SINK;
 	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
 	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
-- 
2.34.1


