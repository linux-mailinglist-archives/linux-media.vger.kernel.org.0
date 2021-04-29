Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025B136ECB7
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhD2OuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:50:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35924 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240705AbhD2OuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:50:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 92B771F43536
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
Subject: [PATCH v7 10/10] media: uapi: move MPEG-2 stateless controls out of staging
Date:   Thu, 29 Apr 2021 11:48:18 -0300
Message-Id: <20210429144818.67105-11-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210429144818.67105-1-ezequiel@collabora.com>
References: <20210429144818.67105-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Until now, the MPEG-2 V4L2 API was not exported as a public API,
and only defined in a private media header (media/mpeg2-ctrls.h).

After reviewing the MPEG-2 specification in detail, and reworking
the controls so they match the MPEG-2 semantics properly,
we can consider it ready.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 214 +++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 216 ------------------
 .../media/v4l/pixfmt-compressed.rst           |  10 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |  12 +-
 drivers/staging/media/hantro/hantro_drv.c     |   6 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   6 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |   6 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   6 +-
 include/media/mpeg2-ctrls.h                   | 126 ----------
 include/media/v4l2-ctrls.h                    |   1 -
 include/uapi/linux/v4l2-controls.h            | 112 +++++++++
 include/uapi/linux/videodev2.h                |   3 +
 14 files changed, 367 insertions(+), 369 deletions(-)
 delete mode 100644 include/media/mpeg2-ctrls.h

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 3fc04daa9ffb..2aa508ffb6b9 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -1244,3 +1244,217 @@ FWHT Flags
     * - __u8
       - ``padding[3]``
       - Applications and drivers must set this to zero.
+
+.. _v4l2-codec-stateless-mpeg2:
+
+``V4L2_CID_STATELESS_MPEG2_SEQUENCE (struct)``
+    Specifies the sequence parameters (as extracted from the bitstream) for the
+    associated MPEG-2 slice data. This includes fields matching the syntax
+    elements from the sequence header and sequence extension parts of the
+    bitstream as specified by :ref:`mpeg2part2`.
+
+.. c:type:: v4l2_ctrl_mpeg2_sequence
+
+.. raw:: latex
+
+    \small
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.4cm}|p{6.5cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_ctrl_mpeg2_sequence
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``horizontal_size``
+      - The width of the displayable part of the frame's luminance component.
+    * - __u16
+      - ``vertical_size``
+      - The height of the displayable part of the frame's luminance component.
+    * - __u32
+      - ``vbv_buffer_size``
+      - Used to calculate the required size of the video buffering verifier,
+	defined (in bits) as: 16 * 1024 * vbv_buffer_size.
+    * - __u16
+      - ``profile_and_level_indication``
+      - The current profile and level indication as extracted from the
+	bitstream.
+    * - __u8
+      - ``chroma_format``
+      - The chrominance sub-sampling format (1: 4:2:0, 2: 4:2:2, 3: 4:4:4).
+    * - __u8
+      - ``flags``
+      - See :ref:`MPEG-2 Sequence Flags <mpeg2_sequence_flags>`.
+
+.. _mpeg2_sequence_flags:
+
+``MPEG-2 Sequence Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE``
+      - 0x01
+      - Indication that all the frames for the sequence are progressive instead
+	of interlaced.
+
+.. raw:: latex
+
+    \normalsize
+
+``V4L2_CID_STATELESS_MPEG2_PICTURE (struct)``
+    Specifies the picture parameters (as extracted from the bitstream) for the
+    associated MPEG-2 slice data. This includes fields matching the syntax
+    elements from the picture header and picture coding extension parts of the
+    bitstream as specified by :ref:`mpeg2part2`.
+
+.. c:type:: v4l2_ctrl_mpeg2_picture
+
+.. raw:: latex
+
+    \small
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.0cm}|p{5.6cm}|p{10.7cm}|
+
+.. flat-table:: struct v4l2_ctrl_mpeg2_picture
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u64
+      - ``backward_ref_ts``
+      - Timestamp of the V4L2 capture buffer to use as backward reference, used
+        with B-coded and P-coded frames. The timestamp refers to the
+	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
+	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
+	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
+    * - __u64
+      - ``forward_ref_ts``
+      - Timestamp for the V4L2 capture buffer to use as forward reference, used
+        with B-coded frames. The timestamp refers to the ``timestamp`` field in
+	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+	function to convert the struct :c:type:`timeval` in struct
+	:c:type:`v4l2_buffer` to a __u64.
+    * - __u32
+      - ``flags``
+      - See :ref:`MPEG-2 Picture Flags <mpeg2_picture_flags>`.
+    * - __u8
+      - ``f_code[2][2]``
+      - Motion vector codes.
+    * - __u8
+      - ``picture_coding_type``
+      - Picture coding type for the frame covered by the current slice
+	(V4L2_MPEG2_PICTURE_CODING_TYPE_I, V4L2_MPEG2_PICTURE_CODING_TYPE_P or
+	V4L2_MPEG2_PICTURE_CODING_TYPE_B).
+    * - __u8
+      - ``picture_structure``
+      - Picture structure (1: interlaced top field, 2: interlaced bottom field,
+	3: progressive frame).
+    * - __u8
+      - ``intra_dc_precision``
+      - Precision of Discrete Cosine transform (0: 8 bits precision,
+	1: 9 bits precision, 2: 10 bits precision, 3: 11 bits precision).
+    * - __u8
+      - ``reserved[5]``
+      - Applications and drivers must set this to zero.
+
+.. _mpeg2_picture_flags:
+
+``MPEG-2 Picture Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST``
+      - 0x00000001
+      - If set and it's an interlaced stream, top field is output first.
+    * - ``V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT``
+      - 0x00000002
+      - If set only frame-DCT and frame prediction are used.
+    * - ``V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV``
+      - 0x00000004
+      -  If set motion vectors are coded for intra macroblocks.
+    * - ``V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE``
+      - 0x00000008
+      - This flag affects the inverse quantization process.
+    * - ``V4L2_MPEG2_PIC_FLAG_INTRA_VLC``
+      - 0x00000010
+      - This flag affects the decoding of transform coefficient data.
+    * - ``V4L2_MPEG2_PIC_FLAG_ALT_SCAN``
+      - 0x00000020
+      - This flag affects the decoding of transform coefficient data.
+    * - ``V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST``
+      - 0x00000040
+      - This flag affects the decoding process of progressive frames.
+    * - ``V4L2_MPEG2_PIC_FLAG_PROGRESSIVE``
+      - 0x00000080
+      - Indicates whether the current frame is progressive.
+
+.. raw:: latex
+
+    \normalsize
+
+``V4L2_CID_STATELESS_MPEG2_QUANTISATION (struct)``
+    Specifies quantisation matrices, in zigzag scanning order, for the
+    associated MPEG-2 slice data. This control is initialized by the kernel
+    to the matrices default values. If a bitstream transmits a user-defined
+    quantisation matrices load, applications are expected to use this control.
+    Applications are also expected to set the control loading the default
+    values, if the quantisation matrices need to be reset, for instance on a
+    sequence header. This process is specified by section 6.3.7.
+    "Quant matrix extension" of the specification.
+
+.. c:type:: v4l2_ctrl_mpeg2_quantisation
+
+.. tabularcolumns:: |p{0.8cm}|p{8.0cm}|p{8.5cm}|
+
+.. cssclass:: longtable
+
+.. raw:: latex
+
+    \small
+
+.. flat-table:: struct v4l2_ctrl_mpeg2_quantisation
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``intra_quantiser_matrix[64]``
+      - The quantisation matrix coefficients for intra-coded frames, in zigzag
+	scanning order. It is relevant for both luma and chroma components,
+	although it can be superseded by the chroma-specific matrix for
+	non-4:2:0 YUV formats.
+    * - __u8
+      - ``non_intra_quantiser_matrix[64]``
+      - The quantisation matrix coefficients for non-intra-coded frames, in
+	zigzag scanning order. It is relevant for both luma and chroma
+	components, although it can be superseded by the chroma-specific matrix
+	for non-4:2:0 YUV formats.
+    * - __u8
+      - ``chroma_intra_quantiser_matrix[64]``
+      - The quantisation matrix coefficients for the chominance component of
+	intra-coded frames, in zigzag scanning order. Only relevant for
+	non-4:2:0 YUV formats.
+    * - __u8
+      - ``chroma_non_intra_quantiser_matrix[64]``
+      - The quantisation matrix coefficients for the chrominance component of
+	non-intra-coded frames, in zigzag scanning order. Only relevant for
+	non-4:2:0 YUV formats.
+
+.. raw:: latex
+
+    \normalsize
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce45792c6fb4..a580ea953c4e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1606,222 +1606,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 ``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR (integer)``
     Indicates bit rate (bps) for hierarchical coding layer 6 for H264 encoder.
 
-.. _v4l2-mpeg-mpeg2:
-
-``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE (struct)``
-    Specifies the sequence parameters (as extracted from the bitstream) for the
-    associated MPEG-2 slice data. This includes fields matching the syntax
-    elements from the sequence header and sequence extension parts of the
-    bitstream as specified by :ref:`mpeg2part2`.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_mpeg2_sequence
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.4cm}|p{6.5cm}|p{9.4cm}|
-
-.. flat-table:: struct v4l2_ctrl_mpeg2_sequence
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u16
-      - ``horizontal_size``
-      - The width of the displayable part of the frame's luminance component.
-    * - __u16
-      - ``vertical_size``
-      - The height of the displayable part of the frame's luminance component.
-    * - __u32
-      - ``vbv_buffer_size``
-      - Used to calculate the required size of the video buffering verifier,
-	defined (in bits) as: 16 * 1024 * vbv_buffer_size.
-    * - __u16
-      - ``profile_and_level_indication``
-      - The current profile and level indication as extracted from the
-	bitstream.
-    * - __u8
-      - ``chroma_format``
-      - The chrominance sub-sampling format (1: 4:2:0, 2: 4:2:2, 3: 4:4:4).
-    * - __u8
-      - ``flags``
-      - See :ref:`MPEG-2 Sequence Flags <mpeg2_sequence_flags>`.
-
-.. _mpeg2_sequence_flags:
-
-``MPEG-2 Sequence Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE``
-      - 0x01
-      - Indication that all the frames for the sequence are progressive instead
-	of interlaced.
-
-``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE (struct)``
-    Specifies the picture parameters (as extracted from the bitstream) for the
-    associated MPEG-2 slice data. This includes fields matching the syntax
-    elements from the picture header and picture coding extension parts of the
-    bitstream as specified by :ref:`mpeg2part2`.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_mpeg2_picture
-
-.. raw:: latex
-
-    \small
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.0cm}|p{5.6cm}|p{10.7cm}|
-
-.. flat-table:: struct v4l2_ctrl_mpeg2_picture
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u64
-      - ``backward_ref_ts``
-      - Timestamp of the V4L2 capture buffer to use as backward reference, used
-        with B-coded and P-coded frames. The timestamp refers to the
-	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
-	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
-	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
-    * - __u64
-      - ``forward_ref_ts``
-      - Timestamp for the V4L2 capture buffer to use as forward reference, used
-        with B-coded frames. The timestamp refers to the ``timestamp`` field in
-	struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
-	function to convert the struct :c:type:`timeval` in struct
-	:c:type:`v4l2_buffer` to a __u64.
-    * - __u32
-      - ``flags``
-      - See :ref:`MPEG-2 Picture Flags <mpeg2_picture_flags>`.
-    * - __u8
-      - ``f_code[2][2]``
-      - Motion vector codes.
-    * - __u8
-      - ``picture_coding_type``
-      - Picture coding type for the frame covered by the current slice
-	(V4L2_MPEG2_PICTURE_CODING_TYPE_I, V4L2_MPEG2_PICTURE_CODING_TYPE_P or
-	V4L2_MPEG2_PICTURE_CODING_TYPE_B).
-    * - __u8
-      - ``picture_structure``
-      - Picture structure (1: interlaced top field, 2: interlaced bottom field,
-	3: progressive frame).
-    * - __u8
-      - ``intra_dc_precision``
-      - Precision of Discrete Cosine transform (0: 8 bits precision,
-	1: 9 bits precision, 2: 10 bits precision, 3: 11 bits precision).
-    * - __u8
-      - ``reserved[5]``
-      - Applications and drivers must set this to zero.
-
-
-.. _mpeg2_picture_flags:
-
-``MPEG-2 Picture Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST``
-      - 0x00000001
-      - If set and it's an interlaced stream, top field is output first.
-    * - ``V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT``
-      - 0x00000002
-      - If set only frame-DCT and frame prediction are used.
-    * - ``V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV``
-      - 0x00000004
-      -  If set motion vectors are coded for intra macroblocks.
-    * - ``V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE``
-      - 0x00000008
-      - This flag affects the inverse quantization process.
-    * - ``V4L2_MPEG2_PIC_FLAG_INTRA_VLC``
-      - 0x00000010
-      - This flag affects the decoding of transform coefficient data.
-    * - ``V4L2_MPEG2_PIC_FLAG_ALT_SCAN``
-      - 0x00000020
-      - This flag affects the decoding of transform coefficient data.
-    * - ``V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST``
-      - 0x00000040
-      - This flag affects the decoding process of progressive frames.
-    * - ``V4L2_MPEG2_PIC_FLAG_PROGRESSIVE``
-      - 0x00000080
-      - Indicates whether the current frame is progressive.
-
-.. raw:: latex
-
-    \normalsize
-
-``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION (struct)``
-    Specifies quantisation matrices (as extracted from the bitstream) for the
-    associated MPEG-2 slice data.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_mpeg2_quantisation
-
-.. tabularcolumns:: |p{0.8cm}|p{8.0cm}|p{8.5cm}|
-
-.. cssclass:: longtable
-
-.. raw:: latex
-
-    \small
-
-.. flat-table:: struct v4l2_ctrl_mpeg2_quantisation
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``intra_quantiser_matrix[64]``
-      - The quantisation matrix coefficients for intra-coded frames, in zigzag
-	scanning order. It is relevant for both luma and chroma components,
-	although it can be superseded by the chroma-specific matrix for
-	non-4:2:0 YUV formats.
-    * - __u8
-      - ``non_intra_quantiser_matrix[64]``
-      - The quantisation matrix coefficients for non-intra-coded frames, in
-	zigzag scanning order. It is relevant for both luma and chroma
-	components, although it can be superseded by the chroma-specific matrix
-	for non-4:2:0 YUV formats.
-    * - __u8
-      - ``chroma_intra_quantiser_matrix[64]``
-      - The quantisation matrix coefficients for the chominance component of
-	intra-coded frames, in zigzag scanning order. Only relevant for
-	non-4:2:0 YUV formats.
-    * - __u8
-      - ``chroma_non_intra_quantiser_matrix[64]``
-      - The quantisation matrix coefficients for the chrominance component of
-	non-intra-coded frames, in zigzag scanning order. Only relevant for
-	non-4:2:0 YUV formats.
-
-.. raw:: latex
-
-    \normalsize
-
 ``V4L2_CID_FWHT_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for FWHT. Valid range: from 1
     to 31.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 6c10a062adac..0ede39907ee2 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -112,13 +112,13 @@ Compressed Formats
       - 'MG2S'
       - MPEG-2 parsed slice data, as extracted from the MPEG-2 bitstream.
 	This format is adapted for stateless video decoders that implement a
-	MPEG-2 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
+	MPEG-2 pipeline with the :ref:`stateless_decoder`.
 	Metadata associated with the frame to decode is required to be passed
-	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE`` and
-        ``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE`` controls.
+	through the ``V4L2_CID_STATELESS_MPEG2_SEQUENCE`` and
+        ``V4L2_CID_STATELESS_MPEG2_PICTURE`` controls.
         Quantisation matrices can optionally be specified through the
-	``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION`` control.
-	See the :ref:`associated Codec Control IDs <v4l2-mpeg-mpeg2>`.
+	``V4L2_CID_STATELESS_MPEG2_QUANTISATION`` control.
+	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-mpeg2>`.
 	Exactly one output and one capture buffer must be provided for use with
 	this pixel format. The output buffer must contain the appropriate number
 	of macroblocks to decode a full corresponding frame to the matching
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 3ba22983d21f..2d6bc8d94380 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -221,6 +221,18 @@ still cause this situation.
       - ``p_vp8_frame``
       - A pointer to a struct :c:type:`v4l2_ctrl_vp8_frame`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_VP8_FRAME``.
+    * - struct :c:type:`v4l2_ctrl_mpeg2_sequence` *
+      - ``p_mpeg2_sequence``
+      - A pointer to a struct :c:type:`v4l2_ctrl_mpeg2_sequence`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_MPEG2_SEQUENCE``.
+    * - struct :c:type:`v4l2_ctrl_mpeg2_picture` *
+      - ``p_mpeg2_picture``
+      - A pointer to a struct :c:type:`v4l2_ctrl_mpeg2_picture`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_MPEG2_PICTURE``.
+    * - struct :c:type:`v4l2_ctrl_mpeg2_quantisation` *
+      - ``p_mpeg2_quantisation``
+      - A pointer to a struct :c:type:`v4l2_ctrl_mpeg2_quantisation`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``.
     * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
       - ``p_hdr10_cll``
       - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index a693ff8dc3dc..d4e2c7318ee6 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -977,9 +977,6 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE:		return "MPEG-2 Sequence Header";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1228,6 +1225,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
 	case V4L2_CID_STATELESS_VP8_FRAME:			return "VP8 Frame Parameters";
+	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:			return "MPEG-2 Sequence Header";
+	case V4L2_CID_STATELESS_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
+	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
 
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1500,13 +1500,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_RDS_TX_ALT_FREQS:
 		*type = V4L2_CTRL_TYPE_U32;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE:
+	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:
 		*type = V4L2_CTRL_TYPE_MPEG2_SEQUENCE;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE:
+	case V4L2_CID_STATELESS_MPEG2_PICTURE:
 		*type = V4L2_CTRL_TYPE_MPEG2_PICTURE;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION:
+	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
 		*type = V4L2_CTRL_TYPE_MPEG2_QUANTISATION;
 		break;
 	case V4L2_CID_STATELESS_FWHT_PARAMS:
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index f5fa7e0940c4..b48552bddb3a 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -289,17 +289,17 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE,
+			.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE,
+			.id = V4L2_CID_STATELESS_MPEG2_PICTURE,
 		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION,
+			.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION,
 		},
 	}, {
 		.codec = HANTRO_VP8_DECODER,
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 6d89cae7df45..f565e37e397a 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -83,7 +83,7 @@ hantro_g1_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
 {
 	struct v4l2_ctrl_mpeg2_quantisation *q;
 
-	q = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION);
+	q = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_QUANTISATION);
 	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu, q);
 	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma, G1_REG_QTABLE_BASE);
 }
@@ -160,9 +160,9 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	seq = hantro_get_ctrl(ctx,
-			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
+			      V4L2_CID_STATELESS_MPEG2_SEQUENCE);
 	pic = hantro_get_ctrl(ctx,
-			      V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
+			      V4L2_CID_STATELESS_MPEG2_PICTURE);
 
 	reg = G1_REG_DEC_AXI_RD_ID(0) |
 	      G1_REG_DEC_TIMEOUT_E(1) |
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index d16d76760278..2527dce7eb18 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -85,7 +85,7 @@ rk3399_vpu_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
 {
 	struct v4l2_ctrl_mpeg2_quantisation *q;
 
-	q = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION);
+	q = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_MPEG2_QUANTISATION);
 	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu, q);
 	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma, VDPU_REG_QTABLE_BASE);
 }
@@ -162,9 +162,9 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	seq = hantro_get_ctrl(ctx,
-			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
+			      V4L2_CID_STATELESS_MPEG2_SEQUENCE);
 	pic = hantro_get_ctrl(ctx,
-			      V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
+			      V4L2_CID_STATELESS_MPEG2_PICTURE);
 
 	reg = VDPU_REG_DEC_ADV_PRE_DIS(0) |
 	      VDPU_REG_DEC_SCMD_DIS(0) |
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 4430c8fa2cc7..fa348c09f844 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -31,19 +31,19 @@
 static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE,
+			.id	= V4L2_CID_STATELESS_MPEG2_SEQUENCE,
 		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE,
+			.id	= V4L2_CID_STATELESS_MPEG2_PICTURE,
 		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION,
+			.id	= V4L2_CID_STATELESS_MPEG2_QUANTISATION,
 		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index e98185c1f5a7..97e410d92506 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -41,11 +41,11 @@ void cedrus_device_run(void *priv)
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
 		run.mpeg2.sequence = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
+			V4L2_CID_STATELESS_MPEG2_SEQUENCE);
 		run.mpeg2.picture = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
+			V4L2_CID_STATELESS_MPEG2_PICTURE);
 		run.mpeg2.quantisation = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION);
+			V4L2_CID_STATELESS_MPEG2_QUANTISATION);
 		break;
 
 	case V4L2_PIX_FMT_H264_SLICE:
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
deleted file mode 100644
index a3d19de9e53a..000000000000
--- a/include/media/mpeg2-ctrls.h
+++ /dev/null
@@ -1,126 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * These are the MPEG2 state controls for use with stateless MPEG-2
- * codec drivers.
- *
- * It turns out that these structs are not stable yet and will undergo
- * more changes. So keep them private until they are stable and ready to
- * become part of the official public API.
- */
-
-#ifndef _MPEG2_CTRLS_H_
-#define _MPEG2_CTRLS_H_
-
-#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION		(V4L2_CID_CODEC_BASE+251)
-#define V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE		(V4L2_CID_CODEC_BASE+252)
-#define V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE		(V4L2_CID_CODEC_BASE+253)
-
-/* enum v4l2_ctrl_type type values */
-#define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE		0x01
-
-/**
- * struct v4l2_ctrl_mpeg2_sequence - MPEG-2 sequence header
- *
- * All the members on this structure match the sequence header and sequence
- * extension syntaxes as specified by the MPEG-2 specification.
- *
- * Fields horizontal_size, vertical_size and vbv_buffer_size are a
- * combination of respective _value and extension syntax elements,
- * as described in section 6.3.3 "Sequence header".
- *
- * @horizontal_size: combination of elements horizontal_size_value and
- * horizontal_size_extension.
- * @vertical_size: combination of elements vertical_size_value and
- * vertical_size_extension.
- * @vbv_buffer_size: combination of elements vbv_buffer_size_value and
- * vbv_buffer_size_extension.
- * @profile_and_level_indication: see MPEG-2 specification.
- * @chroma_format: see MPEG-2 specification.
- * @flags: see V4L2_MPEG2_SEQ_FLAG_{}.
- */
-struct v4l2_ctrl_mpeg2_sequence {
-	__u16	horizontal_size;
-	__u16	vertical_size;
-	__u32	vbv_buffer_size;
-	__u16	profile_and_level_indication;
-	__u8	chroma_format;
-	__u8	flags;
-};
-
-#define V4L2_MPEG2_PIC_CODING_TYPE_I			1
-#define V4L2_MPEG2_PIC_CODING_TYPE_P			2
-#define V4L2_MPEG2_PIC_CODING_TYPE_B			3
-#define V4L2_MPEG2_PIC_CODING_TYPE_D			4
-
-#define V4L2_MPEG2_PIC_TOP_FIELD			0x1
-#define V4L2_MPEG2_PIC_BOTTOM_FIELD			0x2
-#define V4L2_MPEG2_PIC_FRAME				0x3
-
-#define V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST		0x0001
-#define V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT		0x0002
-#define V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV		0x0004
-#define V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE		0x0008
-#define V4L2_MPEG2_PIC_FLAG_INTRA_VLC			0x0010
-#define V4L2_MPEG2_PIC_FLAG_ALT_SCAN			0x0020
-#define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST		0x0040
-#define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE			0x0080
-
-/**
- * struct v4l2_ctrl_mpeg2_picture - MPEG-2 picture header
- *
- * All the members on this structure match the picture header and picture
- * coding extension syntaxes as specified by the MPEG-2 specification.
- *
- * @backward_ref_ts: timestamp of the V4L2 capture buffer to use as
- * reference for backward prediction.
- * @forward_ref_ts: timestamp of the V4L2 capture buffer to use as
- * reference for forward prediction. These timestamp refers to the
- * timestamp field in struct v4l2_buffer. Use v4l2_timeval_to_ns()
- * to convert the struct timeval to a __u64.
- * @flags: see V4L2_MPEG2_PIC_FLAG_{}.
- * @f_code[2][2]: see MPEG-2 specification.
- * @picture_coding_type: see MPEG-2 specification.
- * @picture_structure: see V4L2_MPEG2_PIC_{}_FIELD.
- * @intra_dc_precision: see MPEG-2 specification.
- * @reserved: padding field. Should be zeroed by applications.
- */
-struct v4l2_ctrl_mpeg2_picture {
-	__u64	backward_ref_ts;
-	__u64	forward_ref_ts;
-	__u32	flags;
-	__u8	f_code[2][2];
-	__u8	picture_coding_type;
-	__u8	picture_structure;
-	__u8	intra_dc_precision;
-	__u8	reserved[5];
-};
-
-/**
- * struct v4l2_ctrl_mpeg2_quantisation - MPEG-2 quantisation
- *
- * Quantization matrices as specified by section 6.3.7
- * "Quant matrix extension".
- *
- * @intra_quantiser_matrix: The quantisation matrix coefficients
- * for intra-coded frames, in zigzag scanning order. It is relevant
- * for both luma and chroma components, although it can be superseded
- * by the chroma-specific matrix for non-4:2:0 YUV formats.
- * @non_intra_quantiser_matrix: The quantisation matrix coefficients
- * for non-intra-coded frames, in zigzag scanning order. It is relevant
- * for both luma and chroma components, although it can be superseded
- * by the chroma-specific matrix for non-4:2:0 YUV formats.
- * @chroma_intra_quantiser_matrix: The quantisation matrix coefficients
- * for the chominance component of intra-coded frames, in zigzag scanning
- * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
- * @chroma_non_intra_quantiser_matrix: The quantisation matrix coefficients
- * for the chrominance component of non-intra-coded frames, in zigzag scanning
- * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
- */
-struct v4l2_ctrl_mpeg2_quantisation {
-	__u8	intra_quantiser_matrix[64];
-	__u8	non_intra_quantiser_matrix[64];
-	__u8	chroma_intra_quantiser_matrix[64];
-	__u8	chroma_non_intra_quantiser_matrix[64];
-};
-
-#endif
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 215e44172c66..575b59fbac77 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -17,7 +17,6 @@
  * Include the stateless codec compound control definitions.
  * This will move to the public headers once this API is fully stable.
  */
-#include <media/mpeg2-ctrls.h>
 #include <media/hevc-ctrls.h>
 
 /* forward references */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d43bec5f1afd..f96bea19c991 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1862,6 +1862,118 @@ struct v4l2_ctrl_vp8_frame {
 	__u64 flags;
 };
 
+/* Stateless MPEG-2 controls */
+
+#define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE	0x01
+
+#define V4L2_CID_STATELESS_MPEG2_SEQUENCE (V4L2_CID_CODEC_STATELESS_BASE+220)
+/**
+ * struct v4l2_ctrl_mpeg2_sequence - MPEG-2 sequence header
+ *
+ * All the members on this structure match the sequence header and sequence
+ * extension syntaxes as specified by the MPEG-2 specification.
+ *
+ * Fields horizontal_size, vertical_size and vbv_buffer_size are a
+ * combination of respective _value and extension syntax elements,
+ * as described in section 6.3.3 "Sequence header".
+ *
+ * @horizontal_size: combination of elements horizontal_size_value and
+ * horizontal_size_extension.
+ * @vertical_size: combination of elements vertical_size_value and
+ * vertical_size_extension.
+ * @vbv_buffer_size: combination of elements vbv_buffer_size_value and
+ * vbv_buffer_size_extension.
+ * @profile_and_level_indication: see MPEG-2 specification.
+ * @chroma_format: see MPEG-2 specification.
+ * @flags: see V4L2_MPEG2_SEQ_FLAG_{}.
+ */
+struct v4l2_ctrl_mpeg2_sequence {
+	__u16	horizontal_size;
+	__u16	vertical_size;
+	__u32	vbv_buffer_size;
+	__u16	profile_and_level_indication;
+	__u8	chroma_format;
+	__u8	flags;
+};
+
+#define V4L2_MPEG2_PIC_CODING_TYPE_I			1
+#define V4L2_MPEG2_PIC_CODING_TYPE_P			2
+#define V4L2_MPEG2_PIC_CODING_TYPE_B			3
+#define V4L2_MPEG2_PIC_CODING_TYPE_D			4
+
+#define V4L2_MPEG2_PIC_TOP_FIELD			0x1
+#define V4L2_MPEG2_PIC_BOTTOM_FIELD			0x2
+#define V4L2_MPEG2_PIC_FRAME				0x3
+
+#define V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST		0x0001
+#define V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT		0x0002
+#define V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV		0x0004
+#define V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE		0x0008
+#define V4L2_MPEG2_PIC_FLAG_INTRA_VLC			0x0010
+#define V4L2_MPEG2_PIC_FLAG_ALT_SCAN			0x0020
+#define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST		0x0040
+#define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE			0x0080
+
+#define V4L2_CID_STATELESS_MPEG2_PICTURE (V4L2_CID_CODEC_STATELESS_BASE+221)
+/**
+ * struct v4l2_ctrl_mpeg2_picture - MPEG-2 picture header
+ *
+ * All the members on this structure match the picture header and picture
+ * coding extension syntaxes as specified by the MPEG-2 specification.
+ *
+ * @backward_ref_ts: timestamp of the V4L2 capture buffer to use as
+ * reference for backward prediction.
+ * @forward_ref_ts: timestamp of the V4L2 capture buffer to use as
+ * reference for forward prediction. These timestamp refers to the
+ * timestamp field in struct v4l2_buffer. Use v4l2_timeval_to_ns()
+ * to convert the struct timeval to a __u64.
+ * @flags: see V4L2_MPEG2_PIC_FLAG_{}.
+ * @f_code: see MPEG-2 specification.
+ * @picture_coding_type: see MPEG-2 specification.
+ * @picture_structure: see V4L2_MPEG2_PIC_{}_FIELD.
+ * @intra_dc_precision: see MPEG-2 specification.
+ * @reserved: padding field. Should be zeroed by applications.
+ */
+struct v4l2_ctrl_mpeg2_picture {
+	__u64	backward_ref_ts;
+	__u64	forward_ref_ts;
+	__u32	flags;
+	__u8	f_code[2][2];
+	__u8	picture_coding_type;
+	__u8	picture_structure;
+	__u8	intra_dc_precision;
+	__u8	reserved[5];
+};
+
+#define V4L2_CID_STATELESS_MPEG2_QUANTISATION (V4L2_CID_CODEC_STATELESS_BASE+222)
+/**
+ * struct v4l2_ctrl_mpeg2_quantisation - MPEG-2 quantisation
+ *
+ * Quantisation matrices as specified by section 6.3.7
+ * "Quant matrix extension".
+ *
+ * @intra_quantiser_matrix: The quantisation matrix coefficients
+ * for intra-coded frames, in zigzag scanning order. It is relevant
+ * for both luma and chroma components, although it can be superseded
+ * by the chroma-specific matrix for non-4:2:0 YUV formats.
+ * @non_intra_quantiser_matrix: The quantisation matrix coefficients
+ * for non-intra-coded frames, in zigzag scanning order. It is relevant
+ * for both luma and chroma components, although it can be superseded
+ * by the chroma-specific matrix for non-4:2:0 YUV formats.
+ * @chroma_intra_quantiser_matrix: The quantisation matrix coefficients
+ * for the chominance component of intra-coded frames, in zigzag scanning
+ * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
+ * @chroma_non_intra_quantiser_matrix: The quantisation matrix coefficients
+ * for the chrominance component of non-intra-coded frames, in zigzag scanning
+ * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
+ */
+struct v4l2_ctrl_mpeg2_quantisation {
+	__u8	intra_quantiser_matrix[64];
+	__u8	non_intra_quantiser_matrix[64];
+	__u8	chroma_intra_quantiser_matrix[64];
+	__u8	chroma_non_intra_quantiser_matrix[64];
+};
+
 #define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
 #define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index d3bb18a3a51b..9260791b8438 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1747,6 +1747,9 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_h264_decode_params __user *p_h264_decode_params;
 		struct v4l2_ctrl_fwht_params __user *p_fwht_params;
 		struct v4l2_ctrl_vp8_frame __user *p_vp8_frame;
+		struct v4l2_ctrl_mpeg2_sequence __user *p_mpeg2_sequence;
+		struct v4l2_ctrl_mpeg2_picture __user *p_mpeg2_picture;
+		struct v4l2_ctrl_mpeg2_quantisation __user *p_mpeg2_quantisation;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
-- 
2.30.0

