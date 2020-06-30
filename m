Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8A820EE6A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 08:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbgF3G2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 02:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730284AbgF3G2F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 02:28:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A26C03E979
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:04 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p3so9468209pgh.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OtOeixb7mccS5LB6aqSec7TAqhmpOggKk1PCiEhjqwA=;
        b=ZIuUv++XwmntjHjZsrVuempnAWF+xOvalvYgRG+AZ0Usbl2cEqtMU5LPOuzYcUifQB
         pNOhu1GXeWwIIlmXX71BLRcC+95MxxYZpZPvP6Zfmy+o/c5KCZW4QCf27eB/qTYKM9yv
         7cMyaZFHmz6mUFQR6oEt2aaKsICK5kFJVKZYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OtOeixb7mccS5LB6aqSec7TAqhmpOggKk1PCiEhjqwA=;
        b=GYgQ8Sq0IwDpjo/9LhJVn4KiTMTPj5Pv1G7fJIsc4LEzS2OEw3XafxImMGO0mKt89c
         gKVyprbueT4b6EMHXbyAF6GEqxAtyaDeCycS1nbQwxM1QRgTaaZopgaTpOLB3OIYYuNW
         CGhdXfOa7a6nnMeRT3j0AZRWLG8BeWJhgQOF+8QumPp6Rl2hfzO7m13+jf+Vl9GmUF9J
         /reptlZ+8EaAWxoGzym93H7ITj3K7gtb4xA3ESj95xyD2t2ho53KemVCN9ahW1Koafhu
         p6QgKoqPH1TqhYDyp2A6UFmfvWqO9EBQHeyAvm5I1dGJS/lp2sIsfJ5WmPanQRhs3Y43
         s3rg==
X-Gm-Message-State: AOAM532nnWhcK74/QH9weuNlGmUJE6yvHfGyfBmf9qqcEnIwngFu3fq9
        TYyoMSxlkFUj53kvUNpQ9PWfHg==
X-Google-Smtp-Source: ABdhPJz4N4tXtxXvOixQeratjjXIFAHYukWiVaRMQvGMN4PUAT2PsW0bCL3G1HFLurm6oFTToRkXRQ==
X-Received: by 2002:aa7:8f03:: with SMTP id x3mr16831468pfr.64.1593498484259;
        Mon, 29 Jun 2020 23:28:04 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 23:28:03 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 6/9] media: mtk-vcodec: vdec: support stateless H.264 decoding
Date:   Tue, 30 Jun 2020 15:27:08 +0900
Message-Id: <20200630062711.4169601-7-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Add support for H.264 decoding using the stateless API, as supported by
MT8183. This support takes advantage of the V4L2 H.264 reference list
builders.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 802 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 5 files changed, 808 insertions(+)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index f0dbe048efea..ff77c6db55db 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -255,6 +255,7 @@ config VIDEO_MEDIATEK_VCODEC
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
+	select V4L2_H264
 	select VIDEO_MEDIATEK_VPU
 	select MTK_SCP
 	help
diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 057e2519aafd..f7c1d27a85d5 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
 		vdec/vdec_vp9_if.o \
+		vdec/vdec_h264_req_if.o \
 		mtk_vcodec_dec_drv.o \
 		vdec_drv_if.o \
 		vdec_vpu_if.o \
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
new file mode 100644
index 000000000000..f90518910d8d
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
@@ -0,0 +1,802 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/h264-ctrls.h>
+#include <media/v4l2-h264.h>
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
+#define NAL_TYPE(value)				((value) & 0x1F)
+
+#define BUF_PREDICTION_SZ			(64 * 4096)
+#define MB_UNIT_LEN				16
+
+/* get used parameters for sps/pps */
+#define GET_MTK_VDEC_FLAG(cond, flag) \
+	{ dst_param->cond = ((src_param->flags & (flag)) ? (1) : (0)); }
+#define GET_MTK_VDEC_PARAM(param) \
+	{ dst_param->param = src_param->param; }
+/* motion vector size (bytes) for every macro block */
+#define HW_MB_STORE_SZ				64
+
+#define H264_MAX_MV_NUM				32
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
+ * struct mtk_h264_sps_param  - parameters for sps
+ */
+struct mtk_h264_sps_param {
+	unsigned char chroma_format_idc;
+	unsigned char bit_depth_luma_minus8;
+	unsigned char bit_depth_chroma_minus8;
+	unsigned char log2_max_frame_num_minus4;
+	unsigned char pic_order_cnt_type;
+	unsigned char log2_max_pic_order_cnt_lsb_minus4;
+	unsigned char max_num_ref_frames;
+	unsigned char separate_colour_plane_flag;
+	unsigned short pic_width_in_mbs_minus1;
+	unsigned short pic_height_in_map_units_minus1;
+	unsigned int max_frame_nums;
+	unsigned char qpprime_y_zero_transform_bypass_flag;
+	unsigned char delta_pic_order_always_zero_flag;
+	unsigned char frame_mbs_only_flag;
+	unsigned char mb_adaptive_frame_field_flag;
+	unsigned char direct_8x8_inference_flag;
+	unsigned char reserved[3];
+};
+
+/**
+ * struct mtk_h264_pps_param  - parameters for pps
+ */
+struct mtk_h264_pps_param {
+	unsigned char num_ref_idx_l0_default_active_minus1;
+	unsigned char num_ref_idx_l1_default_active_minus1;
+	unsigned char weighted_bipred_idc;
+	char pic_init_qp_minus26;
+	char chroma_qp_index_offset;
+	char second_chroma_qp_index_offset;
+	unsigned char entropy_coding_mode_flag;
+	unsigned char pic_order_present_flag;
+	unsigned char deblocking_filter_control_present_flag;
+	unsigned char constrained_intra_pred_flag;
+	unsigned char weighted_pred_flag;
+	unsigned char redundant_pic_cnt_present_flag;
+	unsigned char transform_8x8_mode_flag;
+	unsigned char scaling_matrix_present_flag;
+	unsigned char reserved[2];
+};
+
+struct slice_api_h264_scaling_matrix {
+	unsigned char scaling_list_4x4[6][16];
+	unsigned char scaling_list_8x8[6][64];
+};
+
+struct slice_h264_dpb_entry {
+	unsigned long long reference_ts;
+	unsigned short frame_num;
+	unsigned short pic_num;
+	/* Note that field is indicated by v4l2_buffer.field */
+	int top_field_order_cnt;
+	int bottom_field_order_cnt;
+	unsigned int flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
+};
+
+/**
+ * struct slice_api_h264_decode_param - parameters for decode.
+ */
+struct slice_api_h264_decode_param {
+	struct slice_h264_dpb_entry dpb[16];
+	unsigned short num_slices;
+	unsigned short nal_ref_idc;
+	unsigned char ref_pic_list_p0[32];
+	unsigned char ref_pic_list_b0[32];
+	unsigned char ref_pic_list_b1[32];
+	int top_field_order_cnt;
+	int bottom_field_order_cnt;
+	unsigned int flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
+};
+
+/**
+ * struct mtk_h264_dec_slice_param  - parameters for decode current frame
+ */
+struct mtk_h264_dec_slice_param {
+	struct mtk_h264_sps_param			sps;
+	struct mtk_h264_pps_param			pps;
+	struct slice_api_h264_scaling_matrix		scaling_matrix;
+	struct slice_api_h264_decode_param		decode_params;
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
+	struct mtk_h264_dec_slice_param h264_slice_params;
+};
+
+/**
+ * struct vdec_h264_slice_inst - h264 decoder instance
+ * @num_nalu : how many nalus be decoded
+ * @ctx      : point to mtk_vcodec_ctx
+ * @pred_buf : HW working predication buffer
+ * @mv_buf   : HW working motion vector buffer
+ * @vpu      : VPU instance
+ * @vsi_ctx  : Local VSI data for this decoding context
+ */
+struct vdec_h264_slice_inst {
+	unsigned int num_nalu;
+	struct mtk_vcodec_ctx *ctx;
+	struct mtk_vcodec_mem pred_buf;
+	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
+	struct vdec_vpu_inst vpu;
+	struct vdec_h264_vsi vsi_ctx;
+	struct mtk_h264_dec_slice_param h264_slice_param;
+
+	struct v4l2_h264_dpb_entry dpb[16];
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
+static void get_h264_dpb_list(struct vdec_h264_slice_inst *inst,
+			      struct mtk_h264_dec_slice_param *slice_param)
+{
+	struct vb2_queue *vq;
+	struct vb2_buffer *vb;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	u64 index;
+
+	vq = v4l2_m2m_get_vq(inst->ctx->m2m_ctx,
+		V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
+	for (index = 0; index < 16; index++) {
+		const struct slice_h264_dpb_entry *dpb;
+		int vb2_index;
+
+		dpb = &slice_param->decode_params.dpb[index];
+		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)) {
+			slice_param->h264_dpb_info[index].reference_flag = 0;
+			continue;
+		}
+
+		vb2_index = vb2_find_timestamp(vq, dpb->reference_ts, 0);
+		if (vb2_index < 0) {
+			mtk_vcodec_err(inst, "Reference invalid: dpb_index(%lld) reference_ts(%lld)",
+				index, dpb->reference_ts);
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
+static void get_h264_sps_parameters(struct mtk_h264_sps_param *dst_param,
+	const struct v4l2_ctrl_h264_sps *src_param)
+{
+	GET_MTK_VDEC_PARAM(chroma_format_idc);
+	GET_MTK_VDEC_PARAM(bit_depth_luma_minus8);
+	GET_MTK_VDEC_PARAM(bit_depth_chroma_minus8);
+	GET_MTK_VDEC_PARAM(log2_max_frame_num_minus4);
+	GET_MTK_VDEC_PARAM(pic_order_cnt_type);
+	GET_MTK_VDEC_PARAM(log2_max_pic_order_cnt_lsb_minus4);
+	GET_MTK_VDEC_PARAM(max_num_ref_frames);
+	GET_MTK_VDEC_PARAM(pic_width_in_mbs_minus1);
+	GET_MTK_VDEC_PARAM(pic_height_in_map_units_minus1);
+
+	GET_MTK_VDEC_FLAG(separate_colour_plane_flag,
+		V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE);
+	GET_MTK_VDEC_FLAG(qpprime_y_zero_transform_bypass_flag,
+		V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS);
+	GET_MTK_VDEC_FLAG(delta_pic_order_always_zero_flag,
+		V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO);
+	GET_MTK_VDEC_FLAG(frame_mbs_only_flag,
+		V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY);
+	GET_MTK_VDEC_FLAG(mb_adaptive_frame_field_flag,
+		V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
+	GET_MTK_VDEC_FLAG(direct_8x8_inference_flag,
+		V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE);
+}
+
+static void get_h264_pps_parameters(struct mtk_h264_pps_param *dst_param,
+	const struct v4l2_ctrl_h264_pps *src_param)
+{
+	GET_MTK_VDEC_PARAM(num_ref_idx_l0_default_active_minus1);
+	GET_MTK_VDEC_PARAM(num_ref_idx_l1_default_active_minus1);
+	GET_MTK_VDEC_PARAM(weighted_bipred_idc);
+	GET_MTK_VDEC_PARAM(pic_init_qp_minus26);
+	GET_MTK_VDEC_PARAM(chroma_qp_index_offset);
+	GET_MTK_VDEC_PARAM(second_chroma_qp_index_offset);
+
+	GET_MTK_VDEC_FLAG(entropy_coding_mode_flag,
+		V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE);
+	GET_MTK_VDEC_FLAG(pic_order_present_flag,
+		V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT);
+	GET_MTK_VDEC_FLAG(weighted_pred_flag,
+		V4L2_H264_PPS_FLAG_WEIGHTED_PRED);
+	GET_MTK_VDEC_FLAG(deblocking_filter_control_present_flag,
+		V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT);
+	GET_MTK_VDEC_FLAG(constrained_intra_pred_flag,
+		V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED);
+	GET_MTK_VDEC_FLAG(redundant_pic_cnt_present_flag,
+		V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT);
+	GET_MTK_VDEC_FLAG(transform_8x8_mode_flag,
+		V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
+	GET_MTK_VDEC_FLAG(scaling_matrix_present_flag,
+		V4L2_H264_PPS_FLAG_PIC_SCALING_MATRIX_PRESENT);
+}
+
+static void
+get_h264_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
+			const struct v4l2_ctrl_h264_scaling_matrix *src_matrix)
+{
+	memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
+	       sizeof(dst_matrix->scaling_list_4x4));
+
+	memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
+	       sizeof(dst_matrix->scaling_list_8x8));
+}
+
+static void get_h264_decode_parameters(
+	struct slice_api_h264_decode_param *dst_params,
+	const struct v4l2_ctrl_h264_decode_params *src_params)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dst_params->dpb); i++) {
+		struct slice_h264_dpb_entry *dst_entry = &dst_params->dpb[i];
+		const struct v4l2_h264_dpb_entry *src_entry =
+			&src_params->dpb[i];
+
+		dst_entry->reference_ts = src_entry->reference_ts;
+		dst_entry->frame_num = src_entry->frame_num;
+		dst_entry->pic_num = src_entry->pic_num;
+		dst_entry->top_field_order_cnt = src_entry->top_field_order_cnt;
+		dst_entry->bottom_field_order_cnt =
+			src_entry->bottom_field_order_cnt;
+		dst_entry->flags = src_entry->flags;
+	}
+
+	dst_params->num_slices = src_params->num_slices;
+	dst_params->nal_ref_idc = src_params->nal_ref_idc;
+	dst_params->top_field_order_cnt = src_params->top_field_order_cnt;
+	dst_params->bottom_field_order_cnt = src_params->bottom_field_order_cnt;
+	dst_params->flags = src_params->flags;
+}
+
+static bool dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
+			    const struct v4l2_h264_dpb_entry *b)
+{
+	return a->top_field_order_cnt == b->top_field_order_cnt &&
+	       a->bottom_field_order_cnt == b->bottom_field_order_cnt;
+}
+
+/*
+ * Move DPB entries of dec_param that refer to a frame already existing in dpb
+ * into the already existing slot in dpb, and move other entries into new slots.
+ *
+ * This function is an adaptation of the similarly-named function in
+ * hantro_h264.c.
+ */
+static void update_dpb(const struct v4l2_ctrl_h264_decode_params *dec_param,
+		       struct v4l2_h264_dpb_entry *dpb)
+{
+	DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	DECLARE_BITMAP(in_use, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	unsigned int i, j;
+
+	/* Disable all entries by default, and mark the ones in use. */
+	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+			set_bit(i, in_use);
+		dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
+	}
+
+	/* Try to match new DPB entries with existing ones by their POCs. */
+	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
+		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
+
+		if (!(ndpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		/*
+		 * To cut off some comparisons, iterate only on target DPB
+		 * entries were already used.
+		 */
+		for_each_set_bit(j, in_use, ARRAY_SIZE(dec_param->dpb)) {
+			struct v4l2_h264_dpb_entry *cdpb;
+
+			cdpb = &dpb[j];
+			if (!dpb_entry_match(cdpb, ndpb))
+				continue;
+
+			*cdpb = *ndpb;
+			set_bit(j, used);
+			/* Don't reiterate on this one. */
+			clear_bit(j, in_use);
+			break;
+		}
+
+		if (j == ARRAY_SIZE(dec_param->dpb))
+			set_bit(i, new);
+	}
+
+	/* For entries that could not be matched, use remaining free slots. */
+	for_each_set_bit(i, new, ARRAY_SIZE(dec_param->dpb)) {
+		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
+		struct v4l2_h264_dpb_entry *cdpb;
+
+		/*
+		 * Both arrays are of the same sizes, so there is no way
+		 * we can end up with no space in target array, unless
+		 * something is buggy.
+		 */
+		j = find_first_zero_bit(used, ARRAY_SIZE(dec_param->dpb));
+		if (WARN_ON(j >= ARRAY_SIZE(dec_param->dpb)))
+			return;
+
+		cdpb = &dpb[j];
+		*cdpb = *ndpb;
+		set_bit(j, used);
+	}
+}
+
+static void get_vdec_decode_parameters(struct vdec_h264_slice_inst *inst)
+{
+	struct mtk_h264_dec_slice_param *slice_param = &inst->h264_slice_param;
+	const struct v4l2_ctrl_h264_decode_params *dec_params =
+		get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
+	const struct v4l2_ctrl_h264_slice_params *slice_params =
+		get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
+	const struct v4l2_ctrl_h264_sps *sps =
+		get_ctrl_ptr(inst->ctx, V4L2_CID_MPEG_VIDEO_H264_SPS);
+	struct v4l2_ctrl_h264_decode_params fixed_params = *dec_params;
+	struct v4l2_h264_reflist_builder reflist_builder;
+
+	update_dpb(dec_params, inst->dpb);
+	memcpy(fixed_params.dpb, inst->dpb, sizeof(inst->dpb));
+
+	get_h264_sps_parameters(&slice_param->sps,
+				get_ctrl_ptr(inst->ctx,
+					     V4L2_CID_MPEG_VIDEO_H264_SPS));
+	get_h264_pps_parameters(&slice_param->pps,
+				get_ctrl_ptr(inst->ctx,
+					     V4L2_CID_MPEG_VIDEO_H264_PPS));
+	get_h264_scaling_matrix(
+		&slice_param->scaling_matrix,
+		get_ctrl_ptr(inst->ctx,
+			     V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX));
+	get_h264_decode_parameters(&slice_param->decode_params, &fixed_params);
+	get_h264_dpb_list(inst, slice_param);
+
+	/* The firmware expects unused reference list entries to be set to 32 */
+	memset(&slice_param->decode_params.ref_pic_list_p0, 32,
+	       sizeof(slice_param->decode_params.ref_pic_list_p0));
+	memset(&slice_param->decode_params.ref_pic_list_b0, 32,
+	       sizeof(slice_param->decode_params.ref_pic_list_b0));
+	memset(&slice_param->decode_params.ref_pic_list_b1, 32,
+	       sizeof(slice_param->decode_params.ref_pic_list_b1));
+
+	/* Build the reference frames lists */
+	v4l2_h264_init_reflist_builder(&reflist_builder, dec_params,
+				       slice_params, sps, inst->dpb);
+	v4l2_h264_build_p_ref_list(&reflist_builder,
+			 slice_param->decode_params.ref_pic_list_p0);
+	v4l2_h264_build_b_ref_lists(&reflist_builder,
+			  slice_param->decode_params.ref_pic_list_b0,
+			  slice_param->decode_params.ref_pic_list_b1);
+
+	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
+	       sizeof(inst->vsi_ctx.h264_slice_params));
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
+	inst->vsi_ctx.pred_buf_dma = inst->pred_buf.dma_addr;
+	return 0;
+}
+
+static void free_predication_buf(struct vdec_h264_slice_inst *inst)
+{
+	struct mtk_vcodec_mem *mem = NULL;
+
+	mtk_vcodec_debug_enter(inst);
+
+	inst->vsi_ctx.pred_buf_dma = 0;
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
+		inst->vsi_ctx.mv_buf_dma[i] = mem->dma_addr;
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
+		inst->vsi_ctx.mv_buf_dma[i] = 0;
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
+	inst->vsi_ctx.dec.cap_num_planes =
+		ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
+
+	pic = &ctx->picinfo;
+	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
+			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vcodec_debug(inst, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
+		ctx->picinfo.fb_sz[1]);
+
+	if ((ctx->last_decoded_picinfo.pic_w != ctx->picinfo.pic_w) ||
+		(ctx->last_decoded_picinfo.pic_h != ctx->picinfo.pic_h)) {
+		inst->vsi_ctx.dec.resolution_changed = true;
+		if ((ctx->last_decoded_picinfo.buf_w != ctx->picinfo.buf_w) ||
+			(ctx->last_decoded_picinfo.buf_h != ctx->picinfo.buf_h))
+			inst->vsi_ctx.dec.realloc_mv_buf = true;
+
+		mtk_v4l2_debug(1, "ResChg: (%d %d) : old(%d, %d) -> new(%d, %d)",
+			inst->vsi_ctx.dec.resolution_changed,
+			inst->vsi_ctx.dec.realloc_mv_buf,
+			ctx->last_decoded_picinfo.pic_w,
+			ctx->last_decoded_picinfo.pic_h,
+			ctx->picinfo.pic_w, ctx->picinfo.pic_h);
+	}
+}
+
+static void get_crop_info(struct vdec_h264_slice_inst *inst,
+	struct v4l2_rect *cr)
+{
+	cr->left = inst->vsi_ctx.crop.left;
+	cr->top = inst->vsi_ctx.crop.top;
+	cr->width = inst->vsi_ctx.crop.width;
+	cr->height = inst->vsi_ctx.crop.height;
+
+	mtk_vcodec_debug(inst, "l=%d, t=%d, w=%d, h=%d",
+			 cr->left, cr->top, cr->width, cr->height);
+}
+
+static void get_dpb_size(struct vdec_h264_slice_inst *inst,
+	unsigned int *dpb_sz)
+{
+	*dpb_sz = inst->vsi_ctx.dec.dpb_sz;
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
+
+	err = vpu_dec_init(&inst->vpu);
+	if (err) {
+		mtk_vcodec_err(inst, "vdec_h264 init err=%d", err);
+		goto error_free_inst;
+	}
+
+	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
+	inst->vsi_ctx.dec.resolution_changed = true;
+	inst->vsi_ctx.dec.realloc_mv_buf = true;
+
+	err = allocate_predication_buf(inst);
+	if (err)
+		goto error_deinit;
+
+	mtk_vcodec_debug(inst, "struct size = %d,%d,%d,%d\n",
+		sizeof(struct mtk_h264_sps_param),
+		sizeof(struct mtk_h264_pps_param),
+		sizeof(struct mtk_h264_dec_slice_param),
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
+	uint32_t nal_type, data[2];
+	unsigned char *buf;
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
+	inst->vsi_ctx.dec.bs_dma = (uint64_t)bs->dma_addr;
+	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
+	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
+	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+
+	get_vdec_decode_parameters(inst);
+	*res_chg = inst->vsi_ctx.dec.resolution_changed;
+	if (*res_chg) {
+		mtk_vcodec_debug(inst, "- resolution changed -");
+		if (inst->vsi_ctx.dec.realloc_mv_buf) {
+			err = alloc_mv_buf(inst, &(inst->ctx->picinfo));
+			inst->vsi_ctx.dec.realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		*res_chg = false;
+	}
+
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
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
+	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
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
index b18743b906ea..42008243ceac 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -19,6 +19,9 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 	int ret = 0;
 
 	switch (fourcc) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		ctx->dec_if = &vdec_h264_slice_if;
+		break;
 	case V4L2_PIX_FMT_H264:
 		ctx->dec_if = &vdec_h264_if;
 		break;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
index 270d8dc9984b..961b2b6072b5 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
@@ -55,6 +55,7 @@ struct vdec_fb_node {
 };
 
 extern const struct vdec_common_if vdec_h264_if;
+extern const struct vdec_common_if vdec_h264_slice_if;
 extern const struct vdec_common_if vdec_vp8_if;
 extern const struct vdec_common_if vdec_vp9_if;
 
-- 
2.27.0.212.ge8ba1cc988-goog

