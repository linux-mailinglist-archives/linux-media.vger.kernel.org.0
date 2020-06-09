Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3581D1F3A2E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 13:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgFIL5I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 07:57:08 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:60836 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726395AbgFIL5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jun 2020 07:57:07 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jun 2020 17:25:28 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Jun 2020 17:25:14 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 8DD973BCA; Tue,  9 Jun 2020 17:25:13 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] venus: move buffer calculation to driver
Date:   Tue,  9 Jun 2020 17:24:56 +0530
Message-Id: <1591703696-6529-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now we get buffer requirements from fw. The
call to get these requirements is a blocking call and takes
a lot of time. This change calculates all the buffer
requirement within driver and this removes the
necessity for get buffer requirements call.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/Makefile         |    2 +-
 drivers/media/platform/qcom/venus/buffers.c        | 1312 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/buffers.h        |   44 +
 drivers/media/platform/qcom/venus/core.h           |    1 +
 drivers/media/platform/qcom/venus/helpers.c        |    3 +
 .../media/platform/qcom/venus/hfi_platform_data.h  |    3 +
 drivers/media/platform/qcom/venus/vdec.c           |    3 +
 7 files changed, 1367 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/qcom/venus/buffers.c
 create mode 100644 drivers/media/platform/qcom/venus/buffers.h

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index 3878bc9..bb6a378 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -4,7 +4,7 @@
 venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
 		   hfi_parser.o pm_helpers.o dbgfs.o \
-		   hfi_platform_data.o
+		   hfi_platform_data.o buffers.o
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/buffers.c b/drivers/media/platform/qcom/venus/buffers.c
new file mode 100644
index 0000000..bd5071b
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/buffers.c
@@ -0,0 +1,1312 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include "buffers.h"
+#include "hfi_platform_data.h"
+
+/* minimum number of input buffers */
+#define MIN_INPUT_BUFFERS 4
+
+/* minimum number of output buffers */
+#define MIN_ENC_OUTPUT_BUFFERS 4
+
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH 32
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT 8
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_WIDTH 16
+#define HFI_COLOR_FORMAT_YUV420_NV12_UBWC_UV_TILE_HEIGHT 8
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH 48
+#define HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT 4
+#define BUFFER_ALIGNMENT_4096_BYTES 4096
+#define VENUS_METADATA_STRIDE_MULTIPLE     64
+#define VENUS_METADATA_HEIGHT_MULTIPLE     16
+
+#define BUFFER_ALIGNMENT_SIZE(x) x
+
+#define VENUS_DMA_ALIGNMENT BUFFER_ALIGNMENT_SIZE(256)
+
+#define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE   64
+#define MAX_FE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE   64
+#define MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE   64
+#define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE   640
+#define MAX_FE_NBR_DATA_CB_LINE_BUFFER_SIZE     320
+#define MAX_FE_NBR_DATA_CR_LINE_BUFFER_SIZE     320
+
+#define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE     (128 / 8)
+#define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE     (128 / 8)
+#define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE     (128 / 8)
+
+#define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE     (64 * 2 * 3)
+#define MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE     (32 * 2 * 3)
+#define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE     (16 * 2 * 3)
+
+#define MAX_TILE_COLUMNS 32     /* 8K/256 */
+
+#define NUM_HW_PIC_BUF 10
+#define BIN_BUFFER_THRESHOLD (1280 * 736)
+#define H264D_MAX_SLICE 1800
+#define SIZE_H264D_BUFTAB_T  256 // sizeof(h264d_buftab_t) aligned to 256
+#define SIZE_H264D_HW_PIC_T BIT(11) // sizeof(h264d_hw_pic_t) 32 aligned
+#define SIZE_H264D_BSE_CMD_PER_BUF (32 * 4)
+#define SIZE_H264D_VPP_CMD_PER_BUF 512
+
+// Line Buffer definitions
+/* one for luma and 1/2 for each chroma */
+#define SIZE_H264D_LB_FE_TOP_DATA(width, height) \
+	(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * \
+	ALIGN(width, 16) * 3)
+
+#define SIZE_H264D_LB_FE_TOP_CTRL(width, height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	((width + 15) >> 4))
+
+#define SIZE_H264D_LB_FE_LEFT_CTRL(width, height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	((height + 15) >> 4))
+
+#define SIZE_H264D_LB_SE_TOP_CTRL(width, height) \
+	(MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	((width + 15) >> 4))
+
+#define SIZE_H264D_LB_SE_LEFT_CTRL(width, height) \
+	(MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	((height + 15) >> 4))
+
+#define SIZE_H264D_LB_PE_TOP_DATA(width, height) \
+	(MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE * \
+	((width + 15) >> 4))
+
+#define SIZE_H264D_LB_VSP_TOP(width, height) \
+	((((width + 15) >> 4) << 7))
+
+#define SIZE_H264D_LB_RECON_DMA_METADATA_WR(width, height) \
+	(ALIGN(height, 16) * 32)
+
+#define SIZE_H264D_QP(width, height) \
+	(((width + 63) >> 6) * ((height + 63) >> 6) * 128)
+
+#define SIZE_HW_PIC(size_per_buf) \
+	(NUM_HW_PIC_BUF * size_per_buf)
+
+#define H264_CABAC_HDR_RATIO_HD_TOT 1
+#define H264_CABAC_RES_RATIO_HD_TOT 3
+
+/*
+ * some content need more bin buffer, but limit buffer
+ * size for high resolution
+ */
+
+#define NUM_SLIST_BUF_H264            (256 + 32)
+#define SIZE_SLIST_BUF_H264           512
+
+#define LCU_MAX_SIZE_PELS 64
+#define LCU_MIN_SIZE_PELS 16
+
+#define H265D_MAX_SLICE 600
+#define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
+#define SIZE_H265D_BSE_CMD_PER_BUF (16 * sizeof(u32))
+#define SIZE_H265D_VPP_CMD_PER_BUF 256
+
+#define SIZE_H265D_LB_FE_TOP_DATA(width, height) \
+	(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * \
+	(ALIGN(width, 64) + 8) * 2)
+
+#define SIZE_H265D_LB_FE_TOP_CTRL(width, height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	(ALIGN(width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS))
+
+#define SIZE_H265D_LB_FE_LEFT_CTRL(width, height) \
+	(MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * \
+	(ALIGN(height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS))
+
+#define SIZE_H265D_LB_SE_TOP_CTRL(width, height) \
+	((LCU_MAX_SIZE_PELS / 8 * (128 / 8)) * \
+	((width + 15) >> 4))
+
+#define SIZE_H265D_LB_SE_LEFT_CTRL(width, height) \
+	(max(((height + 16 - 1) / 8) * MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,\
+	max(((height + 32 - 1) / 8) * MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE, \
+	((height + 64 - 1) / 8) * MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE)))
+
+#define SIZE_H265D_LB_PE_TOP_DATA(width, height) \
+	(MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE * \
+	(ALIGN(width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS))
+
+#define SIZE_H265D_LB_VSP_TOP(width, height) \
+	(((width + 63) >> 6) * 128)
+
+#define SIZE_H265D_LB_VSP_LEFT(width, height) \
+	(((height + 63) >> 6) * 128)
+
+#define SIZE_H265D_LB_RECON_DMA_METADATA_WR(width, height) \
+	SIZE_H264D_LB_RECON_DMA_METADATA_WR(width, height)
+
+#define SIZE_H265D_QP(width, height) SIZE_H264D_QP(width, height)
+
+#define H265_CABAC_HDR_RATIO_HD_TOT 2
+#define H265_CABAC_RES_RATIO_HD_TOT 2
+
+/*
+ * some content need more bin buffer, but limit buffer size
+ * for high resolution
+ */
+
+#define SIZE_SLIST_BUF_H265 BIT(10)
+#define NUM_SLIST_BUF_H265 (80 + 20)
+#define H265_NUM_TILE_COL 32
+#define H265_NUM_TILE_ROW 128
+#define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)
+
+#define SIZE_VPXD_LB_FE_LEFT_CTRL(width, height) \
+	max(((height + 15) >> 4) * MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE, \
+	max(((height + 31) >> 5) * MAX_FE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE, \
+	((height + 63) >> 6) * MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE))
+#define SIZE_VPXD_LB_FE_TOP_CTRL(width, height) \
+	(((ALIGN(width, 64) + 8) * 10 * 2)) /* + small line */
+#define SIZE_VPXD_LB_SE_TOP_CTRL(width, height) \
+	(((width + 15) >> 4) * MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE)
+#define SIZE_VPXD_LB_SE_LEFT_CTRL(width, height) \
+	max(((height + 15) >> 4) * MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE, \
+	max(((height + 31) >> 5) * MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE, \
+	((height + 63) >> 6) * MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE))
+#define SIZE_VPXD_LB_RECON_DMA_METADATA_WR(width, height) \
+	ALIGN((ALIGN(height, 16) / (4 / 2)) * 64, BUFFER_ALIGNMENT_SIZE(32))
+#define SIZE_VP8D_LB_FE_TOP_DATA(width, height) \
+	((ALIGN(width, 16) + 8) * 10 * 2)
+#define SIZE_VP9D_LB_FE_TOP_DATA(width, height) \
+	((ALIGN(ALIGN(width, 16), 64) + 8) * 10 * 2)
+#define SIZE_VP8D_LB_PE_TOP_DATA(width, height) \
+	((ALIGN(width, 16) >> 4) * 64)
+#define SIZE_VP9D_LB_PE_TOP_DATA(width, height) \
+	((ALIGN(ALIGN(width, 16), 64) >> 6) * 176)
+#define SIZE_VP8D_LB_VSP_TOP(width, height) \
+	(((ALIGN(width, 16) >> 4) * 64 / 2) + 256)
+#define SIZE_VP9D_LB_VSP_TOP(width, height) \
+	(((ALIGN(ALIGN(width, 16), 64) >> 6) * 64 * 8) + 256)
+
+#define HFI_V6_VP9D_COMV_SIZE \
+	((((8192 + 63) >> 6) * ((4320 + 63) >> 6) * 8 * 8 * 2 * 8))
+
+#define VPX_DECODER_FRAME_CONCURENCY_LVL 2
+#define VPX_DECODER_FRAME_BIN_HDR_BUDGET_RATIO_NUM 1
+#define VPX_DECODER_FRAME_BIN_HDR_BUDGET_RATIO_DEN 2
+#define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO_NUM 3
+#define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO_DEN 2
+
+#define VP8_NUM_FRAME_INFO_BUF (5 + 1)
+#define VP9_NUM_FRAME_INFO_BUF (8 + 2 + 1 + 8)
+#define VP8_NUM_PROBABILITY_TABLE_BUF (VP8_NUM_FRAME_INFO_BUF)
+#define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
+#define VP8_PROB_TABLE_SIZE 3840
+#define VP9_PROB_TABLE_SIZE 3840
+
+#define VP9_UDC_HEADER_BUF_SIZE (3 * 128)
+#define MAX_SUPERFRAME_HEADER_LEN (34)
+#define CCE_TILE_OFFSET_SIZE ALIGN(32 * 4 * 4, BUFFER_ALIGNMENT_SIZE(32))
+
+#define QMATRIX_SIZE (sizeof(u32) * 128 + 256)
+#define MP2D_QPDUMP_SIZE 115200
+
+#define HFI_V6_ENC_PERSIST_SIZE 102400
+
+#define HFI_MAX_COL_FRAME 6
+#define HFI_VENUS_VENC_TRE_WB_BUFF_SIZE (65 << 4) // bytes
+#define HFI_VENUS_VENC_DB_LINE_BUFF_PER_MB      512
+#define HFI_VENUS_VPPSG_MAX_REGISTERS  2048
+#define HFI_VENUS_WIDTH_ALIGNMENT 128
+#define HFI_VENUS_WIDTH_TEN_BIT_ALIGNMENT 192
+#define HFI_VENUS_HEIGHT_ALIGNMENT 32
+
+#define SYSTEM_LAL_TILE10 192
+#define NUM_MBS_720P (((1280 + 15) >> 4) * ((720 + 15) >> 4))
+#define NUM_MBS_4k (((4096 + 15) >> 4) * ((2304 + 15) >> 4))
+#define MB_SIZE_IN_PIXEL (16 * 16)
+#define HDR10PLUS_PAYLOAD_SIZE 1024
+#define HDR10_HIST_EXTRADATA_SIZE 4096
+
+static inline u32 size_vpss_lb(u32 width, u32 height, u32 num_vpp_pipes)
+{
+	u32 vpss_4tap_top_buffer_size, vpss_div2_top_buffer_size;
+	u32 vpss_4tap_left_buffer_size, vpss_div2_left_buffer_size;
+	u32 opb_wr_top_line_luma_buf_size, opb_wr_top_line_chroma_buf_size;
+	u32 opb_lb_wr_llb_y_buffer_size, opb_lb_wr_llb_uv_buffer_size;
+	u32 macrotiling_size;
+	u32 size = 0;
+
+	vpss_4tap_top_buffer_size = vpss_div2_top_buffer_size =
+		vpss_4tap_left_buffer_size = vpss_div2_left_buffer_size = 0;
+	macrotiling_size = 32;
+	opb_wr_top_line_luma_buf_size = ALIGN(width, macrotiling_size) /
+		macrotiling_size * 256;
+	opb_wr_top_line_luma_buf_size =
+		ALIGN(opb_wr_top_line_luma_buf_size, VENUS_DMA_ALIGNMENT) +
+			  (MAX_TILE_COLUMNS - 1) * 256;
+	opb_wr_top_line_luma_buf_size =
+		max(opb_wr_top_line_luma_buf_size,
+		    (32 * ALIGN(height, 16)));
+	opb_wr_top_line_chroma_buf_size = opb_wr_top_line_luma_buf_size;
+	opb_lb_wr_llb_uv_buffer_size = opb_lb_wr_llb_y_buffer_size =
+		ALIGN((ALIGN(height, 16) / 2) *
+			64, BUFFER_ALIGNMENT_SIZE(32));
+	size = num_vpp_pipes * 2 * (vpss_4tap_top_buffer_size +
+		vpss_div2_top_buffer_size) +
+		2 * (vpss_4tap_left_buffer_size +
+		vpss_div2_left_buffer_size) +
+	opb_wr_top_line_luma_buf_size +
+	opb_wr_top_line_chroma_buf_size +
+	opb_lb_wr_llb_uv_buffer_size +
+	opb_lb_wr_llb_y_buffer_size;
+
+	return size;
+}
+
+static inline u32 size_h264d_hw_bin_buffer(u32 width, u32 height)
+{
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+	u32 size = 0;
+	u32 product;
+
+	product = width * height;
+	size_yuv = (product <= BIN_BUFFER_THRESHOLD) ?
+			((BIN_BUFFER_THRESHOLD * 3) >> 1) :
+			((product * 3) >> 1);
+
+	size_bin_hdr = size_yuv * H264_CABAC_HDR_RATIO_HD_TOT;
+	size_bin_res = size_yuv * H264_CABAC_RES_RATIO_HD_TOT;
+	size_bin_hdr = ALIGN(size_bin_hdr, VENUS_DMA_ALIGNMENT);
+	size_bin_res = ALIGN(size_bin_res, VENUS_DMA_ALIGNMENT);
+	size = size_bin_hdr + size_bin_res;
+	return size;
+}
+
+static inline u32 calculate_h264d_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, bool is_interlaced)
+{
+	u32 aligned_width = ALIGN(width, BUFFER_ALIGNMENT_SIZE(16));
+	u32 aligned_height = ALIGN(height, BUFFER_ALIGNMENT_SIZE(16));
+	u32 size = 0;
+
+	if (!is_interlaced)
+		size = size_h264d_hw_bin_buffer(aligned_width, aligned_height);
+	else
+		size = 0;
+
+	return size;
+}
+
+static inline u32 size_h265d_hw_bin_buffer(u32 width, u32 height)
+{
+	u32 size = 0;
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+	u32 product;
+
+	product = width * height;
+	size_yuv = (product <= BIN_BUFFER_THRESHOLD) ?
+		((BIN_BUFFER_THRESHOLD * 3) >> 1) :
+		((product * 3) >> 1);
+	size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_HD_TOT;
+	size_bin_res = size_yuv * H265_CABAC_RES_RATIO_HD_TOT;
+	size_bin_hdr = ALIGN(size_bin_hdr, VENUS_DMA_ALIGNMENT);
+	size_bin_res = ALIGN(size_bin_res, VENUS_DMA_ALIGNMENT);
+	size = size_bin_hdr + size_bin_res;
+
+	return size;
+}
+
+static inline u32 calculate_h265d_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, bool is_interlaced)
+{
+	u32 aligned_width = ALIGN(width, BUFFER_ALIGNMENT_SIZE(16));
+	u32 aligned_height = ALIGN(height, BUFFER_ALIGNMENT_SIZE(16));
+	u32 size = 0;
+
+	if (!is_interlaced)
+		size = size_h265d_hw_bin_buffer(aligned_width, aligned_height);
+	else
+		size = 0;
+	return size;
+}
+
+static inline u32 calculate_vpxd_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, bool is_interlaced)
+{
+	u32 aligned_width = ALIGN(width, BUFFER_ALIGNMENT_SIZE(16));
+	u32 aligned_height = ALIGN(height, BUFFER_ALIGNMENT_SIZE(16));
+	u32 size = 0;
+	u32 size_yuv = aligned_width * aligned_height * 3 / 2;
+
+	if (!is_interlaced) {
+		/* binbuffer1_size + binbufer2_size */
+		u32 binbuffer1_size = 0, binbufer2_size = 0;
+
+		binbuffer1_size = max_t(u32, size_yuv,
+			((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
+			VPX_DECODER_FRAME_CONCURENCY_LVL *
+			VPX_DECODER_FRAME_BIN_HDR_BUDGET_RATIO_NUM /
+			VPX_DECODER_FRAME_BIN_HDR_BUDGET_RATIO_DEN;
+		binbufer2_size = max_t(u32, size_yuv,
+			((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
+			VPX_DECODER_FRAME_CONCURENCY_LVL *
+			VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO_NUM /
+			VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO_DEN;
+		size = ALIGN(binbuffer1_size + binbufer2_size,
+			VENUS_DMA_ALIGNMENT);
+	} else {
+		size = 0;
+	}
+
+	return size;
+}
+
+static inline u32 calculate_mpeg2d_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, bool is_interlaced)
+{
+	return 0;
+}
+
+static inline u32 calculate_enc_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 work_mode, u32 lcu_size, u32 num_vpp_pipes)
+{
+	u32 aligned_width, aligned_height, bitstream_size;
+	u32 total_bitbin_buffers = 0, size_single_pipe, bitbin_size = 0;
+	u32 sao_bin_buffer_size, padded_bin_size, size = 0;
+
+	aligned_width = ALIGN(width, lcu_size);
+	aligned_height = ALIGN(height, lcu_size);
+	bitstream_size = inst->output_buf_size; //is this correct?
+
+	bitstream_size = ALIGN(bitstream_size, VENUS_DMA_ALIGNMENT);
+	if (work_mode == 2) {//HFI_WORKMODE_2) {
+		total_bitbin_buffers = 3;
+		bitbin_size = bitstream_size * 17 / 10;
+		bitbin_size = ALIGN(bitbin_size, VENUS_DMA_ALIGNMENT);
+	} else {
+		total_bitbin_buffers = 1;
+		bitstream_size = aligned_width * aligned_height * 3;
+		bitbin_size = ALIGN(bitstream_size, VENUS_DMA_ALIGNMENT);
+	}
+	if (num_vpp_pipes > 2)
+		size_single_pipe = bitbin_size / 2;
+	else
+		size_single_pipe = bitbin_size;
+	/* add the condition when CQ mode is in place */
+	/*if (inst->rc_type == RATE_CONTROL_LOSSLESS)
+	 *size_single_pipe <<= 1;
+	 */
+	size_single_pipe = ALIGN(size_single_pipe, VENUS_DMA_ALIGNMENT);
+	sao_bin_buffer_size = (64 * (((width + BUFFER_ALIGNMENT_SIZE(32)) *
+		(height + BUFFER_ALIGNMENT_SIZE(32))) >> 10)) + 384;
+	padded_bin_size = ALIGN(size_single_pipe, VENUS_DMA_ALIGNMENT);
+	size_single_pipe = sao_bin_buffer_size + padded_bin_size;
+	size_single_pipe = ALIGN(size_single_pipe, VENUS_DMA_ALIGNMENT);
+	bitbin_size = size_single_pipe * num_vpp_pipes;
+	size = ALIGN(bitbin_size, VENUS_DMA_ALIGNMENT) * total_bitbin_buffers
+			+ 512;
+
+	return size;
+}
+
+static inline u32 calculate_h264e_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 work_mode, u32 num_vpp_pipes)
+{
+	return calculate_enc_scratch_size(inst, width, height, work_mode, 16,
+		num_vpp_pipes);
+}
+
+static inline u32 calculate_h265e_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 work_mode, u32 num_vpp_pipes)
+{
+	return calculate_enc_scratch_size(inst, width, height, work_mode, 32,
+		num_vpp_pipes);
+}
+
+static inline u32 calculate_vp8e_scratch_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 work_mode, u32 num_vpp_pipes)
+{
+	return calculate_enc_scratch_size(inst, width, height, work_mode, 16,
+		num_vpp_pipes);
+}
+
+static inline u32 hfi_v6_h264d_comv_size(u32 width, u32 height,
+	u32 yuv_buf_min_count)
+{
+	u32 comv_size = 0;
+	u32 frame_width_in_mbs = ((width + 15) >> 4);
+	u32 frame_height_in_mbs = ((height + 15) >> 4);
+	u32 col_mv_aligned_width = (frame_width_in_mbs << 6);
+	u32 col_zero_aligned_width = (frame_width_in_mbs << 2);
+	u32 col_zero_size = 0, size_colloc = 0;
+
+	col_mv_aligned_width = ALIGN(col_mv_aligned_width,
+		BUFFER_ALIGNMENT_SIZE(16));
+	col_zero_aligned_width = ALIGN(col_zero_aligned_width,
+		BUFFER_ALIGNMENT_SIZE(16));
+	col_zero_size = col_zero_aligned_width *
+		((frame_height_in_mbs + 1) >> 1);
+	col_zero_size = ALIGN(col_zero_size, BUFFER_ALIGNMENT_SIZE(64));
+	col_zero_size <<= 1;
+	col_zero_size = ALIGN(col_zero_size, BUFFER_ALIGNMENT_SIZE(512));
+	size_colloc = col_mv_aligned_width  * ((frame_height_in_mbs + 1) >> 1);
+	size_colloc = ALIGN(size_colloc, BUFFER_ALIGNMENT_SIZE(64));
+	size_colloc <<= 1;
+	size_colloc = ALIGN(size_colloc, BUFFER_ALIGNMENT_SIZE(512));
+	size_colloc += (col_zero_size + SIZE_H264D_BUFTAB_T * 2);
+	comv_size = size_colloc * yuv_buf_min_count;
+	comv_size += BUFFER_ALIGNMENT_SIZE(512);
+
+	return comv_size;
+}
+
+static inline u32 size_h264d_bse_cmd_buf(u32 height)
+{
+	u32 aligned_height = ALIGN(height, BUFFER_ALIGNMENT_SIZE(32));
+
+	return min_t(u32, (((aligned_height + 15) >> 4) * 3 * 4),
+		H264D_MAX_SLICE) *
+		SIZE_H264D_BSE_CMD_PER_BUF;
+}
+
+static inline u32 size_h264d_vpp_cmd_buf(u32 height)
+{
+	u32 aligned_height = ALIGN(height, BUFFER_ALIGNMENT_SIZE(32));
+
+	return min_t(u32, (((aligned_height + 15) >> 4) * 3 * 4),
+		H264D_MAX_SLICE) *
+		SIZE_H264D_VPP_CMD_PER_BUF;
+}
+
+static inline u32 hfi_v6_h264d_non_comv_size(u32 width, u32 height,
+	u32 num_vpp_pipes)
+{
+	u32 size;
+	u32 size_bse, size_vpp;
+
+	size_bse = size_h264d_bse_cmd_buf(height);
+	size_vpp = size_h264d_vpp_cmd_buf(height);
+	size = ALIGN(size_bse, VENUS_DMA_ALIGNMENT) +
+		ALIGN(size_vpp, VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_HW_PIC(SIZE_H264D_HW_PIC_T), VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H264D_LB_FE_TOP_DATA(width, height),
+			  VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H264D_LB_FE_TOP_CTRL(width, height),
+			  VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H264D_LB_FE_LEFT_CTRL(width, height),
+			  VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_H264D_LB_SE_TOP_CTRL(width, height),
+			  VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H264D_LB_SE_LEFT_CTRL(width, height),
+			  VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_H264D_LB_PE_TOP_DATA(width, height),
+			  VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H264D_LB_VSP_TOP(width, height),
+			  VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H264D_LB_RECON_DMA_METADATA_WR(width, height),
+			  VENUS_DMA_ALIGNMENT) * 2 +
+		ALIGN(SIZE_H264D_QP(width, height), VENUS_DMA_ALIGNMENT);
+	size = ALIGN(size, VENUS_DMA_ALIGNMENT);
+	return size;
+}
+
+static inline u32 size_h265d_bse_cmd_buf(u32 width, u32 height)
+{
+	u32 size;
+
+	size = (ALIGN(width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+		(ALIGN(height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+		NUM_HW_PIC_BUF;
+	size = min_t(u32, size, H265D_MAX_SLICE + 1);
+	size = 2 * size * SIZE_H265D_BSE_CMD_PER_BUF;
+	size = ALIGN(size, VENUS_DMA_ALIGNMENT);
+
+	return size;
+}
+
+static inline u32 size_h265d_vpp_cmd_buf(u32 width, u32 height)
+{
+	u32 size = 0;
+
+	size = (ALIGN(width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+		(ALIGN(height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+		NUM_HW_PIC_BUF;
+	size = min_t(u32, size, H265D_MAX_SLICE + 1);
+	size = ALIGN(size, 4);
+	size = 2 * size * SIZE_H265D_VPP_CMD_PER_BUF;
+	size = ALIGN(size, VENUS_DMA_ALIGNMENT);
+
+	return size;
+}
+
+static inline u32 hfi_v6_h265d_comv_size(u32 width, u32 height,
+	u32 yuv_buf_count_min)
+{
+	u32 size = 0;
+
+	size = ALIGN(((((width + 15) >> 4) * ((height + 15) >> 4)) << 8),
+				 BUFFER_ALIGNMENT_SIZE(512));
+	size *= yuv_buf_count_min;
+	size += BUFFER_ALIGNMENT_SIZE(512);
+
+	return size;
+}
+
+static inline u32 hfi_v6_h265d_non_comv_size(u32 width, u32 height,
+	u32 num_vpp_pipes)
+{
+	u32 size_bse, size_vpp;
+	u32 size = 0;
+
+	size_bse = size_h265d_bse_cmd_buf(width, height);
+	size_vpp = size_h265d_vpp_cmd_buf(width, height);
+	size = ALIGN(size_bse, VENUS_DMA_ALIGNMENT) +
+		ALIGN(size_vpp, VENUS_DMA_ALIGNMENT) +
+		ALIGN(NUM_HW_PIC_BUF * 20 * 22 * 4, VENUS_DMA_ALIGNMENT) +
+		ALIGN(2 * sizeof(u16) *
+		(ALIGN(width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+			(ALIGN(height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_HW_PIC(SIZE_H265D_HW_PIC_T), VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H265D_LB_FE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H265D_LB_FE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H265D_LB_FE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_H265D_LB_SE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_H265D_LB_SE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H265D_LB_PE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H265D_LB_VSP_TOP(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_H265D_LB_VSP_LEFT(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_H265D_LB_RECON_DMA_METADATA_WR(width, height),
+			VENUS_DMA_ALIGNMENT) * 4 +
+		ALIGN(SIZE_H265D_QP(width, height), VENUS_DMA_ALIGNMENT);
+	size = ALIGN(size, VENUS_DMA_ALIGNMENT);
+	return size;
+}
+
+static inline u32 hfi_v6_vp8d_comv_size(u32 width, u32 height,
+	u32 yuv_min_buf_count)
+{
+	return (((width + 15) >> 4) * ((height + 15) >> 4) * 8 * 2);
+}
+
+static inline u32 calculate_h264d_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 min_buf_count, bool split_mode_enabled,
+	u32 num_vpp_pipes)
+{
+	u32 co_mv_size = 0, nonco_mv_size = 0;
+	u32 vpss_lb_size = 0;
+	u32 size = 0;
+
+	co_mv_size = hfi_v6_h264d_comv_size(width, height, min_buf_count);
+	nonco_mv_size = hfi_v6_h264d_non_comv_size(width, height,
+			num_vpp_pipes);
+	if (split_mode_enabled)
+		vpss_lb_size = size_vpss_lb(width, height, num_vpp_pipes);
+	size = co_mv_size + nonco_mv_size + vpss_lb_size;
+	return size;
+}
+
+static inline u32 calculate_h265d_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 min_buf_count, bool split_mode_enabled,
+	u32 num_vpp_pipes)
+{
+	u32 co_mv_size = 0, nonco_mv_size = 0;
+	u32 vpss_lb_size = 0;
+	u32 size = 0;
+
+	co_mv_size = hfi_v6_h265d_comv_size(width, height, min_buf_count);
+	nonco_mv_size =
+		hfi_v6_h265d_non_comv_size(width, height, num_vpp_pipes);
+	if (split_mode_enabled)
+		vpss_lb_size = size_vpss_lb(width, height, num_vpp_pipes);
+
+	size = co_mv_size + nonco_mv_size + vpss_lb_size +
+			HDR10_HIST_EXTRADATA_SIZE;
+	return size;
+}
+
+static inline u32 calculate_vp8d_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 min_buf_count, bool split_mode_enabled,
+	u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0;
+	u32 size = 0;
+
+	size = hfi_v6_vp8d_comv_size(width, height, 0);
+	size += ALIGN(SIZE_VPXD_LB_FE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_VPXD_LB_SE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_VP8D_LB_VSP_TOP(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VPXD_LB_FE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		2 * ALIGN(SIZE_VPXD_LB_RECON_DMA_METADATA_WR(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VPXD_LB_SE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VP8D_LB_PE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VP8D_LB_FE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT);
+	if (split_mode_enabled)
+		vpss_lb_size = size_vpss_lb(width, height, num_vpp_pipes);
+
+	size += vpss_lb_size;
+	return size;
+}
+
+static inline u32 calculate_vp9d_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 min_buf_count, bool split_mode_enabled,
+	u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0;
+	u32 size = 0;
+
+	size = ALIGN(SIZE_VPXD_LB_FE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_VPXD_LB_SE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_VP9D_LB_VSP_TOP(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VPXD_LB_FE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		2 * ALIGN(SIZE_VPXD_LB_RECON_DMA_METADATA_WR(width, height),
+				VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VPXD_LB_SE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VP9D_LB_PE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VP9D_LB_FE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT);
+	if (split_mode_enabled)
+		vpss_lb_size = size_vpss_lb(width, height, num_vpp_pipes);
+
+	size += vpss_lb_size + HDR10_HIST_EXTRADATA_SIZE;
+	return size;
+}
+
+static inline u32 calculate_mpeg2d_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 min_buf_count, bool split_mode_enabled,
+	u32 num_vpp_pipes)
+{
+	u32 vpss_lb_size = 0;
+	u32 size = 0;
+
+	size = ALIGN(SIZE_VPXD_LB_FE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_VPXD_LB_SE_LEFT_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes +
+		ALIGN(SIZE_VP8D_LB_VSP_TOP(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VPXD_LB_FE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		2 * ALIGN(SIZE_VPXD_LB_RECON_DMA_METADATA_WR(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VPXD_LB_SE_TOP_CTRL(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VP8D_LB_PE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT) +
+		ALIGN(SIZE_VP8D_LB_FE_TOP_DATA(width, height),
+			VENUS_DMA_ALIGNMENT);
+	if (split_mode_enabled)
+		vpss_lb_size = size_vpss_lb(width, height, num_vpp_pipes);
+
+	size += vpss_lb_size;
+	return size;
+}
+
+static inline u32 calculate_enc_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 lcu_size, u32 num_ref, bool ten_bit,
+	u32 num_vpp_pipes, bool is_h265)
+{
+	u32 line_buf_ctrl_size, line_buf_data_size, leftline_buf_ctrl_size;
+	u32 line_buf_sde_size, sps_pps_slice_hdr, topline_buf_ctrl_size_FE;
+	u32 leftline_buf_ctrl_size_FE, line_buf_recon_pix_size;
+	u32 leftline_buf_recon_pix_size, lambda_lut_size, override_buffer_size;
+	u32 col_mv_buf_size, vpp_reg_buffer_size, ir_buffer_size;
+	u32 vpss_line_buf, leftline_buf_meta_recony, h265e_colrcbuf_size;
+	u32 h265e_framerc_bufsize, h265e_lcubitcnt_bufsize;
+	u32 h265e_lcubitmap_bufsize, se_stats_bufsize;
+	u32 bse_reg_buffer_size, bse_slice_cmd_buffer_size, slice_info_bufsize;
+	u32 line_buf_ctrl_size_buffid2, slice_cmd_buffer_size;
+	u32 width_lcu_num, height_lcu_num, width_coded, height_coded;
+	u32 frame_num_lcu, linebuf_meta_recon_uv, topline_bufsize_fe_1stg_sao;
+	u32 output_mv_bufsize = 0, temp_scratch_mv_bufsize = 0;
+	u32 size, bit_depth, num_LCUMB;
+	u32 vpss_lineBufferSize_1 = 0;
+
+	width_lcu_num = ((width)+(lcu_size)-1) / (lcu_size);
+	height_lcu_num = ((height)+(lcu_size)-1) / (lcu_size);
+	frame_num_lcu = width_lcu_num * height_lcu_num;
+	width_coded = width_lcu_num * (lcu_size);
+	height_coded = height_lcu_num * (lcu_size);
+	num_LCUMB = (height_coded / lcu_size) *
+		((width_coded + lcu_size * 8) / lcu_size);
+	slice_info_bufsize = (256 + (frame_num_lcu << 4));
+	slice_info_bufsize = ALIGN(slice_info_bufsize, VENUS_DMA_ALIGNMENT);
+	line_buf_ctrl_size = ALIGN(width_coded, VENUS_DMA_ALIGNMENT);
+	line_buf_ctrl_size_buffid2 = ALIGN(width_coded, VENUS_DMA_ALIGNMENT);
+
+	bit_depth = ten_bit ? 10 : 8;
+	line_buf_data_size = (((((bit_depth * width_coded + 1024) +
+	(VENUS_DMA_ALIGNMENT - 1)) & (~(VENUS_DMA_ALIGNMENT - 1))) * 1) +
+	(((((bit_depth * width_coded + 1024) >> 1) +
+	(VENUS_DMA_ALIGNMENT - 1)) &
+	(~(VENUS_DMA_ALIGNMENT - 1))) * 2));
+	leftline_buf_ctrl_size = (is_h265) ?
+		((height_coded + (BUFFER_ALIGNMENT_SIZE(32))) /
+		BUFFER_ALIGNMENT_SIZE(32) * 4 * 16) :
+		((height_coded + 15) / 16 * 5 * 16);
+	if (num_vpp_pipes > 1) {
+		leftline_buf_ctrl_size += BUFFER_ALIGNMENT_SIZE(512);
+		leftline_buf_ctrl_size = ALIGN(leftline_buf_ctrl_size,
+			BUFFER_ALIGNMENT_SIZE(512)) * num_vpp_pipes;
+	}
+	leftline_buf_ctrl_size = ALIGN(leftline_buf_ctrl_size,
+		VENUS_DMA_ALIGNMENT);
+	leftline_buf_recon_pix_size = (((ten_bit + 1) * 2 *
+		(height_coded)+VENUS_DMA_ALIGNMENT) +
+	(VENUS_DMA_ALIGNMENT << (num_vpp_pipes - 1)) - 1) &
+		(~((VENUS_DMA_ALIGNMENT << (num_vpp_pipes - 1)) - 1)) * 1;
+	topline_buf_ctrl_size_FE = (is_h265) ? (64 * (width_coded >> 5)) :
+		(VENUS_DMA_ALIGNMENT + 16 * (width_coded >> 4));
+	topline_buf_ctrl_size_FE = ALIGN(topline_buf_ctrl_size_FE,
+		VENUS_DMA_ALIGNMENT);
+	leftline_buf_ctrl_size_FE = (((VENUS_DMA_ALIGNMENT + 64 *
+		(height_coded >> 4)) +
+		(VENUS_DMA_ALIGNMENT << (num_vpp_pipes - 1)) - 1) &
+		(~((VENUS_DMA_ALIGNMENT << (num_vpp_pipes - 1)) - 1)) * 1) *
+		num_vpp_pipes;
+	leftline_buf_meta_recony = (VENUS_DMA_ALIGNMENT + 64 *
+		((height_coded) / (8 * (ten_bit ? 4 : 8))));
+	leftline_buf_meta_recony = ALIGN(leftline_buf_meta_recony,
+		VENUS_DMA_ALIGNMENT);
+	leftline_buf_meta_recony = leftline_buf_meta_recony *
+		num_vpp_pipes;
+	linebuf_meta_recon_uv = (VENUS_DMA_ALIGNMENT + 64 *
+		((height_coded) / (4 * (ten_bit ? 4 : 8))));
+	linebuf_meta_recon_uv = ALIGN(linebuf_meta_recon_uv,
+		VENUS_DMA_ALIGNMENT);
+	linebuf_meta_recon_uv = linebuf_meta_recon_uv *
+		num_vpp_pipes;
+	line_buf_recon_pix_size = ((ten_bit ? 3 : 2) * width_coded);
+	line_buf_recon_pix_size = ALIGN(line_buf_recon_pix_size,
+		VENUS_DMA_ALIGNMENT);
+	slice_cmd_buffer_size = ALIGN(20480, VENUS_DMA_ALIGNMENT);
+	sps_pps_slice_hdr = 2048 + 4096;
+	col_mv_buf_size = (is_h265) ? (16 * ((frame_num_lcu << 2) +
+		BUFFER_ALIGNMENT_SIZE(32))) :
+		(3 * 16 * (width_lcu_num * height_lcu_num +
+		BUFFER_ALIGNMENT_SIZE(32)));
+	col_mv_buf_size = ALIGN(col_mv_buf_size, VENUS_DMA_ALIGNMENT)
+		* (num_ref + 1);
+	h265e_colrcbuf_size = (((width_lcu_num + 7) >> 3) *
+		16 * 2 * height_lcu_num);
+	if (num_vpp_pipes > 1)
+		h265e_colrcbuf_size = ALIGN(h265e_colrcbuf_size,
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes;
+	h265e_colrcbuf_size = ALIGN(h265e_colrcbuf_size,
+		VENUS_DMA_ALIGNMENT) * HFI_MAX_COL_FRAME;
+	h265e_framerc_bufsize = (is_h265) ? (256 + 16 *
+		(14 + (((height_coded >> 5) + 7) >> 3))) :
+		(256 + 16 * (14 + (((height_coded >> 4) + 7) >> 3)));
+	h265e_framerc_bufsize *= 6;   /* multiply by max numtilescol*/
+	if (num_vpp_pipes > 1)
+		h265e_framerc_bufsize = ALIGN(h265e_framerc_bufsize,
+			VENUS_DMA_ALIGNMENT) * num_vpp_pipes;
+
+	h265e_framerc_bufsize = ALIGN(h265e_framerc_bufsize,
+		BUFFER_ALIGNMENT_SIZE(512)) * HFI_MAX_COL_FRAME;
+	h265e_lcubitcnt_bufsize = (256 + 4 * frame_num_lcu);
+	h265e_lcubitcnt_bufsize = ALIGN(h265e_lcubitcnt_bufsize,
+		VENUS_DMA_ALIGNMENT);
+	h265e_lcubitmap_bufsize = 256 + (frame_num_lcu >> 3);
+	h265e_lcubitmap_bufsize = ALIGN(h265e_lcubitmap_bufsize,
+		VENUS_DMA_ALIGNMENT);
+	line_buf_sde_size = 256 + 16 * (width_coded >> 4);
+	line_buf_sde_size = ALIGN(line_buf_sde_size, VENUS_DMA_ALIGNMENT);
+	if ((width_coded * height_coded) > (4096 * 2160))
+		se_stats_bufsize = 0;
+	else if ((width_coded * height_coded) > (1920 * 1088))
+		se_stats_bufsize = (40 * 4 * frame_num_lcu + 256 + 256);
+	else
+		se_stats_bufsize = (1024 * frame_num_lcu + 256 + 256);
+
+	se_stats_bufsize = ALIGN(se_stats_bufsize, VENUS_DMA_ALIGNMENT) * 2;
+	bse_slice_cmd_buffer_size = ((((8192 << 2) + 7) & (~7)) * 6);
+	bse_reg_buffer_size = ((((512 << 3) + 7) & (~7)) * 4);
+	vpp_reg_buffer_size = ((((HFI_VENUS_VPPSG_MAX_REGISTERS << 3) + 31) &
+		(~31)) * 10);
+	lambda_lut_size = (256 * 11);
+	override_buffer_size = 16 * ((num_LCUMB + 7) >> 3);
+	override_buffer_size = ALIGN(override_buffer_size,
+		VENUS_DMA_ALIGNMENT) * 2;
+	ir_buffer_size = (((frame_num_lcu << 1) + 7) & (~7)) * 3;
+	vpss_lineBufferSize_1 = ((((8192) >> 2) << 5) * num_vpp_pipes) + 64;
+	vpss_line_buf = (((((max(width_coded, height_coded) + 3) >> 2) << 5)
+		+ 256) * 16) +
+		vpss_lineBufferSize_1;
+	topline_bufsize_fe_1stg_sao = (16 * (width_coded >> 5));
+	topline_bufsize_fe_1stg_sao = ALIGN(topline_bufsize_fe_1stg_sao,
+		VENUS_DMA_ALIGNMENT);
+	size = line_buf_ctrl_size + line_buf_data_size +
+		line_buf_ctrl_size_buffid2 + leftline_buf_ctrl_size +
+		vpss_line_buf + col_mv_buf_size + topline_buf_ctrl_size_FE +
+		leftline_buf_ctrl_size_FE + line_buf_recon_pix_size +
+		leftline_buf_recon_pix_size + leftline_buf_meta_recony +
+		linebuf_meta_recon_uv + h265e_colrcbuf_size +
+		h265e_framerc_bufsize + h265e_lcubitcnt_bufsize +
+		h265e_lcubitmap_bufsize + line_buf_sde_size +
+		topline_bufsize_fe_1stg_sao + override_buffer_size +
+		bse_reg_buffer_size + vpp_reg_buffer_size +
+		sps_pps_slice_hdr + slice_cmd_buffer_size +
+		bse_slice_cmd_buffer_size + ir_buffer_size + slice_info_bufsize
+		+ lambda_lut_size + se_stats_bufsize + temp_scratch_mv_bufsize
+		+ output_mv_bufsize + 1024;
+	return size;
+}
+
+static inline u32 calculate_h264e_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 num_ref, bool ten_bit, u32 num_vpp_pipes)
+{
+	return calculate_enc_scratch1_size(inst, width, height, 16,
+		num_ref, ten_bit, num_vpp_pipes, false);
+}
+
+static inline u32 calculate_h265e_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 num_ref, bool ten_bit, u32 num_vpp_pipes)
+{
+	return calculate_enc_scratch1_size(inst, width, height, 32,
+		num_ref, ten_bit, num_vpp_pipes, true);
+}
+
+static inline u32 calculate_vp8e_scratch1_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 num_ref, bool ten_bit, u32 num_vpp_pipes)
+{
+	(void)num_vpp_pipes;
+	return calculate_enc_scratch1_size(inst, width, height, 16,
+		num_ref, ten_bit, 1, false);
+}
+
+static inline u32 hfi_ubwc_calc_metadata_plane_stride(u32 width,
+	u32 metadata_stride_multi, u32 tile_width_pels)
+{
+	return ALIGN(((width + (tile_width_pels - 1)) / tile_width_pels),
+		metadata_stride_multi);
+}
+
+static inline u32 hfi_ubwc_metadata_plane_bufheight(u32 height,
+	u32 metadata_height_multi, u32 tile_height_pels)
+{
+	return ALIGN(((height + (tile_height_pels - 1)) / tile_height_pels),
+		metadata_height_multi);
+}
+
+static inline u32 hfi_ubwc_metadata_plane_buffer_size(u32 metadata_stride,
+	u32 metadata_buf_height)
+{
+	return ALIGN(metadata_stride * metadata_buf_height,
+		BUFFER_ALIGNMENT_4096_BYTES);
+}
+
+static inline u32 hfi_ubwc_uv_metadata_plane_stride(u32 width,
+	u32 metadata_stride_multi, u32 tile_width_pels)
+{
+	return ALIGN(((((width + 1) >> 1) + (tile_width_pels - 1)) /
+		tile_width_pels), metadata_stride_multi);
+}
+
+static inline u32 hfi_ubwc_uv_metadata_plane_bufheight(u32 height,
+	u32 metadata_height_multi, u32 tile_height_pels)
+{
+	return ALIGN(((((height + 1) >> 1) + (tile_height_pels - 1)) /
+		tile_height_pels), metadata_height_multi);
+}
+
+static inline u32 calculate_enc_scratch2_size(struct venus_inst *inst,
+	u32 width, u32 height, u32 num_ref, bool ten_bit)
+{
+	u32 aligned_width, aligned_height, chroma_height, ref_buf_height;
+	u32 luma_size, chroma_size;
+	u32 metadata_stride, meta_buf_height, meta_size_y, meta_size_c;
+	u32 ref_luma_stride_bytes, ref_chroma_height_bytes;
+	u32 ref_buf_size = 0, ref_stride;
+	u32 size;
+
+	if (!ten_bit) {
+		aligned_height = ALIGN(height, HFI_VENUS_HEIGHT_ALIGNMENT);
+		chroma_height = height >> 1;
+		chroma_height = ALIGN(chroma_height,
+			HFI_VENUS_HEIGHT_ALIGNMENT);
+		aligned_width = ALIGN(width, HFI_VENUS_WIDTH_ALIGNMENT);
+		metadata_stride = hfi_ubwc_calc_metadata_plane_stride(width,
+			64, HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_WIDTH);
+		meta_buf_height = hfi_ubwc_metadata_plane_bufheight(height,
+			16, HFI_COLOR_FORMAT_YUV420_NV12_UBWC_Y_TILE_HEIGHT);
+		meta_size_y = hfi_ubwc_metadata_plane_buffer_size(
+			metadata_stride, meta_buf_height);
+		meta_size_c = hfi_ubwc_metadata_plane_buffer_size(
+			metadata_stride, meta_buf_height);
+		size = (aligned_height + chroma_height) * aligned_width +
+			meta_size_y + meta_size_c;
+		size = (size * (num_ref+3)) + 4096;
+	} else {
+		ref_buf_height = (height + (HFI_VENUS_HEIGHT_ALIGNMENT - 1))
+			& (~(HFI_VENUS_HEIGHT_ALIGNMENT - 1));
+		ref_luma_stride_bytes = ((width + SYSTEM_LAL_TILE10 - 1) /
+			SYSTEM_LAL_TILE10) * SYSTEM_LAL_TILE10;
+		ref_stride = 4 * (ref_luma_stride_bytes / 3);
+		ref_stride = (ref_stride + (BUFFER_ALIGNMENT_SIZE(128) - 1)) &
+			(~(BUFFER_ALIGNMENT_SIZE(128) - 1));
+		luma_size = ref_buf_height * ref_stride;
+		ref_chroma_height_bytes = (((height + 1) >> 1) +
+			(BUFFER_ALIGNMENT_SIZE(32) - 1)) &
+			(~(BUFFER_ALIGNMENT_SIZE(32) - 1));
+		chroma_size = ref_stride * ref_chroma_height_bytes;
+		luma_size = (luma_size + (BUFFER_ALIGNMENT_4096_BYTES - 1)) &
+			(~(BUFFER_ALIGNMENT_4096_BYTES - 1));
+		chroma_size = (chroma_size +
+			(BUFFER_ALIGNMENT_4096_BYTES - 1)) &
+			(~(BUFFER_ALIGNMENT_4096_BYTES - 1));
+		ref_buf_size = luma_size + chroma_size;
+		metadata_stride = hfi_ubwc_calc_metadata_plane_stride(
+			width,
+			VENUS_METADATA_STRIDE_MULTIPLE,
+			HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_WIDTH);
+		meta_buf_height = hfi_ubwc_metadata_plane_bufheight(
+			height,
+			VENUS_METADATA_HEIGHT_MULTIPLE,
+			HFI_COLOR_FORMAT_YUV420_TP10_UBWC_Y_TILE_HEIGHT);
+		meta_size_y = hfi_ubwc_metadata_plane_buffer_size(
+			metadata_stride, meta_buf_height);
+		meta_size_c = hfi_ubwc_metadata_plane_buffer_size(
+			metadata_stride, meta_buf_height);
+		size = ref_buf_size + meta_size_y + meta_size_c;
+		size = (size * (num_ref+3)) + 4096;
+	}
+	return size;
+}
+
+static inline u32 calculate_enc_persist_size(void)
+{
+	return HFI_V6_ENC_PERSIST_SIZE;
+}
+
+static inline u32 calculate_h264d_persist1_size(void)
+{
+	u32 size = 0;
+
+	size = ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264),
+			VENUS_DMA_ALIGNMENT);
+	return size;
+}
+
+static inline u32 calculate_h265d_persist1_size(void)
+{
+	u32 size = 0;
+
+	size = ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + H265_NUM_TILE
+			* sizeof(u32)), VENUS_DMA_ALIGNMENT);
+	return size;
+}
+
+static inline u32 calculate_vp8d_persist1_size(void)
+{
+	u32 size = 0;
+
+	size = ALIGN(VP8_NUM_PROBABILITY_TABLE_BUF * VP8_PROB_TABLE_SIZE,
+			VENUS_DMA_ALIGNMENT);
+	return size;
+}
+
+static inline u32 calculate_vp9d_persist1_size(void)
+{
+	u32 size = 0;
+
+	size = ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE,
+			VENUS_DMA_ALIGNMENT) +
+			ALIGN(HFI_V6_VP9D_COMV_SIZE, VENUS_DMA_ALIGNMENT) +
+			ALIGN(MAX_SUPERFRAME_HEADER_LEN, VENUS_DMA_ALIGNMENT) +
+			ALIGN(VP9_UDC_HEADER_BUF_SIZE, VENUS_DMA_ALIGNMENT) +
+			ALIGN(VP9_NUM_FRAME_INFO_BUF * CCE_TILE_OFFSET_SIZE,
+			VENUS_DMA_ALIGNMENT);
+	return size;
+}
+
+static inline u32 calculate_mpeg2d_persist1_size(void)
+{
+	return QMATRIX_SIZE + MP2D_QPDUMP_SIZE;
+}
+
+static struct venus_dec_buff_size_calculators h264d_calculators = {
+	.calculate_scratch_size = calculate_h264d_scratch_size,
+	.calculate_scratch1_size = calculate_h264d_scratch1_size,
+	.calculate_persist1_size = calculate_h264d_persist1_size,
+};
+
+static struct venus_dec_buff_size_calculators h265d_calculators = {
+	.calculate_scratch_size = calculate_h265d_scratch_size,
+	.calculate_scratch1_size = calculate_h265d_scratch1_size,
+	.calculate_persist1_size = calculate_h265d_persist1_size,
+};
+
+static struct venus_dec_buff_size_calculators vp8d_calculators = {
+	.calculate_scratch_size = calculate_vpxd_scratch_size,
+	.calculate_scratch1_size = calculate_vp8d_scratch1_size,
+	.calculate_persist1_size = calculate_vp8d_persist1_size,
+};
+
+static struct venus_dec_buff_size_calculators vp9d_calculators = {
+	.calculate_scratch_size = calculate_vpxd_scratch_size,
+	.calculate_scratch1_size = calculate_vp9d_scratch1_size,
+	.calculate_persist1_size = calculate_vp9d_persist1_size,
+};
+
+static struct venus_dec_buff_size_calculators mpeg2d_calculators = {
+	.calculate_scratch_size = calculate_mpeg2d_scratch_size,
+	.calculate_scratch1_size = calculate_mpeg2d_scratch1_size,
+	.calculate_persist1_size = calculate_mpeg2d_persist1_size,
+};
+
+static struct venus_enc_buff_size_calculators h264e_calculators = {
+	.calculate_scratch_size = calculate_h264e_scratch_size,
+	.calculate_scratch1_size = calculate_h264e_scratch1_size,
+	.calculate_scratch2_size = calculate_enc_scratch2_size,
+	.calculate_persist_size = calculate_enc_persist_size,
+};
+
+static struct venus_enc_buff_size_calculators h265e_calculators = {
+	.calculate_scratch_size = calculate_h265e_scratch_size,
+	.calculate_scratch1_size = calculate_h265e_scratch1_size,
+	.calculate_scratch2_size = calculate_enc_scratch2_size,
+	.calculate_persist_size = calculate_enc_persist_size,
+};
+
+static struct venus_enc_buff_size_calculators vp8e_calculators = {
+	.calculate_scratch_size = calculate_vp8e_scratch_size,
+	.calculate_scratch1_size = calculate_vp8e_scratch1_size,
+	.calculate_scratch2_size = calculate_enc_scratch2_size,
+	.calculate_persist_size = calculate_enc_persist_size,
+};
+
+int venus_calculate_output_buffer_count(struct venus_inst *inst,
+	struct hfi_buffer_requirements *bufreq)
+{
+	u32 output_min_count;
+	const struct venus_format *fmt;
+
+	if (!inst)
+		return -EINVAL;
+
+	fmt = inst->fmt_out;
+
+	if (!(inst->session_type == VIDC_SESSION_TYPE_DEC) &&
+		!(inst->session_type == VIDC_SESSION_TYPE_ENC))
+		return 0;
+
+	/* Update output buff count: Changes for decoder based on codec */
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
+		switch (fmt->pixfmt) {
+		case V4L2_PIX_FMT_MPEG2:
+		case V4L2_PIX_FMT_VP8:
+			output_min_count = 6;
+			break;
+		case V4L2_PIX_FMT_VP9:
+			output_min_count = 9;
+			break;
+		default:
+			output_min_count = 8; //H264, HEVC
+		}
+	} else {
+		output_min_count = MIN_ENC_OUTPUT_BUFFERS;
+	}
+
+	bufreq->count_min = output_min_count;
+
+	return 0;
+}
+
+
+int venus_get_buf_req_dec(struct venus_inst *inst, u32 buf_type,
+	struct hfi_buffer_requirements *bufreq)
+{
+	u32 width, height, i, out_min_count, num_vpp_pipes;
+	struct venus_core *core = inst->core;
+	const struct venus_format *fmt;
+	struct venus_dec_buff_size_calculators *dec_calc;
+	bool is_secondary_output_mode;
+
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	num_vpp_pipes = core->hfi_data->num_vpp_pipes;
+	fmt = inst->fmt_out;
+	switch (fmt->pixfmt) {
+	case V4L2_PIX_FMT_H264:
+		dec_calc = &h264d_calculators;
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		dec_calc = &h265d_calculators;
+		break;
+	case V4L2_PIX_FMT_VP8:
+		dec_calc = &vp8d_calculators;
+		break;
+	case V4L2_PIX_FMT_VP9:
+		dec_calc = &vp9d_calculators;
+		break;
+	case V4L2_PIX_FMT_MPEG2:
+		dec_calc = &mpeg2d_calculators;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	width = inst->width;
+	height = inst->height;
+	is_secondary_output_mode =
+		(inst->opb_buftype == HFI_BUFFER_OUTPUT2) ? true : false;
+	memset(bufreq, 0, sizeof(*bufreq));
+	for (i = 0; i < HFI_BUFFER_TYPE_MAX; i++) {
+		bool internal_buffer_type = false;
+
+		if (buf_type == HFI_BUFFER_INPUT) {
+			bufreq->count_min = MIN_INPUT_BUFFERS;
+		} else if (buf_type == HFI_BUFFER_OUTPUT ||
+			buf_type == HFI_BUFFER_OUTPUT2) {
+			return venus_calculate_output_buffer_count(inst,
+				bufreq);
+		} else if (buf_type ==
+			HFI_BUFFER_INTERNAL_SCRATCH(core->res->hfi_version)) {
+			bool is_interlaced =
+				(inst->pic_struct !=
+				HFI_INTERLACE_FRAME_PROGRESSIVE) ? true : false;
+			bufreq->size = dec_calc->calculate_scratch_size(
+					inst, width, height, is_interlaced);
+			internal_buffer_type = true;
+		} else if (buf_type ==
+			HFI_BUFFER_INTERNAL_SCRATCH_1(core->res->hfi_version)) {
+			out_min_count = inst->num_output_bufs;
+			bufreq->size = dec_calc->calculate_scratch1_size(
+					inst, width, height, out_min_count,
+					is_secondary_output_mode,
+					num_vpp_pipes);
+			internal_buffer_type = true;
+		} else if (buf_type == HFI_BUFFER_INTERNAL_PERSIST_1) {
+			out_min_count = inst->num_output_bufs;
+			bufreq->size = dec_calc->calculate_scratch1_size(
+					inst, width, height, out_min_count,
+					is_secondary_output_mode,
+					num_vpp_pipes);
+			internal_buffer_type = true;
+		}
+		if (internal_buffer_type) {
+			bufreq->hold_count = bufreq->count_min =
+				bufreq->count_actual = 1;
+			bufreq->alignment = 256;
+		}
+	}
+	return 0;
+}
+
+int venus_get_buf_req_enc(struct venus_inst *inst, u32 buf_type,
+	struct hfi_buffer_requirements *bufreq)
+{
+	struct venus_enc_buff_size_calculators *enc_calc;
+	struct venus_core *core = inst->core;
+	u32 width, height, i, num_ref, num_vpp_pipes;
+	bool is_tenbit = false;
+	int num_bframes;
+	const struct venus_format *fmt;
+	u32 work_mode = 2;
+
+	if (!inst || !inst->core)
+		return -EINVAL;
+
+	num_vpp_pipes = core->hfi_data->num_vpp_pipes;
+	fmt = inst->fmt_cap;
+	switch (fmt->pixfmt) {
+	case V4L2_PIX_FMT_H264:
+		enc_calc = &h264e_calculators;
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		enc_calc = &h265e_calculators;
+		break;
+	case V4L2_PIX_FMT_VP8:
+		enc_calc = &vp8e_calculators;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	width = inst->out_width;
+	height = inst->out_height;
+	num_bframes = inst->controls.enc.num_b_frames;
+	if (num_bframes < 0)
+		return -EINVAL;
+
+	num_ref = (num_bframes > 0) ? (num_bframes + 1) : 1;
+	is_tenbit = (inst->bit_depth == VIDC_BITDEPTH_10);
+	memset(bufreq, 0, sizeof(*bufreq));
+
+	for (i = 0; i < HFI_BUFFER_TYPE_MAX; i++) {
+		bool internal_buffer_type = false;
+
+		if (buf_type == HFI_BUFFER_INPUT) {
+			bufreq->count_min = MIN_INPUT_BUFFERS;
+		} else if (buf_type == HFI_BUFFER_OUTPUT ||
+			buf_type == HFI_BUFFER_OUTPUT2) {
+			return venus_calculate_output_buffer_count(inst,
+				bufreq);
+		} else if (buf_type ==
+			HFI_BUFFER_INTERNAL_SCRATCH(core->res->hfi_version)) {
+			bufreq->size = enc_calc->calculate_scratch_size(
+					inst, width, height,
+					work_mode,
+					num_vpp_pipes);
+			internal_buffer_type = true;
+		} else if (buf_type ==
+			HFI_BUFFER_INTERNAL_SCRATCH_1(core->res->hfi_version)) {
+			bufreq->size = enc_calc->calculate_scratch1_size(
+					inst, width, height, num_ref,
+					is_tenbit, num_vpp_pipes);
+			internal_buffer_type = true;
+		} else if (buf_type ==
+			HFI_BUFFER_INTERNAL_SCRATCH_2(core->res->hfi_version)) {
+			bufreq->size = enc_calc->calculate_scratch2_size(
+					inst, width, height, num_ref,
+					is_tenbit);
+			internal_buffer_type = true;
+		} else if (buf_type == HFI_BUFFER_INTERNAL_PERSIST) {
+			bufreq->size = enc_calc->calculate_persist_size();
+		}
+
+		if (internal_buffer_type) {
+			bufreq->alignment = 256;
+			bufreq->hold_count = bufreq->count_min =
+				bufreq->count_actual = 1;
+		}
+	}
+	return 0;
+}
+
+int venus_get_buf_req(struct venus_inst *inst, u32 buf_type,
+	struct hfi_buffer_requirements *bufreq)
+{
+	if (!inst)
+		return -EINVAL;
+
+	if (inst->session_type == VIDC_SESSION_TYPE_DEC)
+		return venus_get_buf_req_dec(inst, buf_type, bufreq);
+	else if (inst->session_type == VIDC_SESSION_TYPE_ENC)
+		return venus_get_buf_req_enc(inst, buf_type, bufreq);
+
+	return 0;
+}
+
diff --git a/drivers/media/platform/qcom/venus/buffers.h b/drivers/media/platform/qcom/venus/buffers.h
new file mode 100644
index 0000000..c306ea3
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/buffers.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __BUFFERS_H__
+#define __BUFFERS_H__
+
+#include <linux/types.h>
+#include "core.h"
+
+struct venus_dec_buff_size_calculators {
+	u32 (*calculate_scratch_size)(struct venus_inst *inst, u32 width,
+	     u32 height, bool is_interlaced);
+	u32 (*calculate_scratch1_size)(struct venus_inst *inst, u32 width,
+	     u32 height, u32 min_buf_count, bool split_mode_enabled,
+	     u32 num_vpp_pipes);
+	u32 (*calculate_persist1_size)(void);
+};
+
+struct venus_enc_buff_size_calculators {
+	u32 (*calculate_scratch_size)(struct venus_inst *inst, u32 width,
+	     u32 height, u32 work_mode, u32 num_vpp_pipes);
+	u32 (*calculate_scratch1_size)(struct venus_inst *inst,
+	     u32 width, u32 height, u32 num_ref, bool ten_bit,
+	     u32 num_vpp_pipes);
+	u32 (*calculate_scratch2_size)(struct venus_inst *inst,
+	     u32 width, u32 height, u32 num_ref, bool ten_bit);
+	u32 (*calculate_persist_size)(void);
+};
+
+int venus_calculate_input_buffer_count(struct venus_inst *inst,
+				       struct hfi_buffer_requirements *bufreq);
+int venus_calculate_output_buffer_count(struct venus_inst *inst,
+					struct hfi_buffer_requirements *bufreq);
+
+int venus_get_buf_req(struct venus_inst *inst, u32 buf_type,
+		      struct hfi_buffer_requirements *bufreq);
+int venus_get_buf_req_dec(struct venus_inst *inst, u32 buf_type,
+			  struct hfi_buffer_requirements *bufreq);
+int venus_get_buf_req_enc(struct venus_inst *inst, u32 buf_type,
+			  struct hfi_buffer_requirements *bufreq);
+
+#endif
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 86dc443..745462b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -390,6 +390,7 @@ struct venus_inst {
 	unsigned int core_acquired: 1;
 	unsigned int bit_depth;
 	struct vb2_buffer *last_buf;
+	unsigned int pic_struct;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 62d1197..33cc161 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -563,6 +563,9 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 	if (req)
 		memset(req, 0, sizeof(*req));
 
+	if (inst->core->hfi_data && inst->core->hfi_data->get_bufreq)
+		return inst->core->hfi_data->get_bufreq(inst, type, req);
+
 	ret = hfi_session_get_property(inst, ptype, &hprop);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.h b/drivers/media/platform/qcom/venus/hfi_platform_data.h
index 55de59b..3890e5a 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_data.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform_data.h
@@ -51,7 +51,10 @@ struct venus_hfi_platform_data {
 	unsigned int venus_codecs_size;
 	struct venus_capability *capabilities;
 	unsigned int capabilities_size;
+	unsigned int num_vpp_pipes;
 	void (*venus_parse_resources)(struct venus_core *core);
+	int (*get_bufreq)(struct venus_inst *inst, u32 buf_type,
+			  struct hfi_buffer_requirements *bufreq);
 };
 
 const struct venus_hfi_platform_data *venus_get_hfi_platform
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7959e45..a0560db 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1357,6 +1357,8 @@ static void vdec_event_change(struct venus_inst *inst,
 	if (inst->bit_depth != ev_data->bit_depth)
 		inst->bit_depth = ev_data->bit_depth;
 
+	if (inst->pic_struct != ev_data->pic_struct)
+		inst->pic_struct = ev_data->pic_struct;
 	VDBGH("event: %s sufficient resources (%ux%u)\n",
 	      sufficient ? "" : "not", ev_data->width, ev_data->height);
 
@@ -1537,6 +1539,7 @@ static int vdec_open(struct file *file)
 	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
 	inst->core_acquired = false;
 	inst->bit_depth = VIDC_BITDEPTH_8;
+	inst->pic_struct = HFI_INTERLACE_FRAME_PROGRESSIVE;
 	init_waitqueue_head(&inst->reconf_wait);
 	venus_helper_init_instance(inst);
 
-- 
1.9.1

