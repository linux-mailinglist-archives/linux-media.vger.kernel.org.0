Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A2B43913
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388009AbfFMPLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:11:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54550 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387971AbfFMPLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 11:11:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 76245285B9C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Pawel Osciak <posciak@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/2] media: uapi: Add VP8 stateless decoder API
Date:   Thu, 13 Jun 2019 12:10:39 -0300
Message-Id: <20190613151040.8971-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613151040.8971-1-ezequiel@collabora.com>
References: <20190613151040.8971-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Pawel Osciak <posciak@chromium.org>

Add the parsed VP8 frame pixel format and controls, to be used
with the new stateless decoder API for VP8 to provide parameters
for accelerator (aka stateless) codecs.

Signed-off-by: Pawel Osciak <posciak@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
--
Changes from RFC:
* Make sure the uAPI has the same size on x86, x86_64, arm and arm64.
* Move entropy coder state fields to a struct.
* Move key_frame field to the flags.
* Remove unneeded first_part_offset field.
* Add documentation.
---
 Documentation/media/uapi/v4l/biblio.rst       |  10 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 311 ++++++++++++++++++
 .../media/uapi/v4l/pixfmt-compressed.rst      |  20 ++
 drivers/media/v4l2-core/v4l2-ctrls.c          |   8 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/media/v4l2-ctrls.h                    |   3 +
 include/media/vp8-ctrls.h                     | 110 +++++++
 7 files changed, 463 insertions(+)
 create mode 100644 include/media/vp8-ctrls.h

diff --git a/Documentation/media/uapi/v4l/biblio.rst b/Documentation/media/uapi/v4l/biblio.rst
index 8f4eb8823d82..ad2ff258afa8 100644
--- a/Documentation/media/uapi/v4l/biblio.rst
+++ b/Documentation/media/uapi/v4l/biblio.rst
@@ -395,3 +395,13 @@ colimg
 :title:     Color Imaging: Fundamentals and Applications
 
 :author:    Erik Reinhard et al.
+
+.. _vp8:
+
+VP8
+===
+
+
+:title:     RFC 6386: "VP8 Data Format and Decoding Guide"
+
+:author:    J. Bankoski et al.
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index d6ea2ffd65c5..7a1947f5be96 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -2234,6 +2234,317 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Quantization parameter for a P frame for FWHT. Valid range: from 1
     to 31.
 
+.. _v4l2-mpeg-vp8:
+
+``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR (struct)``
+    Specifies the frame parameters for the associated VP8 parsed frame data.
+    This includes the necessary parameters for
+    configuring a stateless hardware decoding pipeline for VP8.
+    The bitstream parameters are defined according to :ref:`vp8`.
+
+    .. note::
+
+       This compound control is not yet part of the public kernel API and
+       it is expected to change.
+
+.. c:type:: v4l2_ctrl_vp8_frame_header
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
+
+.. flat-table:: struct v4l2_ctrl_vp8_frame_header
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``version``
+      - Bitstream version.
+    * - __u16
+      - ``width``
+      - The width of the frame
+    * - __u16
+      - ``height``
+      - The height of the frame
+    * - __u8
+      - ``horizontal_scale``
+      - Horizontal scale.
+    * - __u8
+      - ``vertical_scale``
+      - Vertical scale.
+    * - struct :c:type:`v4l2_vp8_segment_header`
+      - ``segment_header``
+      - Structure with segment-based adjustments metadata.
+    * - struct :c:type:`v4l2_vp8_loopfilter_header`
+      - ``loopfilter_header``
+      - Structure with loop filter level adjustments metadata.
+    * - struct :c:type:`v4l2_vp8_quantization_header`
+      - ``quant_header``
+      - Structure with VP8 dequantization indices metadata.
+    * - struct :c:type:`v4l2_vp8_entropy_header`
+      - ``entropy_header``
+      - Structure with VP8 entropy coder probabilities metadata.
+    * - __u16
+      - ``sign_bias_golden``
+      - Sign bias flag for golden reference frame.
+    * - __u16
+      - ``sign_bias_alternate``
+      - Sign bias flag for alternate reference frame.
+    * - __u8
+      - ``prob_skip_false``
+      -
+    * - __u8
+      - ``prob_intra``
+      -
+    * - __u8
+      - ``prob_last``
+      -
+    * - __u8
+      - ``prob_gf``
+      -
+    * - __u32
+      - ``first_part_size``
+      -
+    * - __u32
+      - ``macroblock_bit_offset``
+      - Offset in bits of macroblock data in first partition.
+    * - __u32
+      - ``dct_part_sizes[8]``
+      - DCT coefficients sizes.
+    * - __u8
+      - ``num_dct_parts``
+      - Number of DCT coefficients partitions.
+    * - struct :c:type:`v4l2_vp8_entropy_coder_state`
+      - ``coder_state``
+      - Structure with VP8 entropy coder state.
+    * - __u64
+      - ``last_frame_ts``
+      - Timestamp for the V4L2 capture buffer to use as last reference frame, used
+        with inter-coded frames. The timestamp refers to the ``timestamp`` field in
+	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+	function to convert the struct :c:type:`timeval` in struct
+	:c:type:`v4l2_buffer` to a __u64.
+    * - __u64
+      - ``golden_frame_ts``
+      - Timestamp for the V4L2 capture buffer to use as last reference frame, used
+        with inter-coded frames. The timestamp refers to the ``timestamp`` field in
+	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+	function to convert the struct :c:type:`timeval` in struct
+	:c:type:`v4l2_buffer` to a __u64.
+    * - __u64
+      - ``alt_frame_ts``
+      - Timestamp for the V4L2 capture buffer to use as alternate reference frame, used
+        with inter-coded frames. The timestamp refers to the ``timestamp`` field in
+	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+	function to convert the struct :c:type:`timeval` in struct
+	:c:type:`v4l2_buffer` to a __u64.
+    * - __u64
+      - ``flags``
+      - flags
+    * - __u64
+      - ``flags``
+      - See :ref:`Frame Header Flags <vp8_frame_header_flags>`
+
+.. _vp8_frame_header_flags:
+
+``Frame Header Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP8_FRAME_HDR_FLAG_KEY_FRAME``
+      - 0x01
+      - Inidicates if the frame is a key frame.
+    * - ``V4L2_VP8_FRAME_HDR_FLAG_EXPERIMENTAL``
+      - 0x02
+      - Experimental bitstream.
+    * - ``V4L2_VP8_FRAME_HDR_FLAG_SHOW_FRAME``
+      - 0x04
+      - Show frame flag, indicates if the frame is for display.
+    * - ``V4L2_VP8_FRAME_HDR_FLAG_MB_NO_SKIP_COEFF``
+      - 0x08
+      - Enable/disable skipping of macroblocks with no non-zero coefficients.
+
+.. c:type:: v4l2_vp8_entropy_coder_state
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp8_entropy_coder_state
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``range``
+      -
+    * - __u8
+      - ``value``
+      -
+    * - __u8
+      - ``bit_count``
+      -
+
+.. c:type:: v4l2_vp8_segment_header
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp8_segment_header
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``segment_feature_mode``
+      - Indicates the mode of segment feature data. 1 for absolute value
+        mode, 0 for delta value mode.
+    * - __s8
+      - ``quant_update[4]``
+      - Signed quantizer value update.
+    * - __s8
+      - ``lf_update[4]``
+      - Signed loop filter level value update.
+    * - __u8
+      - ``segment_probs[3]``
+      - Segment probabilities.
+    * - __u32
+      - ``flags``
+      - See :ref:`Segment Header Flags <vp8_segment_header_flags>`
+
+.. _vp8_segment_header_flags:
+
+``Segment Header Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED``
+      - 0x01
+      - Enable/disable segment-based adjustments.
+    * - ``V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_MAP``
+      - 0x02
+      - Indicates if the macroblock segmentation map is updated in this frame.
+    * - ``V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_FEATURE_DATA``
+      - 0x04
+      - Indicates if the segment feature data is updated in this frame.
+
+.. c:type:: v4l2_vp8_loopfilter_header
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp8_loopfilter_header
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``type``
+      - Filter type.
+    * - __u8
+      - ``level``
+      - Filter level
+    * - __u8
+      - ``sharpness_level``
+      - Sharpness level
+    * - __s8
+      - ``ref_frm_delta_magnitude[4]``
+      -
+    * - __s8
+      - ``mb_mode_delta_magnitude[4]``
+      -
+    * - __u16
+      - ``flags``
+      - See :ref:`Loopfilter Header Flags <vp8_loopfilter_header_flags>`
+
+.. _vp8_loopfilter_header_flags:
+
+``Loopfilter Header Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP8_LF_HDR_ADJ_ENABLE``
+      - 0x01
+      - Enable/disable macroblock-level loop filter adjustment.
+    * - ``V4L2_VP8_LF_HDR_DELTA_UPDATE``
+      - 0x02
+      - Indicates if the delta values used in an adjustment are updated.
+
+.. c:type:: v4l2_vp8_quantization_header
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp8_quantization_header
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``y_ac_qi``
+      -
+    * - __s8
+      - ``y_dc_delta``
+      -
+    * - __s8
+      - ``y2_dc_delta``
+      -
+    * - __s8
+      - ``y2_ac_delta``
+      -
+    * - __s8
+      - ``uv_dc_delta``
+      -
+    * - __s8
+      - ``uv_ac_delta``
+      -
+    * - __u16
+      - ``dequant_factors[4][3][2]``
+      -
+
+.. c:type:: v4l2_vp8_entropy_header
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp8_entropy_header
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``coeff_probs[4][8][3][11]``
+      -
+    * - __u8
+      - ``y_mode_probs[4]``
+      -
+    * - __u8
+      - ``uv_mode_probs[3]``
+      -
+    * - __u8
+      - ``mv_probs[2][19]``
+      -
+
 .. raw:: latex
 
     \normalsize
diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
index 4b701fc7653e..f349ad7c20cf 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
@@ -133,6 +133,26 @@ Compressed Formats
       - ``V4L2_PIX_FMT_VP8``
       - 'VP80'
       - VP8 video elementary stream.
+    * .. _V4L2-PIX-FMT-VP8-FRAME:
+
+      - ``V4L2_PIX_FMT_VP8_FRAME``
+      - 'VP8F'
+      - VP8 parsed frame, as extracted from the container.
+	This format is adapted for stateless video decoders that implement a
+	VP8 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
+	Metadata associated with the frame to decode is required to be passed
+	through the ``V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR`` control.
+	See the :ref:`associated Codec Control IDs <v4l2-mpeg-vp8>`.
+	Exactly one output and one capture buffer must be provided for use with
+	this pixel format. The output buffer must contain the appropriate number
+	of macroblocks to decode a full corresponding frame to the matching
+	capture buffer.
+
+	.. note::
+
+	   This format is not yet part of the public kernel API and it
+	   is expected to change.
+
     * .. _V4L2-PIX-FMT-VP9:
 
       - ``V4L2_PIX_FMT_VP9``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index f2b9bdedbf8c..bb623a972b9e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -885,6 +885,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
+	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR:			return "VP8 Frame Header";
 
 	/* HEVC controls */
 	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
@@ -1345,6 +1346,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR:
+		*type = V4L2_CTRL_TYPE_VP8_FRAME_HDR;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
@@ -1737,6 +1741,7 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
 	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
+	case V4L2_CTRL_TYPE_VP8_FRAME_HDR:
 		return 0;
 
 	default:
@@ -2337,6 +2342,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_h264_decode_params);
 		break;
+	case V4L2_CTRL_TYPE_VP8_FRAME_HDR:
+		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b1f4b991dba6..436a13204921 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1331,6 +1331,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_VC1_ANNEX_G:	descr = "VC-1 (SMPTE 412M Annex G)"; break;
 		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
 		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
+		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 FRAME"; break;
 		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
 		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
 		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b4433483af23..6e9dc9c44bb1 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -20,6 +20,7 @@
 #include <media/mpeg2-ctrls.h>
 #include <media/fwht-ctrls.h>
 #include <media/h264-ctrls.h>
+#include <media/vp8-ctrls.h>
 
 /* forward references */
 struct file;
@@ -48,6 +49,7 @@ struct poll_table_struct;
  * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
  * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
+ * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
  * @p:				Pointer to a compound value.
  */
 union v4l2_ctrl_ptr {
@@ -65,6 +67,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
+	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
 	void *p;
 };
 
diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
new file mode 100644
index 000000000000..3b0dcc125e25
--- /dev/null
+++ b/include/media/vp8-ctrls.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * These are the VP8 state controls for use with stateless VP8
+ * codec drivers.
+ *
+ * It turns out that these structs are not stable yet and will undergo
+ * more changes. So keep them private until they are stable and ready to
+ * become part of the official public API.
+ */
+
+#ifndef _VP8_CTRLS_H_
+#define _VP8_CTRLS_H_
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frames */
+
+#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HDR (V4L2_CID_MPEG_BASE + 2000)
+#define V4L2_CTRL_TYPE_VP8_FRAME_HDR 0x301
+
+#define V4L2_VP8_SEGMNT_HDR_FLAG_ENABLED              0x01
+#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_MAP           0x02
+#define V4L2_VP8_SEGMNT_HDR_FLAG_UPDATE_FEATURE_DATA  0x04
+
+struct v4l2_vp8_segment_header {
+	__u8 segment_feature_mode;
+	__s8 quant_update[4];
+	__s8 lf_update[4];
+	__u8 segment_probs[3];
+	__u32 flags;
+};
+
+#define V4L2_VP8_LF_HDR_ADJ_ENABLE	0x01
+#define V4L2_VP8_LF_HDR_DELTA_UPDATE	0x02
+struct v4l2_vp8_loopfilter_header {
+	__u16 type;
+	__u8 level;
+	__u8 sharpness_level;
+	__s8 ref_frm_delta_magnitude[4];
+	__s8 mb_mode_delta_magnitude[4];
+	__u16 flags;
+};
+
+struct v4l2_vp8_quantization_header {
+	__u8 y_ac_qi;
+	__s8 y_dc_delta;
+	__s8 y2_dc_delta;
+	__s8 y2_ac_delta;
+	__s8 uv_dc_delta;
+	__s8 uv_ac_delta;
+	__u16 dequant_factors[4][3][2];
+};
+
+struct v4l2_vp8_entropy_header {
+	__u8 coeff_probs[4][8][3][11];
+	__u8 y_mode_probs[4];
+	__u8 uv_mode_probs[3];
+	__u8 mv_probs[2][19];
+};
+
+struct v4l2_vp8_entropy_coder_state {
+	__u8 range;
+	__u8 value;
+	__u8 bit_count;
+};
+
+#define V4L2_VP8_FRAME_HDR_FLAG_KEY_FRAME		0x01
+#define V4L2_VP8_FRAME_HDR_FLAG_EXPERIMENTAL		0x02
+#define V4L2_VP8_FRAME_HDR_FLAG_SHOW_FRAME		0x04
+#define V4L2_VP8_FRAME_HDR_FLAG_MB_NO_SKIP_COEFF	0x08
+
+#define VP8_FRAME_IS_KEY_FRAME(hdr) (!!(hdr->flags & V4L2_VP8_FRAME_HDR_FLAG_KEY_FRAME))
+
+struct v4l2_ctrl_vp8_frame_header {
+	__u8 version;
+
+	/* Populated also if not a key frame */
+	__u16 width;
+	__u16 height;
+	__u8 horizontal_scale;
+	__u8 vertical_scale;
+
+	struct v4l2_vp8_segment_header segment_header;
+	struct v4l2_vp8_loopfilter_header lf_header;
+	struct v4l2_vp8_quantization_header quant_header;
+	struct v4l2_vp8_entropy_header entropy_header;
+
+	__u16 sign_bias_golden;
+	__u16 sign_bias_alternate;
+
+	__u8 prob_skip_false;
+	__u8 prob_intra;
+	__u8 prob_last;
+	__u8 prob_gf;
+
+	__u32 first_part_size;
+	__u32 macroblock_bit_offset;
+	__u32 dct_part_sizes[8];
+	__u8 num_dct_parts;
+
+	struct v4l2_vp8_entropy_coder_state coder_state;
+
+	__u64 last_frame_ts;
+	__u64 golden_frame_ts;
+	__u64 alt_frame_ts;
+
+	__u64 flags;
+};
+
+#endif
-- 
2.20.1

