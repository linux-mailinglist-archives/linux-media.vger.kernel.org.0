Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B14D290551
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 18:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbfHPQCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 12:02:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50202 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbfHPQCB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 12:02:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0B007283C9E
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v7 03/11] media: uapi: h264: Add the concept of decoding mode
Date:   Fri, 16 Aug 2019 13:01:24 -0300
Message-Id: <20190816160132.7352-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190816160132.7352-1-ezequiel@collabora.com>
References: <20190816160132.7352-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Some stateless decoders don't support per-slice decoding granularity
(or at least not in a way that would make them efficient or easy to use).

Expose a menu to control the supported decoding modes. Drivers are
allowed to support only one decoding but they can support both too.

To fully specify the decoding operation, we need to introduce
a start_byte_offset, to indicate where slices start.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v7:
* Further specify start_byte_offset in slice- and frame-based
  decoding modes.
Changes in v6:
* Fix spec, specifiying the decode-mode pixelformat modifier
  needs to be set once, as suggested by Hans.
* Rename, as suggested by Paul.
Changes in v5:
* Improve specification as suggested by Hans.
Changes in v4:
* Typos/rewording fixes
Changes in v3:
* s/per-{slice,frame} decoding/{slice,frame}-based decoding/
* Add Paul's R-b
Changes in v2:
* Allow decoding multiple slices in per-slice decoding mode
* Minor doc improvement/fixes

doc api ext-ctrls-codec

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 57 ++++++++++++++++++-
 .../media/uapi/v4l/pixfmt-compressed.rst      |  6 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++
 include/media/h264-ctrls.h                    | 10 ++++
 4 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index c5f39dd50043..7e7447d9998c 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1747,6 +1747,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u32
       - ``size``
       -
+    * - __u32
+      - ``start_byte_offset``
+        Offset (in bytes) from the beginning of the OUTPUT buffer to the start
+        of the slice. If the slice starts with a start code, then this is the
+        offset to such start code. When operating in slice-based decoding mode
+        (see :c:type:`v4l2_mpeg_video_h264_decode_mode`), this field should
+        be set to 0. When operating in frame-based decoding mode, this field
+        should be 0, for the first slice.
     * - __u32
       - ``header_bit_size``
       -
@@ -1930,7 +1938,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       -
     * - __u16
       - ``num_slices``
-      - Number of slices needed to decode the current frame
+      - Number of slices needed to decode the current frame/field. When
+        operating in slice-based decoding mode (see
+        :c:type:`v4l2_mpeg_video_h264_decode_mode`), this field
+        should always be set to one.
     * - __u16
       - ``nal_ref_idc``
       - NAL reference ID value coming from the NAL Unit header
@@ -2021,6 +2032,50 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - 0x00000004
       - The DPB entry is a long term reference frame
 
+``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
+    Specifies the decoding mode to use. Currently exposes slice-based and
+    frame-based decoding but new modes might be added later on.
+    This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
+    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
+    are required to set this control in order to specify the decoding mode
+    that is expected for the buffer.
+    Drivers may expose a single or multiple decoding modes, depending
+    on what they can support.
+
+    .. note::
+
+       This menu control is not yet part of the public kernel API and
+       it is expected to change.
+
+.. c:type:: v4l2_mpeg_video_h264_decode_mode
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED``
+      - 0
+      - Decoding is done at the slice granularity.
+        In this mode, ``num_slices`` field in struct
+        :c:type:`v4l2_ctrl_h264_decode_params` should be set to 1,
+        and ``start_byte_offset`` in struct
+        :c:type:`v4l2_ctrl_h264_slice_params` should be set to 0.
+        The OUTPUT buffer must contain a single slice.
+    * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED``
+      - 1
+      - Decoding is done at the frame granularity.
+        In this mode, ``num_slices`` field in struct
+        :c:type:`v4l2_ctrl_h264_decode_params` should be set to the number
+        of slices in the frame, and ``start_byte_offset`` in struct
+        :c:type:`v4l2_ctrl_h264_slice_params` should be set accordingly
+        for each slice. For the first slice, ``start_byte_offset`` should
+        be zero.
+        The OUTPUT buffer must contain all slices needed to decode the
+        frame. The OUTPUT buffer must also contain both fields.
+
 .. _v4l2-mpeg-mpeg2:
 
 ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
index 9b65473a2288..d666eb51741a 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
@@ -60,8 +60,10 @@ Compressed Formats
 	extracted from the H264 bitstream.  This format is adapted for
 	stateless video decoders that implement an H264 pipeline
 	(using the :ref:`mem2mem` and :ref:`media-request-api`).
-	Metadata associated with the frame to decode are required to
-	be passed through the ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
+	This pixelformat has a modifier that must be set at least once
+	through the ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE`` control.
+	In addition, metadata associated with the frame to decode are
+	required to be passed through the ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
 	``V4L2_CID_MPEG_VIDEO_H264_PPS``,
 	``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX``,
 	``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS`` and
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index cd1ae016706f..2c67f9fc4d5b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -402,6 +402,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"Explicit",
 		NULL,
 	};
+	static const char * const h264_decode_mode[] = {
+		"Slice-Based",
+		"Frame-Based",
+		NULL,
+	};
 	static const char * const mpeg_mpeg2_level[] = {
 		"Low",
 		"Main",
@@ -633,6 +638,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return h264_fp_arrangement_type;
 	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
 		return h264_fmo_map_type;
+	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:
+		return h264_decode_mode;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 		return mpeg_mpeg2_level;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
@@ -852,6 +859,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
 	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
+	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:		return "H264 Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
 	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
@@ -1220,6 +1228,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
 	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
 	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
+	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 6160a69c0143..928c48c57282 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -26,6 +26,7 @@
 #define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_MPEG_BASE+1002)
 #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
+#define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_MPEG_BASE+1005)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_H264_SPS			0x0110
@@ -34,6 +35,11 @@
 #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
 #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
 
+enum v4l2_mpeg_video_h264_decode_mode {
+	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
+	V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+};
+
 #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
 #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
 #define V4L2_H264_SPS_CONSTRAINT_SET2_FLAG			0x04
@@ -125,6 +131,10 @@ struct v4l2_h264_pred_weight_table {
 struct v4l2_ctrl_h264_slice_params {
 	/* Size in bytes, including header */
 	__u32 size;
+
+	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
+	__u32 start_byte_offset;
+
 	/* Offset in bits to slice_data() from the beginning of this slice. */
 	__u32 header_bit_size;
 
-- 
2.22.0

