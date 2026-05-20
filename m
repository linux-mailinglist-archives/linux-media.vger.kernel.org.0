Return-Path: <linux-media+bounces-62379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPdUGg5ADmqr9AUAu9opvQ
	(envelope-from <linux-media+bounces-62379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:13:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452A59C9CE
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 299FC30840A3
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E23405859;
	Wed, 20 May 2026 22:45:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FEF402BB5
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779317123; cv=none; b=TJBiXZevvbPUZKZX7ta0g+JGE8s/22p5j8iZiav7i7De1bzX2tCBdDL6U8KX5LRazBIOeEFj/l07EXlyt6gctkHNZmWtXV6sgayWaUIpFqKEX7LkOYR+DYlkV7BzGWWBWnyLWnfwVKW2eApnCQfJH0t5WRZqQb6g5Ny1hKNxp2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779317123; c=relaxed/simple;
	bh=DDA58GZlnGFgFbP2Qrg1HaaE/8SHkMHpZ0JRikDK6Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCWYR++VcKcv1Mrw2l/qGAoJCMRFLkUAG5hS/0cK5v834O3m9vxy0p34n6LwDy5C4sAJmwBsdNcHpjde4DmhcrvM1G3DuE9l4eNkAeEISxSW+QS1xTlfh6svy2GRrhXnE5U1v5uUWckqkTJz3eTr6StGhut9Aatq3EXW4pJMNRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wPpeq-0005vy-0e; Thu, 21 May 2026 00:44:56 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Thu, 21 May 2026 00:44:25 +0200
Subject: [PATCH v7 20/28] media: rockchip: rga: support external iommus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-spu-rga3-v7-20-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62379-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,collabora.com:email,pengutronix.de:mid,pengutronix.de:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7452A59C9CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation for the RGA3 add support for external iommus. This is a
transition step to just disable the RGA2 specific mmu table setup code.

Currently a simple rga_hw struct field is used to set the internal iommu.
But to handle the case of more sophisticated detection mechanisms
(e.g. check for an iommu property in the device tree), it is abstracted
by an inline function.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

---
Changes in v6:
- Also select VIDEOBUF2_DMA_CONTIG in Kconfig, Flagged by sashiko:
  https://sashiko.dev/#/patchset/20260325-spu-rga3-v4-0-e90ec1c61354%40pengutronix.de?part=10
---
 drivers/media/platform/rockchip/rga/Kconfig   |  1 +
 drivers/media/platform/rockchip/rga/rga-buf.c | 31 ++++++++++++++++++---------
 drivers/media/platform/rockchip/rga/rga-hw.c  |  1 +
 drivers/media/platform/rockchip/rga/rga.c     | 11 ++++++++--
 drivers/media/platform/rockchip/rga/rga.h     |  6 ++++++
 5 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/Kconfig b/drivers/media/platform/rockchip/rga/Kconfig
index 727a0f6ea4664..846e555829f38 100644
--- a/drivers/media/platform/rockchip/rga/Kconfig
+++ b/drivers/media/platform/rockchip/rga/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_ROCKCHIP_RGA
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
 	select V4L2_MEM2MEM_DEV
 	help
diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index ab9554c1c4cd9..cd6904d5fe5a6 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -12,6 +12,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rga.h"
@@ -82,6 +83,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	if (IS_ERR(f))
 		return PTR_ERR(f);
 
+	if (!rga_has_internal_iommu(rga))
+		return 0;
+
 	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
@@ -136,17 +140,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
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
@@ -176,6 +184,9 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
 	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct rockchip_rga *rga = ctx->rga;
 
+	if (!rga_has_internal_iommu(rga))
+		return;
+
 	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
 			  rbuf->dma_desc, rbuf->dma_desc_pa);
 }
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 99cf57d5ba89d..73584706a47e2 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -577,6 +577,7 @@ static struct rga_fmt formats[] = {
 
 const struct rga_hw rga2_hw = {
 	.card_type = "rga2",
+	.has_internal_iommu = true,
 	.formats = formats,
 	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 91775b43ff617..e3c99c3f7c5be 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -23,6 +23,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
 #include "rga.h"
@@ -98,7 +99,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &rga_qops;
-	src_vq->mem_ops = &vb2_dma_sg_memops;
+	if (rga_has_internal_iommu(ctx->rga))
+		src_vq->mem_ops = &vb2_dma_sg_memops;
+	else
+		src_vq->mem_ops = &vb2_dma_contig_memops;
 	src_vq->gfp_flags = __GFP_DMA32;
 	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
@@ -113,7 +117,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &rga_qops;
-	dst_vq->mem_ops = &vb2_dma_sg_memops;
+	if (rga_has_internal_iommu(ctx->rga))
+		dst_vq->mem_ops = &vb2_dma_sg_memops;
+	else
+		dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->gfp_flags = __GFP_DMA32;
 	dst_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index bf21a57555a59..b180df5c48370 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -150,6 +150,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 
 struct rga_hw {
 	const char *card_type;
+	bool has_internal_iommu;
 	struct rga_fmt *formats;
 	u32 num_formats;
 	size_t cmdbuf_size;
@@ -165,6 +166,11 @@ struct rga_hw {
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
2.54.0


