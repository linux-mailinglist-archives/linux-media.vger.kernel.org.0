Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE7854AB1D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 09:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355067AbiFNHu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 03:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355004AbiFNHuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 03:50:11 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8751A3EF06;
        Tue, 14 Jun 2022 00:50:06 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CA60B66016F4;
        Tue, 14 Jun 2022 08:50:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655193005;
        bh=VxFUVU598sPR+2ba2pJaipyY91RQ+APtAi220RV7Y1c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FkuS3nIFZX9ocPtMRzMPjnE9YHcNtcFkj3vdX+Nnzk7BQNpw0VeppXwauFBJwaHyP
         y5zkglAkNIr7P7w6EQqlLX9xFSZud4DY1GJlVU7of25cPSvi1/N68AYrwMTxDBjIY8
         pObVvBWfVCChArkVriZfkc6prUsJhmW4x5hxuBOPMD7LswFRr/WBe4f6NUQFfG8Dqq
         FxwCpVWrETiqQ2sHCIN9sFxek1WIIdSvszrmoJ+sjDVadj2hDrJNp6fZm/FI46/n57
         P/C7aNkq27fEer1dA3UmuTtuz22wre9u2WSNt7uowKROznOqOvxijKUsBly87G7YBx
         LDBEXsHeBMp2A==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 14/17] media: hantro: Stop using Hantro dedicated control
Date:   Tue, 14 Jun 2022 09:49:44 +0200
Message-Id: <20220614074947.160316-15-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220614074947.160316-1-benjamin.gaignard@collabora.com>
References: <20220614074947.160316-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The number of bits to skip in the slice header can be computed
in the driver by using sps, pps and decode_params information.
This allow to remove Hantro dedicated control.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/hantro_drv.c     | 36 -----------
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 62 ++++++++++++++++++-
 include/media/hevc-ctrls.h                    | 13 ----
 3 files changed, 61 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index b38d9b3ab2ed..377dcc1d19de 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -304,26 +304,6 @@ static int hantro_jpeg_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
-static int hantro_hevc_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct hantro_ctx *ctx;
-
-	ctx = container_of(ctrl->handler,
-			   struct hantro_ctx, ctrl_handler);
-
-	vpu_debug(1, "s_ctrl: id = %d, val = %d\n", ctrl->id, ctrl->val);
-
-	switch (ctrl->id) {
-	case V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP:
-		ctx->hevc_dec.ctrls.hevc_hdr_skip_length = ctrl->val;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
 	.try_ctrl = hantro_try_ctrl,
 };
@@ -332,10 +312,6 @@ static const struct v4l2_ctrl_ops hantro_jpeg_ctrl_ops = {
 	.s_ctrl = hantro_jpeg_s_ctrl,
 };
 
-static const struct v4l2_ctrl_ops hantro_hevc_ctrl_ops = {
-	.s_ctrl = hantro_hevc_s_ctrl,
-};
-
 #define HANTRO_JPEG_ACTIVE_MARKERS	(V4L2_JPEG_ACTIVE_MARKER_APP0 | \
 					 V4L2_JPEG_ACTIVE_MARKER_COM | \
 					 V4L2_JPEG_ACTIVE_MARKER_DQT | \
@@ -487,18 +463,6 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
 		},
-	}, {
-		.codec = HANTRO_HEVC_DECODER,
-		.cfg = {
-			.id = V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP,
-			.name = "Hantro HEVC slice header skip bytes",
-			.type = V4L2_CTRL_TYPE_INTEGER,
-			.min = 0,
-			.def = 0,
-			.max = 0x100,
-			.step = 1,
-			.ops = &hantro_hevc_ctrl_ops,
-		},
 	}, {
 		.codec = HANTRO_VP9_DECODER,
 		.cfg = {
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index d28653d04d20..3be8d6e60bf0 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -117,6 +117,66 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 		vpu_debug(1, "%s: no chroma!\n", __func__);
 }
 
+static unsigned int ceil_log2(unsigned int v)
+{
+	/* Compute Ceil(Log2(v))
+	 * Derived from branchless code for integer log2(v) from:
+	 * <http://graphics.stanford.edu/~seander/bithacks.html#IntegerLog>
+	 */
+	unsigned int r, shift;
+
+	v--;
+	r = (v > 0xFFFF) << 4;
+	v >>= r;
+	shift = (v > 0xFF) << 3;
+	v >>= shift;
+	r |= shift;
+	shift = (v > 0xF) << 2;
+	v >>= shift;
+	r |= shift;
+	shift = (v > 0x3) << 1;
+	v >>= shift;
+	r |= shift;
+	r |= (v >> 1);
+
+	return r + 1;
+}
+
+static int compute_header_skip_lenght(struct hantro_ctx *ctx)
+{
+	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
+	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
+	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
+	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
+	int skip = 0;
+
+	if (pps->flags & V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT)
+		/* size of pic_output_flag */
+		skip++;
+
+	if (sps->flags & V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE)
+		/* size of pic_order_cnt_lsb */
+		skip += 2;
+
+	if (!(decode_params->flags & V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC)) {
+		/* size of pic_order_cnt_lsb */
+		skip += sps->log2_max_pic_order_cnt_lsb_minus4 + 4;
+
+		/* size of short_term_ref_pic_set_sps_flag */
+		skip++;
+
+		if (decode_params->short_term_ref_pic_set_size)
+			/* size of st_ref_pic_set( num_short_term_ref_pic_sets ) */
+			skip += decode_params->short_term_ref_pic_set_size;
+		else if (sps->num_short_term_ref_pic_sets > 1)
+			skip += ceil_log2(sps->num_short_term_ref_pic_sets);
+
+		skip += decode_params->long_term_ref_pic_set_size;
+	}
+
+	return skip;
+}
+
 static void set_params(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
@@ -134,7 +194,7 @@ static void set_params(struct hantro_ctx *ctx)
 
 	hantro_reg_write(vpu, &g2_output_8_bits, 0);
 
-	hantro_reg_write(vpu, &g2_hdr_skip_length, ctrls->hevc_hdr_skip_length);
+	hantro_reg_write(vpu, &g2_hdr_skip_length, compute_header_skip_lenght(ctx));
 
 	min_log2_cb_size = sps->log2_min_luma_coding_block_size_minus3 + 3;
 	max_log2_ctb_size = min_log2_cb_size + sps->log2_diff_max_min_luma_coding_block_size;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index d6cb3779d190..efc0412ac41e 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -467,17 +467,4 @@ struct v4l2_ctrl_hevc_scaling_matrix {
 	__u8	scaling_list_dc_coef_32x32[2];
 };
 
-/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */
-#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
-/*
- * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
- * the number of data (in bits) to skip in the
- * slice segment header.
- * If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
- * to before syntax element "slice_temporal_mvp_enabled_flag".
- * If IDR, the skipped bits are just "pic_output_flag"
- * (separate_colour_plane_flag is not supported).
- */
-#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	(V4L2_CID_CODEC_HANTRO_BASE + 0)
-
 #endif
-- 
2.32.0

