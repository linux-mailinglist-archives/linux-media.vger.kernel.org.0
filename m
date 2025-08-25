Return-Path: <linux-media+bounces-41020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9CAB343DD
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 000143BFAEA
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC8A2F99BE;
	Mon, 25 Aug 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SFUnhV7a"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67792FD7B4;
	Mon, 25 Aug 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131971; cv=none; b=qCfm+1JhJMJKHa1FCC55euO+eBgMb0j+AnoPcjnXfGRgWgQQuL5zvnar06ivse6hvd6qsYT95tfwtTFOHRyR+8id5YSheMyBc/HWFl5yLgwq7i3ae1aKLuhykV2pxtkSbFc4C1JqYer1yyCIeIkG2saZ6sgyr/ZDpmp9Gr464gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131971; c=relaxed/simple;
	bh=TxbXJPBAxn+Av31vkGIg4/NGpY+5ittNuyQehLvzIUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DV0Tv5Sx0hLp2aMHqjYetqKhFELLB/ezp8FXAj5cd/0jNiUM2WNjxoSGofVJYqUaaqnfhs29HLJcvoprMs3zWaTspx5ogwvQu23yiLfgtpMRtFqYrjMhANlgLbQvvRAqssOIgfAPOxm9rLcfM4usgUy3jjzdl1uKkXHy9y5HBj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SFUnhV7a; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEPnDC831123;
	Mon, 25 Aug 2025 09:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756131949;
	bh=QNm5dwf8TdgR6Mdz4J5qJhQINiOOdeGEbH9ZV2bXdLI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SFUnhV7aUm9/hskQrZEFOvYToSnsa7jRiJZyKjX8mnRnGLk7/nm9im8bT3Hrj1z8c
	 acf0pu28EtirCuJSoFFGC7kWFzGYRbh9m2iCTCOo4J/6j/RPyxBYUF8Pdv1d9DNjgv
	 F76MxLbBHeTZzM1tSFrrefvXy67RVdqSw0uIWwDY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEPmxG940798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:25:48 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:25:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:25:48 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEPN3q3747540;
	Mon, 25 Aug 2025 09:25:42 -0500
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
Subject: [PATCH v5 03/14] media: ti: j721e-csi2rx: separate out device and context
Date: Mon, 25 Aug 2025 19:55:11 +0530
Message-ID: <20250825142522.1826188-4-r-donadkar@ti.com>
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

The TI CSI2RX wrapper has two parts: the main device and the DMA
contexts. The driver was originally written with single camera capture
in mind, so only one DMA context was needed. For the sake of simplicity,
the context specific stuff was not modeled different to the main device.

To enable multiplexed stream capture, the contexts need to be separated
out from the main device. Create a struct ti_csi2rx_ctx that holds the
DMA context specific things. Separate out functions handling the device
and context related functionality.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 420 ++++++++++--------
 1 file changed, 232 insertions(+), 188 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b3a27f4c3210..cb52bc7afd1f 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -44,6 +44,8 @@
 
 #define TI_CSI2RX_MAX_PIX_PER_CLK	4
 #define PSIL_WORD_SIZE_BYTES		16
+#define TI_CSI2RX_NUM_CTX		1
+
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
  * all sizes. The max width and height are arbitrary numbers for this driver.
@@ -70,7 +72,7 @@ struct ti_csi2rx_buffer {
 	/* Common v4l2 buffer. Must be first. */
 	struct vb2_v4l2_buffer		vb;
 	struct list_head		list;
-	struct ti_csi2rx_dev		*csi;
+	struct ti_csi2rx_ctx		*ctx;
 };
 
 enum ti_csi2rx_dma_state {
@@ -90,30 +92,38 @@ struct ti_csi2rx_dma {
 	 * Queue of buffers submitted to DMA engine.
 	 */
 	struct list_head		submitted;
-	/* Buffer to drain stale data from PSI-L endpoint */
-	struct {
-		void			*vaddr;
-		dma_addr_t		paddr;
-		size_t			len;
-	} drain;
+};
+
+struct ti_csi2rx_dev;
+
+struct ti_csi2rx_ctx {
+	struct ti_csi2rx_dev		*csi;
+	struct video_device		vdev;
+	struct vb2_queue		vidq;
+	struct mutex			mutex; /* To serialize ioctls. */
+	struct v4l2_format		v_fmt;
+	struct ti_csi2rx_dma		dma;
+	u32				sequence;
+	u32				idx;
 };
 
 struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
 	struct v4l2_device		v4l2_dev;
-	struct video_device		vdev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
 	struct media_pad		pad;
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
-	struct vb2_queue		vidq;
-	struct mutex			mutex; /* To serialize ioctls. */
-	struct v4l2_format		v_fmt;
-	struct ti_csi2rx_dma		dma;
-	u32				sequence;
+	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
 	u8				pix_per_clk;
+	/* Buffer to drain stale data from PSI-L endpoint */
+	struct {
+		void			*vaddr;
+		dma_addr_t		paddr;
+		size_t			len;
+	} drain;
 };
 
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
@@ -219,7 +229,7 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 };
 
 /* Forward declaration needed by ti_csi2rx_dma_callback. */
-static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
+static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 			       struct ti_csi2rx_buffer *buf);
 
 static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
@@ -306,7 +316,7 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
 static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
-	struct ti_csi2rx_dev *csi = video_drvdata(file);
+	struct ti_csi2rx_ctx *csi = video_drvdata(file);
 
 	*f = csi->v_fmt;
 
@@ -337,7 +347,7 @@ static int ti_csi2rx_try_fmt_vid_cap(struct file *file, void *priv,
 static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_format *f)
 {
-	struct ti_csi2rx_dev *csi = video_drvdata(file);
+	struct ti_csi2rx_ctx *csi = video_drvdata(file);
 	struct vb2_queue *q = &csi->vidq;
 	int ret;
 
@@ -415,26 +425,35 @@ static int csi_async_notifier_bound(struct v4l2_async_notifier *notifier,
 static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
-	struct video_device *vdev = &csi->vdev;
-	int ret;
+	int ret, i;
 
-	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-	if (ret)
-		return ret;
-
-	ret = media_create_pad_link(&csi->source->entity, CSI2RX_BRIDGE_SOURCE_PAD,
-				    &vdev->entity, csi->pad.index,
-				    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
+		struct video_device *vdev = &ctx->vdev;
 
-	if (ret) {
-		video_unregister_device(vdev);
-		return ret;
+		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+		if (ret)
+			goto unregister_dev;
 	}
 
+	ret = media_create_pad_link(&csi->source->entity,
+				    CSI2RX_BRIDGE_SOURCE_PAD,
+				    &vdev->entity, csi->pad.index,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto unregister_dev;
+
 	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 	if (ret)
-		video_unregister_device(vdev);
+		goto unregister_dev;
 
+	return 0;
+
+unregister_dev:
+	i--;
+	for (; i >= 0; i--)
+		video_unregister_device(&csi->ctx[i].vdev);
 	return ret;
 }
 
@@ -479,13 +498,14 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
 }
 
 /* Request maximum possible pixels per clock from the bridge */
-static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
+static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
 {
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
 	struct media_pad *pad;
 	int ret;
 
-	pad = media_entity_remote_source_pad_unique(&csi->vdev.entity);
+	pad = media_entity_remote_source_pad_unique(&ctx->vdev.entity);
 	if (!pad)
 		return;
 
@@ -498,19 +518,20 @@ static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
 	}
 }
 
-static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
+static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 {
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	const struct ti_csi2rx_fmt *fmt;
 	unsigned int reg;
 
-	fmt = find_format_by_fourcc(csi->v_fmt.fmt.pix.pixelformat);
+	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
 	/* De-assert the pixel interface reset. */
 	reg = SHIM_CNTL_PIX_RST;
 	writel(reg, csi->shim + SHIM_CNTL);
 
 	/* Negotiate pixel count from the source */
-	ti_csi2rx_request_max_ppc(csi);
+	ti_csi2rx_request_max_ppc(ctx);
 
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
@@ -577,8 +598,9 @@ static void ti_csi2rx_drain_callback(void *param)
  * To prevent that stale data corrupting the subsequent transactions, it is
  * required to issue DMA requests to drain it out.
  */
-static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
+static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 {
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct dma_async_tx_descriptor *desc;
 	struct completion drain_complete;
 	dma_cookie_t cookie;
@@ -586,8 +608,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
 
 	init_completion(&drain_complete);
 
-	desc = dmaengine_prep_slave_single(csi->dma.chan, csi->dma.drain.paddr,
-					   csi->dma.drain.len, DMA_DEV_TO_MEM,
+	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
+					   csi->drain.len, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
 		ret = -EIO;
@@ -602,11 +624,11 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
 	if (ret)
 		goto out;
 
-	dma_async_issue_pending(csi->dma.chan);
+	dma_async_issue_pending(ctx->dma.chan);
 
 	if (!wait_for_completion_timeout(&drain_complete,
 					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
-		dmaengine_terminate_sync(csi->dma.chan);
+		dmaengine_terminate_sync(ctx->dma.chan);
 		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
 		ret = -ETIMEDOUT;
 		goto out;
@@ -618,8 +640,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
 static void ti_csi2rx_dma_callback(void *param)
 {
 	struct ti_csi2rx_buffer *buf = param;
-	struct ti_csi2rx_dev *csi = buf->csi;
-	struct ti_csi2rx_dma *dma = &csi->dma;
+	struct ti_csi2rx_ctx *ctx = buf->ctx;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	unsigned long flags;
 
 	/*
@@ -627,7 +649,7 @@ static void ti_csi2rx_dma_callback(void *param)
 	 * hardware monitor registers.
 	 */
 	buf->vb.vb2_buf.timestamp = ktime_get_ns();
-	buf->vb.sequence = csi->sequence++;
+	buf->vb.sequence = ctx->sequence++;
 
 	spin_lock_irqsave(&dma->lock, flags);
 
@@ -654,17 +676,17 @@ static void ti_csi2rx_dma_callback(void *param)
 	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
-static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
+static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 			       struct ti_csi2rx_buffer *buf)
 {
 	unsigned long addr;
 	struct dma_async_tx_descriptor *desc;
-	size_t len = csi->v_fmt.fmt.pix.sizeimage;
+	size_t len = ctx->v_fmt.fmt.pix.sizeimage;
 	dma_cookie_t cookie;
 	int ret = 0;
 
 	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-	desc = dmaengine_prep_slave_single(csi->dma.chan, addr, len,
+	desc = dmaengine_prep_slave_single(ctx->dma.chan, addr, len,
 					   DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc)
@@ -678,20 +700,20 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
 	if (ret)
 		return ret;
 
-	dma_async_issue_pending(csi->dma.chan);
+	dma_async_issue_pending(ctx->dma.chan);
 
 	return 0;
 }
 
-static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev *csi)
+static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 {
-	struct ti_csi2rx_dma *dma = &csi->dma;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	enum ti_csi2rx_dma_state state;
 	unsigned long flags;
 	int ret;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	state = csi->dma.state;
+	state = ctx->dma.state;
 	dma->state = TI_CSI2RX_DMA_STOPPED;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
@@ -702,30 +724,30 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev *csi)
 		 * is stopped, as the module-level pixel reset cannot be
 		 * enforced before terminating DMA.
 		 */
-		ret = ti_csi2rx_drain_dma(csi);
+		ret = ti_csi2rx_drain_dma(ctx);
 		if (ret && ret != -ETIMEDOUT)
-			dev_warn(csi->dev,
+			dev_warn(ctx->csi->dev,
 				 "Failed to drain DMA. Next frame might be bogus\n");
 	}
 
-	ret = dmaengine_terminate_sync(csi->dma.chan);
+	ret = dmaengine_terminate_sync(ctx->dma.chan);
 	if (ret)
-		dev_err(csi->dev, "Failed to stop DMA: %d\n", ret);
+		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
 }
 
-static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_dev *csi,
+static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_ctx *ctx,
 				      enum vb2_buffer_state state)
 {
-	struct ti_csi2rx_dma *dma = &csi->dma;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct ti_csi2rx_buffer *buf, *tmp;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	list_for_each_entry_safe(buf, tmp, &csi->dma.queue, list) {
+	list_for_each_entry_safe(buf, tmp, &ctx->dma.queue, list) {
 		list_del(&buf->list);
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
-	list_for_each_entry_safe(buf, tmp, &csi->dma.submitted, list) {
+	list_for_each_entry_safe(buf, tmp, &ctx->dma.submitted, list) {
 		list_del(&buf->list);
 		vb2_buffer_done(&buf->vb.vb2_buf, state);
 	}
@@ -736,8 +758,8 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 				 unsigned int *nplanes, unsigned int sizes[],
 				 struct device *alloc_devs[])
 {
-	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(q);
-	unsigned int size = csi->v_fmt.fmt.pix.sizeimage;
+	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(q);
+	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
 
 	if (*nplanes) {
 		if (sizes[0] < size)
@@ -753,11 +775,11 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 
 static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
 {
-	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
-	unsigned long size = csi->v_fmt.fmt.pix.sizeimage;
+	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long size = ctx->v_fmt.fmt.pix.sizeimage;
 
 	if (vb2_plane_size(vb, 0) < size) {
-		dev_err(csi->dev, "Data will not fit into plane\n");
+		dev_err(ctx->csi->dev, "Data will not fit into plane\n");
 		return -EINVAL;
 	}
 
@@ -767,15 +789,15 @@ static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
 
 static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 {
-	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
+	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct ti_csi2rx_buffer *buf;
-	struct ti_csi2rx_dma *dma = &csi->dma;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	bool restart_dma = false;
 	unsigned long flags = 0;
 	int ret;
 
 	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
-	buf->csi = csi;
+	buf->ctx = ctx;
 
 	spin_lock_irqsave(&dma->lock, flags);
 	/*
@@ -804,18 +826,18 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 		 * the application and will only confuse it. Issue a DMA
 		 * transaction to drain that up.
 		 */
-		ret = ti_csi2rx_drain_dma(csi);
+		ret = ti_csi2rx_drain_dma(ctx);
 		if (ret && ret != -ETIMEDOUT)
-			dev_warn(csi->dev,
+			dev_warn(ctx->csi->dev,
 				 "Failed to drain DMA. Next frame might be bogus\n");
 
 		spin_lock_irqsave(&dma->lock, flags);
-		ret = ti_csi2rx_start_dma(csi, buf);
+		ret = ti_csi2rx_start_dma(ctx, buf);
 		if (ret) {
 			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 			dma->state = TI_CSI2RX_DMA_IDLE;
 			spin_unlock_irqrestore(&dma->lock, flags);
-			dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
+			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
 		} else {
 			list_add_tail(&buf->list, &dma->submitted);
 			spin_unlock_irqrestore(&dma->lock, flags);
@@ -825,8 +847,9 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 
 static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
-	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vq);
-	struct ti_csi2rx_dma *dma = &csi->dma;
+	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct ti_csi2rx_buffer *buf;
 	unsigned long flags;
 	int ret = 0;
@@ -838,18 +861,18 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		return ret;
 
-	ret = video_device_pipeline_start(&csi->vdev, &csi->pipe);
+	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
 	if (ret)
 		goto err;
 
-	ti_csi2rx_setup_shim(csi);
+	ti_csi2rx_setup_shim(ctx);
 
-	csi->sequence = 0;
+	ctx->sequence = 0;
 
 	spin_lock_irqsave(&dma->lock, flags);
 	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
 
-	ret = ti_csi2rx_start_dma(csi, buf);
+	ret = ti_csi2rx_start_dma(ctx, buf);
 	if (ret) {
 		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
 		spin_unlock_irqrestore(&dma->lock, flags);
@@ -867,22 +890,23 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 err_dma:
-	ti_csi2rx_stop_dma(csi);
+	ti_csi2rx_stop_dma(ctx);
 err_pipeline:
-	video_device_pipeline_stop(&csi->vdev);
+	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX);
 err:
-	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_QUEUED);
+	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
 }
 
 static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 {
-	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vq);
+	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	int ret;
 
-	video_device_pipeline_stop(&csi->vdev);
+	video_device_pipeline_stop(&ctx->vdev);
 
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX);
@@ -891,8 +915,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
-	ti_csi2rx_stop_dma(csi);
-	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_ERROR);
+	ti_csi2rx_stop_dma(ctx);
+	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -903,20 +927,43 @@ static const struct vb2_ops csi_vb2_qops = {
 	.stop_streaming = ti_csi2rx_stop_streaming,
 };
 
-static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
+static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 {
-	struct vb2_queue *q = &csi->vidq;
+	media_device_unregister(&csi->mdev);
+	v4l2_device_unregister(&csi->v4l2_dev);
+	media_device_cleanup(&csi->mdev);
+}
+
+static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
+{
+	v4l2_async_nf_unregister(&csi->notifier);
+	v4l2_async_nf_cleanup(&csi->notifier);
+}
+
+static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
+{
+	dma_release_channel(ctx->dma.chan);
+	vb2_queue_release(&ctx->vidq);
+
+	video_unregister_device(&ctx->vdev);
+
+	mutex_destroy(&ctx->mutex);
+}
+
+static int ti_csi2rx_init_vb2q(struct ti_csi2rx_ctx *ctx)
+{
+	struct vb2_queue *q = &ctx->vidq;
 	int ret;
 
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_DMABUF;
-	q->drv_priv = csi;
+	q->drv_priv = ctx;
 	q->buf_struct_size = sizeof(struct ti_csi2rx_buffer);
 	q->ops = &csi_vb2_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->dev = dmaengine_get_dma_device(csi->dma.chan);
-	q->lock = &csi->mutex;
+	q->dev = dmaengine_get_dma_device(ctx->dma.chan);
+	q->lock = &ctx->mutex;
 	q->min_queued_buffers = 1;
 	q->allow_cache_hints = 1;
 
@@ -924,7 +971,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
 	if (ret)
 		return ret;
 
-	csi->vdev.queue = q;
+	ctx->vdev.queue = q;
 
 	return 0;
 }
@@ -933,8 +980,9 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 {
 	struct media_entity *entity = link->sink->entity;
 	struct video_device *vdev = media_entity_to_video_device(entity);
-	struct ti_csi2rx_dev *csi = container_of(vdev, struct ti_csi2rx_dev, vdev);
-	struct v4l2_pix_format *csi_fmt = &csi->v_fmt.fmt.pix;
+	struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
 	struct v4l2_subdev_format source_fmt = {
 		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
 		.pad	= link->source->index,
@@ -987,47 +1035,63 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
 	.link_validate = ti_csi2rx_link_validate,
 };
 
-static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
+static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
 	int ret;
 
-	INIT_LIST_HEAD(&csi->dma.queue);
-	INIT_LIST_HEAD(&csi->dma.submitted);
-	spin_lock_init(&csi->dma.lock);
-
-	csi->dma.state = TI_CSI2RX_DMA_STOPPED;
+	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
+	if (IS_ERR(ctx->dma.chan))
+		return PTR_ERR(ctx->dma.chan);
 
-	csi->dma.chan = dma_request_chan(csi->dev, "rx0");
-	if (IS_ERR(csi->dma.chan))
-		return PTR_ERR(csi->dma.chan);
-
-	ret = dmaengine_slave_config(csi->dma.chan, &cfg);
+	ret = dmaengine_slave_config(ctx->dma.chan, &cfg);
 	if (ret) {
-		dma_release_channel(csi->dma.chan);
+		dma_release_channel(ctx->dma.chan);
 		return ret;
 	}
 
-	csi->dma.drain.len = DRAIN_BUFFER_SIZE;
-	csi->dma.drain.vaddr = dma_alloc_coherent(csi->dev, csi->dma.drain.len,
-						  &csi->dma.drain.paddr,
-						  GFP_KERNEL);
-	if (!csi->dma.drain.vaddr)
-		return -ENOMEM;
-
 	return 0;
 }
 
 static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 {
 	struct media_device *mdev = &csi->mdev;
-	struct video_device *vdev = &csi->vdev;
+	int ret;
+
+	mdev->dev = csi->dev;
+	mdev->hw_revision = 1;
+	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
+
+	media_device_init(mdev);
+
+	csi->v4l2_dev.mdev = mdev;
+
+	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = media_device_register(mdev);
+	if (ret) {
+		v4l2_device_unregister(&csi->v4l2_dev);
+		media_device_cleanup(mdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct video_device *vdev = &ctx->vdev;
 	const struct ti_csi2rx_fmt *fmt;
-	struct v4l2_pix_format *pix_fmt = &csi->v_fmt.fmt.pix;
+	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
 	int ret;
 
+	mutex_init(&ctx->mutex);
+
 	fmt = find_format_by_fourcc(V4L2_PIX_FMT_UYVY);
 	if (!fmt)
 		return -EINVAL;
@@ -1036,19 +1100,20 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	pix_fmt->height = 480;
 	pix_fmt->field = V4L2_FIELD_NONE;
 	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
-	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
-	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601,
+	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE,
+	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB,
 
-	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
+	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
 
-	mdev->dev = csi->dev;
-	mdev->hw_revision = 1;
-	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
-
-	media_device_init(mdev);
+	csi->pad.flags = MEDIA_PAD_FL_SINK;
+	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
+	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
+	if (ret)
+		return ret;
 
-	strscpy(vdev->name, TI_CSI2RX_MODULE_NAME, sizeof(vdev->name));
+	snprintf(vdev->name, sizeof(vdev->name), "%s context %u",
+		 dev_name(csi->dev), ctx->idx);
 	vdev->v4l2_dev = &csi->v4l2_dev;
 	vdev->vfl_dir = VFL_DIR_RX;
 	vdev->fops = &csi_fops;
@@ -1056,61 +1121,33 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	vdev->release = video_device_release_empty;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_IO_MC;
-	vdev->lock = &csi->mutex;
-	video_set_drvdata(vdev, csi);
+	vdev->lock = &ctx->mutex;
+	video_set_drvdata(vdev, ctx);
 
-	csi->pad.flags = MEDIA_PAD_FL_SINK;
-	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
-	ret = media_entity_pads_init(&csi->vdev.entity, 1, &csi->pad);
-	if (ret)
-		return ret;
+	INIT_LIST_HEAD(&ctx->dma.queue);
+	INIT_LIST_HEAD(&ctx->dma.submitted);
+	spin_lock_init(&ctx->dma.lock);
+	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
 
-	csi->v4l2_dev.mdev = mdev;
-
-	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
+	ret = ti_csi2rx_init_dma(ctx);
 	if (ret)
 		return ret;
 
-	ret = media_device_register(mdev);
-	if (ret) {
-		v4l2_device_unregister(&csi->v4l2_dev);
-		media_device_cleanup(mdev);
-		return ret;
-	}
+	ret = ti_csi2rx_init_vb2q(ctx);
+	if (ret)
+		goto cleanup_dma;
 
 	return 0;
-}
-
-static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_dev *csi)
-{
-	dma_free_coherent(csi->dev, csi->dma.drain.len,
-			  csi->dma.drain.vaddr, csi->dma.drain.paddr);
-	csi->dma.drain.vaddr = NULL;
-	dma_release_channel(csi->dma.chan);
-}
-
-static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
-{
-	media_device_unregister(&csi->mdev);
-	v4l2_device_unregister(&csi->v4l2_dev);
-	media_device_cleanup(&csi->mdev);
-}
-
-static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
-{
-	v4l2_async_nf_unregister(&csi->notifier);
-	v4l2_async_nf_cleanup(&csi->notifier);
-}
 
-static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_dev *csi)
-{
-	vb2_queue_release(&csi->vidq);
+cleanup_dma:
+	dma_release_channel(ctx->dma.chan);
+	return ret;
 }
 
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
 	struct ti_csi2rx_dev *csi;
-	int ret;
+	int ret, i;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1119,62 +1156,69 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	csi->dev = &pdev->dev;
 	platform_set_drvdata(pdev, csi);
 
-	mutex_init(&csi->mutex);
 	csi->shim = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi->shim)) {
 		ret = PTR_ERR(csi->shim);
-		goto err_mutex;
+		return ret;
 	}
 
-	ret = ti_csi2rx_init_dma(csi);
-	if (ret)
-		goto err_mutex;
+	csi->drain.len = DRAIN_BUFFER_SIZE;
+	csi->drain.vaddr = dma_alloc_coherent(csi->dev, csi->drain.len,
+					      &csi->drain.paddr,
+					      GFP_KERNEL);
+	if (!csi->drain.vaddr)
+		return -ENOMEM;
 
 	ret = ti_csi2rx_v4l2_init(csi);
-	if (ret)
-		goto err_dma;
-
-	ret = ti_csi2rx_init_vb2q(csi);
 	if (ret)
 		goto err_v4l2;
 
+	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+		csi->ctx[i].idx = i;
+		csi->ctx[i].csi = csi;
+		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
+		if (ret)
+			goto err_ctx;
+	}
+
 	ret = ti_csi2rx_notifier_register(csi);
 	if (ret)
-		goto err_vb2q;
+		goto err_ctx;
 
 	ret = devm_of_platform_populate(csi->dev);
 	if (ret) {
 		dev_err(csi->dev, "Failed to create children: %d\n", ret);
-		goto err_subdev;
+		goto err_notifier;
 	}
 
 	return 0;
 
-err_subdev:
-	ti_csi2rx_cleanup_subdev(csi);
-err_vb2q:
-	ti_csi2rx_cleanup_vb2q(csi);
-err_v4l2:
+err_notifier:
+	ti_csi2rx_cleanup_notifier(csi);
+err_ctx:
+	i--;
+	for (; i >= 0; i--)
+		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
-err_dma:
-	ti_csi2rx_cleanup_dma(csi);
-err_mutex:
-	mutex_destroy(&csi->mutex);
+err_v4l2:
+	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
+			  csi->drain.paddr);
 	return ret;
 }
 
 static void ti_csi2rx_remove(struct platform_device *pdev)
 {
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
+	unsigned int i;
 
-	video_unregister_device(&csi->vdev);
+	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
+		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
-	ti_csi2rx_cleanup_vb2q(csi);
-	ti_csi2rx_cleanup_subdev(csi);
+	ti_csi2rx_cleanup_notifier(csi);
 	ti_csi2rx_cleanup_v4l2(csi);
-	ti_csi2rx_cleanup_dma(csi);
 
-	mutex_destroy(&csi->mutex);
+	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
+			  csi->drain.paddr);
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
-- 
2.34.1


