Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A81233EB9A
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 09:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhCQIgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 04:36:10 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7638 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhCQIf5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 04:35:57 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 17 Mar 2021 01:35:57 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Mar 2021 01:35:54 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 17 Mar 2021 14:05:39 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id AEA7121663; Wed, 17 Mar 2021 14:05:37 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] media: venus: Fix internal buffer size calculations for v6.
Date:   Wed, 17 Mar 2021 14:05:28 +0530
Message-Id: <1615970128-25668-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Update persist buffer size for encoder to 204800.
- Update persist buffer size calculation for h264 decoder.
- h264d level 6 support needs update in internal buffer size.
  update below buffers size
  - h264 decoder colocated motion vector buffer.
  - h264 decoder VPP command buffer.
  - h265 decoder VPP command buffer.
- Update VP9_NUM_FRAME_INFO_BUF to 32.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 27 ++++++++++++++--------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index d43d1a5..a41ad63 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -40,7 +40,8 @@
 
 #define MAX_TILE_COLUMNS				32 /* 8K/256 */
 
-#define NUM_HW_PIC_BUF					10
+#define VPP_CMD_MAX_SIZE				BIT(20)
+#define NUM_HW_PIC_BUF					32
 #define BIN_BUFFER_THRESHOLD				(1280 * 736)
 #define H264D_MAX_SLICE					1800
 /* sizeof(h264d_buftab_t) aligned to 256 */
@@ -90,6 +91,7 @@
 #define SIZE_SLIST_BUF_H264		512
 #define LCU_MAX_SIZE_PELS		64
 #define LCU_MIN_SIZE_PELS		16
+#define SIZE_SEI_USERDATA		4096
 
 #define H265D_MAX_SLICE			600
 #define SIZE_H265D_HW_PIC_T		SIZE_H264D_HW_PIC_T
@@ -199,7 +201,7 @@ static inline u32 size_vpxd_lb_se_left_ctrl(u32 width, u32 height)
 #define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO_DEN	2
 
 #define VP8_NUM_FRAME_INFO_BUF			(5 + 1)
-#define VP9_NUM_FRAME_INFO_BUF			(8 + 2 + 1 + 8)
+#define VP9_NUM_FRAME_INFO_BUF			32
 #define VP8_NUM_PROBABILITY_TABLE_BUF		VP8_NUM_FRAME_INFO_BUF
 #define VP9_NUM_PROBABILITY_TABLE_BUF		(VP9_NUM_FRAME_INFO_BUF + 4)
 #define VP8_PROB_TABLE_SIZE			3840
@@ -211,7 +213,7 @@ static inline u32 size_vpxd_lb_se_left_ctrl(u32 width, u32 height)
 
 #define QMATRIX_SIZE				(sizeof(u32) * 128 + 256)
 #define MP2D_QPDUMP_SIZE			115200
-#define HFI_IRIS2_ENC_PERSIST_SIZE		102400
+#define HFI_IRIS2_ENC_PERSIST_SIZE		204800
 #define HFI_MAX_COL_FRAME			6
 #define HFI_VENUS_VENC_TRE_WB_BUFF_SIZE		(65 << 4) /* in Bytes */
 #define HFI_VENUS_VENC_DB_LINE_BUFF_PER_MB	512
@@ -467,7 +469,7 @@ static u32 hfi_iris2_h264d_comv_size(u32 width, u32 height,
 {
 	u32 frame_width_in_mbs = ((width + 15) >> 4);
 	u32 frame_height_in_mbs = ((height + 15) >> 4);
-	u32 col_mv_aligned_width = (frame_width_in_mbs << 6);
+	u32 col_mv_aligned_width = (frame_width_in_mbs << 7);
 	u32 col_zero_aligned_width = (frame_width_in_mbs << 2);
 	u32 col_zero_size = 0, size_colloc = 0, comv_size = 0;
 
@@ -499,10 +501,14 @@ static u32 size_h264d_bse_cmd_buf(u32 height)
 
 static u32 size_h264d_vpp_cmd_buf(u32 height)
 {
+	u32 size = 0;
 	u32 aligned_height = ALIGN(height, 32);
+	size = min_t(u32, (((aligned_height + 15) >> 4) * 3 * 4), H264D_MAX_SLICE) *
+		SIZE_H264D_VPP_CMD_PER_BUF;
+	if (size > VPP_CMD_MAX_SIZE)
+		size = VPP_CMD_MAX_SIZE;
 
-	return min_t(u32, (((aligned_height + 15) >> 4) * 3 * 4),
-		     H264D_MAX_SLICE) * SIZE_H264D_VPP_CMD_PER_BUF;
+	return size;
 }
 
 static u32 hfi_iris2_h264d_non_comv_size(u32 width, u32 height,
@@ -559,8 +565,11 @@ static u32 size_h265d_vpp_cmd_buf(u32 width, u32 height)
 	size = min_t(u32, size, H265D_MAX_SLICE + 1);
 	size = ALIGN(size, 4);
 	size = 2 * size * SIZE_H265D_VPP_CMD_PER_BUF;
+	size = ALIGN(size, HFI_DMA_ALIGNMENT);
+	if (size > VPP_CMD_MAX_SIZE)
+		size = VPP_CMD_MAX_SIZE;
 
-	return ALIGN(size, HFI_DMA_ALIGNMENT);
+	return size;
 }
 
 static u32 hfi_iris2_h265d_comv_size(u32 width, u32 height,
@@ -1004,8 +1013,8 @@ static u32 enc_persist_size(void)
 
 static u32 h264d_persist1_size(void)
 {
-	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264),
-		     HFI_DMA_ALIGNMENT);
+	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264
+		     + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA), HFI_DMA_ALIGNMENT);
 }
 
 static u32 h265d_persist1_size(void)
-- 
2.7.4

