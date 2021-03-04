Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7C832D4FE
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 15:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241168AbhCDOJ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 09:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240126AbhCDOJI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 09:09:08 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5172C061761;
        Thu,  4 Mar 2021 06:08:27 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 904391F4644B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 8/8] media: uapi: move VP8 stateless controls out of staging
Date:   Thu,  4 Mar 2021 11:07:55 -0300
Message-Id: <20210304140755.85581-9-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210304140755.85581-1-ezequiel@collabora.com>
References: <20210304140755.85581-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Until now, the VP8 V4L2 API was not exported as a public API,
and only defined in a private media header (media/vp8-ctrls.h).

The reason for this was a concern about the API not complete
and ready to support VP8 decoding hardware accelerators.

After reviewing the VP8 specification in detail, and now
that the API is able to support Cedrus and Hantro G1,
we can consider this ready.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 334 +++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 339 ------------------
 .../media/v4l/pixfmt-compressed.rst           |  10 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   4 +
 .../media/v4l/vidioc-queryctrl.rst            |   6 +
 .../media/videodev2.h.rst.exceptions          |   1 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |   4 +-
 drivers/staging/media/hantro/hantro_drv.c     |   2 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |   3 +-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      |   3 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   |   3 +-
 include/media/v4l2-ctrls.h                    |   1 -
 include/media/vp8-ctrls.h                     | 210 -----------
 include/uapi/linux/v4l2-controls.h            | 195 ++++++++++
 include/uapi/linux/videodev2.h                |   1 +
 17 files changed, 555 insertions(+), 565 deletions(-)
 delete mode 100644 include/media/vp8-ctrls.h

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 681f59e0a8f5..6628be22e670 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -908,3 +908,337 @@ FWHT Flags
 .. raw:: latex
 
     \normalsize
+
+.. _v4l2-codec-stateless-vp8:
+
+``V4L2_CID_STATELESS_VP8_FRAME (struct)``
+    Specifies the frame parameters for the associated VP8 parsed frame data.
+    This includes the necessary parameters for
+    configuring a stateless hardware decoding pipeline for VP8.
+    The bitstream parameters are defined according to :ref:`vp8`.
+
+.. c:type:: v4l2_ctrl_vp8_frame
+
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{7.0cm}|p{4.6cm}|p{5.7cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_vp8_frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - struct :c:type:`v4l2_vp8_segment`
+      - ``segment``
+      - Structure with segment-based adjustments metadata.
+    * - struct :c:type:`v4l2_vp8_loop_filter`
+      - ``lf``
+      - Structure with loop filter level adjustments metadata.
+    * - struct :c:type:`v4l2_vp8_quantization`
+      - ``quant``
+      - Structure with VP8 dequantization indices metadata.
+    * - struct :c:type:`v4l2_vp8_entropy`
+      - ``entropy``
+      - Structure with VP8 entropy coder probabilities metadata.
+    * - struct :c:type:`v4l2_vp8_entropy_coder_state`
+      - ``coder_state``
+      - Structure with VP8 entropy coder state.
+    * - __u16
+      - ``width``
+      - The width of the frame. Must be set for all frames.
+    * - __u16
+      - ``height``
+      - The height of the frame. Must be set for all frames.
+    * - __u8
+      - ``horizontal_scale``
+      - Horizontal scaling factor.
+    * - __u8
+      - ``vertical_scaling factor``
+      - Vertical scale.
+    * - __u8
+      - ``version``
+      - Bitstream version.
+    * - __u8
+      - ``prob_skip_false``
+      - Indicates the probability that the macroblock is not skipped.
+    * - __u8
+      - ``prob_intra``
+      - Indicates the probability that a macroblock is intra-predicted.
+    * - __u8
+      - ``prob_last``
+      - Indicates the probability that the last reference frame is used
+        for inter-prediction
+    * - __u8
+      - ``prob_gf``
+      - Indicates the probability that the golden reference frame is used
+        for inter-prediction
+    * - __u8
+      - ``num_dct_parts``
+      - Number of DCT coefficients partitions. Must be one of: 1, 2, 4, or 8.
+    * - __u32
+      - ``first_part_size``
+      - Size of the first partition, i.e. the control partition.
+    * - __u32
+      - ``first_part_header_bits``
+      - Size in bits of the first partition header portion.
+    * - __u32
+      - ``dct_part_sizes[8]``
+      - DCT coefficients sizes.
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
+      - See :ref:`Frame Flags <vp8_frame_flags>`
+
+.. raw:: latex
+
+    \normalsize
+
+.. _vp8_frame_flags:
+
+``Frame Flags``
+
+.. tabularcolumns:: |p{9.8cm}|p{0.8cm}|p{6.7cm}|
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP8_FRAME_FLAG_KEY_FRAME``
+      - 0x01
+      - Indicates if the frame is a key frame.
+    * - ``V4L2_VP8_FRAME_FLAG_EXPERIMENTAL``
+      - 0x02
+      - Experimental bitstream.
+    * - ``V4L2_VP8_FRAME_FLAG_SHOW_FRAME``
+      - 0x04
+      - Show frame flag, indicates if the frame is for display.
+    * - ``V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF``
+      - 0x08
+      - Enable/disable skipping of macroblocks with no non-zero coefficients.
+    * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN``
+      - 0x10
+      - Sign of motion vectors when the golden frame is referenced.
+    * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT``
+      - 0x20
+      - Sign of motion vectors when the alt frame is referenced.
+
+.. c:type:: v4l2_vp8_entropy_coder_state
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.0cm}|p{2.0cm}|p{14.3cm}|
+
+.. flat-table:: struct v4l2_vp8_entropy_coder_state
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``range``
+      - coder state value for "Range"
+    * - __u8
+      - ``value``
+      - coder state value for "Value"-
+    * - __u8
+      - ``bit_count``
+      - number of bits left.
+    * - __u8
+      - ``padding``
+      - Applications and drivers must set this to zero.
+
+.. c:type:: v4l2_vp8_segment
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.2cm}|p{4.0cm}|p{12.1cm}|
+
+.. flat-table:: struct v4l2_vp8_segment
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __s8
+      - ``quant_update[4]``
+      - Signed quantizer value update.
+    * - __s8
+      - ``lf_update[4]``
+      - Signed loop filter level value update.
+    * - __u8
+      - ``segment_probs[3]``
+      - Segment probabilities.
+    * - __u8
+      - ``padding``
+      - Applications and drivers must set this to zero.
+    * - __u32
+      - ``flags``
+      - See :ref:`Segment Flags <vp8_segment_flags>`
+
+.. _vp8_segment_flags:
+
+``Segment Flags``
+
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{10cm}|p{1.0cm}|p{6.3cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP8_SEGMENT_FLAG_ENABLED``
+      - 0x01
+      - Enable/disable segment-based adjustments.
+    * - ``V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP``
+      - 0x02
+      - Indicates if the macroblock segmentation map is updated in this frame.
+    * - ``V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA``
+      - 0x04
+      - Indicates if the segment feature data is updated in this frame.
+    * - ``V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE``
+      - 0x08
+      - If is set, the segment feature data mode is delta-value.
+        If cleared, it's absolute-value.
+
+.. raw:: latex
+
+    \normalsize
+
+.. c:type:: v4l2_vp8_loop_filter
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{3.9cm}|p{11.9cm}|
+
+.. flat-table:: struct v4l2_vp8_loop_filter
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __s8
+      - ``ref_frm_delta[4]``
+      - Reference adjustment (signed) delta value.
+    * - __s8
+      - ``mb_mode_delta[4]``
+      - Macroblock prediction mode adjustment (signed) delta value.
+    * - __u8
+      - ``sharpness_level``
+      - Sharpness level
+    * - __u8
+      - ``level``
+      - Filter level
+    * - __u16
+      - ``padding``
+      - Applications and drivers must set this to zero.
+    * - __u32
+      - ``flags``
+      - See :ref:`Loop Filter Flags <vp8_loop_filter_flags>`
+
+.. _vp8_loop_filter_flags:
+
+``Loop Filter Flags``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP8_LF_ADJ_ENABLE``
+      - 0x01
+      - Enable/disable macroblock-level loop filter adjustment.
+    * - ``V4L2_VP8_LF_DELTA_UPDATE``
+      - 0x02
+      - Indicates if the delta values used in an adjustment are updated.
+    * - ``V4L2_VP8_LF_FILTER_TYPE_SIMPLE``
+      - 0x04
+      - If set, indicates the filter type is simple.
+        If cleared, the filter type is normal.
+
+.. c:type:: v4l2_vp8_quantization
+
+.. tabularcolumns:: |p{1.5cm}|p{3.5cm}|p{12.3cm}|
+
+.. flat-table:: struct v4l2_vp8_quantization
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``y_ac_qi``
+      - Luma AC coefficient table index.
+    * - __s8
+      - ``y_dc_delta``
+      - Luma DC delta vaue.
+    * - __s8
+      - ``y2_dc_delta``
+      - Y2 block DC delta value.
+    * - __s8
+      - ``y2_ac_delta``
+      - Y2 block AC delta value.
+    * - __s8
+      - ``uv_dc_delta``
+      - Chroma DC delta value.
+    * - __s8
+      - ``uv_ac_delta``
+      - Chroma AC delta value.
+    * - __u16
+      - ``padding``
+      - Applications and drivers must set this to zero.
+
+.. c:type:: v4l2_vp8_entropy
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
+
+.. flat-table:: struct v4l2_vp8_entropy
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``coeff_probs[4][8][3][11]``
+      - Coefficient update probabilities.
+    * - __u8
+      - ``y_mode_probs[4]``
+      - Luma mode update probabilities.
+    * - __u8
+      - ``uv_mode_probs[3]``
+      - Chroma mode update probabilities.
+    * - __u8
+      - ``mv_probs[2][19]``
+      - MV decoding update probabilities.
+    * - __u8
+      - ``padding[3]``
+      - Applications and drivers must set this to zero.
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 1795f079aca2..16b83b06795e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1778,345 +1778,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Quantization parameter for a P frame for FWHT. Valid range: from 1
     to 31.
 
-.. _v4l2-mpeg-vp8:
-
-``V4L2_CID_MPEG_VIDEO_VP8_FRAME (struct)``
-    Specifies the frame parameters for the associated VP8 parsed frame data.
-    This includes the necessary parameters for
-    configuring a stateless hardware decoding pipeline for VP8.
-    The bitstream parameters are defined according to :ref:`vp8`.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_vp8_frame
-
-.. raw:: latex
-
-    \small
-
-.. tabularcolumns:: |p{7.0cm}|p{4.6cm}|p{5.7cm}|
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_vp8_frame
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - struct :c:type:`v4l2_vp8_segment`
-      - ``segment``
-      - Structure with segment-based adjustments metadata.
-    * - struct :c:type:`v4l2_vp8_loop_filter`
-      - ``lf``
-      - Structure with loop filter level adjustments metadata.
-    * - struct :c:type:`v4l2_vp8_quantization`
-      - ``quant``
-      - Structure with VP8 dequantization indices metadata.
-    * - struct :c:type:`v4l2_vp8_entropy`
-      - ``entropy``
-      - Structure with VP8 entropy coder probabilities metadata.
-    * - struct :c:type:`v4l2_vp8_entropy_coder_state`
-      - ``coder_state``
-      - Structure with VP8 entropy coder state.
-    * - __u16
-      - ``width``
-      - The width of the frame. Must be set for all frames.
-    * - __u16
-      - ``height``
-      - The height of the frame. Must be set for all frames.
-    * - __u8
-      - ``horizontal_scale``
-      - Horizontal scaling factor.
-    * - __u8
-      - ``vertical_scaling factor``
-      - Vertical scale.
-    * - __u8
-      - ``version``
-      - Bitstream version.
-    * - __u8
-      - ``prob_skip_false``
-      - Indicates the probability that the macroblock is not skipped.
-    * - __u8
-      - ``prob_intra``
-      - Indicates the probability that a macroblock is intra-predicted.
-    * - __u8
-      - ``prob_last``
-      - Indicates the probability that the last reference frame is used
-        for inter-prediction
-    * - __u8
-      - ``prob_gf``
-      - Indicates the probability that the golden reference frame is used
-        for inter-prediction
-    * - __u8
-      - ``num_dct_parts``
-      - Number of DCT coefficients partitions. Must be one of: 1, 2, 4, or 8.
-    * - __u32
-      - ``first_part_size``
-      - Size of the first partition, i.e. the control partition.
-    * - __u32
-      - ``first_part_header_bits``
-      - Size in bits of the first partition header portion.
-    * - __u32
-      - ``dct_part_sizes[8]``
-      - DCT coefficients sizes.
-    * - __u64
-      - ``last_frame_ts``
-      - Timestamp for the V4L2 capture buffer to use as last reference frame, used
-        with inter-coded frames. The timestamp refers to the ``timestamp`` field in
-	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
-	function to convert the struct :c:type:`timeval` in struct
-	:c:type:`v4l2_buffer` to a __u64.
-    * - __u64
-      - ``golden_frame_ts``
-      - Timestamp for the V4L2 capture buffer to use as last reference frame, used
-        with inter-coded frames. The timestamp refers to the ``timestamp`` field in
-	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
-	function to convert the struct :c:type:`timeval` in struct
-	:c:type:`v4l2_buffer` to a __u64.
-    * - __u64
-      - ``alt_frame_ts``
-      - Timestamp for the V4L2 capture buffer to use as alternate reference frame, used
-        with inter-coded frames. The timestamp refers to the ``timestamp`` field in
-	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
-	function to convert the struct :c:type:`timeval` in struct
-	:c:type:`v4l2_buffer` to a __u64.
-    * - __u64
-      - ``flags``
-      - See :ref:`Frame Flags <vp8_frame_flags>`
-
-.. raw:: latex
-
-    \normalsize
-
-.. _vp8_frame_flags:
-
-``Frame Flags``
-
-.. tabularcolumns:: |p{9.8cm}|p{0.8cm}|p{6.7cm}|
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_VP8_FRAME_FLAG_KEY_FRAME``
-      - 0x01
-      - Indicates if the frame is a key frame.
-    * - ``V4L2_VP8_FRAME_FLAG_EXPERIMENTAL``
-      - 0x02
-      - Experimental bitstream.
-    * - ``V4L2_VP8_FRAME_FLAG_SHOW_FRAME``
-      - 0x04
-      - Show frame flag, indicates if the frame is for display.
-    * - ``V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF``
-      - 0x08
-      - Enable/disable skipping of macroblocks with no non-zero coefficients.
-    * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN``
-      - 0x10
-      - Sign of motion vectors when the golden frame is referenced.
-    * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT``
-      - 0x20
-      - Sign of motion vectors when the alt frame is referenced.
-
-.. c:type:: v4l2_vp8_entropy_coder_state
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.0cm}|p{2.0cm}|p{14.3cm}|
-
-.. flat-table:: struct v4l2_vp8_entropy_coder_state
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``range``
-      -
-    * - __u8
-      - ``value``
-      -
-    * - __u8
-      - ``bit_count``
-      -
-    * - __u8
-      - ``padding``
-      - Applications and drivers must set this to zero.
-
-.. c:type:: v4l2_vp8_segment
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.2cm}|p{4.0cm}|p{12.1cm}|
-
-.. flat-table:: struct v4l2_vp8_segment
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __s8
-      - ``quant_update[4]``
-      - Signed quantizer value update.
-    * - __s8
-      - ``lf_update[4]``
-      - Signed loop filter level value update.
-    * - __u8
-      - ``segment_probs[3]``
-      - Segment probabilities.
-    * - __u8
-      - ``padding``
-      - Applications and drivers must set this to zero.
-    * - __u32
-      - ``flags``
-      - See :ref:`Segment Flags <vp8_segment_flags>`
-
-.. _vp8_segment_flags:
-
-``Segment Flags``
-
-.. raw:: latex
-
-    \small
-
-.. tabularcolumns:: |p{10cm}|p{1.0cm}|p{6.3cm}|
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_VP8_SEGMENT_FLAG_ENABLED``
-      - 0x01
-      - Enable/disable segment-based adjustments.
-    * - ``V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP``
-      - 0x02
-      - Indicates if the macroblock segmentation map is updated in this frame.
-    * - ``V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA``
-      - 0x04
-      - Indicates if the segment feature data is updated in this frame.
-    * - ``V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE``
-      - 0x08
-      - If is set, the segment feature data mode is delta-value.
-        If cleared, it's absolute-value.
-
-.. raw:: latex
-
-    \normalsize
-
-.. c:type:: v4l2_vp8_loop_filter
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.5cm}|p{3.9cm}|p{11.9cm}|
-
-.. flat-table:: struct v4l2_vp8_loop_filter
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __s8
-      - ``ref_frm_delta[4]``
-      - Reference adjustment (signed) delta value.
-    * - __s8
-      - ``mb_mode_delta[4]``
-      - Macroblock prediction mode adjustment (signed) delta value.
-    * - __u8
-      - ``sharpness_level``
-      - Sharpness level
-    * - __u8
-      - ``level``
-      - Filter level
-    * - __u16
-      - ``padding``
-      - Applications and drivers must set this to zero.
-    * - __u32
-      - ``flags``
-      - See :ref:`Loop Filter Flags <vp8_loop_filter_flags>`
-
-.. _vp8_loop_filter_flags:
-
-``Loop Filter Flags``
-
-.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_VP8_LF_ADJ_ENABLE``
-      - 0x01
-      - Enable/disable macroblock-level loop filter adjustment.
-    * - ``V4L2_VP8_LF_DELTA_UPDATE``
-      - 0x02
-      - Indicates if the delta values used in an adjustment are updated.
-    * - ``V4L2_VP8_LF_FILTER_TYPE_SIMPLE``
-      - 0x04
-      - If set, indicates the filter type is simple.
-        If cleared, the filter type is normal.
-
-.. c:type:: v4l2_vp8_quantization
-
-.. tabularcolumns:: |p{1.5cm}|p{3.5cm}|p{12.3cm}|
-
-.. flat-table:: struct v4l2_vp8_quantization
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``y_ac_qi``
-      - Luma AC coefficient table index.
-    * - __s8
-      - ``y_dc_delta``
-      - Luma DC delta vaue.
-    * - __s8
-      - ``y2_dc_delta``
-      - Y2 block DC delta value.
-    * - __s8
-      - ``y2_ac_delta``
-      - Y2 block AC delta value.
-    * - __s8
-      - ``uv_dc_delta``
-      - Chroma DC delta value.
-    * - __s8
-      - ``uv_ac_delta``
-      - Chroma AC delta value.
-    * - __u16
-      - ``padding``
-      - Applications and drivers must set this to zero.
-
-.. c:type:: v4l2_vp8_entropy
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
-
-.. flat-table:: struct v4l2_vp8_entropy
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``coeff_probs[4][8][3][11]``
-      - Coefficient update probabilities.
-    * - __u8
-      - ``y_mode_probs[4]``
-      - Luma mode update probabilities.
-    * - __u8
-      - ``uv_mode_probs[3]``
-      - Chroma mode update probabilities.
-    * - __u8
-      - ``mv_probs[2][19]``
-      - MV decoding update probabilities.
-    * - __u8
-      - ``padding[3]``
-      - Applications and drivers must set this to zero.
-
 .. raw:: latex
 
     \normalsize
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 0232d0808519..6dba70da822b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -153,12 +153,12 @@ Compressed Formats
 
       - ``V4L2_PIX_FMT_VP8_FRAME``
       - 'VP8F'
-      - VP8 parsed frame, as extracted from the container.
-	This format is adapted for stateless video decoders that implement a
-	VP8 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
+      - VP8 parsed frame, including the frame header, as extracted from the container.
+	This format is adapted for stateless video decoders that implement an
+	VP8 pipeline with the :ref:`stateless_decoder`.
 	Metadata associated with the frame to decode is required to be passed
-	through the ``V4L2_CID_MPEG_VIDEO_VP8_FRAME`` control.
-	See the :ref:`associated Codec Control IDs <v4l2-mpeg-vp8>`.
+	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
+	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
 	Exactly one output and one capture buffer must be provided for use with
 	this pixel format. The output buffer must contain the appropriate number
 	of macroblocks to decode a full corresponding frame to the matching
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index a90c433e430c..fd8533b55d51 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -216,6 +216,10 @@ still cause this situation.
       - ``p_fwht_params``
       - A pointer to a struct :c:type:`v4l2_ctrl_fwht_params`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_FWHT_PARAMS``.
+    * - struct :c:type:`v4l2_ctrl_vp8_frame` *
+      - ``p_vp8_frame``
+      - A pointer to a struct :c:type:`v4l2_ctrl_vp8_frame`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_VP8_FRAME``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 583fa551f0a1..f213b1bc0b76 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -489,6 +489,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_hevc_slice_params`, containing HEVC
 	slice parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_VP8_FRAME``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_vp8_frame`, containing VP8
+	frame parameters for stateless video decoders.
 
 .. raw:: latex
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 0ed170c6e720..afb1552b2d39 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -147,6 +147,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 658621b961d5..ef2d5e876b50 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -971,7 +971,6 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
 	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
-	case V4L2_CID_MPEG_VIDEO_VP8_FRAME:			return "VP8 Frame Parameters";
 
 	/* HEVC controls */
 	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
@@ -1201,6 +1200,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
+	case V4L2_CID_STATELESS_VP8_FRAME:			return "VP8 Frame Parameters";
 	default:
 		return NULL;
 	}
@@ -1470,7 +1470,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
 		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_VP8_FRAME:
+	case V4L2_CID_STATELESS_VP8_FRAME:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME;
 		break;
 	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index f1e7f0732e27..595e82a82728 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -299,7 +299,7 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_VP8_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_VP8_FRAME,
+			.id = V4L2_CID_STATELESS_VP8_FRAME,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index 7d6270e26297..57002ba70176 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -10,7 +10,6 @@
  */
 
 #include <media/v4l2-mem2mem.h>
-#include <media/vp8-ctrls.h>
 
 #include "hantro_hw.h"
 #include "hantro.h"
@@ -437,7 +436,7 @@ void hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hantro_start_prepare_run(ctx);
 
-	hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME);
+	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
 	if (WARN_ON(!hdr))
 		return;
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
index caa1435008d4..8661a3cc1e6b 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
@@ -13,7 +13,6 @@
  */
 
 #include <media/v4l2-mem2mem.h>
-#include <media/vp8-ctrls.h>
 
 #include "hantro_hw.h"
 #include "hantro.h"
@@ -515,7 +514,7 @@ void rk3399_vpu_vp8_dec_run(struct hantro_ctx *ctx)
 
 	hantro_start_prepare_run(ctx);
 
-	hdr = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_VP8_FRAME);
+	hdr = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_VP8_FRAME);
 	if (WARN_ON(!hdr))
 		return;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index e233feb49c9c..92812d1a39d4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -147,7 +147,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_VP8_FRAME,
+			.id	= V4L2_CID_STATELESS_VP8_FRAME,
 		},
 		.codec		= CEDRUS_CODEC_VP8,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index b0a0559cd0eb..d696b3ec70c0 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -72,7 +72,7 @@ void cedrus_device_run(void *priv)
 
 	case V4L2_PIX_FMT_VP8_FRAME:
 		run.vp8.frame_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_VP8_FRAME);
+			V4L2_CID_STATELESS_VP8_FRAME);
 		break;
 
 	default:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 12b233d28db3..f4016684b32d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -423,7 +423,8 @@ static const u8 prob_table_init[] = {
  * This table is a copy of k_mv_entropy_update_probs from the VP8
  * specification.
  *
- * FIXME: If any other driver uses it, move this table to media/vp8-ctrls.h
+ * FIXME: If any other driver uses it, we can consider moving
+ * this table so it can be shared.
  */
 static const u8 k_mv_entropy_update_probs[2][V4L2_VP8_MV_PROB_CNT] = {
 	{ 237, 246, 253, 253, 254, 254, 254, 254, 254,
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index aa06ff1695fe..dea65c92e86b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -18,7 +18,6 @@
  * This will move to the public headers once this API is fully stable.
  */
 #include <media/mpeg2-ctrls.h>
-#include <media/vp8-ctrls.h>
 #include <media/hevc-ctrls.h>
 
 /* forward references */
diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
deleted file mode 100644
index d19bf25e836d..000000000000
--- a/include/media/vp8-ctrls.h
+++ /dev/null
@@ -1,210 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * These are the VP8 state controls for use with stateless VP8
- * codec drivers.
- *
- * It turns out that these structs are not stable yet and will undergo
- * more changes. So keep them private until they are stable and ready to
- * become part of the official public API.
- */
-
-#ifndef _VP8_CTRLS_H_
-#define _VP8_CTRLS_H_
-
-#include <linux/types.h>
-
-#define V4L2_CID_MPEG_VIDEO_VP8_FRAME (V4L2_CID_CODEC_BASE + 2000)
-
-#define V4L2_VP8_SEGMENT_FLAG_ENABLED              0x01
-#define V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP           0x02
-#define V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA  0x04
-#define V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE     0x08
-
-/**
- * struct v4l2_vp8_segment - VP8 segment-based adjustments parameters
- *
- * @quant_update: update values for the segment quantizer.
- * @lf_update: update values for the loop filter level.
- * @segment_probs: branch probabilities of the segment_id decoding tree.
- * @padding: padding field. Should be zeroed by applications.
- * @flags: see V4L2_VP8_SEGMENT_FLAG_{}.
- *
- * This structure contains segment-based adjustments related parameters.
- * See the 'update_segmentation()' part of the frame header syntax,
- * and section '9.3. Segment-Based Adjustments' of the VP8 specification
- * for more details.
- */
-struct v4l2_vp8_segment {
-	__s8 quant_update[4];
-	__s8 lf_update[4];
-	__u8 segment_probs[3];
-	__u8 padding;
-	__u32 flags;
-};
-
-#define V4L2_VP8_LF_ADJ_ENABLE	0x01
-#define V4L2_VP8_LF_DELTA_UPDATE	0x02
-#define V4L2_VP8_LF_FILTER_TYPE_SIMPLE	0x04
-
-/**
- * struct v4l2_vp8_loop_filter - VP8 loop filter parameters
- *
- * @ref_frm_delta: Reference frame signed delta values.
- * @mb_mode_delta: MB prediction mode signed delta values.
- * @sharpness_level: matches sharpness_level syntax element.
- * @level: matches loop_filter_level syntax element.
- * @padding: padding field. Should be zeroed by applications.
- * @flags: see V4L2_VP8_LF_FLAG_{}.
- *
- * This structure contains loop filter related parameters.
- * See the 'mb_lf_adjustments()' part of the frame header syntax,
- * and section '9.4. Loop Filter Type and Levels' of the VP8 specification
- * for more details.
- */
-struct v4l2_vp8_loop_filter {
-	__s8 ref_frm_delta[4];
-	__s8 mb_mode_delta[4];
-	__u8 sharpness_level;
-	__u8 level;
-	__u16 padding;
-	__u32 flags;
-};
-
-/**
- * struct v4l2_vp8_quantization - VP8 quantizattion indices
- *
- * @y_ac_qi: luma AC coefficient table index.
- * @y_dc_delta: luma DC delta vaue.
- * @y2_dc_delta: y2 block DC delta value.
- * @y2_ac_delta: y2 block AC delta value.
- * @uv_dc_delta: chroma DC delta value.
- * @uv_ac_delta: chroma AC delta value.
- * @padding: padding field. Should be zeroed by applications.
-
- * This structure contains the quantization indices present
- * in 'quant_indices()' part of the frame header syntax.
- * See section '9.6. Dequantization Indices' of the VP8 specification
- * for more details.
- */
-struct v4l2_vp8_quantization {
-	__u8 y_ac_qi;
-	__s8 y_dc_delta;
-	__s8 y2_dc_delta;
-	__s8 y2_ac_delta;
-	__s8 uv_dc_delta;
-	__s8 uv_ac_delta;
-	__u16 padding;
-};
-
-#define V4L2_VP8_COEFF_PROB_CNT 11
-#define V4L2_VP8_MV_PROB_CNT 19
-
-/**
- * struct v4l2_vp8_entropy - VP8 update probabilities
- *
- * @coeff_probs: coefficient probability update values.
- * @y_mode_probs: luma intra-prediction probabilities.
- * @uv_mode_probs: chroma intra-prediction probabilities.
- * @mv_probs: mv decoding probability.
- * @padding: padding field. Should be zeroed by applications.
- *
- * This structure contains the update probabilities present in
- * 'token_prob_update()' and 'mv_prob_update()' part of the frame header.
- * See section '17.2. Probability Updates' of the VP8 specification
- * for more details.
- */
-struct v4l2_vp8_entropy {
-	__u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT];
-	__u8 y_mode_probs[4];
-	__u8 uv_mode_probs[3];
-	__u8 mv_probs[2][V4L2_VP8_MV_PROB_CNT];
-	__u8 padding[3];
-};
-
-/**
- * struct v4l2_vp8_entropy_coder_state - VP8 boolean coder state
- *
- * @range: coder state value for "Range"
- * @value: coder state value for "Value"
- * @bit_count: number of bits left in range "Value".
- * @padding: padding field. Should be zeroed by applications.
- *
- * This structure contains the state for the boolean coder, as
- * explained in section '7. Boolean Entropy Decoder' of the VP8 specification.
- */
-struct v4l2_vp8_entropy_coder_state {
-	__u8 range;
-	__u8 value;
-	__u8 bit_count;
-	__u8 padding;
-};
-
-#define V4L2_VP8_FRAME_FLAG_KEY_FRAME		0x01
-#define V4L2_VP8_FRAME_FLAG_EXPERIMENTAL		0x02
-#define V4L2_VP8_FRAME_FLAG_SHOW_FRAME		0x04
-#define V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF	0x08
-#define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN	0x10
-#define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT	0x20
-
-#define V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) \
-	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
-
-/**
- * struct v4l2_vp8_frame - VP8 frame parameters
- *
- * @seg: segmentation parameters. See &v4l2_vp8_segment for more details
- * @lf: loop filter parameters. See &v4l2_vp8_loop_filter for more details
- * @quant: quantization parameters. See &v4l2_vp8_quantization for more details
- * @probs: probabilities. See &v4l2_vp9_probabilities for more details
- * @width: frame width.
- * @height: frame height.
- * @horizontal_scale: horizontal scaling factor.
- * @vertical_scale: vertical scaling factor.
- * @version: bitstream version.
- * @prob_skip_false: frame header syntax element.
- * @prob_intra: frame header syntax element.
- * @prob_last: frame header syntax element.
- * @prob_gf: frame header syntax element.
- * @num_dct_parts: number of DCT coefficients partitions.
- * @first_part_size: size of the first partition, i.e. the control partition.
- * @first_part_header_bits: size in bits of the first partition header portion.
- * @dct_part_sizes: DCT coefficients sizes.
- * @last_frame_ts: "last" reference buffer timestamp.
- * The timestamp refers to the timestamp field in struct v4l2_buffer.
- * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
- * @golden_frame_ts: "golden" reference buffer timestamp.
- * @alt_frame_ts: "alt" reference buffer timestamp.
- * @flags: see V4L2_VP8_FRAME_FLAG_{}.
- */
-struct v4l2_ctrl_vp8_frame {
-	struct v4l2_vp8_segment segment;
-	struct v4l2_vp8_loop_filter lf;
-	struct v4l2_vp8_quantization quant;
-	struct v4l2_vp8_entropy entropy;
-	struct v4l2_vp8_entropy_coder_state coder_state;
-
-	__u16 width;
-	__u16 height;
-
-	__u8 horizontal_scale;
-	__u8 vertical_scale;
-
-	__u8 version;
-	__u8 prob_skip_false;
-	__u8 prob_intra;
-	__u8 prob_last;
-	__u8 prob_gf;
-	__u8 num_dct_parts;
-
-	__u32 first_part_size;
-	__u32 first_part_header_bits;
-	__u32 dct_part_sizes[8];
-
-	__u64 last_frame_ts;
-	__u64 golden_frame_ts;
-	__u64 alt_frame_ts;
-
-	__u64 flags;
-};
-
-#endif
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 039c0d7add1b..baa4fb8b1e37 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1657,6 +1657,201 @@ struct v4l2_ctrl_fwht_params {
 	__u32 quantization;
 };
 
+/* Stateless VP8 control */
+
+#define V4L2_VP8_SEGMENT_FLAG_ENABLED              0x01
+#define V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP           0x02
+#define V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA  0x04
+#define V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE     0x08
+
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
+struct v4l2_vp8_segment {
+	__s8 quant_update[4];
+	__s8 lf_update[4];
+	__u8 segment_probs[3];
+	__u8 padding;
+	__u32 flags;
+};
+
+#define V4L2_VP8_LF_ADJ_ENABLE	0x01
+#define V4L2_VP8_LF_DELTA_UPDATE	0x02
+#define V4L2_VP8_LF_FILTER_TYPE_SIMPLE	0x04
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
+struct v4l2_vp8_loop_filter {
+	__s8 ref_frm_delta[4];
+	__s8 mb_mode_delta[4];
+	__u8 sharpness_level;
+	__u8 level;
+	__u16 padding;
+	__u32 flags;
+};
+
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
+struct v4l2_vp8_quantization {
+	__u8 y_ac_qi;
+	__s8 y_dc_delta;
+	__s8 y2_dc_delta;
+	__s8 y2_ac_delta;
+	__s8 uv_dc_delta;
+	__s8 uv_ac_delta;
+	__u16 padding;
+};
+
+#define V4L2_VP8_COEFF_PROB_CNT 11
+#define V4L2_VP8_MV_PROB_CNT 19
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
+struct v4l2_vp8_entropy {
+	__u8 coeff_probs[4][8][3][V4L2_VP8_COEFF_PROB_CNT];
+	__u8 y_mode_probs[4];
+	__u8 uv_mode_probs[3];
+	__u8 mv_probs[2][V4L2_VP8_MV_PROB_CNT];
+	__u8 padding[3];
+};
+
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
+struct v4l2_vp8_entropy_coder_state {
+	__u8 range;
+	__u8 value;
+	__u8 bit_count;
+	__u8 padding;
+};
+
+#define V4L2_VP8_FRAME_FLAG_KEY_FRAME		0x01
+#define V4L2_VP8_FRAME_FLAG_EXPERIMENTAL		0x02
+#define V4L2_VP8_FRAME_FLAG_SHOW_FRAME		0x04
+#define V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF	0x08
+#define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN	0x10
+#define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT	0x20
+
+#define V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) \
+	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
+
+#define V4L2_CID_STATELESS_VP8_FRAME (V4L2_CID_CODEC_STATELESS_BASE + 200)
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
+struct v4l2_ctrl_vp8_frame {
+	struct v4l2_vp8_segment segment;
+	struct v4l2_vp8_loop_filter lf;
+	struct v4l2_vp8_quantization quant;
+	struct v4l2_vp8_entropy entropy;
+	struct v4l2_vp8_entropy_coder_state coder_state;
+
+	__u16 width;
+	__u16 height;
+
+	__u8 horizontal_scale;
+	__u8 vertical_scale;
+
+	__u8 version;
+	__u8 prob_skip_false;
+	__u8 prob_intra;
+	__u8 prob_last;
+	__u8 prob_gf;
+	__u8 num_dct_parts;
+
+	__u32 first_part_size;
+	__u32 first_part_header_bits;
+	__u32 dct_part_sizes[8];
+
+	__u64 last_frame_ts;
+	__u64 golden_frame_ts;
+	__u64 alt_frame_ts;
+
+	__u64 flags;
+};
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 611b75df7f17..ec2af5ddf7d7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1738,6 +1738,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_h264_slice_params __user *p_h264_slice_params;
 		struct v4l2_ctrl_h264_decode_params __user *p_h264_decode_params;
 		struct v4l2_ctrl_fwht_params __user *p_fwht_params;
+		struct v4l2_ctrl_vp8_frame __user *p_vp8_frame;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
-- 
2.30.0

