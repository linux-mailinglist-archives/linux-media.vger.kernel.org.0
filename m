Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F07475364
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 08:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240406AbhLOG76 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 01:59:58 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:34216 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S240374AbhLOG7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 01:59:43 -0500
X-UUID: 5f6ae5e5de624cbaad2560d1f0a85ee1-20211215
X-UUID: 5f6ae5e5de624cbaad2560d1f0a85ee1-20211215
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1798713789; Wed, 15 Dec 2021 14:59:37 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 14:59:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Dec 2021 14:59:34 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 06/12] media: mtk-vcodec: Refactor get and put capture buffer flow
Date:   Wed, 15 Dec 2021 14:59:20 +0800
Message-ID: <20211215065926.8761-7-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215065926.8761-1-yunfei.dong@mediatek.com>
References: <20211215065926.8761-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

For lat and core decode in parallel, need to get capture buffer
when core start to decode and put put capture buffer to display
list when core decode done.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 122 ++++++++++++------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   5 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  16 ++-
 3 files changed, 103 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
index 0d19b0f67fd6..f3036c3f223b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -108,38 +108,89 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 
 #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
 
-static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
-					       struct vdec_fb *fb)
+static void mtk_vdec_stateless_out_to_done(struct mtk_vcodec_ctx *ctx,
+					   struct mtk_vcodec_mem *bs, int error)
 {
-	struct mtk_video_dec_buf *vdec_frame_buf =
-		container_of(fb, struct mtk_video_dec_buf, frame_buffer);
-	struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
-	unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
+	struct mtk_video_dec_buf *out_buf;
+	struct vb2_v4l2_buffer *vb;
 
-	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
-	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
-		unsigned int cap_c_size =
-			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
+	if (!bs) {
+		mtk_v4l2_err("Free bitstream buffer fail.");
+		return;
+	}
+	out_buf = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	vb = &out_buf->m2m_buf.vb;
+
+	mtk_v4l2_debug(2,
+		"Free bitsteam buffer id = %d to done_list",
+		vb->vb2_buf.index);
+
+	v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+	if (error) {
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
+		if (error == -EIO)
+			out_buf->error = true;
+	} else {
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+	}
+}
 
-		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
+static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx,
+					   struct vdec_fb *fb, int error)
+{
+	struct mtk_video_dec_buf *vdec_frame_buf;
+	struct vb2_v4l2_buffer *vb;
+	unsigned int cap_y_size, cap_c_size;
+
+	if (!fb) {
+		mtk_v4l2_err("Free frame buffer fail.");
+		return;
 	}
+	vdec_frame_buf = container_of(fb, struct mtk_video_dec_buf,
+				      frame_buffer);
+	vb = &vdec_frame_buf->m2m_buf.vb;
+
+	cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
+	cap_c_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
+
+	v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+
+	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
+
+	mtk_v4l2_debug(2,
+		"Free frame buffer id = %d to done_list",
+		vb->vb2_buf.index);
+	if (error)
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
+	else
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
 }
 
-static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
-					   struct vb2_v4l2_buffer *vb2_v4l2)
+static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx)
 {
-	struct mtk_video_dec_buf *framebuf =
-		container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
-	struct vdec_fb *pfb = &framebuf->frame_buffer;
-	struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
+	struct mtk_video_dec_buf *framebuf;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vb2_buffer *dst_buf;
+	struct vdec_fb *pfb;
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	if (!vb2_v4l2) {
+		mtk_v4l2_debug(1, "[%d] dst_buf empty!!", ctx->id);
+		return NULL;
+	}
+
+	dst_buf = &vb2_v4l2->vb2_buf;
+	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
 
 	pfb = &framebuf->frame_buffer;
-	pfb->base_y.va = NULL;
+	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
 	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
 
 	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
-		pfb->base_c.va = NULL;
+		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
 		pfb->base_c.dma_addr =
 			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
 		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
@@ -163,12 +214,11 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct mtk_vcodec_ctx *ctx =
 		container_of(work, struct mtk_vcodec_ctx, decode_work);
 	struct mtk_vcodec_dev *dev = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
+	struct vb2_v4l2_buffer *vb2_v4l2_src;
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
 	struct media_request *src_buf_req;
-	struct vdec_fb *dst_buf;
 	bool res_chg = false;
 	int ret;
 
@@ -179,13 +229,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		return;
 	}
 
-	vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
-	if (!vb2_v4l2_dst) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
-		return;
-	}
-
 	vb2_src = &vb2_v4l2_src->vb2_buf;
 	dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
@@ -194,9 +237,15 @@ static void mtk_vdec_worker(struct work_struct *work)
 	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p", ctx->id,
 		       vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
 
-	bs_src->va = NULL;
+	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
+	if (!bs_src->va) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_err("[%d] id=%d source buffer is NULL", ctx->id,
+			vb2_src->index);
+		return;
+	}
 
 	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 		       ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
@@ -207,9 +256,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	else
 		mtk_v4l2_err("vb2 buffer media request is NULL");
 
-	dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
-	v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
-	ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
+	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
 	if (ret) {
 		mtk_v4l2_err(" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
 			     ctx->id, vb2_src->index, bs_src->size,
@@ -221,12 +268,9 @@ static void mtk_vdec_worker(struct work_struct *work)
 		}
 	}
 
-	mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
-
-	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
-					 ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
-
+	mtk_vdec_stateless_out_to_done(ctx, bs_src, ret);
 	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
@@ -359,6 +403,8 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = false,
 	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
 };
@@ -377,6 +423,8 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
 	.uses_stateless_api = true,
 	.worker = mtk_vdec_worker,
 	.flush_decoder = mtk_vdec_flush_decoder,
+	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
+	.get_cap_buffer = vdec_get_cap_buffer,
 	.is_subdev_supported = true,
 	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
 };
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 1938b94eb147..b9c6649da1b1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -362,7 +362,8 @@ enum mtk_vdec_hw_arch {
  * @ctrls_setup: init vcodec dec ctrls
  * @worker: worker to start a decode job
  * @flush_decoder: function that flushes the decoder
- *
+ * @get_cap_buffer: get capture buffer from capture queue
+ * @cap_to_disp: put capture buffer to disp list
  * @vdec_vb2_ops: struct vb2_ops
  *
  * @vdec_formats: supported video decoder formats
@@ -384,6 +385,8 @@ struct mtk_vcodec_dec_pdata {
 	int (*ctrls_setup)(struct mtk_vcodec_ctx *ctx);
 	void (*worker)(struct work_struct *work);
 	int (*flush_decoder)(struct mtk_vcodec_ctx *ctx);
+	struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_ctx *ctx);
+	void (*cap_to_disp)(struct mtk_vcodec_ctx *ctx, struct vdec_fb *fb, int error);
 
 	struct vb2_ops *vdec_vb2_ops;
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
index d402fc4bda69..870676c2065e 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -670,32 +670,42 @@ static void vdec_h264_slice_deinit(void *h_vdec)
 }
 
 static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
-				  struct vdec_fb *fb, bool *res_chg)
+				  struct vdec_fb *unused, bool *res_chg)
 {
 	struct vdec_h264_slice_inst *inst = h_vdec;
 	const struct v4l2_ctrl_h264_decode_params *dec_params =
 		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
 	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct mtk_video_dec_buf *dst_buf_info;
+	struct vdec_fb *fb;
 	u32 data[2];
 	u64 y_fb_dma;
 	u64 c_fb_dma;
 	int err;
 
+	inst->num_nalu++;
 	/* bs NULL means flush decoder */
 	if (!bs)
 		return vpu_dec_reset(vpu);
 
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
 	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
 
 	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
-			 ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
+			 inst->num_nalu, y_fb_dma, c_fb_dma, fb);
 
 	inst->vsi_ctx.dec.bs_dma = (uint64_t)bs->dma_addr;
 	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
 	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
 	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
 
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+		&dst_buf_info->m2m_buf.vb, true);
 	get_vdec_decode_parameters(inst);
 	data[0] = bs->size;
 	/*
@@ -734,6 +744,8 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
 	mtk_vcodec_debug(inst, "\n - NALU[%d]", inst->num_nalu);
+
+	inst->ctx->dev->vdec_pdata->cap_to_disp(inst->ctx, fb, 0);
 	return 0;
 
 err_free_fb_out:
-- 
2.25.1

