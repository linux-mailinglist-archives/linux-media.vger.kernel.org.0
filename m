Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27F02BEE0
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbfE1F56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:57:58 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36469 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfE1F5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:40 -0400
Received: by mail-pg1-f196.google.com with SMTP id a3so10289849pgb.3
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WOsrjmVUf4+L1q1i+4I2nidvjTij0dlrzJ90Q4f+mM4=;
        b=LTPZtF4d/M0LBQQMHzwtiucA3YoN/fAemPD1UUlt9QUweD3uakAupNYkdmdVJopDvq
         19yHonsnO7pMWDudF7KIELCiSkwbNX/Y193s7UBT4xUNXSHVbT2Gxuxk9rdAlNW4oez4
         BcCGlWhecHHRAW1hci7vtd2nUWYxkyBquw6h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WOsrjmVUf4+L1q1i+4I2nidvjTij0dlrzJ90Q4f+mM4=;
        b=naweA74UfsPLoSrfu4FYCBhvnVs3KZDHYGNMeteoirdiasvplg7DBBzbB4UCIqO6Mw
         BavISCIqO1lwMBqSwSSHta5CQZbbLVkaueRaw3vTy1jjW7Ht2a/M9oRNX8h1CSpG8jXG
         7KIVLvKXjrOu+y0TUiGZXI/n5LxnudTmO6oDMc1fTuIGaE3vg2YJkPfO0+Emb5Wf8CL3
         2EZ+ePaC8PcNxRpDaru3RTcgSyq1aabW2DMpG4gejtmsgRnYm+XwPX0EUEx4pka90fR+
         CT08evf7a+GTk9uYm9bozj/OLuJCa2mzhs4cfzJ+LTU0Rco+3o84E0nqsdHZbo4Rg7ql
         RScw==
X-Gm-Message-State: APjAAAUOb4333RHIE44VlsUiRfPxL47dz9MH+aMQvV8mBrQmBxX0Mz/y
        aWKGZCRhxJphITYRMXjKDUJWzQ==
X-Google-Smtp-Source: APXvYqzqanKf+wl430pGypiHIgHWfQ42gvwTNo+zdPJpNfZoETAkGOSsbtXgg2sYWiCPrVKr1qPoTg==
X-Received: by 2002:a63:b706:: with SMTP id t6mr125275063pgf.305.1559023059108;
        Mon, 27 May 2019 22:57:39 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:38 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 10/12] media: mtk-vcodec: vdec: support stateless H.264 decoding
Date:   Tue, 28 May 2019 14:56:33 +0900
Message-Id: <20190528055635.12109-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Add the firmware interface allowing to decode H.264 in a stateless
manner.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]
---
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 533 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   4 +
 2 files changed, 537 insertions(+)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
new file mode 100644
index 000000000000..27874afac86b
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -0,0 +1,533 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "../vdec_drv_if.h"
+#include "../mtk_vcodec_util.h"
+#include "../mtk_vcodec_dec.h"
+#include "../mtk_vcodec_intr.h"
+#include "../vdec_vpu_if.h"
+#include "../vdec_drv_base.h"
+
+#define NAL_NON_IDR_SLICE			0x01
+#define NAL_IDR_SLICE				0x05
+#define NAL_H264_PPS				0x08
+#define NAL_TYPE(value)				((value) & 0x1F)
+
+#define BUF_PREDICTION_SZ			(64 * 4096)
+
+#define MB_UNIT_LEN				16
+
+/* motion vector size (bytes) for every macro block */
+#define HW_MB_STORE_SZ				64
+
+#define H264_MAX_FB_NUM				17
+#define H264_MAX_MV_NUM				32
+#define HDR_PARSING_BUF_SZ			1024
+
+/**
+ * struct mtk_h264_dpb_info  - h264 dpb information
+ * @y_dma_addr: Y bitstream physical address
+ * @c_dma_addr: CbCr bitstream physical address
+ * @reference_flag: reference picture flag (short/long term reference picture)
+ * @field: field picture flag
+ */
+struct mtk_h264_dpb_info {
+	dma_addr_t y_dma_addr;
+	dma_addr_t c_dma_addr;
+	int reference_flag;
+	int field;
+};
+
+/**
+ * struct mtk_h264_dec_slice_param  - parameters for decode current frame
+ */
+struct mtk_h264_dec_slice_param {
+	struct v4l2_ctrl_h264_sps			sps;
+	struct v4l2_ctrl_h264_pps			pps;
+	struct v4l2_ctrl_h264_scaling_matrix			scaling_matrix;
+	struct v4l2_ctrl_h264_slice_param		slice_param;
+	struct v4l2_ctrl_h264_decode_param	decode_param;
+	struct mtk_h264_dpb_info h264_dpb_info[16];
+};
+
+/**
+ * struct h264_fb - h264 decode frame buffer information
+ * @vdec_fb_va  : virtual address of struct vdec_fb
+ * @y_fb_dma    : dma address of Y frame buffer (luma)
+ * @c_fb_dma    : dma address of C frame buffer (chroma)
+ * @poc         : picture order count of frame buffer
+ * @reserved    : for 8 bytes alignment
+ */
+struct h264_fb {
+	uint64_t vdec_fb_va;
+	uint64_t y_fb_dma;
+	uint64_t c_fb_dma;
+	int32_t poc;
+	uint32_t reserved;
+};
+
+/**
+ * struct vdec_h264_dec_info - decode information
+ * @dpb_sz		: decoding picture buffer size
+ * @resolution_changed  : resoltion change happen
+ * @realloc_mv_buf	: flag to notify driver to re-allocate mv buffer
+ * @cap_num_planes	: number planes of capture buffer
+ * @bs_dma		: Input bit-stream buffer dma address
+ * @y_fb_dma		: Y frame buffer dma address
+ * @c_fb_dma		: C frame buffer dma address
+ * @vdec_fb_va		: VDEC frame buffer struct virtual address
+ */
+struct vdec_h264_dec_info {
+	uint32_t dpb_sz;
+	uint32_t resolution_changed;
+	uint32_t realloc_mv_buf;
+	uint32_t cap_num_planes;
+	uint64_t bs_dma;
+	uint64_t y_fb_dma;
+	uint64_t c_fb_dma;
+	uint64_t vdec_fb_va;
+};
+
+/**
+ * struct vdec_h264_vsi - shared memory for decode information exchange
+ *                        between VPU and Host.
+ *                        The memory is allocated by VPU then mapping to Host
+ *                        in vpu_dec_init() and freed in vpu_dec_deinit()
+ *                        by VPU.
+ *                        AP-W/R : AP is writer/reader on this item
+ *                        VPU-W/R: VPU is write/reader on this item
+ * @pred_buf_dma : HW working predication buffer dma address (AP-W, VPU-R)
+ * @mv_buf_dma   : HW working motion vector buffer dma address (AP-W, VPU-R)
+ * @dec          : decode information (AP-R, VPU-W)
+ * @pic          : picture information (AP-R, VPU-W)
+ * @crop         : crop information (AP-R, VPU-W)
+ */
+struct vdec_h264_vsi {
+	uint64_t pred_buf_dma;
+	uint64_t mv_buf_dma[H264_MAX_MV_NUM];
+	struct vdec_h264_dec_info dec;
+	struct vdec_pic_info pic;
+	struct v4l2_rect crop;
+	struct mtk_h264_dec_slice_param h264_slice_param;
+};
+
+/**
+ * struct vdec_h264_slice_inst - h264 decoder instance
+ * @num_nalu : how many nalus be decoded
+ * @ctx      : point to mtk_vcodec_ctx
+ * @pred_buf : HW working predication buffer
+ * @mv_buf   : HW working motion vector buffer
+ * @vpu      : VPU instance
+ * @vsi      : VPU shared information
+ */
+struct vdec_h264_slice_inst {
+	unsigned int num_nalu;
+	struct mtk_vcodec_ctx *ctx;
+	struct mtk_vcodec_mem pred_buf;
+	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
+	struct vdec_vpu_inst vpu;
+	struct vdec_h264_vsi *vsi;
+	struct mtk_h264_dec_slice_param h264_slice_param;
+};
+
+static void *get_ctrl_ptr(struct mtk_vcodec_ctx *ctx,
+				 int id)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, id);
+
+	return ctrl->p_cur.p;
+}
+
+static void get_h264_dpb_list(struct vdec_h264_slice_inst *inst)
+{
+	struct v4l2_ctrl_h264_decode_param *decode_param =
+		&inst->h264_slice_param.decode_param;
+	struct mtk_h264_dec_slice_param *slice_param = &inst->h264_slice_param;
+	const struct v4l2_h264_dpb_entry *dpb;
+	struct vb2_queue *vq;
+	struct vb2_buffer *vb;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	u32 index;
+
+	vq = v4l2_m2m_get_vq(inst->ctx->m2m_ctx,
+		V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	for (index = 0; index < 16; index++) {
+		int vb2_index;
+
+		dpb = &decode_param->dpb[index];
+		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) {
+			slice_param->h264_dpb_info[index].reference_flag = 0;
+			continue;
+		}
+
+		vb2_index = vb2_find_timestamp(vq, dpb->buf_index, 0);
+		if (vb2_index < 0) {
+			mtk_vcodec_err(inst, "Reference invalid: dpb_index(%d) buf_index(%d)",
+				index, dpb->buf_index);
+			continue;
+		}
+		/* 1 for short term reference, 2 for long term reference */
+		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			slice_param->h264_dpb_info[index].reference_flag = 1;
+		else
+			slice_param->h264_dpb_info[index].reference_flag = 2;
+
+		vb = vq->bufs[vb2_index];
+		vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
+		slice_param->h264_dpb_info[index].field = vb2_v4l2->field;
+
+		slice_param->h264_dpb_info[index].y_dma_addr =
+			vb2_dma_contig_plane_dma_addr(vb, 0);
+		if (inst->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
+			slice_param->h264_dpb_info[index].c_dma_addr =
+				vb2_dma_contig_plane_dma_addr(vb, 1);
+		}
+	}
+}
+
+static void get_vdec_decode_parameters(struct vdec_h264_slice_inst *inst)
+{
+	struct mtk_h264_dec_slice_param *slice_param = &inst->h264_slice_param;
+
+	memcpy(&slice_param->sps,
+		get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_SPS),
+		sizeof(struct v4l2_ctrl_h264_sps));
+	memcpy(&slice_param->pps,
+		get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_PPS),
+		sizeof(struct v4l2_ctrl_h264_pps));
+	memcpy(&slice_param->scaling_matrix,
+	       get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX),
+		sizeof(struct v4l2_ctrl_h264_scaling_matrix));
+	memcpy(&slice_param->slice_param,
+		get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAM),
+		sizeof(struct v4l2_ctrl_h264_slice_param));
+	memcpy(&slice_param->decode_param,
+		get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAM),
+		sizeof(struct v4l2_ctrl_h264_decode_param));
+
+	get_h264_dpb_list(inst);
+	memcpy(&inst->vsi->h264_slice_param, slice_param,
+		sizeof(struct mtk_h264_dec_slice_param));
+}
+
+static unsigned int get_mv_buf_size(unsigned int width, unsigned int height)
+{
+	int unit_size = (width / MB_UNIT_LEN) * (height / MB_UNIT_LEN) + 8;
+
+	return HW_MB_STORE_SZ * unit_size;
+}
+
+static int allocate_predication_buf(struct vdec_h264_slice_inst *inst)
+{
+	int err = 0;
+
+	inst->pred_buf.size = BUF_PREDICTION_SZ;
+	err = mtk_vcodec_mem_alloc(inst->ctx, &inst->pred_buf);
+	if (err) {
+		mtk_vcodec_err(inst, "failed to allocate ppl buf");
+		return err;
+	}
+
+	inst->vsi->pred_buf_dma = inst->pred_buf.dma_addr;
+	return 0;
+}
+
+static void free_predication_buf(struct vdec_h264_slice_inst *inst)
+{
+	struct mtk_vcodec_mem *mem = NULL;
+
+	mtk_vcodec_debug_enter(inst);
+
+	inst->vsi->pred_buf_dma = 0;
+	mem = &inst->pred_buf;
+	if (mem->va)
+		mtk_vcodec_mem_free(inst->ctx, mem);
+}
+
+static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
+	struct vdec_pic_info *pic)
+{
+	int i;
+	int err;
+	struct mtk_vcodec_mem *mem = NULL;
+	unsigned int buf_sz = get_mv_buf_size(pic->buf_w, pic->buf_h);
+
+	mtk_v4l2_debug(3, "size = 0x%lx", buf_sz);
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		if (mem->va)
+			mtk_vcodec_mem_free(inst->ctx, mem);
+		mem->size = buf_sz;
+		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
+		if (err) {
+			mtk_vcodec_err(inst, "failed to allocate mv buf");
+			return err;
+		}
+		inst->vsi->mv_buf_dma[i] = mem->dma_addr;
+	}
+
+	return 0;
+}
+
+static void free_mv_buf(struct vdec_h264_slice_inst *inst)
+{
+	int i;
+	struct mtk_vcodec_mem *mem = NULL;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		inst->vsi->mv_buf_dma[i] = 0;
+		mem = &inst->mv_buf[i];
+		if (mem->va)
+			mtk_vcodec_mem_free(inst->ctx, mem);
+	}
+}
+
+static void get_pic_info(struct vdec_h264_slice_inst *inst,
+			 struct vdec_pic_info *pic)
+{
+	struct mtk_vcodec_ctx *ctx = inst->ctx;
+
+	ctx->picinfo.buf_w = (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
+	ctx->picinfo.buf_h = (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
+	ctx->picinfo.fb_sz[0] = ctx->picinfo.buf_w * ctx->picinfo.buf_h;
+	ctx->picinfo.fb_sz[1] = ctx->picinfo.fb_sz[0] >> 1;
+	inst->vsi->dec.cap_num_planes =
+		ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
+
+	pic = &ctx->picinfo;
+	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
+			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vcodec_debug(inst, "Y(%d, %d), C(%d, %d)", ctx->picinfo.y_bs_sz,
+			 ctx->picinfo.y_len_sz, ctx->picinfo.c_bs_sz,
+			 ctx->picinfo.c_len_sz);
+
+	if ((ctx->last_decoded_picinfo.pic_w != ctx->picinfo.pic_w) ||
+		(ctx->last_decoded_picinfo.pic_h != ctx->picinfo.pic_h)) {
+
+		inst->vsi->dec.resolution_changed = true;
+		if ((ctx->last_decoded_picinfo.buf_w != ctx->picinfo.buf_w) ||
+			(ctx->last_decoded_picinfo.buf_h != ctx->picinfo.buf_h))
+			inst->vsi->dec.realloc_mv_buf = true;
+
+		mtk_v4l2_debug(1, "ResChg: (%d %d) : old(%d, %d) -> new(%d, %d)",
+			inst->vsi->dec.resolution_changed,
+			inst->vsi->dec.realloc_mv_buf,
+			ctx->last_decoded_picinfo.pic_w,
+			ctx->last_decoded_picinfo.pic_h,
+			ctx->picinfo.pic_w, ctx->picinfo.pic_h);
+	}
+}
+
+static void get_crop_info(struct vdec_h264_slice_inst *inst,
+	struct v4l2_rect *cr)
+{
+	cr->left = inst->vsi->crop.left;
+	cr->top = inst->vsi->crop.top;
+	cr->width = inst->vsi->crop.width;
+	cr->height = inst->vsi->crop.height;
+
+	mtk_vcodec_debug(inst, "l=%d, t=%d, w=%d, h=%d",
+			 cr->left, cr->top, cr->width, cr->height);
+}
+
+static void get_dpb_size(struct vdec_h264_slice_inst *inst,
+	unsigned int *dpb_sz)
+{
+	*dpb_sz = inst->vsi->dec.dpb_sz;
+	mtk_vcodec_debug(inst, "sz=%d", *dpb_sz);
+}
+
+static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
+{
+	struct vdec_h264_slice_inst *inst = NULL;
+	int err;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->ctx = ctx;
+
+	inst->vpu.id = SCP_IPI_VDEC_H264;
+	inst->vpu.ctx = ctx;
+	inst->vpu.handler = vpu_dec_ipi_handler;
+
+	err = vpu_dec_init(&inst->vpu);
+	if (err) {
+		mtk_vcodec_err(inst, "vdec_h264 init err=%d", err);
+		goto error_free_inst;
+	}
+
+	inst->vsi = (struct vdec_h264_vsi *)inst->vpu.vsi;
+	err = allocate_predication_buf(inst);
+	if (err)
+		goto error_deinit;
+
+	mtk_v4l2_debug(0, "struct size = %d,%d,%d,%d,%d,%d\n",
+		sizeof(struct v4l2_ctrl_h264_sps),
+		sizeof(struct v4l2_ctrl_h264_pps),
+		sizeof(struct v4l2_ctrl_h264_scaling_matrix),
+		sizeof(struct v4l2_ctrl_h264_slice_param),
+		sizeof(struct v4l2_ctrl_h264_decode_param),
+		sizeof(struct mtk_h264_dpb_info));
+
+	mtk_vcodec_debug(inst, "H264 Instance >> %p", inst);
+
+	ctx->drv_handle = inst;
+	return 0;
+
+error_deinit:
+	vpu_dec_deinit(&inst->vpu);
+
+error_free_inst:
+	kfree(inst);
+	return err;
+}
+
+static void vdec_h264_slice_deinit(void *h_vdec)
+{
+	struct vdec_h264_slice_inst *inst =
+		(struct vdec_h264_slice_inst *)h_vdec;
+
+	mtk_vcodec_debug_enter(inst);
+
+	vpu_dec_deinit(&inst->vpu);
+	free_predication_buf(inst);
+	free_mv_buf(inst);
+
+	kfree(inst);
+}
+
+static int find_start_code(unsigned char *data, unsigned int data_sz)
+{
+	if (data_sz > 3 && data[0] == 0 && data[1] == 0 && data[2] == 1)
+		return 3;
+
+	if (data_sz > 4 && data[0] == 0 && data[1] == 0 && data[2] == 0 &&
+	    data[3] == 1)
+		return 4;
+
+	return -1;
+}
+
+static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				  struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst =
+		(struct vdec_h264_slice_inst *)h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct mtk_video_dec_buf *dst_buf_info;
+	int nal_start_idx = 0, err = 0;
+	unsigned int nal_type, data[2];
+	unsigned char *buf;
+	uint64_t vdec_fb_va;
+	uint64_t y_fb_dma;
+	uint64_t c_fb_dma;
+
+	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
+			 ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
+
+	/* bs NULL means flush decoder */
+	if (bs == NULL)
+		return vpu_dec_reset(vpu);
+
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
+	vdec_fb_va = (u64)(uintptr_t)fb;
+	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+
+	buf = (unsigned char *)bs->va;
+	nal_start_idx = find_start_code(buf, bs->size);
+	if (nal_start_idx < 0)
+		goto err_free_fb_out;
+
+	data[0] = bs->size;
+	data[1] = buf[nal_start_idx];
+	nal_type = NAL_TYPE(buf[nal_start_idx]);
+	mtk_vcodec_debug(inst, "\n + NALU[%d] type %d +\n", inst->num_nalu,
+			 nal_type);
+
+	inst->vsi->dec.bs_dma = (uint64_t)bs->dma_addr;
+	inst->vsi->dec.y_fb_dma = y_fb_dma;
+	inst->vsi->dec.c_fb_dma = c_fb_dma;
+	inst->vsi->dec.vdec_fb_va = vdec_fb_va;
+
+	get_vdec_decode_parameters(inst);
+	*res_chg = inst->vsi->dec.resolution_changed;
+	if (*res_chg) {
+		mtk_vcodec_debug(inst, "- resolution changed -");
+		if (inst->vsi->dec.realloc_mv_buf) {
+			err = alloc_mv_buf(inst, &(inst->ctx->picinfo));
+			inst->vsi->dec.realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		*res_chg = false;
+	}
+
+	err = vpu_dec_start(vpu, data, 2);
+	if (err)
+		goto err_free_fb_out;
+
+	if (nal_type == NAL_NON_IDR_SLICE || nal_type == NAL_IDR_SLICE) {
+		/* wait decoder done interrupt */
+		err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
+						   MTK_INST_IRQ_RECEIVED,
+						   WAIT_INTR_TIMEOUT_MS);
+		if (err)
+			goto err_free_fb_out;
+
+		vpu_dec_end(vpu);
+	}
+
+	mtk_vcodec_debug(inst, "\n - NALU[%d] type=%d -\n", inst->num_nalu,
+			 nal_type);
+	return 0;
+
+err_free_fb_out:
+	mtk_vcodec_err(inst, "\n - NALU[%d] err=%d -\n", inst->num_nalu, err);
+	return err;
+}
+
+static int vdec_h264_slice_get_param(void *h_vdec,
+			       enum vdec_get_param_type type, void *out)
+{
+	struct vdec_h264_slice_inst *inst =
+		(struct vdec_h264_slice_inst *)h_vdec;
+
+	switch (type) {
+	case GET_PARAM_PIC_INFO:
+		get_pic_info(inst, out);
+		break;
+
+	case GET_PARAM_DPB_SIZE:
+		get_dpb_size(inst, out);
+		break;
+
+	case GET_PARAM_CROP_INFO:
+		get_crop_info(inst, out);
+		break;
+
+	default:
+		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+const struct vdec_common_if vdec_h264_slice_if = {
+	.init		= vdec_h264_slice_init,
+	.decode		= vdec_h264_slice_decode,
+	.get_param	= vdec_h264_slice_get_param,
+	.deinit		= vdec_h264_slice_deinit,
+};
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 7e3c536909a2..26c05be783e5 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -25,12 +25,16 @@
 extern const struct vdec_common_if vdec_h264_if;
 extern const struct vdec_common_if vdec_vp8_if;
 extern const struct vdec_common_if vdec_vp9_if;
+extern const struct vdec_common_if vdec_h264_slice_if;
 
 int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 {
 	int ret = 0;
 
 	switch (fourcc) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		ctx->dec_if = &vdec_h264_slice_if;
+		break;
 	case V4L2_PIX_FMT_H264:
 		ctx->dec_if = &vdec_h264_if;
 		break;
-- 
2.22.0.rc1.257.g3120a18244-goog

