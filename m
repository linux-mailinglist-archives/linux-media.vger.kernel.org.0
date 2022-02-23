Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9EC4C0AA0
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 04:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238094AbiBWDlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 22:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237953AbiBWDlH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 22:41:07 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5925BD30;
        Tue, 22 Feb 2022 19:40:38 -0800 (PST)
X-UUID: 5aeab751a50745b3b747e61f33b3a7de-20220223
X-UUID: 5aeab751a50745b3b747e61f33b3a7de-20220223
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 400207852; Wed, 23 Feb 2022 11:40:34 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Feb 2022 11:40:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Feb
 2022 11:40:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 11:40:30 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7, 13/15] media: mtk-vcodec: support stateless H.264 decoding for mt8192
Date:   Wed, 23 Feb 2022 11:40:06 +0800
Message-ID: <20220223034008.15781-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223034008.15781-1-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds h264 lat and core architecture driver for mt8192,
and the decode mode is frame based for stateless decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../mtk-vcodec/vdec/vdec_h264_req_multi_if.c  | 621 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   8 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 include/linux/remoteproc/mtk_scp.h            |   2 +
 5 files changed, 632 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 3f41d748eee5..22edb1c86598 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -10,6 +10,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp9_if.o \
 		vdec/vdec_h264_req_if.o \
 		vdec/vdec_h264_req_common.o \
+		vdec/vdec_h264_req_multi_if.o \
 		mtk_vcodec_dec_drv.o \
 		vdec_drv_if.o \
 		vdec_vpu_if.o \
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
new file mode 100644
index 000000000000..82a279f327c4
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
@@ -0,0 +1,621 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <media/v4l2-h264.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "../mtk_vcodec_util.h"
+#include "../mtk_vcodec_dec.h"
+#include "../mtk_vcodec_intr.h"
+#include "../vdec_drv_base.h"
+#include "../vdec_drv_if.h"
+#include "../vdec_vpu_if.h"
+#include "vdec_h264_req_common.h"
+
+/**
+ * enum vdec_h264_core_dec_err_type  - core decode error type
+ * @TRANS_BUFFER_FULL : trans buffer is full
+ * @SLICE_HEADER_FULL : slice header buffer is full
+ */
+enum vdec_h264_core_dec_err_type {
+	TRANS_BUFFER_FULL = 1,
+	SLICE_HEADER_FULL,
+};
+
+/**
+ * struct vdec_h264_slice_lat_dec_param  - parameters for decode current frame
+ * @sps : h264 sps syntax parameters
+ * @pps : h264 pps syntax parameters
+ * @slice_header: h264 slice header syntax parameters
+ * @scaling_matrix : h264 scaling list parameters
+ * @decode_params : decoder parameters of each frame used for hardware decode
+ * @h264_dpb_info : dpb reference list
+ */
+struct vdec_h264_slice_lat_dec_param {
+	struct mtk_h264_sps_param sps;
+	struct mtk_h264_pps_param pps;
+	struct mtk_h264_slice_hd_param slice_header;
+	struct slice_api_h264_scaling_matrix scaling_matrix;
+	struct slice_api_h264_decode_param decode_params;
+	struct mtk_h264_dpb_info h264_dpb_info[V4L2_H264_NUM_DPB_ENTRIES];
+};
+
+/**
+ * struct vdec_h264_slice_info - decode information
+ * @nal_info    : nal info of current picture
+ * @timeout     : Decode timeout: 1 timeout, 0 no timeount
+ * @bs_buf_size : bitstream size
+ * @bs_buf_addr : bitstream buffer dma address
+ * @y_fb_dma    : Y frame buffer dma address
+ * @c_fb_dma    : C frame buffer dma address
+ * @vdec_fb_va  : VDEC frame buffer struct virtual address
+ * @crc         : Used to check whether hardware's status is right
+ */
+struct vdec_h264_slice_info {
+	u16 nal_info;
+	u16 timeout;
+	u32 bs_buf_size;
+	u64 bs_buf_addr;
+	u64 y_fb_dma;
+	u64 c_fb_dma;
+	u64 vdec_fb_va;
+	u32 crc[8];
+};
+
+/**
+ * struct vdec_h264_slice_vsi - shared memory for decode information exchange
+ *        between VPU and Host. The memory is allocated by VPU then mapping to
+ *        Host in vdec_h264_slice_init() and freed in vdec_h264_slice_deinit()
+ *        by VPU. AP-W/R : AP is writer/reader on this item. VPU-W/R: VPU is
+ *        write/reader on this item.
+ * @wdma_err_addr       : wdma error dma address
+ * @wdma_start_addr     : wdma start dma address
+ * @wdma_end_addr       : wdma end dma address
+ * @slice_bc_start_addr : slice bc start dma address
+ * @slice_bc_end_addr   : slice bc end dma address
+ * @row_info_start_addr : row info start dma address
+ * @row_info_end_addr   : row info end dma address
+ * @trans_start         : trans start dma address
+ * @trans_end           : trans end dma address
+ * @wdma_end_addr_offset: wdma end address offset
+ *
+ * @mv_buf_dma          : HW working motion vector buffer
+ *                        dma address (AP-W, VPU-R)
+ * @dec                 : decode information (AP-R, VPU-W)
+ * @h264_slice_params   : decode parameters for hw used
+ */
+struct vdec_h264_slice_vsi {
+	/* LAT dec addr */
+	u64 wdma_err_addr;
+	u64 wdma_start_addr;
+	u64 wdma_end_addr;
+	u64 slice_bc_start_addr;
+	u64 slice_bc_end_addr;
+	u64 row_info_start_addr;
+	u64 row_info_end_addr;
+	u64 trans_start;
+	u64 trans_end;
+	u64 wdma_end_addr_offset;
+
+	u64 mv_buf_dma[H264_MAX_MV_NUM];
+	struct vdec_h264_slice_info dec;
+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
+};
+
+/**
+ * struct vdec_h264_slice_share_info - shared information used to exchange
+ *                                     message between lat and core
+ * @sps	              : sequence header information from user space
+ * @dec_params        : decoder params from user space
+ * @h264_slice_params : decoder params used for hardware
+ * @trans_start       : trans start dma address
+ * @trans_end         : trans end dma address
+ * @nal_info          : nal info of current picture
+ */
+struct vdec_h264_slice_share_info {
+	struct v4l2_ctrl_h264_sps sps;
+	struct v4l2_ctrl_h264_decode_params dec_params;
+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
+	u64 trans_start;
+	u64 trans_end;
+	u16 nal_info;
+};
+
+/**
+ * struct vdec_h264_slice_inst - h264 decoder instance
+ * @slice_dec_num        : how many picture be decoded
+ * @ctx                 : point to mtk_vcodec_ctx
+ * @pred_buf            : HW working predication buffer
+ * @mv_buf              : HW working motion vector buffer
+ * @vpu                 : VPU instance
+ * @vsi                 : vsi used for lat
+ * @vsi_core            : vsi used for core
+ *
+ * @resolution_changed  : resolution changed
+ * @realloc_mv_buf      : reallocate mv buffer
+ * @cap_num_planes      : number of capture queue plane
+ *
+ * @dpb : decoded picture buffer used to store reference buffer information
+ */
+struct vdec_h264_slice_inst {
+	unsigned int slice_dec_num;
+	struct mtk_vcodec_ctx *ctx;
+	struct mtk_vcodec_mem pred_buf;
+	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
+	struct vdec_vpu_inst vpu;
+	struct vdec_h264_slice_vsi *vsi;
+	struct vdec_h264_slice_vsi *vsi_core;
+
+	unsigned int resolution_changed;
+	unsigned int realloc_mv_buf;
+	unsigned int cap_num_planes;
+
+	struct v4l2_h264_dpb_entry dpb[16];
+};
+
+static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *inst,
+						  struct vdec_h264_slice_share_info *share_info)
+{
+	struct vdec_h264_slice_lat_dec_param *slice_param = &inst->vsi->h264_slice_params;
+	const struct v4l2_ctrl_h264_decode_params *dec_params;
+	const struct v4l2_ctrl_h264_scaling_matrix *src_matrix;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+
+	dec_params =
+		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
+	if (IS_ERR(dec_params))
+		return PTR_ERR(dec_params);
+
+	src_matrix =
+		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SCALING_MATRIX);
+	if (IS_ERR(src_matrix))
+		return PTR_ERR(src_matrix);
+
+	sps = mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SPS);
+	if (IS_ERR(sps))
+		return PTR_ERR(sps);
+
+	pps = mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_PPS);
+	if (IS_ERR(pps))
+		return PTR_ERR(pps);
+
+	if (dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC) {
+		mtk_vcodec_err(inst, "h264 no support field bitstream.");
+		return -EINVAL;
+	}
+
+	mtk_vdec_h264_copy_sps_params(&slice_param->sps, sps);
+	mtk_vdec_h264_copy_pps_params(&slice_param->pps, pps);
+	mtk_vdec_h264_copy_scaling_matrix(&slice_param->scaling_matrix, src_matrix);
+
+	memcpy(&share_info->sps, sps, sizeof(*sps));
+	memcpy(&share_info->dec_params, dec_params, sizeof(*dec_params));
+
+	return 0;
+}
+
+static void vdec_h264_slice_fill_decode_reflist(struct vdec_h264_slice_inst *inst,
+						struct vdec_h264_slice_lat_dec_param *slice_param,
+						struct vdec_h264_slice_share_info *share_info)
+{
+	struct v4l2_ctrl_h264_decode_params *dec_params = &share_info->dec_params;
+	struct v4l2_ctrl_h264_sps *sps = &share_info->sps;
+	struct v4l2_h264_reflist_builder reflist_builder;
+	u8 *p0_reflist = slice_param->decode_params.ref_pic_list_p0;
+	u8 *b0_reflist = slice_param->decode_params.ref_pic_list_b0;
+	u8 *b1_reflist = slice_param->decode_params.ref_pic_list_b1;
+
+	mtk_vdec_h264_update_dpb(dec_params, inst->dpb);
+
+	mtk_vdec_h264_copy_decode_params(&slice_param->decode_params, dec_params,
+					 inst->dpb);
+	mtk_vdec_h264_fill_dpb_info(inst->ctx, &slice_param->decode_params,
+				    slice_param->h264_dpb_info);
+
+	mtk_v4l2_debug(3, "cur poc = %d\n", dec_params->bottom_field_order_cnt);
+	/* Build the reference lists */
+	v4l2_h264_init_reflist_builder(&reflist_builder, dec_params, sps,
+				       inst->dpb);
+	v4l2_h264_build_p_ref_list(&reflist_builder, p0_reflist);
+	v4l2_h264_build_b_ref_lists(&reflist_builder, b0_reflist, b1_reflist);
+
+	/* Adapt the built lists to the firmware's expectations */
+	mtk_vdec_h264_fixup_ref_list(p0_reflist, reflist_builder.num_valid);
+	mtk_vdec_h264_fixup_ref_list(b0_reflist, reflist_builder.num_valid);
+	mtk_vdec_h264_fixup_ref_list(b1_reflist, reflist_builder.num_valid);
+}
+
+static int vdec_h264_slice_alloc_mv_buf(struct vdec_h264_slice_inst *inst,
+					struct vdec_pic_info *pic)
+{
+	unsigned int buf_sz = mtk_vdec_h264_get_mv_buf_size(pic->buf_w, pic->buf_h);
+	struct mtk_vcodec_mem *mem;
+	int i, err;
+
+	mtk_v4l2_debug(3, "size = 0x%x", buf_sz);
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
+	}
+
+	return 0;
+}
+
+static void vdec_h264_slice_free_mv_buf(struct vdec_h264_slice_inst *inst)
+{
+	int i;
+	struct mtk_vcodec_mem *mem;
+
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		if (mem->va)
+			mtk_vcodec_mem_free(inst->ctx, mem);
+	}
+}
+
+static void vdec_h264_slice_get_pic_info(struct vdec_h264_slice_inst *inst)
+{
+	struct mtk_vcodec_ctx *ctx = inst->ctx;
+	unsigned int data[3];
+
+	data[0] = ctx->picinfo.pic_w;
+	data[1] = ctx->picinfo.pic_h;
+	data[2] = ctx->capture_fourcc;
+	vpu_dec_get_param(&inst->vpu, data, 3, GET_PARAM_PIC_INFO);
+
+	ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, 64);
+	ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, 64);
+	ctx->picinfo.fb_sz[0] = inst->vpu.fb_sz[0];
+	ctx->picinfo.fb_sz[1] = inst->vpu.fb_sz[1];
+	inst->cap_num_planes =
+		ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
+
+	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
+			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vcodec_debug(inst, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
+			 ctx->picinfo.fb_sz[1]);
+
+	if (ctx->last_decoded_picinfo.pic_w != ctx->picinfo.pic_w ||
+	    ctx->last_decoded_picinfo.pic_h != ctx->picinfo.pic_h) {
+		inst->resolution_changed = true;
+		if (ctx->last_decoded_picinfo.buf_w != ctx->picinfo.buf_w ||
+		    ctx->last_decoded_picinfo.buf_h != ctx->picinfo.buf_h)
+			inst->realloc_mv_buf = true;
+
+		mtk_v4l2_debug(1, "resChg: (%d %d) : old(%d, %d) -> new(%d, %d)",
+			       inst->resolution_changed,
+			       inst->realloc_mv_buf,
+			       ctx->last_decoded_picinfo.pic_w,
+			       ctx->last_decoded_picinfo.pic_h,
+			       ctx->picinfo.pic_w, ctx->picinfo.pic_h);
+	}
+}
+
+static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
+					  struct v4l2_rect *cr)
+{
+	cr->left = 0;
+	cr->top = 0;
+	cr->width = inst->ctx->picinfo.pic_w;
+	cr->height = inst->ctx->picinfo.pic_h;
+
+	mtk_vcodec_debug(inst, "l=%d, t=%d, w=%d, h=%d",
+			 cr->left, cr->top, cr->width, cr->height);
+}
+
+static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
+{
+	struct vdec_h264_slice_inst *inst;
+	int err, vsi_size;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->ctx = ctx;
+
+	inst->vpu.id = SCP_IPI_VDEC_LAT;
+	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
+	inst->vpu.ctx = ctx;
+	inst->vpu.codec_type = ctx->current_codec;
+	inst->vpu.capture_type = ctx->capture_fourcc;
+
+	err = vpu_dec_init(&inst->vpu);
+	if (err) {
+		mtk_vcodec_err(inst, "vdec_h264 init err=%d", err);
+		goto error_free_inst;
+	}
+
+	vsi_size = round_up(sizeof(struct vdec_h264_slice_vsi), 64);
+	inst->vsi = inst->vpu.vsi;
+	inst->vsi_core =
+		(struct vdec_h264_slice_vsi *)(((char *)inst->vpu.vsi) + vsi_size);
+	inst->resolution_changed = true;
+	inst->realloc_mv_buf = true;
+
+	mtk_vcodec_debug(inst, "lat struct size = %d,%d,%d,%d vsi: %d\n",
+			 (int)sizeof(struct mtk_h264_sps_param),
+			 (int)sizeof(struct mtk_h264_pps_param),
+			 (int)sizeof(struct vdec_h264_slice_lat_dec_param),
+			 (int)sizeof(struct mtk_h264_dpb_info),
+			 vsi_size);
+	mtk_vcodec_debug(inst, "lat H264 instance >> %p, codec_type = 0x%x",
+			 inst, inst->vpu.codec_type);
+
+	ctx->drv_handle = inst;
+	return 0;
+
+error_free_inst:
+	kfree(inst);
+	return err;
+}
+
+static void vdec_h264_slice_deinit(void *h_vdec)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+
+	mtk_vcodec_debug_enter(inst);
+
+	vpu_dec_deinit(&inst->vpu);
+	vdec_h264_slice_free_mv_buf(inst);
+	vdec_msg_queue_deinit(&inst->ctx->msg_queue, inst->ctx);
+
+	kfree(inst);
+}
+
+static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
+{
+	struct vdec_fb *fb;
+	u64 vdec_fb_va;
+	u64 y_fb_dma, c_fb_dma;
+	int err, timeout, i;
+	struct mtk_vcodec_ctx *ctx = lat_buf->ctx;
+	struct vdec_h264_slice_inst *inst = ctx->drv_handle;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vdec_h264_slice_share_info *share_info = lat_buf->private_data;
+	struct mtk_vcodec_mem *mem;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+
+	mtk_vcodec_debug(inst, "[h264-core] vdec_h264 core decode");
+	memcpy_toio(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
+		    sizeof(share_info->h264_slice_params));
+
+	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
+	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	vdec_fb_va = (unsigned long)fb;
+
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
+		c_fb_dma =
+			y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
+	else
+		c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+
+	mtk_vcodec_debug(inst, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma,
+			 c_fb_dma);
+
+	inst->vsi_core->dec.y_fb_dma = y_fb_dma;
+	inst->vsi_core->dec.c_fb_dma = c_fb_dma;
+	inst->vsi_core->dec.vdec_fb_va = vdec_fb_va;
+	inst->vsi_core->dec.nal_info = share_info->nal_info;
+	inst->vsi_core->wdma_start_addr =
+		lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi_core->wdma_end_addr =
+		lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
+		lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi_core->wdma_err_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi_core->slice_bc_start_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi_core->slice_bc_end_addr = lat_buf->slice_bc_addr.dma_addr +
+		lat_buf->slice_bc_addr.size;
+	inst->vsi_core->trans_start = share_info->trans_start;
+	inst->vsi_core->trans_end = share_info->trans_end;
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi_core->mv_buf_dma[i] = mem->dma_addr;
+	}
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	vb2_v4l2->vb2_buf.timestamp = lat_buf->ts_info.vb2_buf.timestamp;
+	vb2_v4l2->timecode = lat_buf->ts_info.timecode;
+	vb2_v4l2->field = lat_buf->ts_info.field;
+	vb2_v4l2->flags = lat_buf->ts_info.flags;
+	vb2_v4l2->vb2_buf.copied_timestamp =
+		lat_buf->ts_info.vb2_buf.copied_timestamp;
+
+	vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_slice_params,
+					    share_info);
+
+	err = vpu_dec_core(vpu);
+	if (err) {
+		mtk_vcodec_err(inst, "core decode err=%d", err);
+		goto vdec_dec_end;
+	}
+
+	/* wait decoder done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	if (timeout)
+		mtk_vcodec_err(inst, "core decode timeout: pic_%d",
+			       ctx->decoded_frame_cnt);
+	inst->vsi_core->dec.timeout = !!timeout;
+
+	vpu_dec_core_end(vpu);
+	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+			 ctx->decoded_frame_cnt,
+			 inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
+			 inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
+			 inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
+			 inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
+
+vdec_dec_end:
+	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue,
+				       share_info->trans_end);
+	ctx->dev->vdec_pdata->cap_to_disp(ctx, fb, !!err);
+	mtk_vcodec_debug(inst, "core decode done err=%d", err);
+	ctx->decoded_frame_cnt++;
+	return 0;
+}
+
+static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				  struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info;
+	int nal_start_idx, err, timeout = 0, i;
+	unsigned int data[2];
+	struct vdec_lat_buf *lat_buf;
+	struct vdec_h264_slice_share_info *share_info;
+	unsigned char *buf;
+	struct mtk_vcodec_mem *mem;
+
+	if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
+				vdec_h264_slice_core_decode,
+				sizeof(*share_info)))
+		return -ENOMEM;
+
+	/* bs NULL means flush decoder */
+	if (!bs) {
+		vdec_msg_queue_wait_lat_buf_full(&inst->ctx->msg_queue);
+		return vpu_dec_reset(vpu);
+	}
+
+	lat_buf = vdec_msg_queue_dqbuf(&inst->ctx->msg_queue.lat_ctx);
+	if (!lat_buf) {
+		mtk_vcodec_err(inst, "failed to get lat buffer");
+		return -EINVAL;
+	}
+	share_info = lat_buf->private_data;
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+
+	buf = (unsigned char *)bs->va;
+	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
+	if (nal_start_idx < 0) {
+		err = -EINVAL;
+		goto err_free_fb_out;
+	}
+
+	inst->vsi->dec.nal_info = buf[nal_start_idx];
+	inst->vsi->dec.bs_buf_addr = (u64)bs->dma_addr;
+	inst->vsi->dec.bs_buf_size = bs->size;
+
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &lat_buf->ts_info, true);
+
+	err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
+	if (err)
+		goto err_free_fb_out;
+
+	*res_chg = inst->resolution_changed;
+	if (inst->resolution_changed) {
+		mtk_vcodec_debug(inst, "- resolution changed -");
+		if (inst->realloc_mv_buf) {
+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
+			inst->realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		inst->resolution_changed = false;
+	}
+	for (i = 0; i < H264_MAX_MV_NUM; i++) {
+		mem = &inst->mv_buf[i];
+		inst->vsi->mv_buf_dma[i] = mem->dma_addr;
+	}
+	inst->vsi->wdma_start_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
+	inst->vsi->wdma_end_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
+		lat_buf->ctx->msg_queue.wdma_addr.size;
+	inst->vsi->wdma_err_addr = lat_buf->wdma_err_addr.dma_addr;
+	inst->vsi->slice_bc_start_addr = lat_buf->slice_bc_addr.dma_addr;
+	inst->vsi->slice_bc_end_addr = lat_buf->slice_bc_addr.dma_addr +
+		lat_buf->slice_bc_addr.size;
+
+	inst->vsi->trans_end = inst->ctx->msg_queue.wdma_rptr_addr;
+	inst->vsi->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
+	mtk_vcodec_debug(inst, "lat:trans(0x%llx 0x%llx)err:0x%llx",
+			 inst->vsi->wdma_start_addr,
+			 inst->vsi->wdma_end_addr,
+			 inst->vsi->wdma_err_addr);
+
+	mtk_vcodec_debug(inst, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
+			 inst->vsi->slice_bc_start_addr,
+			 inst->vsi->slice_bc_end_addr,
+			 inst->vsi->trans_start,
+			 inst->vsi->trans_end);
+	err = vpu_dec_start(vpu, data, 2);
+	if (err) {
+		mtk_vcodec_debug(inst, "lat decode err: %d", err);
+		goto err_free_fb_out;
+	}
+
+	/* wait decoder done interrupt */
+	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+	inst->vsi->dec.timeout = !!timeout;
+
+	err = vpu_dec_end(vpu);
+	if (err == SLICE_HEADER_FULL || timeout || err == TRANS_BUFFER_FULL) {
+		err = -EINVAL;
+		goto err_free_fb_out;
+	}
+
+	share_info->trans_end = inst->ctx->msg_queue.wdma_addr.dma_addr +
+		inst->vsi->wdma_end_addr_offset;
+	share_info->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
+	share_info->nal_info = inst->vsi->dec.nal_info;
+	vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue,
+				       share_info->trans_end);
+
+	memcpy_fromio(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
+		      sizeof(share_info->h264_slice_params));
+	vdec_msg_queue_qbuf(&inst->ctx->dev->msg_queue_core_ctx, lat_buf);
+
+	inst->slice_dec_num++;
+	return 0;
+
+err_free_fb_out:
+	mtk_vcodec_err(inst, "slice dec number: %d err: %d", inst->slice_dec_num, err);
+	return err;
+}
+
+static int vdec_h264_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
+				     void *out)
+{
+	struct vdec_h264_slice_inst *inst = h_vdec;
+
+	switch (type) {
+	case GET_PARAM_PIC_INFO:
+		vdec_h264_slice_get_pic_info(inst);
+		break;
+	case GET_PARAM_DPB_SIZE:
+		*(unsigned int *)out = 6;
+		break;
+	case GET_PARAM_CROP_INFO:
+		vdec_h264_slice_get_crop_info(inst, out);
+		break;
+	default:
+		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+const struct vdec_common_if vdec_h264_slice_lat_if = {
+	.init		= vdec_h264_slice_init,
+	.decode		= vdec_h264_slice_decode,
+	.get_param	= vdec_h264_slice_get_param,
+	.deinit		= vdec_h264_slice_deinit,
+};
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index c93dd0ea3537..c17a7815e1bb 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -20,7 +20,13 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 
 	switch (fourcc) {
 	case V4L2_PIX_FMT_H264_SLICE:
-		ctx->dec_if = &vdec_h264_slice_if;
+		if (ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
+			ctx->dec_if = &vdec_h264_slice_if;
+			ctx->hw_id = MTK_VDEC_CORE;
+		} else {
+			ctx->dec_if = &vdec_h264_slice_lat_if;
+			ctx->hw_id = MTK_VDEC_LAT0;
+		}
 		break;
 	case V4L2_PIX_FMT_H264:
 		ctx->dec_if = &vdec_h264_if;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
index d467e8af4a84..6ce848e74167 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
@@ -56,6 +56,7 @@ struct vdec_fb_node {
 
 extern const struct vdec_common_if vdec_h264_if;
 extern const struct vdec_common_if vdec_h264_slice_if;
+extern const struct vdec_common_if vdec_h264_slice_lat_if;
 extern const struct vdec_common_if vdec_vp8_if;
 extern const struct vdec_common_if vdec_vp9_if;
 
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index b47416f7aeb8..7c2b7cc9fe6c 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -41,6 +41,8 @@ enum scp_ipi_id {
 	SCP_IPI_ISP_FRAME,
 	SCP_IPI_FD_CMD,
 	SCP_IPI_CROS_HOST_CMD,
+	SCP_IPI_VDEC_LAT,
+	SCP_IPI_VDEC_CORE,
 	SCP_IPI_NS_SERVICE = 0xFF,
 	SCP_IPI_MAX = 0x100,
 };
-- 
2.25.1

