Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F3754AB1C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 09:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354930AbiFNHuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 03:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237682AbiFNHuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 03:50:01 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1E53ED0E;
        Tue, 14 Jun 2022 00:50:00 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4a7b:8d3a:acaa:ec46])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 90E0B66016B3;
        Tue, 14 Jun 2022 08:49:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655192999;
        bh=Z3iTF+IlAqXZzSrDjKcsIZjoHijhPp6mbGupKbVLE5w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H08oC4YrjYRU/TigB7TFEe9wCByjm6bTRE8qfZbFA42gKQ1NFfYs9Mmwy9MQAti0a
         XR3V4oNxPMglpsMcQ5+rJOvJ3j4osOpdN7jdzbtP0zzZnop41yXwUQPifPf1GIw5kF
         9yMQ4W7zI07172FNWSSoEbVeNN2a2GiyDQydGXIbFsHCDOiu2Bs76Awb3J6WBbxWy5
         ide+R8rF6nF8fIr2YKFPLsNxEq5bbQzpFVsIQJwF4lJPBvxd8h71NVLc6MfqFM0cMZ
         sIt3mjGP1LCp78b2hbOs+/5X/u1dnhOO0oaTWJ8dblmxraec6NXpo5X0xRQJKB9CMU
         2ngqxOb/t2DjA==
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
Subject: [PATCH v7 05/17] media: uapi: HEVC: Rename HEVC stateless controls with STATELESS prefix
Date:   Tue, 14 Jun 2022 09:49:35 +0200
Message-Id: <20220614074947.160316-6-benjamin.gaignard@collabora.com>
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

Change HEVC  stateless controls names to V4L2_CID_STATELESS_HEVC instead
of V4L2_CID_MPEG_VIDEO_HEVC be coherent with v4l2 naming convention.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 26 +++++++--------
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 32 +++++++++----------
 drivers/staging/media/hantro/hantro_drv.c     | 26 +++++++--------
 drivers/staging/media/hantro/hantro_hevc.c    |  8 ++---
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 24 +++++++-------
 .../staging/media/sunxi/cedrus/cedrus_dec.c   | 10 +++---
 include/media/hevc-ctrls.h                    | 26 +++++++--------
 7 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index aa7556e200c9..160b91537c09 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2661,7 +2661,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
 .. _v4l2-mpeg-hevc:
 
-``V4L2_CID_MPEG_VIDEO_HEVC_SPS (struct)``
+``V4L2_CID_STATELESS_HEVC_SPS (struct)``
     Specifies the Sequence Parameter Set fields (as extracted from the
     bitstream) for the associated HEVC slice data.
     These bitstream parameters are defined according to :ref:`hevc`.
@@ -2814,7 +2814,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_PPS (struct)``
+``V4L2_CID_STATELESS_HEVC_PPS (struct)``
     Specifies the Picture Parameter Set fields (as extracted from the
     bitstream) for the associated HEVC slice data.
     These bitstream parameters are defined according to :ref:`hevc`.
@@ -2967,7 +2967,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS (struct)``
+``V4L2_CID_STATELESS_HEVC_SLICE_PARAMS (struct)``
     Specifies various slice-specific parameters, especially from the NAL unit
     header, general slice segment header and weighted prediction parameter
     parts of the bitstream.
@@ -3132,7 +3132,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX (struct)``
+``V4L2_CID_STATELESS_HEVC_SCALING_MATRIX (struct)``
     Specifies the HEVC scaling matrix parameters used for the scaling process
     for transform coefficients.
     These matrix and parameters are defined according to :ref:`hevc`.
@@ -3282,7 +3282,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE (enum)``
+``V4L2_CID_STATELESS_HEVC_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based and
     frame-based decoding but new modes might be added later on.
     This control is used as a modifier for V4L2_PIX_FMT_HEVC_SLICE
@@ -3297,7 +3297,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
        This menu control is not yet part of the public kernel API and
        it is expected to change.
 
-.. c:type:: v4l2_mpeg_video_hevc_decode_mode
+.. c:type:: v4l2_stateless_hevc_decode_mode
 
 .. raw:: latex
 
@@ -3310,11 +3310,11 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED``
+    * - ``V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED``
       - 0
       - Decoding is done at the slice granularity.
         The OUTPUT buffer must contain a single slice.
-    * - ``V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED``
+    * - ``V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED``
       - 1
       - Decoding is done at the frame granularity.
         The OUTPUT buffer must contain all slices needed to decode the
@@ -3324,7 +3324,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_HEVC_START_CODE (enum)``
+``V4L2_CID_STATELESS_HEVC_START_CODE (enum)``
     Specifies the HEVC slice start code expected for each slice.
     This control is used as a modifier for V4L2_PIX_FMT_HEVC_SLICE
     pixel format. Applications that support V4L2_PIX_FMT_HEVC_SLICE
@@ -3338,7 +3338,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
        This menu control is not yet part of the public kernel API and
        it is expected to change.
 
-.. c:type:: v4l2_mpeg_video_hevc_start_code
+.. c:type:: v4l2_stateless_hevc_start_code
 
 .. tabularcolumns:: |p{9.2cm}|p{0.6cm}|p{7.5cm}|
 
@@ -3347,13 +3347,13 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - ``V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE``
+    * - ``V4L2_STATELESS_HEVC_START_CODE_NONE``
       - 0
       - Selecting this value specifies that HEVC slices are passed
         to the driver without any start code. The bitstream data should be
         according to :ref:`hevc` 7.3.1.1 General NAL unit syntax, hence
         contains emulation prevention bytes when required.
-    * - ``V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B``
+    * - ``V4L2_STATELESS_HEVC_START_CODE_ANNEX_B``
       - 1
       - Selecting this value specifies that HEVC slices are expected
         to be prefixed by Annex B start codes. According to :ref:`hevc`
@@ -3386,7 +3386,7 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     This provides a bitmask which consists of bits [0, LTR_COUNT-1].
     This is applicable to the H264 and HEVC encoders.
 
-``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS (struct)``
+``V4L2_CID_STATELESS_HEVC_DECODE_PARAMS (struct)``
     Specifies various decode parameters, especially the references picture order
     count (POC) for all the lists (short, long, before, current, after) and the
     number of entries for each of them.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 16f42d2fd359..9f55503cd3d6 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -704,9 +704,9 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return hevc_tier;
 	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
 		return hevc_loop_filter_mode;
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
+	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:
 		return hevc_decode_mode;
-	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
+	case V4L2_CID_STATELESS_HEVC_START_CODE:
 		return hevc_start_code;
 	case V4L2_CID_CAMERA_ORIENTATION:
 		return camera_orientation;
@@ -1003,13 +1003,6 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:	return "HEVC Size of Length Field";
 	case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Reference Frames for a P-Frame";
 	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:		return "Prepend SPS and PPS to IDR";
-	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Set";
-	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set";
-	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
-	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:		return "HEVC Scaling Matrix";
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
-	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1188,6 +1181,13 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
 	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
 	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
+	case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Parameter Set";
+	case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Parameter Set";
+	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
+	case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:		return "HEVC Scaling Matrix";
+	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
+	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
+	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
 
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1363,8 +1363,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
 	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
 	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
-	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
+	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:
+	case V4L2_CID_STATELESS_HEVC_START_CODE:
 	case V4L2_CID_STATELESS_H264_DECODE_MODE:
 	case V4L2_CID_STATELESS_H264_START_CODE:
 	case V4L2_CID_CAMERA_ORIENTATION:
@@ -1502,19 +1502,19 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_VP8_FRAME:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
+	case V4L2_CID_STATELESS_HEVC_SPS:
 		*type = V4L2_CTRL_TYPE_HEVC_SPS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:
+	case V4L2_CID_STATELESS_HEVC_PPS:
 		*type = V4L2_CTRL_TYPE_HEVC_PPS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
+	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:
+	case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:
 		*type = V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX;
 		break;
-	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:
+	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
 		break;
 	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ac232b5f7825..b38d9b3ab2ed 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -265,7 +265,7 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
-	} else if (ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_SPS) {
+	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 
 		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
@@ -438,18 +438,18 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
-			.min = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
-			.max = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
-			.def = V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
+			.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
+			.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+			.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+			.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
 		},
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_HEVC_START_CODE,
-			.min = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
-			.max = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
-			.def = V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
+			.id = V4L2_CID_STATELESS_HEVC_START_CODE,
+			.min = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+			.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+			.def = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
 		},
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
@@ -469,23 +469,23 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_HEVC_SPS,
+			.id = V4L2_CID_STATELESS_HEVC_SPS,
 			.ops = &hantro_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_HEVC_PPS,
+			.id = V4L2_CID_STATELESS_HEVC_PPS,
 		},
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
+			.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
 		},
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
+			.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
 		},
 	}, {
 		.codec = HANTRO_HEVC_DECODER,
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index f86c98e19177..f0b19d8017ba 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -163,22 +163,22 @@ int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	ctrls->decode_params =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
 	if (WARN_ON(!ctrls->decode_params))
 		return -EINVAL;
 
 	ctrls->scaling =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 	if (WARN_ON(!ctrls->scaling))
 		return -EINVAL;
 
 	ctrls->sps =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_SPS);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_HEVC_SPS);
 	if (WARN_ON(!ctrls->sps))
 		return -EINVAL;
 
 	ctrls->pps =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_HEVC_PPS);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_HEVC_PPS);
 	if (WARN_ON(!ctrls->pps))
 		return -EINVAL;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 68b3dcdb5df3..87be975a72b6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -42,7 +42,7 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
-	} else if (ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_SPS) {
+	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
 
@@ -164,42 +164,42 @@ static const struct cedrus_control cedrus_controls[] = {
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SPS,
+			.id	= V4L2_CID_STATELESS_HEVC_SPS,
 			.ops	= &cedrus_ctrl_ops,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_PPS,
+			.id	= V4L2_CID_STATELESS_HEVC_PPS,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS,
+			.id	= V4L2_CID_STATELESS_HEVC_SLICE_PARAMS,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
+			.id	= V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
-			.max	= V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
-			.def	= V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
+			.id	= V4L2_CID_STATELESS_HEVC_DECODE_MODE,
+			.max	= V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
+			.def	= V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_HEVC_START_CODE,
-			.max	= V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
-			.def	= V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
+			.id	= V4L2_CID_STATELESS_HEVC_START_CODE,
+			.max	= V4L2_STATELESS_HEVC_START_CODE_NONE,
+			.def	= V4L2_STATELESS_HEVC_START_CODE_NONE,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
@@ -211,7 +211,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	},
 	{
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
+			.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 9c7200299465..aabe6253078e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -65,15 +65,15 @@ void cedrus_device_run(void *priv)
 
 	case V4L2_PIX_FMT_HEVC_SLICE:
 		run.h265.sps = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_SPS);
+			V4L2_CID_STATELESS_HEVC_SPS);
 		run.h265.pps = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
+			V4L2_CID_STATELESS_HEVC_PPS);
 		run.h265.slice_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
+			V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
 		run.h265.decode_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
+			V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
 		run.h265.scaling_matrix = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
+			V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
 		break;
 
 	case V4L2_PIX_FMT_VP8_FRAME:
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 752a8d10782c..45734bd8fdfc 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -16,13 +16,13 @@
 /* The pixel format isn't stable at the moment and will likely be renamed. */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 
-#define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
-#define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
-#define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
-#define V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX	(V4L2_CID_CODEC_BASE + 1011)
-#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 1012)
-#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
-#define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
+#define V4L2_CID_STATELESS_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
+#define V4L2_CID_STATELESS_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
+#define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
+#define V4L2_CID_STATELESS_HEVC_SCALING_MATRIX	(V4L2_CID_CODEC_BASE + 1011)
+#define V4L2_CID_STATELESS_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 1012)
+#define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
+#define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
@@ -31,14 +31,14 @@
 #define V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX 0x0123
 #define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
 
-enum v4l2_mpeg_video_hevc_decode_mode {
-	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
-	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_FRAME_BASED,
+enum v4l2_stateless_hevc_decode_mode {
+	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
+	V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
 };
 
-enum v4l2_mpeg_video_hevc_start_code {
-	V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
-	V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B,
+enum v4l2_stateless_hevc_start_code {
+	V4L2_STATELESS_HEVC_START_CODE_NONE,
+	V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
 };
 
 #define V4L2_HEVC_SLICE_TYPE_B	0
-- 
2.32.0

