Return-Path: <linux-media+bounces-43810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EDBC0B4B
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ADE63B5450
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7D42DEA7B;
	Tue,  7 Oct 2025 08:33:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3175D2DE6EF
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825992; cv=none; b=QlXMafMP7CMP6RgJeNd/PXXCBSk2HJU1iOHyFZmQ0N7pj7YLzHMxca6mN3evnPo3XhaxF9tdFvMCcRrkfUQoFGlsDkkYzLKCvRa77TEi1x1nBt4lSuCWh9kDxQJXHBN0PRsdusIITKZRbm3cZ2t+NXdgyGLOblpjyg6/IjYCojI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825992; c=relaxed/simple;
	bh=mj/oZKEIMIIRflXaV/dGXLjzTSNUGtt3SsBnF1EElog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5QIhyvxEVlBZy3KHgSHPlYFYwBo5LiqBurYBvXbITk+nBzf6r9gimyNIVbBld/EaWVXESl6IKpTZ7qZNHVm7OsDS1gjltWzm7aWEY1oUGppzgseAzuc1DbHUAobu4tbCEJ4hUJZh8TlOhvc2WFN3QirmC8YX6sS39Ulqzx1X6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637t-0002Hb-Ix; Tue, 07 Oct 2025 10:32:53 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:00 +0200
Subject: [PATCH 07/16] media: rockchip: rga: support external iommus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-7-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

In preparation for the RGA3 add support for external iommus. This is a
transition step to just disable the RGA2 specific mmu table setup code.

Currently a simple rga_hw struct field is used to set the internal iommu.
But to handle the case of more sophisticated detection mechanisms
(e.g. check for an iommu property in the device tree), it is abstracted
by an inline function.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 46 ++++++++++++++++-----------
 drivers/media/platform/rockchip/rga/rga-hw.c  |  1 +
 drivers/media/platform/rockchip/rga/rga.c     | 11 +++++--
 drivers/media/platform/rockchip/rga/rga.h     |  6 ++++
 4 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 0d188b3176cf3e175e865db5cfa26d565bf846ec..26b66b0c7e008308c24433f061a738a3985484b6 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -12,6 +12,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rga.h"
@@ -79,14 +80,16 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
 
-	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
+	if (rga_has_internal_iommu(rga)) {
+		n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
 
-	rbuf->n_desc = n_desc;
-	rbuf->dma_desc = dma_alloc_coherent(rga->dev,
-					    rbuf->n_desc * sizeof(*rbuf->dma_desc),
-					    &rbuf->dma_desc_pa, GFP_KERNEL);
-	if (!rbuf->dma_desc)
-		return -ENOMEM;
+		rbuf->n_desc = n_desc;
+		rbuf->dma_desc = dma_alloc_coherent(rga->dev,
+						    rbuf->n_desc * sizeof(*rbuf->dma_desc),
+						    &rbuf->dma_desc_pa, GFP_KERNEL);
+		if (!rbuf->dma_desc)
+			return -ENOMEM;
+	}
 
 	return 0;
 }
@@ -133,17 +136,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	for (i = 0; i < vb->num_planes; i++) {
 		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
 
-		/* Create local MMU table for RGA */
-		n_desc = fill_descriptors(&rbuf->dma_desc[curr_desc],
-					  rbuf->n_desc - curr_desc,
-					  vb2_dma_sg_plane_desc(vb, i));
-		if (n_desc < 0) {
-			v4l2_err(&ctx->rga->v4l2_dev,
-				 "Failed to map video buffer to RGA\n");
-			return n_desc;
+		if (rga_has_internal_iommu(ctx->rga)) {
+			/* Create local MMU table for RGA */
+			n_desc = fill_descriptors(&rbuf->dma_desc[curr_desc],
+						  rbuf->n_desc - curr_desc,
+						  vb2_dma_sg_plane_desc(vb, i));
+			if (n_desc < 0) {
+				v4l2_err(&ctx->rga->v4l2_dev,
+					 "Failed to map video buffer to RGA\n");
+				return n_desc;
+			}
+			dma_addrs[i] = curr_desc << PAGE_SHIFT;
+			curr_desc += n_desc;
+		} else {
+			dma_addrs[i] = vb2_dma_contig_plane_dma_addr(vb, i);
 		}
-		dma_addrs[i] = curr_desc << PAGE_SHIFT;
-		curr_desc += n_desc;
 	}
 
 	/* Fill the remaining planes */
@@ -173,8 +180,9 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
 	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct rockchip_rga *rga = ctx->rga;
 
-	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
-			  rbuf->dma_desc, rbuf->dma_desc_pa);
+	if (rga_has_internal_iommu(rga))
+		dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
+				  rbuf->dma_desc, rbuf->dma_desc_pa);
 }
 
 static void rga_buf_return_buffers(struct vb2_queue *q,
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index f3aef0b5ce25870764bd59f4241e2bda332bbd1f..04d72ecce7cdd47df8457b97c5ec4cff9cd7430b 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -619,6 +619,7 @@ static struct rga_fmt formats[] = {
 
 const struct rga_hw rga2_hw = {
 	.card_type = "rga2",
+	.has_internal_iommu = true,
 	.formats = formats,
 	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index ce55b48ef9fa8fbb2b265455cc559a4216609d4f..b8e4be3f9acd8a73a3d4e947aeeef9095543fb49 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -23,6 +23,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rga.h"
@@ -95,13 +96,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &rga_qops;
-	src_vq->mem_ops = &vb2_dma_sg_memops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->gfp_flags = __GFP_DMA32;
 	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->rga->mutex;
 	src_vq->dev = ctx->rga->v4l2_dev.dev;
 
+	if (rga_has_internal_iommu(ctx->rga))
+		src_vq->mem_ops = &vb2_dma_sg_memops;
+
 	ret = vb2_queue_init(src_vq);
 	if (ret)
 		return ret;
@@ -110,13 +114,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &rga_qops;
-	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->gfp_flags = __GFP_DMA32;
 	dst_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->rga->mutex;
 	dst_vq->dev = ctx->rga->v4l2_dev.dev;
 
+	if (rga_has_internal_iommu(ctx->rga))
+		dst_vq->mem_ops = &vb2_dma_sg_memops;
+
 	return vb2_queue_init(dst_vq);
 }
 
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index fa47cb35f2623fc5226cb23d1d1d793d5dcd1dc7..82ead58719f3baadb77575896ca2d430aa8e3dc6 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -152,6 +152,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 
 struct rga_hw {
 	const char *card_type;
+	bool has_internal_iommu;
 	struct rga_fmt *formats;
 	u32 num_formats;
 	size_t cmdbuf_size;
@@ -164,6 +165,11 @@ struct rga_hw {
 	void (*get_version)(struct rockchip_rga *rga);
 };
 
+static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)
+{
+	return rga->hw->has_internal_iommu;
+}
+
 extern const struct rga_hw rga2_hw;
 
 #endif

-- 
2.51.0


