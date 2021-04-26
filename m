Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2937036AB20
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 05:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhDZDgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 23:36:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38220 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbhDZDgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 23:36:50 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6B7C71F41F87
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
Subject: [PATCH v6 02/10] media: uapi: mpeg2: rework quantisation matrices semantics
Date:   Mon, 26 Apr 2021 00:35:14 -0300
Message-Id: <20210426033522.69395-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210426033522.69395-1-ezequiel@collabora.com>
References: <20210426033522.69395-1-ezequiel@collabora.com>
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
in the bitstream headers, signalling that a quantisation matrix
needs to be loaded and used for pictures transmitted afterwards
(until the matrices are reset).

This "load" semantics are implemented in the V4L2 interface
without the need of any "load" flags: passing the control
is effectively a load.

Therefore, rework the V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION
semantics to match the MPEG-2 semantics. Quantisation matrices
values are now initialized by the V4L2 control core to their
reset default value, and applications are expected to reset
their values as specified.

The quantisation control is therefore optional, and used to
load bitstream-defined values in the quantisation matrices.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 17 ---------
 drivers/media/v4l2-core/v4l2-ctrls.c          | 26 +++++++++++++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 38 +------------------
 include/media/mpeg2-ctrls.h                   |  5 ---
 4 files changed, 28 insertions(+), 58 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e40c81146a31..f90481458eaf 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1779,23 +1779,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
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
       - The quantisation matrix coefficients for intra-coded frames, in zigzag
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1ed62f0ed66f..41955ea9230d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -57,6 +57,18 @@ static bool is_new_manual(const struct v4l2_ctrl *master)
 	return master->is_auto && master->val == master->manual_mode_value;
 }
 
+/* Default intra MPEG-2 quantisation coefficients, from the specification. */
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
@@ -1692,6 +1704,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			      union v4l2_ctrl_ptr ptr)
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
+	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
 	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
@@ -1716,6 +1729,19 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		p_mpeg2_slice_params->picture.picture_coding_type =
 					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
 		break;
+	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
+		p_mpeg2_quant = p;
+
+		memcpy(p_mpeg2_quant->intra_quantiser_matrix,
+		       mpeg2_intra_quant_matrix,
+		       ARRAY_SIZE(mpeg2_intra_quant_matrix));
+		/*
+		 * The default non-intra MPEG-2 quantisation
+		 * coefficients are all 16, as per the specification.
+		 */
+		memset(p_mpeg2_quant->non_intra_quantiser_matrix, 16,
+		       sizeof(p_mpeg2_quant->non_intra_quantiser_matrix));
+		break;
 	case V4L2_CTRL_TYPE_VP8_FRAME:
 		p_vp8_frame = p;
 		p_vp8_frame->num_dct_parts = 1;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 459f71679a4f..e3154f631858 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -13,30 +13,6 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-/* Default MPEG-2 quantisation coefficients, from the specification. */
-
-static const u8 intra_quantisation_matrix_default[64] = {
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
-static const u8 non_intra_quantisation_matrix_default[64] = {
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
 
 	/* Set intra quantisation matrix. */
-
-	if (quantisation && quantisation->load_intra_quantiser_matrix)
-		matrix = quantisation->intra_quantiser_matrix;
-	else
-		matrix = intra_quantisation_matrix_default;
-
+	matrix = quantisation->intra_quantiser_matrix;
 	for (i = 0; i < 64; i++) {
 		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
 		reg |= VE_DEC_MPEG_IQMINPUT_FLAG_INTRA;
@@ -113,12 +84,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 
 	/* Set non-intra quantisation matrix. */
-
-	if (quantisation && quantisation->load_non_intra_quantiser_matrix)
-		matrix = quantisation->non_intra_quantiser_matrix;
-	else
-		matrix = non_intra_quantisation_matrix_default;
-
+	matrix = quantisation->non_intra_quantiser_matrix;
 	for (i = 0; i < 64; i++) {
 		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
 		reg |= VE_DEC_MPEG_IQMINPUT_FLAG_NON_INTRA;
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index b8adf3ac2c1d..8ea2c7f3a172 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -68,11 +68,6 @@ struct v4l2_ctrl_mpeg2_slice_params {
 
 struct v4l2_ctrl_mpeg2_quantisation {
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

