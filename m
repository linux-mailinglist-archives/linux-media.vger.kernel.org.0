Return-Path: <linux-media+bounces-43812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B5EBC0A90
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 10:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B990188CA42
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 08:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296802D5C91;
	Tue,  7 Oct 2025 08:33:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA8F2571BE
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 08:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759825993; cv=none; b=ssM3ybcoNQJEWYzt8NTlxVLYTnPqFtenhoEOdElf5TYg4/IPBon0lVP+hGojun8CTlplyM9i30MuyWod1MOs+nR3f/r3E/H5KbOZvj1DdO3xAz20pAXW3+T3iuAAkWFTtQKeLyE0xWSWFrSVY9J1i7wr6Yo8+Zo+Bfq1atNlsiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759825993; c=relaxed/simple;
	bh=/HFgI/+FFPzyNEIkAXoxPZ3fGijgiQ34KN89cXoqjAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvT0TojNMDLGSISj+8EPU1ec8b+aBi9CqyOSlEDhCA5uGVIpP2LQqcCrEJN4KfA8zVssjY/FAFsUyD4x5XKNSEfa1ggPv6eGoRisovPi6jcB+yuMYjxODRyFsnlf0pU7txHvKmrxCQLZkPDDmiSzHX1qPofkhrj2cE83xyLX0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637u-0002Hb-C4; Tue, 07 Oct 2025 10:32:54 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:01 +0200
Subject: [PATCH 08/16] media: rockchip: rga: remove size from rga_frame
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-8-36ad85570402@pengutronix.de>
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

The size member is only used for the mmu page table mapping.
Therefore avoid storing the value and instead only calculate it
in place. This also avoids the calculation entirely when an external
iommu is used.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 6 +++++-
 drivers/media/platform/rockchip/rga/rga.c     | 8 ++------
 drivers/media/platform/rockchip/rga/rga.h     | 1 -
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 26b66b0c7e008308c24433f061a738a3985484b6..e44fe870fb9e34aa93404b7a60022fe441adf8f9 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -79,9 +79,13 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rockchip_rga *rga = ctx->rga;
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
+	u32 size = 0;
+	u8 i;
 
 	if (rga_has_internal_iommu(rga)) {
-		n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
+		for (i = 0; i < f->pix.num_planes; i++)
+			size += f->pix.plane_fmt[i].sizeimage;
+		n_desc = DIV_ROUND_UP(size, PAGE_SIZE);
 
 		rbuf->n_desc = n_desc;
 		rbuf->dma_desc = dma_alloc_coherent(rga->dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b8e4be3f9acd8a73a3d4e947aeeef9095543fb49..c5f25869d0cd08a794330954ec414f0428b647d8 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -222,7 +222,6 @@ static int rga_open(struct file *file)
 	};
 
 	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * def_frame.height;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -407,9 +406,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		return PTR_ERR(frm);
 	frm->width = pix_fmt->width;
 	frm->height = pix_fmt->height;
-	frm->size = 0;
-	for (i = 0; i < pix_fmt->num_planes; i++)
-		frm->size += pix_fmt->plane_fmt[i].sizeimage;
 	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 	frm->colorspace = pix_fmt->colorspace;
@@ -423,10 +419,10 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm->pix = *pix_fmt;
 
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
-		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
+		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
 		  &frm->fmt->fourcc, frm->width, frm->height,
-		  frm->stride, frm->size);
+		  frm->stride);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 82ead58719f3baadb77575896ca2d430aa8e3dc6..5aedda2f187e4bfef42c8755c4fc4b1ee5453e8e 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -42,7 +42,6 @@ struct rga_frame {
 
 	/* Variables that can calculated once and reused */
 	u32 stride;
-	u32 size;
 };
 
 struct rga_dma_desc {

-- 
2.51.0


