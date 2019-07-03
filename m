Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B04335E3E5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 14:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGCM25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 08:28:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38614 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfGCM24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 08:28:56 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6722E28A926;
        Wed,  3 Jul 2019 13:28:54 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3 2/3] media: uapi: h264: Add the concept of decoding mode
Date:   Wed,  3 Jul 2019 14:28:48 +0200
Message-Id: <20190703122849.6316-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703122849.6316-1-boris.brezillon@collabora.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some stateless decoders don't support per-slice decoding (or at least
not in a way that would make them efficient or easy to use).
Let's expose a menu to control and expose the supported decoding modes.
Drivers are allowed to support only one decoding but they can support
both too.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
Changes in v3:
* s/per-{slice,frame} decoding/{slice,frame}-based decoding/
* Add Paul's R-b

Changes in v2:
* Allow decoding multiple slices in per-slice decoding mode
* Minor doc improvement/fixes
---
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 47 ++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++
 include/media/h264-ctrls.h                    | 13 +++++
 3 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index 3ae1367806cf..47ba2d057a92 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1748,6 +1748,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u32
       - ``size``
       -
+    * - __u32
+      - ``start_byte_offset``
+      - Where the slice payload starts in the output buffer. Useful when
+        operating in frame-based decoding mode and decoding multi-slice
+        content. In this case, the output buffer will contain more than one
+        slice and some codecs need to know where each slice starts. Note that
+        this offsets points to the beginning of the slice which is supposed to
+        contain an ANNEX B start code
     * - __u32
       - ``header_bit_size``
       -
@@ -1931,7 +1939,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       -
     * - __u16
       - ``num_slices``
-      - Number of slices needed to decode the current frame
+      - Number of slices needed to decode the current frame/field. When
+        operating in slice-based decoding mode (see
+        :c:type:`v4l2_mpeg_video_h264_decoding_mode`), this field
+        should always be set to one
     * - __u16
       - ``nal_ref_idc``
       - NAL reference ID value coming from the NAL Unit header
@@ -2022,6 +2033,40 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - 0x00000004
       - The DPB entry is a long term reference frame
 
+``V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE (enum)``
+    Specifies the decoding mode to use. Currently exposes slice-based and
+    frame-based decoding but new modes might be added later on.
+
+    .. note::
+
+       This menu control is not yet part of the public kernel API and
+       it is expected to change.
+
+.. c:type:: v4l2_mpeg_video_h264_decoding_mode
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING``
+      - 0
+      - The decoding is done at the slice granularity.
+        v4l2_ctrl_h264_decode_params->num_slices can be set to anything between
+        1 and then number of slices that remain to fully decode the
+        frame/field.
+        The output buffer should contain
+        v4l2_ctrl_h264_decode_params->num_slices slices.
+    * - ``V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING``
+      - 1
+      - The decoding is done at the frame granularity.
+        v4l2_ctrl_h264_decode_params->num_slices should be set to the number of
+        slices forming a frame.
+        The output buffer should contain all slices needed to decode the
+        frame/field.
+
 .. _v4l2-mpeg-mpeg2:
 
 ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 471ff5c91f43..70d994be27e1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -394,6 +394,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"Explicit",
 		NULL,
 	};
+	static const char * const h264_decoding_mode[] = {
+		"Slice-based",
+		"Frame-based",
+		NULL,
+	};
 	static const char * const mpeg_mpeg2_level[] = {
 		"Low",
 		"Main",
@@ -625,6 +630,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return h264_fp_arrangement_type;
 	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
 		return h264_fmo_map_type;
+	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
+		return h264_decoding_mode;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 		return mpeg_mpeg2_level;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
@@ -844,6 +851,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
 	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
+	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:		return "H264 Decoding Mode";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
 	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
@@ -1212,6 +1220,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
 	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
 	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
+	case V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index e1404d78d6ff..206fd5ada620 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -26,6 +26,7 @@
 #define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_MPEG_BASE+1002)
 #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
+#define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_H264_SPS			0x0110
@@ -33,6 +34,12 @@
 #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
 #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
 #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
+#define V4L2_CTRL_TYPE_H264_DECODING_MODE	0x0115
+
+enum v4l2_mpeg_video_h264_decoding_mode {
+	V4L2_MPEG_VIDEO_H264_SLICE_BASED_DECODING,
+	V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,
+};
 
 #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
 #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
@@ -111,6 +118,8 @@ struct v4l2_h264_pred_weight_table {
 	struct v4l2_h264_weight_factors weight_factors[2];
 };
 
+#define V4L2_H264_MAX_SLICES_PER_FRAME			16
+
 #define V4L2_H264_SLICE_TYPE_P				0
 #define V4L2_H264_SLICE_TYPE_B				1
 #define V4L2_H264_SLICE_TYPE_I				2
@@ -125,6 +134,10 @@ struct v4l2_h264_pred_weight_table {
 struct v4l2_ctrl_h264_slice_params {
 	/* Size in bytes, including header */
 	__u32 size;
+
+	/* Where the slice starts in the output buffer (expressed in bytes). */
+	__u32 start_byte_offset;
+
 	/* Offset in bits to slice_data() from the beginning of this slice. */
 	__u32 header_bit_size;
 
-- 
2.21.0

