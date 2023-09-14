Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2587A0426
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 14:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238440AbjINMlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 08:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238435AbjINMlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 08:41:35 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BD21FC9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 05:41:31 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qglet-0008Mc-IM; Thu, 14 Sep 2023 14:41:23 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 14 Sep 2023 14:40:44 +0200
Subject: [PATCH 12/13] media: rockchip: rga: rework buffer handling for
 multi-planar formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v1-12-abfd77260ae3@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Multi-planar formats may have multiple planes that must be handled and
correctly mapped into a continuous buffer for the RGA by using the DMA
descriptors.

The plane offsets in the continuous mapping may now start at page
boundaries and the previous calculation based on the frame sizes is only
valid for planar buffers in a single memory. Therefore, the offsets must
be detected and set while creating the mapping.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 60 ++++++++++++++++++++-------
 drivers/media/platform/rockchip/rga/rga.c     |  7 ++++
 drivers/media/platform/rockchip/rga/rga.h     |  1 +
 3 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 137f4f4be14c..8eb89b28ba48 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 
+#include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
@@ -42,15 +43,29 @@ rga_queue_setup(struct vb2_queue *vq,
 {
 	struct rga_ctx *ctx = vb2_get_drv_priv(vq);
 	struct rga_frame *f = rga_get_frame(ctx, vq->type);
+	const struct v4l2_pix_format_mplane *pix_fmt;
+	int i;
 
 	if (IS_ERR(f))
 		return PTR_ERR(f);
 
-	if (*nplanes)
-		return sizes[0] < f->size ? -EINVAL : 0;
+	pix_fmt = &f->pix;
 
-	sizes[0] = f->size;
-	*nplanes = 1;
+	if (*nplanes) {
+		if (*nplanes != pix_fmt->num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < pix_fmt->num_planes; i++)
+			if (sizes[i] < pix_fmt->plane_fmt[i].sizeimage)
+				return -EINVAL;
+
+		return 0;
+	}
+
+	*nplanes = pix_fmt->num_planes;
+
+	for (i = 0; i < pix_fmt->num_planes; i++)
+		sizes[i] = pix_fmt->plane_fmt[i].sizeimage;
 
 	return 0;
 }
@@ -95,23 +110,38 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	struct rockchip_rga *rga = ctx->rga;
-	int n_desc;
+	int n_desc = 0;
+	int i;
+	const struct v4l2_format_info *info;
+	unsigned int offsets[VIDEO_MAX_PLANES];
 
 	if (IS_ERR(f))
 		return PTR_ERR(f);
 
-	vb2_set_plane_payload(vb, 0, f->size);
+	for (i = 0; i < vb->num_planes; i++) {
+		unsigned int ret;
+
+		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
 
-	/* Create local MMU table for RGA */
-	n_desc = fill_descriptors(rbuf->dma_desc,
-				  vb2_dma_sg_plane_desc(vb, 0));
-	if (n_desc < 0) {
-		dev_err(rga->dev, "Failed to map buffer");
-		return n_desc;
+		/* Create local MMU table for RGA */
+		ret = fill_descriptors(&rbuf->dma_desc[n_desc],
+				       vb2_dma_sg_plane_desc(vb, i));
+		if (ret < 0) {
+			dev_err(rga->dev, "Failed to map buffer");
+			return ret;
+		}
+		offsets[i] = n_desc << PAGE_SHIFT;
+		n_desc += ret;
 	}
-	rbuf->offset.y_off = get_plane_offset(f, 0);
-	rbuf->offset.u_off = get_plane_offset(f, 1);
-	rbuf->offset.v_off = get_plane_offset(f, 2);
+
+	/* Fill the remaining planes */
+	info = v4l2_format_info(f->fmt->fourcc);
+	for (i = info->mem_planes; i < info->comp_planes; i++)
+		offsets[i] = get_plane_offset(f, i);
+
+	rbuf->offset.y_off = offsets[0];
+	rbuf->offset.u_off = offsets[1];
+	rbuf->offset.v_off = offsets[2];
 
 	/* sync local MMU table for RGA */
 	dma_sync_single_for_device(rga->dev, rbuf->dma_desc_pa,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index db2160407b83..e0324341e702 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -363,6 +363,11 @@ static int rga_open(struct file *file)
 	ctx->in = def_frame;
 	ctx->out = def_frame;
 
+	v4l2_fill_pixfmt_mp(&ctx->in.pix,
+			    ctx->in.fmt->fourcc, ctx->out.width, ctx->out.height);
+	v4l2_fill_pixfmt_mp(&ctx->out.pix,
+			    ctx->out.fmt->fourcc, ctx->out.width, ctx->out.height);
+
 	if (mutex_lock_interruptible(&rga->mutex)) {
 		kfree(ctx);
 		return -ERESTARTSYS;
@@ -522,6 +527,8 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	frm->crop.width = frm->width;
 	frm->crop.height = frm->height;
 
+	frm->pix = *pix_fmt;
+
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index d8e76ab9c7e4..b279483aecf8 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -34,6 +34,7 @@ struct rga_frame {
 
 	/* Image format */
 	struct rga_fmt *fmt;
+	struct v4l2_pix_format_mplane pix;
 
 	/* Variables that can calculated once and reused */
 	u32 stride;

-- 
2.39.2

