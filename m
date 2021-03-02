Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BE232BAEC
	for <lists+linux-media@lfdr.de>; Wed,  3 Mar 2021 22:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbhCCMIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 07:08:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381316AbhCBU4D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 15:56:03 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F09DC061794;
        Tue,  2 Mar 2021 12:54:23 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 19EC21F4549D
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 3/7] media: uapi: vp8: Add proper kernel-doc documentation
Date:   Tue,  2 Mar 2021 17:54:01 -0300
Message-Id: <20210302205405.69538-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210302205405.69538-1-ezequiel@collabora.com>
References: <20210302205405.69538-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for making the interface public,
document all the structures.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/media/vp8-ctrls.h | 99 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
index f20117e825ef..9f6cb40088a6 100644
--- a/include/media/vp8-ctrls.h
+++ b/include/media/vp8-ctrls.h
@@ -23,6 +23,20 @@
 #define V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA  0x04
 #define V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE     0x08
 
+/**
+ * struct v4l2_vp8_segment - VP8 segment-based adjustments parameters
+ *
+ * @quant_update: update values for the segment quantizer.
+ * @lf_update: update values for the loop filter level.
+ * @segment_probs: branch probabilities of the segment_id decoding tree.
+ * @padding: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_VP8_SEGMENT_FLAG_{}.
+ *
+ * This structure contains segment-based adjustments related parameters.
+ * See the 'update_segmentation()' part of the frame header syntax,
+ * and section '9.3. Segment-Based Adjustments' of the VP8 specification
+ * for more details.
+ */
 struct v4l2_vp8_segment {
 	__s8 quant_update[4];
 	__s8 lf_update[4];
@@ -34,6 +48,22 @@ struct v4l2_vp8_segment {
 #define V4L2_VP8_LF_ADJ_ENABLE	0x01
 #define V4L2_VP8_LF_DELTA_UPDATE	0x02
 #define V4L2_VP8_LF_FILTER_TYPE_SIMPLE	0x04
+
+/**
+ * struct v4l2_vp8_loop_filter - VP8 loop filter parameters
+ *
+ * @ref_frm_delta: Reference frame signed delta values.
+ * @mb_mode_delta: MB prediction mode signed delta values.
+ * @sharpness_level: matches sharpness_level syntax element.
+ * @level: matches loop_filter_level syntax element.
+ * @padding: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_VP8_LF_FLAG_{}.
+ *
+ * This structure contains loop filter related parameters.
+ * See the 'mb_lf_adjustments()' part of the frame header syntax,
+ * and section '9.4. Loop Filter Type and Levels' of the VP8 specification
+ * for more details.
+ */
 struct v4l2_vp8_loop_filter {
 	__s8 ref_frm_delta[4];
 	__s8 mb_mode_delta[4];
@@ -43,6 +73,22 @@ struct v4l2_vp8_loop_filter {
 	__u32 flags;
 };
 
+/**
+ * struct v4l2_vp8_quantization - VP8 quantizattion indices
+ *
+ * @y_ac_qi: luma AC coefficient table index.
+ * @y_dc_delta: luma DC delta vaue.
+ * @y2_dc_delta: y2 block DC delta value.
+ * @y2_ac_delta: y2 block AC delta value.
+ * @uv_dc_delta: chroma DC delta value.
+ * @uv_ac_delta: chroma AC delta value.
+ * @padding: padding field. Should be zeroed by applications.
+
+ * This structure contains the quantization indices present
+ * in 'quant_indices()' part of the frame header syntax.
+ * See section '9.6. Dequantization Indices' of the VP8 specification
+ * for more details.
+ */
 struct v4l2_vp8_quantization {
 	__u8 y_ac_qi;
 	__s8 y_dc_delta;
@@ -55,6 +101,21 @@ struct v4l2_vp8_quantization {
 
 #define V4L2_VP8_COEFF_PROB_CNT 11
 #define V4L2_VP8_MV_PROB_CNT 19
+
+/**
+ * struct v4l2_vp8_entropy - VP8 update probabilities
+ *
+ * @coeff_probs: coefficient probability update values.
+ * @y_mode_probs: luma intra-prediction probabilities.
+ * @uv_mode_probs: chroma intra-prediction probabilities.
+ * @mv_probs: mv decoding probability.
+ * @padding: padding field. Should be zeroed by applications.
+ *
+ * This structure contains the update probabilities present in
+ * 'token_prob_update()' and 'mv_prob_update()' part of the frame header.
+ * See section '17.2. Probability Updates' of the VP8 specification
+ * for more details.
+ */
 struct v4l2_vp8_entropy {
 	__u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT];
 	__u8 y_mode_probs[4];
@@ -63,6 +124,17 @@ struct v4l2_vp8_entropy {
 	__u8 padding[3];
 };
 
+/**
+ * struct v4l2_vp8_entropy_coder_state - VP8 boolean coder state
+ *
+ * @range: coder state value for "Range"
+ * @value: coder state value for "Value"
+ * @bit_count: number of bits left in range "Value".
+ * @padding: padding field. Should be zeroed by applications.
+ *
+ * This structure contains the state for the boolean coder, as
+ * explained in section '7. Boolean Entropy Decoder' of the VP8 specification.
+ */
 struct v4l2_vp8_entropy_coder_state {
 	__u8 range;
 	__u8 value;
@@ -80,6 +152,33 @@ struct v4l2_vp8_entropy_coder_state {
 #define VP8_FRAME_IS_KEY_FRAME(hdr) \
 	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
 
+/**
+ * struct v4l2_vp8_frame - VP8 frame parameters
+ *
+ * @seg: segmentation parameters. See &v4l2_vp8_segment for more details
+ * @lf: loop filter parameters. See &v4l2_vp8_loop_filter for more details
+ * @quant: quantization parameters. See &v4l2_vp8_quantization for more details
+ * @probs: probabilities. See &v4l2_vp9_probabilities for more details
+ * @width: frame width.
+ * @height: frame height.
+ * @horizontal_scale: horizontal scaling factor.
+ * @vertical_scale: vertical scaling factor.
+ * @version: bitstream version.
+ * @prob_skip_false: frame header syntax element.
+ * @prob_intra: frame header syntax element.
+ * @prob_last: frame header syntax element.
+ * @prob_gf: frame header syntax element.
+ * @num_dct_parts: number of DCT coefficients partitions.
+ * @first_part_size: size of the first partition, i.e. the control partition.
+ * @first_part_header_bits: size in bits of the first partition header portion.
+ * @dct_part_sizes: DCT coefficients sizes.
+ * @last_frame_ts: "last" reference buffer timestamp.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @golden_frame_ts: "golden" reference buffer timestamp.
+ * @alt_frame_ts: "alt" reference buffer timestamp.
+ * @flags: see V4L2_VP8_FRAME_FLAG_{}.
+ */
 struct v4l2_ctrl_vp8_frame {
 	struct v4l2_vp8_segment seg;
 	struct v4l2_vp8_loop_filter lf;
-- 
2.30.0

