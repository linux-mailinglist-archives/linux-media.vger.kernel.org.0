Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 387CC536419
	for <lists+linux-media@lfdr.de>; Fri, 27 May 2022 16:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353353AbiE0OcI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 May 2022 10:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353314AbiE0OcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 May 2022 10:32:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A701377E2;
        Fri, 27 May 2022 07:31:58 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 39A191F462BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653661917;
        bh=ftNAvCRvK+AQGEske0ptTAtK3LtSx8QeJyl1icndO24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eJkIRecZTmYGaG4ZFmePMIqptn3rVy6lr1zMdtqj9Dnjv2BwF+DapPM+6YxV2ZiOM
         ok4m0VxgyTEYmHYB4vI+RBg+NWeVlMZGhn45Yh9i8khPvb63oTdY2XSAV2dLuIlUfb
         s+Yv68Uw/MssbA5kyAk9wRnqDOTt191qh2uRjRGAiOArUrgM1Hmyy+HzAVyAIZ4Tdk
         WqTeatA6sEwP/b8xRQrliQRctoP/e0cTnWbV0J/1f1+vxiygNvgR9/R1P1ZOoDnfxA
         jJTrZ9km6GA3AoDS6tFVhZPyIv/bHUCOcMlW6sJexEGpKb3L/Y4JUmvHPQkkLN2Oiv
         kTY6B6g5cUYgA==
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
Subject: [PATCH v6 11/17] media: uapi: Add V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS control
Date:   Fri, 27 May 2022 16:31:28 +0200
Message-Id: <20220527143134.3360174-12-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220527143134.3360174-1-benjamin.gaignard@collabora.com>
References: <20220527143134.3360174-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The number of 'entry point offset' can be very variable.
Instead of using a large static array define a v4l2 dynamic array
of U32 (V4L2_CTRL_TYPE_U32).
The number of entry point offsets is reported by the elems field
and in struct v4l2_ctrl_hevc_slice_params.num_entry_point_offsets
field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c             |  5 +++++
 include/media/hevc-ctrls.h                            |  5 ++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 0796b1563daa..05228e280f66 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3010,6 +3010,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u32
       - ``data_bit_offset``
       - Offset (in bits) to the video data in the current slice data.
+    * - __u32
+      - ``num_entry_point_offsets``
+      - Specifies the number of entry point offset syntax elements in the slice header.
     * - __u8
       - ``nal_unit_type``
       - Specifies the coding type of the slice (B, P or I).
@@ -3150,6 +3153,14 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
+``V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (integer)``
+    Specifies entry point offsets in bytes.
+    This control is a dynamically sized array. The number of entry point
+    offsets is reported by the ``elems`` field.
+    This bitstream parameter is defined according to :ref:`hevc`.
+    They are described in section 7.4.7.1 "General slice segment header
+    semantics" of the specification.
+
 ``V4L2_CID_STATELESS_HEVC_SCALING_MATRIX (struct)``
     Specifies the HEVC scaling matrix parameters used for the scaling process
     for transform coefficients.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index d594efbcbb93..e22921e7ea61 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1188,6 +1188,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
 	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
 
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1518,6 +1519,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
 		break;
+	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:
+		*type = V4L2_CTRL_TYPE_U32;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
 	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
 		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
 		break;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index a3c829ef531a..1319cb99ae3f 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -20,6 +20,7 @@
 #define V4L2_CID_STATELESS_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 1012)
 #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
 #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
+#define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_BASE + 1017)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
@@ -318,6 +319,8 @@ struct v4l2_hevc_pred_weight_table {
  *
  * @bit_size: size (in bits) of the current slice data
  * @data_bit_offset: offset (in bits) to the video data in the current slice data
+ * @num_entry_point_offsets: specifies the number of entry point offset syntax
+ *			     elements in the slice header.
  * @nal_unit_type: specifies the coding type of the slice (B, P or I)
  * @nuh_temporal_id_plus1: minus 1 specifies a temporal identifier for the NAL unit
  * @slice_type: see V4L2_HEVC_SLICE_TYPE_{}
@@ -360,7 +363,7 @@ struct v4l2_hevc_pred_weight_table {
 struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
 	__u32	data_bit_offset;
-
+	__u32	num_entry_point_offsets;
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
 	__u8	nal_unit_type;
 	__u8	nuh_temporal_id_plus1;
-- 
2.32.0

