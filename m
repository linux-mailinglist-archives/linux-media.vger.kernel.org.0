Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0850234D6B2
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 20:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhC2SOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 14:14:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52806 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbhC2SOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 14:14:09 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 50CF21F455BE
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 1/9] media: uapi: mpeg2: Rework quantization matrices semantics
Date:   Mon, 29 Mar 2021 15:13:21 -0300
Message-Id: <20210329181329.48006-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210329181329.48006-1-ezequiel@collabora.com>
References: <20210329181329.48006-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As stated in the MPEG-2 specification, section 6.3.7 "Quant matrix
extension":

  Each quantisation matrix has a default set of values. When a
  sequence_header_code is decoded all matrices shall be reset to
  their default values. User defined matrices may be downloaded
  and this can occur in a sequence_header() or in a
  quant_matrix_extension().

The load_intra_quantiser_matrix syntax elements are transmitted
in the bistream headers, signalling that a quantization matrix
needs to be loaded and used for pictures transmitted afterwards
(until the matrices are reset).

These "load" semantics are implemented in the V4L2 interface
without the need of any "load" flags: passing the control
is effectively a load.

Therefore, rework the V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION
semantics to match the MPEG-2 semantics. Quantization matrices
values are now initialized by the V4L2 control core to their
reset default value, and applications are expected to reset
their values as specified.

The quantization control is therefore optional, and used to
load bitstream-defined values in the quantization matrices.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 17 ---------
 drivers/media/v4l2-core/v4l2-ctrls.c          | 21 ++++++++++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 38 +------------------
 include/media/mpeg2-ctrls.h                   |  5 ---
 4 files changed, 23 insertions(+), 58 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 188aef8e40d0..29d017654141 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1746,23 +1746,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - __u8
-      - ``load_intra_quantiser_matrix``
-      - One bit to indicate whether to load the ``intra_quantiser_matrix`` data.
-    * - __u8
-      - ``load_non_intra_quantiser_matrix``
-      - One bit to indicate whether to load the ``non_intra_quantiser_matrix``
-	data.
-    * - __u8
-      - ``load_chroma_intra_quantiser_matrix``
-      - One bit to indicate whether to load the
-	``chroma_intra_quantiser_matrix`` data, only relevant for non-4:2:0 YUV
-	formats.
-    * - __u8
-      - ``load_chroma_non_intra_quantiser_matrix``
-      - One bit to indicate whether to load the
-	``chroma_non_intra_quantiser_matrix`` data, only relevant for non-4:2:0
-	YUV formats.
     * - __u8
       - ``intra_quantiser_matrix[64]``
       - The quantization matrix coefficients for intra-coded frames, in zigzag
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 39038c6ad8fb..6da4f994e1fc 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -57,6 +57,18 @@ static bool is_new_manual(const struct v4l2_ctrl *master)
 	return master->is_auto && master->val == master->manual_mode_value;
 }
 
+/* Default MPEG-2 quantization coefficients, from the specification. */
+static const u8 mpeg2_intra_quant_matrix[64] = {
+	8,  16, 16, 19, 16, 19, 22, 22,
+	22, 22, 22, 22, 26, 24, 26, 27,
+	27, 27, 26, 26, 26, 26, 27, 27,
+	27, 29, 29, 29, 34, 34, 34, 29,
+	29, 29, 27, 27, 29, 29, 32, 32,
+	34, 34, 37, 38, 37, 35, 35, 34,
+	35, 38, 38, 40, 40, 40, 48, 48,
+	46, 46, 56, 56, 58, 69, 69, 83
+};
+
 /* Returns NULL or a character pointer array containing the menu for
    the given control ID. The pointer array ends with a NULL pointer.
    An empty string signifies a menu entry that is invalid. This allows
@@ -1656,6 +1668,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			      union v4l2_ctrl_ptr ptr)
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
+	struct v4l2_ctrl_mpeg2_quantization *p_mpeg2_quant;
 	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
@@ -1680,6 +1693,14 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		p_mpeg2_slice_params->picture.picture_coding_type =
 					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
 		break;
+	case V4L2_CTRL_TYPE_MPEG2_QUANTIZATION:
+		p_mpeg2_quant = p;
+
+		memcpy(p_mpeg2_quant->intra_quantiser_matrix,
+		       mpeg2_intra_quant_matrix,
+		       ARRAY_SIZE(mpeg2_intra_quant_matrix));
+		memset(p_mpeg2_quant->non_intra_quantiser_matrix, 16, 64);
+		break;
 	case V4L2_CTRL_TYPE_VP8_FRAME:
 		p_vp8_frame = p;
 		p_vp8_frame->num_dct_parts = 1;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 8bcd6b8f9e2d..28fb228bbab7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -13,30 +13,6 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-/* Default MPEG-2 quantization coefficients, from the specification. */
-
-static const u8 intra_quantization_matrix_default[64] = {
-	8,  16, 16, 19, 16, 19, 22, 22,
-	22, 22, 22, 22, 26, 24, 26, 27,
-	27, 27, 26, 26, 26, 26, 27, 27,
-	27, 29, 29, 29, 34, 34, 34, 29,
-	29, 29, 27, 27, 29, 29, 32, 32,
-	34, 34, 37, 38, 37, 35, 35, 34,
-	35, 38, 38, 40, 40, 40, 48, 48,
-	46, 46, 56, 56, 58, 69, 69, 83
-};
-
-static const u8 non_intra_quantization_matrix_default[64] = {
-	16, 16, 16, 16, 16, 16, 16, 16,
-	16, 16, 16, 16, 16, 16, 16, 16,
-	16, 16, 16, 16, 16, 16, 16, 16,
-	16, 16, 16, 16, 16, 16, 16, 16,
-	16, 16, 16, 16, 16, 16, 16, 16,
-	16, 16, 16, 16, 16, 16, 16, 16,
-	16, 16, 16, 16, 16, 16, 16, 16,
-	16, 16, 16, 16, 16, 16, 16, 16
-};
-
 static enum cedrus_irq_status cedrus_mpeg2_irq_status(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -99,12 +75,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	cedrus_engine_enable(ctx, CEDRUS_CODEC_MPEG2);
 
 	/* Set intra quantization matrix. */
-
-	if (quantization && quantization->load_intra_quantiser_matrix)
-		matrix = quantization->intra_quantiser_matrix;
-	else
-		matrix = intra_quantization_matrix_default;
-
+	matrix = quantization->intra_quantiser_matrix;
 	for (i = 0; i < 64; i++) {
 		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
 		reg |= VE_DEC_MPEG_IQMINPUT_FLAG_INTRA;
@@ -113,12 +84,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 
 	/* Set non-intra quantization matrix. */
-
-	if (quantization && quantization->load_non_intra_quantiser_matrix)
-		matrix = quantization->non_intra_quantiser_matrix;
-	else
-		matrix = non_intra_quantization_matrix_default;
-
+	matrix = quantization->non_intra_quantiser_matrix;
 	for (i = 0; i < 64; i++) {
 		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
 		reg |= VE_DEC_MPEG_IQMINPUT_FLAG_NON_INTRA;
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 2a4ae6701166..757043eef682 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -68,11 +68,6 @@ struct v4l2_ctrl_mpeg2_slice_params {
 
 struct v4l2_ctrl_mpeg2_quantization {
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Quant matrix extension */
-	__u8	load_intra_quantiser_matrix;
-	__u8	load_non_intra_quantiser_matrix;
-	__u8	load_chroma_intra_quantiser_matrix;
-	__u8	load_chroma_non_intra_quantiser_matrix;
-
 	__u8	intra_quantiser_matrix[64];
 	__u8	non_intra_quantiser_matrix[64];
 	__u8	chroma_intra_quantiser_matrix[64];
-- 
2.30.0

