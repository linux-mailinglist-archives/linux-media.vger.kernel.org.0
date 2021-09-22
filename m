Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3024145D7
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 12:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234802AbhIVKNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 06:13:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58088 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234752AbhIVKNe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 06:13:34 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id B324C1F437EC
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v5 05/10] media: uapi: Add VP9 stateless decoder controls
Date:   Wed, 22 Sep 2021 12:11:41 +0200
Message-Id: <20210922101146.13762-6-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922101146.13762-1-andrzej.p@collabora.com>
References: <20210922101146.13762-1-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the VP9 stateless decoder controls plus the documentation that goes
with it.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 .../userspace-api/media/v4l/biblio.rst        |  10 +
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 565 ++++++++++++++++++
 .../media/v4l/pixfmt-compressed.rst           |  15 +
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   8 +
 .../media/v4l/vidioc-queryctrl.rst            |  12 +
 .../media/videodev2.h.rst.exceptions          |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 180 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   8 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/media/v4l2-ctrls.h                    |   4 +
 include/uapi/linux/v4l2-controls.h            | 284 +++++++++
 include/uapi/linux/videodev2.h                |   6 +
 12 files changed, 1095 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 7b8e6738ff9e..9cd18c153d19 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -417,3 +417,13 @@ VP8
 :title:     RFC 6386: "VP8 Data Format and Decoding Guide"
 
 :author:    J. Bankoski et al.
+
+.. _vp9:
+
+VP9
+===
+
+
+:title:     VP9 Bitstream & Decoding Process Specification
+
+:author:    Adrian Grange (Google), Peter de Rivaz (Argon Design), Jonathan Hunt (Argon Design)
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 72f5e85b4f34..039450f77e0b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -1458,3 +1458,568 @@ FWHT Flags
 .. raw:: latex
 
     \normalsize
+
+.. _v4l2-codec-stateless-vp9:
+
+``V4L2_CID_STATELESS_VP9_COMPRESSED_HDR (struct)``
+    Stores VP9 probabilities updates as parsed from the current compressed frame
+    header. A value of zero in an array element means no update of the relevant
+    probability. Motion vector-related updates contain a new value or zero. All
+    other updates contain values translated with inv_map_table[] (see 6.3.5 in
+    :ref:`vp9`).
+
+.. c:type:: v4l2_ctrl_vp9_compressed_hdr
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
+
+.. flat-table:: struct v4l2_ctrl_vp9_compressed_hdr
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``tx_mode``
+      - Specifies the TX mode. See :ref:`TX Mode <vp9_tx_mode>` for more details.
+    * - __u8
+      - ``tx8[2][1]``
+      - TX 8x8 probabilities delta.
+    * - __u8
+      - ``tx16[2][2]``
+      - TX 16x16 probabilities delta.
+    * - __u8
+      - ``tx32[2][3]``
+      - TX 32x32 probabilities delta.
+    * - __u8
+      - ``coef[4][2][2][6][6][3]``
+      - Coefficient probabilities delta.
+    * - __u8
+      - ``skip[3]``
+      - Skip probabilities delta.
+    * - __u8
+      - ``inter_mode[7][3]``
+      - Inter prediction mode probabilities delta.
+    * - __u8
+      - ``interp_filter[4][2]``
+      - Interpolation filter probabilities delta.
+    * - __u8
+      - ``is_inter[4]``
+      - Is inter-block probabilities delta.
+    * - __u8
+      - ``comp_mode[5]``
+      - Compound prediction mode probabilities delta.
+    * - __u8
+      - ``single_ref[5][2]``
+      - Single reference probabilities delta.
+    * - __u8
+      - ``comp_ref[5]``
+      - Compound reference probabilities delta.
+    * - __u8
+      - ``y_mode[4][9]``
+      - Y prediction mode probabilities delta.
+    * - __u8
+      - ``uv_mode[10][9]``
+      - UV prediction mode probabilities delta.
+    * - __u8
+      - ``partition[16][3]``
+      - Partition probabilities delta.
+    * - __u8
+      - ``mv.joint[3]``
+      - Motion vector joint probabilities delta.
+    * - __u8
+      - ``mv.sign[2]``
+      - Motion vector sign probabilities delta.
+    * - __u8
+      - ``mv.classes[2][10]``
+      - Motion vector class probabilities delta.
+    * - __u8
+      - ``mv.class0_bit[2]``
+      - Motion vector class0 bit probabilities delta.
+    * - __u8
+      - ``mv.bits[2][10]``
+      - Motion vector bits probabilities delta.
+    * - __u8
+      - ``mv.class0_fr[2][2][3]``
+      - Motion vector class0 fractional bit probabilities delta.
+    * - __u8
+      - ``mv.fr[2][3]``
+      - Motion vector fractional bit probabilities delta.
+    * - __u8
+      - ``mv.class0_hp[2]``
+      - Motion vector class0 high precision fractional bit probabilities delta.
+    * - __u8
+      - ``mv.hp[2]``
+      - Motion vector high precision fractional bit probabilities delta.
+
+.. _vp9_tx_mode:
+
+``TX Mode``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_TX_MODE_ONLY_4X4``
+      - 0
+      - Transform size is 4x4.
+    * - ``V4L2_VP9_TX_MODE_ALLOW_8X8``
+      - 1
+      - Transform size can be up to 8x8.
+    * - ``V4L2_VP9_TX_MODE_ALLOW_16X16``
+      - 2
+      - Transform size can be up to 16x16.
+    * - ``V4L2_VP9_TX_MODE_ALLOW_32X32``
+      - 3
+      - transform size can be up to 32x32.
+    * - ``V4L2_VP9_TX_MODE_SELECT``
+      - 4
+      - Bitstream contains the transform size for each block.
+
+See section '7.3.1 Tx mode semantics' of the :ref:`vp9` specification for more details.
+
+``V4L2_CID_STATELESS_VP9_FRAME (struct)``
+    Specifies the frame parameters for the associated VP9 frame decode request.
+    This includes the necessary parameters for configuring a stateless hardware
+    decoding pipeline for VP9. The bitstream parameters are defined according
+    to :ref:`vp9`.
+
+.. c:type:: v4l2_ctrl_vp9_frame
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_ctrl_vp9_frame
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - struct :c:type:`v4l2_vp9_loop_filter`
+      - ``lf``
+      - Loop filter parameters. See struct :c:type:`v4l2_vp9_loop_filter` for more details.
+    * - struct :c:type:`v4l2_vp9_quantization`
+      - ``quant``
+      - Quantization parameters. See :c:type:`v4l2_vp9_quantization` for more details.
+    * - struct :c:type:`v4l2_vp9_segmentation`
+      - ``seg``
+      - Segmentation parameters. See :c:type:`v4l2_vp9_segmentation` for more details.
+    * - __u32
+      - ``flags``
+      - Combination of V4L2_VP9_FRAME_FLAG_* flags. See :ref:`Frame Flags<vp9_frame_flags>`.
+    * - __u16
+      - ``compressed_header_size``
+      - Compressed header size in bytes.
+    * - __u16
+      - ``uncompressed_header_size``
+      - Uncompressed header size in bytes.
+    * - __u16
+      - ``frame_width_minus_1``
+      - Add 1 to get the frame width expressed in pixels. See section 7.2.3 in :ref:`vp9`.
+    * - __u16
+      - ``frame_height_minus_1``
+      - Add 1 to get the frame height expressed in pixels. See section 7.2.3 in :ref:`vp9`.
+    * - __u16
+      - ``render_width_minus_1``
+      - Add 1 to get the expected render width expressed in pixels. This is
+        not used during the decoding process but might be used by HW scalers to
+        prepare a frame that's ready for scanout. See section 7.2.4 in :ref:`vp9`.
+    * - __u16
+      - render_height_minus_1
+      - Add 1 to get the expected render height expressed in pixels. This is
+        not used during the decoding process but might be used by HW scalers to
+        prepare a frame that's ready for scanout. See section 7.2.4 in :ref:`vp9`.
+    * - __u64
+      - ``last_frame_ts``
+      - "last" reference buffer timestamp.
+	The timestamp refers to the ``timestamp`` field in
+        struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+        function to convert the struct :c:type:`timeval` in struct
+        :c:type:`v4l2_buffer` to a __u64.
+    * - __u64
+      - ``golden_frame_ts``
+      - "golden" reference buffer timestamp.
+	The timestamp refers to the ``timestamp`` field in
+        struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+        function to convert the struct :c:type:`timeval` in struct
+        :c:type:`v4l2_buffer` to a __u64.
+    * - __u64
+      - ``alt_frame_ts``
+      - "alt" reference buffer timestamp.
+	The timestamp refers to the ``timestamp`` field in
+        struct :c:type:`v4l2_buffer`. Use the :c:func:`v4l2_timeval_to_ns()`
+        function to convert the struct :c:type:`timeval` in struct
+        :c:type:`v4l2_buffer` to a __u64.
+    * - __u8
+      - ``ref_frame_sign_bias``
+      - a bitfield specifying whether the sign bias is set for a given
+        reference frame. See :ref:`Reference Frame Sign Bias<vp9_ref_frame_sign_bias>`
+        for more details.
+    * - __u8
+      - ``reset_frame_context``
+      - specifies whether the frame context should be reset to default values. See
+        :ref:`Reset Frame Context<vp9_reset_frame_context>` for more details.
+    * - __u8
+      - ``frame_context_idx``
+      - Frame context that should be used/updated.
+    * - __u8
+      - ``profile``
+      - VP9 profile. Can be 0, 1, 2 or 3.
+    * - __u8
+      - ``bit_depth``
+      - Component depth in bits. Can be 8, 10 or 12. Note that not all profiles
+        support 10 and/or 12 bits depths.
+    * - __u8
+      - ``interpolation_filter``
+      - Specifies the filter selection used for performing inter prediction. See
+        :ref:`Interpolation Filter<vp9_interpolation_filter>` for more details.
+    * - __u8
+      - ``tile_cols_log2``
+      - Specifies the base 2 logarithm of the width of each tile (where the
+        width is measured in units of 8x8 blocks). Shall be less than or equal
+        to 6.
+    * - __u8
+      - ``tile_rows_log2``
+      - Specifies the base 2 logarithm of the height of each tile (where the
+        height is measured in units of 8x8 blocks).
+    * - __u8
+      - ``reference_mode``
+      - Specifies the type of inter prediction to be used. See
+        :ref:`Reference Mode<vp9_reference_mode>` for more details.
+    * - __u8
+      - ``reserved[7]``
+      - Applications and drivers must set this to zero.
+
+.. _vp9_frame_flags:
+
+``Frame Flags``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_FRAME_FLAG_KEY_FRAME``
+      - 0x001
+      - The frame is a key frame.
+    * - ``V4L2_VP9_FRAME_FLAG_SHOW_FRAME``
+      - 0x002
+      - The frame should be displayed.
+    * - ``V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT``
+      - 0x004
+      - The decoding should be error resilient.
+    * - ``V4L2_VP9_FRAME_FLAG_INTRA_ONLY``
+      - 0x008
+      - The frame does not reference other frames.
+    * - ``V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV``
+      - 0x010
+      - The frame can use high precision motion vectors.
+    * - ``V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX``
+      - 0x020
+      - Frame context should be updated after decoding.
+    * - ``V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE``
+      - 0x040
+      - Parallel decoding is used.
+    * - ``V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING``
+      - 0x080
+      - Vertical subsampling is enabled.
+    * - ``V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING``
+      - 0x100
+      - Horizontal subsampling is enabled.
+    * - ``V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING``
+      - 0x200
+      - The full UV range is used.
+
+.. _vp9_ref_frame_sign_bias:
+
+``Reference Frame Sign Bias``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_SIGN_BIAS_LAST``
+      - 0x1
+      - Sign bias is set for the last reference frame.
+    * - ``V4L2_VP9_SIGN_BIAS_GOLDEN``
+      - 0x2
+      - Sign bias is set for the golden reference frame.
+    * - ``V4L2_VP9_SIGN_BIAS_ALT``
+      - 0x2
+      - Sign bias is set for the alt reference frame.
+
+.. _vp9_reset_frame_context:
+
+``Reset Frame Context``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
+      - 0
+      - Do not reset any frame context.
+    * - ``V4L2_VP9_RESET_FRAME_CTX_SPEC``
+      - 1
+      - Reset the frame context pointed to by
+        :c:type:`v4l2_ctrl_vp9_frame`.frame_context_idx.
+    * - ``V4L2_VP9_RESET_FRAME_CTX_ALL``
+      - 2
+      - Reset all frame contexts.
+
+See section '7.2 Uncompressed header semantics' of the :ref:`vp9` specification
+for more details.
+
+.. _vp9_interpolation_filter:
+
+``Interpolation Filter``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_INTERP_FILTER_EIGHTTAP``
+      - 0
+      - Eight tap filter.
+    * - ``V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH``
+      - 1
+      - Eight tap smooth filter.
+    * - ``V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP``
+      - 2
+      - Eeight tap sharp filter.
+    * - ``V4L2_VP9_INTERP_FILTER_BILINEAR``
+      - 3
+      - Bilinear filter.
+    * - ``V4L2_VP9_INTERP_FILTER_SWITCHABLE``
+      - 4
+      - Filter selection is signaled at the block level.
+
+See section '7.2.7 Interpolation filter semantics' of the :ref:`vp9` specification
+for more details.
+
+.. _vp9_reference_mode:
+
+``Reference Mode``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE``
+      - 0
+      - Indicates that all the inter blocks use only a single reference frame
+        to generate motion compensated prediction.
+    * - ``V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE``
+      - 1
+      - Requires all the inter blocks to use compound mode. Single reference
+        frame prediction is not allowed.
+    * - ``V4L2_VP9_REFERENCE_MODE_SELECT``
+      - 2
+      - Allows each individual inter block to select between single and
+        compound prediction modes.
+
+See section '7.3.6 Frame reference mode semantics' of the :ref:`vp9` specification for more details.
+
+.. c:type:: v4l2_vp9_segmentation
+
+Encodes the quantization parameters. See section '7.2.10 Segmentation
+params syntax' of the :ref:`vp9` specification for more details.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp9_segmentation
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``feature_data[8][4]``
+      - Data attached to each feature. Data entry is only valid if the feature
+        is enabled. The array shall be indexed with segment number as the first dimension
+        (0..7) and one of V4L2_VP9_SEG_* as the second dimension.
+        See :ref:`Segment Feature IDs<vp9_segment_feature>`.
+    * - __u8
+      - ``feature_enabled[8]``
+      - Bitmask defining which features are enabled in each segment. The value for each
+        segment is a combination of V4L2_VP9_SEGMENT_FEATURE_ENABLED(id) values where id is
+        one of V4L2_VP9_SEG_*. See :ref:`Segment Feature IDs<vp9_segment_feature>`.
+    * - __u8
+      - ``tree_probs[7]``
+      - Specifies the probability values to be used when decoding a Segment-ID.
+        See '5.15. Segmentation map' section of :ref:`vp9` for more details.
+    * - __u8
+      - ``pred_probs[3]``
+      - Specifies the probability values to be used when decoding a
+        Predicted-Segment-ID. See '6.4.14. Get segment id syntax'
+        section of :ref:`vp9` for more details.
+    * - __u8
+      - ``flags``
+      - Combination of V4L2_VP9_SEGMENTATION_FLAG_* flags. See
+        :ref:`Segmentation Flags<vp9_segmentation_flags>`.
+    * - __u8
+      - ``reserved[5]``
+      - Applications and drivers must set this to zero.
+
+.. _vp9_segment_feature:
+
+``Segment feature IDs``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_SEG_LVL_ALT_Q``
+      - 0
+      - Quantizer segment feature.
+    * - ``V4L2_VP9_SEG_LVL_ALT_L``
+      - 1
+      - Loop filter segment feature.
+    * - ``V4L2_VP9_SEG_LVL_REF_FRAME``
+      - 2
+      - Reference frame segment feature.
+    * - ``V4L2_VP9_SEG_LVL_SKIP``
+      - 3
+      - Skip segment feature.
+    * - ``V4L2_VP9_SEG_LVL_MAX``
+      - 4
+      - Number of segment features.
+
+.. _vp9_segmentation_flags:
+
+``Segmentation Flags``
+
+.. tabularcolumns:: |p{7.0cm}|p{1.2cm}|p{9.1cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_VP9_SEGMENTATION_FLAG_ENABLED``
+      - 0x01
+      - Indicates that this frame makes use of the segmentation tool.
+    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP``
+      - 0x02
+      - Indicates that the segmentation map should be updated during the
+        decoding of this frame.
+    * - ``V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE``
+      - 0x04
+      - Indicates that the updates to the segmentation map are coded
+        relative to the existing segmentation map.
+    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA``
+      - 0x08
+      - Indicates that new parameters are about to be specified for each
+        segment.
+    * - ``V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE``
+      - 0x10
+      - Indicates that the segmentation parameters represent the actual values
+        to be used.
+
+.. c:type:: v4l2_vp9_quantization
+
+Encodes the quantization parameters. See section '7.2.9 Quantization params
+syntax' of the VP9 specification for more details.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp9_quantization
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``base_q_idx``
+      - Indicates the base frame qindex.
+    * - __s8
+      - ``delta_q_y_dc``
+      - Indicates the Y DC quantizer relative to base_q_idx.
+    * - __s8
+      - ``delta_q_uv_dc``
+      - Indicates the UV DC quantizer relative to base_q_idx.
+    * - __s8
+      - ``delta_q_uv_ac``
+      - Indicates the UV AC quantizer relative to base_q_idx.
+    * - __u8
+      - ``reserved[4]``
+      - Applications and drivers must set this to zero.
+
+.. c:type:: v4l2_vp9_loop_filter
+
+This structure contains all loop filter related parameters. See sections
+'7.2.8 Loop filter semantics' of the :ref:`vp9` specification for more details.
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
+
+.. flat-table:: struct v4l2_vp9_loop_filter
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __s8
+      - ``ref_deltas[4]``
+      - Contains the adjustment needed for the filter level based on the chosen
+        reference frame.
+    * - __s8
+      - ``mode_deltas[2]``
+      - Contains the adjustment needed for the filter level based on the chosen
+        mode.
+    * - __u8
+      - ``level``
+      - Indicates the loop filter strength.
+    * - __u8
+      - ``sharpness``
+      - Indicates the sharpness level.
+    * - __u8
+      - ``flags``
+      - Combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags.
+        See :ref:`Loop Filter Flags <vp9_loop_filter_flags>`.
+    * - __u8
+      - ``reserved[7]``
+      - Applications and drivers must set this to zero.
+
+
+.. _vp9_loop_filter_flags:
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
+    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED``
+      - 0x1
+      - When set, the filter level depends on the mode and reference frame used
+        to predict a block.
+    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE``
+      - 0x2
+      - When set, the bitstream contains additional syntax elements that
+        specify which mode and reference frame deltas are to be updated.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 0ede39907ee2..967fc803ef94 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -172,6 +172,21 @@ Compressed Formats
       - VP9 compressed video frame. The encoder generates one
 	compressed frame per buffer, and the decoder requires one
 	compressed frame per buffer.
+    * .. _V4L2-PIX-FMT-VP9-FRAME:
+
+      - ``V4L2_PIX_FMT_VP9_FRAME``
+      - 'VP9F'
+      - VP9 parsed frame, including the frame header, as extracted from the container.
+	This format is adapted for stateless video decoders that implement a
+	VP9 pipeline with the :ref:`stateless_decoder`.
+	Metadata associated with the frame to decode is required to be passed
+	through the ``V4L2_CID_STATELESS_VP9_FRAME`` and
+	the ``V4L2_CID_STATELESS_VP9_COMPRESSED_HDR`` controls.
+	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp9>`.
+	Exactly one output and one capture buffer must be provided for use with
+	this pixel format. The output buffer must contain the appropriate number
+	of macroblocks to decode a full corresponding frame to the matching
+	capture buffer.
     * .. _V4L2-PIX-FMT-HEVC:
 
       - ``V4L2_PIX_FMT_HEVC``
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 2d6bc8d94380..d2bdd3db076f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -233,6 +233,14 @@ still cause this situation.
       - ``p_mpeg2_quantisation``
       - A pointer to a struct :c:type:`v4l2_ctrl_mpeg2_quantisation`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``.
+    * - struct :c:type:`v4l2_ctrl_vp9_compressed_hdr` *
+      - ``p_vp9_compressed_hdr_probs``
+      - A pointer to a struct :c:type:`v4l2_ctrl_vp9_compressed_hdr`. Valid if this
+        control is of type ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``.
+    * - struct :c:type:`v4l2_ctrl_vp9_frame` *
+      - ``p_vp9_frame``
+      - A pointer to a struct :c:type:`v4l2_ctrl_vp9_frame`. Valid if this
+        control is of type ``V4L2_CTRL_TYPE_VP9_FRAME``.
     * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
       - ``p_hdr10_cll``
       - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index f9ecf6276129..9ad930823960 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -507,6 +507,18 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
 	decoding parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_vp9_compressed_hdr`, containing VP9
+	probabilities updates for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_VP9_FRAME``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_vp9_frame`, containing VP9
+	frame decode parameters for stateless video decoders.
 
 .. raw:: latex
 
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index eb0b1cd37abd..9cbb7a0c354a 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -149,6 +149,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_VP9_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c4b5082849b6..52b9ff46ab26 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -283,6 +283,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
 		pr_cont("MPEG2_PICTURE");
 		break;
+	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
+		pr_cont("VP9_COMPRESSED_HDR");
+		break;
+	case V4L2_CTRL_TYPE_VP9_FRAME:
+		pr_cont("VP9_FRAME");
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -317,6 +323,168 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 #define zero_reserved(s) \
 	memset(&(s).reserved, 0, sizeof((s).reserved))
 
+static int
+validate_vp9_lf_params(struct v4l2_vp9_loop_filter *lf)
+{
+	unsigned int i;
+
+	if (lf->flags & ~(V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED |
+			  V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE))
+		return -EINVAL;
+
+	/* That all values are in the accepted range. */
+	if (lf->level > GENMASK(5, 0))
+		return -EINVAL;
+
+	if (lf->sharpness > GENMASK(2, 0))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(lf->ref_deltas); i++)
+		if (lf->ref_deltas[i] < -63 || lf->ref_deltas[i] > 63)
+			return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(lf->mode_deltas); i++)
+		if (lf->mode_deltas[i] < -63 || lf->mode_deltas[i] > 63)
+			return -EINVAL;
+
+	zero_reserved(*lf);
+	return 0;
+}
+
+static int
+validate_vp9_quant_params(struct v4l2_vp9_quantization *quant)
+{
+	if (quant->delta_q_y_dc < -15 || quant->delta_q_y_dc > 15 ||
+	    quant->delta_q_uv_dc < -15 || quant->delta_q_uv_dc > 15 ||
+	    quant->delta_q_uv_ac < -15 || quant->delta_q_uv_ac > 15)
+		return -EINVAL;
+
+	zero_reserved(*quant);
+	return 0;
+}
+
+static int
+validate_vp9_seg_params(struct v4l2_vp9_segmentation *seg)
+{
+	unsigned int i, j;
+
+	if (seg->flags & ~(V4L2_VP9_SEGMENTATION_FLAG_ENABLED |
+			   V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP |
+			   V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE |
+			   V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA |
+			   V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(seg->feature_enabled); i++) {
+		if (seg->feature_enabled[i] &
+		    ~V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK)
+			return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(seg->feature_data); i++) {
+		const int range[] = { 255, 63, 3, 0 };
+
+		for (j = 0; j < ARRAY_SIZE(seg->feature_data[j]); j++) {
+			if (seg->feature_data[i][j] < -range[j] ||
+			    seg->feature_data[i][j] > range[j])
+				return -EINVAL;
+		}
+	}
+
+	zero_reserved(*seg);
+	return 0;
+}
+
+static int
+validate_vp9_compressed_hdr(struct v4l2_ctrl_vp9_compressed_hdr *hdr)
+{
+	if (hdr->tx_mode > V4L2_VP9_TX_MODE_SELECT)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int
+validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
+{
+	int ret;
+
+	/* Make sure we're not passed invalid flags. */
+	if (frame->flags & ~(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
+		  V4L2_VP9_FRAME_FLAG_SHOW_FRAME |
+		  V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT |
+		  V4L2_VP9_FRAME_FLAG_INTRA_ONLY |
+		  V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV |
+		  V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX |
+		  V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE |
+		  V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
+		  V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING |
+		  V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING))
+		return -EINVAL;
+
+	if (frame->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT &&
+	    frame->flags & V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX)
+		return -EINVAL;
+
+	if (frame->profile > V4L2_VP9_PROFILE_MAX)
+		return -EINVAL;
+
+	if (frame->reset_frame_context > V4L2_VP9_RESET_FRAME_CTX_ALL)
+		return -EINVAL;
+
+	if (frame->frame_context_idx >= V4L2_VP9_NUM_FRAME_CTX)
+		return -EINVAL;
+
+	/*
+	 * Profiles 0 and 1 only support 8-bit depth, profiles 2 and 3 only 10
+	 * and 12 bit depths.
+	 */
+	if ((frame->profile < 2 && frame->bit_depth != 8) ||
+	    (frame->profile >= 2 &&
+	     (frame->bit_depth != 10 && frame->bit_depth != 12)))
+		return -EINVAL;
+
+	/* Profile 0 and 2 only accept YUV 4:2:0. */
+	if ((frame->profile == 0 || frame->profile == 2) &&
+	    (!(frame->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) ||
+	     !(frame->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)))
+		return -EINVAL;
+
+	/* Profile 1 and 3 only accept YUV 4:2:2, 4:4:0 and 4:4:4. */
+	if ((frame->profile == 1 || frame->profile == 3) &&
+	    ((frame->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING) &&
+	     (frame->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING)))
+		return -EINVAL;
+
+	if (frame->interpolation_filter > V4L2_VP9_INTERP_FILTER_SWITCHABLE)
+		return -EINVAL;
+
+	/*
+	 * According to the spec, tile_cols_log2 shall be less than or equal
+	 * to 6.
+	 */
+	if (frame->tile_cols_log2 > 6)
+		return -EINVAL;
+
+	if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)
+		return -EINVAL;
+
+	ret = validate_vp9_lf_params(&frame->lf);
+	if (ret)
+		return ret;
+
+	ret = validate_vp9_quant_params(&frame->quant);
+	if (ret)
+		return ret;
+
+	ret = validate_vp9_seg_params(&frame->seg);
+	if (ret)
+		return ret;
+
+	zero_reserved(*frame);
+	return 0;
+}
+
 /*
  * Compound controls validation requires setting unused fields/flags to zero
  * in order to properly detect unchanged controls with std_equal's memcmp.
@@ -687,6 +855,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 		break;
 
+	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
+		return validate_vp9_compressed_hdr(p);
+
+	case V4L2_CTRL_TYPE_VP9_FRAME:
+		return validate_vp9_frame(p);
+
 	case V4L2_CTRL_TYPE_AREA:
 		area = p;
 		if (!area->width || !area->height)
@@ -1249,6 +1423,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
 		elem_size = sizeof(struct v4l2_ctrl_hdr10_mastering_display);
 		break;
+	case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
+		elem_size = sizeof(struct v4l2_ctrl_vp9_compressed_hdr);
+		break;
+	case V4L2_CTRL_TYPE_VP9_FRAME:
+		elem_size = sizeof(struct v4l2_ctrl_vp9_frame);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 421300e13a41..5845c1b6bb2a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1175,6 +1175,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:			return "MPEG-2 Sequence Header";
 	case V4L2_CID_STATELESS_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
 	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
+	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
+	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
 
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1493,6 +1495,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
 		break;
+	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
+		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
+		break;
+	case V4L2_CID_STATELESS_VP9_FRAME:
+		*type = V4L2_CTRL_TYPE_VP9_FRAME;
+		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index ec6fc1ef291e..7a5e8120d733 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1394,6 +1394,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
 		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
 		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
+		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
 		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
 		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
 		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 575b59fbac77..b3ce438f1329 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -50,6 +50,8 @@ struct video_device;
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
  * @p_h264_pred_weights:	Pointer to a struct v4l2_ctrl_h264_pred_weights.
  * @p_vp8_frame:		Pointer to a VP8 frame params structure.
+ * @p_vp9_compressed_hdr_probs:	Pointer to a VP9 frame compressed header probs structure.
+ * @p_vp9_frame:		Pointer to a VP9 frame params structure.
  * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
  * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
  * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
@@ -80,6 +82,8 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
+	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
 	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *p_area;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5532b5f68493..baca14bb3e5d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2010,6 +2010,290 @@ struct v4l2_ctrl_hdr10_mastering_display {
 	__u32 min_display_mastering_luminance;
 };
 
+/* Stateless VP9 controls */
+
+#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
+#define	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE	0x2
+
+/**
+ * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
+ *
+ * @ref_deltas: contains the adjustment needed for the filter level based on the chosen
+ *	reference frame. If this syntax element is not present in the bitstream, users
+ *	should pass its last value.
+ * @mode_deltas: contains the adjustment needed for the filter level based on the chosen mode.
+ *	If this syntax element is not present in the bitstream, users
+ *	should pass its last value.
+ * @level: indicates the loop filter strength
+ * @sharpness: indicates the sharpness level
+ * @flags: combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags
+ * @reserved: padding field. Should be zeroed by applications.
+ *
+ * This structure contains all loop filter related parameters. See sections
+ * '7.2.8 Loop filter semantics' of the VP9 specification for more details.
+ */
+struct v4l2_vp9_loop_filter {
+	__s8 ref_deltas[4];
+	__s8 mode_deltas[2];
+	__u8 level;
+	__u8 sharpness;
+	__u8 flags;
+	__u8 reserved[7];
+};
+
+/**
+ * struct v4l2_vp9_quantization - VP9 quantization parameters
+ *
+ * @base_q_idx: indicates the base frame qindex
+ * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx
+ * @delta_q_uv_dc: indicates the UV DC quantizer relative to base_q_idx
+ * @delta_q_uv_ac: indicates the UV AC quantizer relative to base_q_idx
+ * @reserved: padding field. Should be zeroed by applications.
+ *
+ * Encodes the quantization parameters. See section '7.2.9 Quantization params
+ * syntax' of the VP9 specification for more details.
+ */
+struct v4l2_vp9_quantization {
+	__u8 base_q_idx;
+	__s8 delta_q_y_dc;
+	__s8 delta_q_uv_dc;
+	__s8 delta_q_uv_ac;
+	__u8 reserved[4];
+};
+
+#define V4L2_VP9_SEGMENTATION_FLAG_ENABLED		0x01
+#define V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP		0x02
+#define V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE	0x04
+#define V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA		0x08
+#define V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE	0x10
+
+#define V4L2_VP9_SEG_LVL_ALT_Q				0
+#define V4L2_VP9_SEG_LVL_ALT_L				1
+#define V4L2_VP9_SEG_LVL_REF_FRAME			2
+#define V4L2_VP9_SEG_LVL_SKIP				3
+#define V4L2_VP9_SEG_LVL_MAX				4
+
+#define V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)	(1 << (id))
+#define V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK	0xf
+
+/**
+ * struct v4l2_vp9_segmentation - VP9 segmentation parameters
+ *
+ * @feature_data: data attached to each feature. Data entry is only valid if the feature is enabled.
+ * The array shall be indexed with segment number as the first dimension (0..7) and one of
+ * V4L2_VP9_SEG_* as the second dimension.
+ * @feature_enabled: bitmask defining which features are enabled in each segment. The value for
+ * each segment is a combination of V4L2_VP9_SEGMENT_FEATURE_ENABLED(id) values where id is one
+ * of V4L2_VP9_SEG_*
+ * @tree_probs: specifies the probability values to be used when
+ *	decoding a Segment-ID. See '5.15. Segmentation map' section of the VP9 specification
+ *	for more details.
+ * @pred_probs: specifies the probability values to be used when decoding a
+ *	Predicted-Segment-ID. See '6.4.14. Get segment id syntax' section of :ref:`vp9`
+ *	for more details.
+ * @flags: combination of V4L2_VP9_SEGMENTATION_FLAG_* flags
+ * @reserved: padding field. Should be zeroed by applications.
+ *
+ * Encodes the quantization parameters. See section '7.2.10 Segmentation params syntax' of
+ * the VP9 specification for more details.
+ */
+struct v4l2_vp9_segmentation {
+	__s16 feature_data[8][4];
+	__u8 feature_enabled[8];
+	__u8 tree_probs[7];
+	__u8 pred_probs[3];
+	__u8 flags;
+	__u8 reserved[5];
+};
+
+#define V4L2_VP9_FRAME_FLAG_KEY_FRAME			0x001
+#define V4L2_VP9_FRAME_FLAG_SHOW_FRAME			0x002
+#define V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT		0x004
+#define V4L2_VP9_FRAME_FLAG_INTRA_ONLY			0x008
+#define V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV		0x010
+#define V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX		0x020
+#define V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE		0x040
+#define V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING		0x080
+#define V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING		0x100
+#define V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING	0x200
+
+#define V4L2_VP9_SIGN_BIAS_LAST				0x1
+#define V4L2_VP9_SIGN_BIAS_GOLDEN			0x2
+#define V4L2_VP9_SIGN_BIAS_ALT				0x4
+
+#define V4L2_VP9_RESET_FRAME_CTX_NONE			0
+#define V4L2_VP9_RESET_FRAME_CTX_SPEC			1
+#define V4L2_VP9_RESET_FRAME_CTX_ALL			2
+
+#define V4L2_VP9_INTERP_FILTER_EIGHTTAP			0
+#define V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH		1
+#define V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP		2
+#define V4L2_VP9_INTERP_FILTER_BILINEAR			3
+#define V4L2_VP9_INTERP_FILTER_SWITCHABLE		4
+
+#define V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE	0
+#define V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE	1
+#define V4L2_VP9_REFERENCE_MODE_SELECT			2
+
+#define V4L2_VP9_PROFILE_MAX				3
+
+#define V4L2_CID_STATELESS_VP9_FRAME	(V4L2_CID_CODEC_STATELESS_BASE + 300)
+/**
+ * struct v4l2_ctrl_vp9_frame - VP9 frame decoding control
+ *
+ * @lf: loop filter parameters. See &v4l2_vp9_loop_filter for more details
+ * @quant: quantization parameters. See &v4l2_vp9_quantization for more details
+ * @seg: segmentation parameters. See &v4l2_vp9_segmentation for more details
+ * @flags: combination of V4L2_VP9_FRAME_FLAG_* flags
+ * @compressed_header_size: compressed header size in bytes
+ * @uncompressed_header_size: uncompressed header size in bytes
+ * @frame_width_minus_1: add 1 to it and you'll get the frame width expressed in pixels
+ * @frame_height_minus_1: add 1 to it and you'll get the frame height expressed in pixels
+ * @render_width_minus_1: add 1 to it and you'll get the expected render width expressed in
+ *	pixels. This is not used during the decoding process but might be used by HW scalers
+ *	to prepare a frame that's ready for scanout
+ * @render_height_minus_1: add 1 to it and you'll get the expected render height expressed in
+ *	pixels. This is not used during the decoding process but might be used by HW scalers
+ *	to prepare a frame that's ready for scanout
+ * @last_frame_ts: "last" reference buffer timestamp.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @golden_frame_ts: "golden" reference buffer timestamp.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @alt_frame_ts: "alt" reference buffer timestamp.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @ref_frame_sign_bias: a bitfield specifying whether the sign bias is set for a given
+ *	reference frame. Either of V4L2_VP9_SIGN_BIAS_*.
+ * @reset_frame_context: specifies whether the frame context should be reset to default values.
+ *	Either of V4L2_VP9_RESET_FRAME_CTX_*.
+ * @frame_context_idx: frame context that should be used/updated
+ * @profile: VP9 profile. Can be 0, 1, 2 or 3
+ * @bit_depth: bits per components. Can be 8, 10 or 12. Note that not all profiles support
+ *	10 and/or 12 bits depths
+ * @interpolation_filter: specifies the filter selection used for performing inter prediction.
+ *	Either of V4L2_VP9_INTERP_FILTER_*
+ * @tile_cols_log2: specifies the base 2 logarithm of the width of each tile (where the width
+ *	is measured in units of 8x8 blocks). Shall be less than or equal to 6
+ * @tile_rows_log2: specifies the base 2 logarithm of the height of each tile (where the height
+ *	is measured in units of 8x8 blocks)
+ * @reference_mode: specifies the type of inter prediction to be used. See
+ *	Either of V4L2_VP9_REFERENCE_MODE_*
+ * @reserved: padding field. Should be zeroed by applications.
+ */
+struct v4l2_ctrl_vp9_frame {
+	struct v4l2_vp9_loop_filter lf;
+	struct v4l2_vp9_quantization quant;
+	struct v4l2_vp9_segmentation seg;
+	__u32 flags;
+	__u16 compressed_header_size;
+	__u16 uncompressed_header_size;
+	__u16 frame_width_minus_1;
+	__u16 frame_height_minus_1;
+	__u16 render_width_minus_1;
+	__u16 render_height_minus_1;
+	__u64 last_frame_ts;
+	__u64 golden_frame_ts;
+	__u64 alt_frame_ts;
+	__u8 ref_frame_sign_bias;
+	__u8 reset_frame_context;
+	__u8 frame_context_idx;
+	__u8 profile;
+	__u8 bit_depth;
+	__u8 interpolation_filter;
+	__u8 tile_cols_log2;
+	__u8 tile_rows_log2;
+	__u8 reference_mode;
+	__u8 reserved[7];
+};
+
+#define V4L2_VP9_NUM_FRAME_CTX	4
+
+/**
+ * struct v4l2_vp9_mv_probs - VP9 Motion vector probability updates
+ * @joint: motion vector joint probability updates
+ * @sign: motion vector sign probability updates
+ * @classes: motion vector class probability updates
+ * @class0_bit: motion vector class0 bit probability updates
+ * @bits: motion vector bits probability updates
+ * @class0_fr: motion vector class0 fractional bit probability updates
+ * @fr: motion vector fractional bit probability updates
+ * @class0_hp: motion vector class0 high precision fractional bit probability updates
+ * @hp: motion vector high precision fractional bit probability updates
+ *
+ * This structure contains new values of motion vector probabilities.
+ * A value of zero in an array element means there is no update of the relevant probability.
+ * See `struct v4l2_vp9_prob_updates` for details.
+ */
+struct v4l2_vp9_mv_probs {
+	__u8 joint[3];
+	__u8 sign[2];
+	__u8 classes[2][10];
+	__u8 class0_bit[2];
+	__u8 bits[2][10];
+	__u8 class0_fr[2][2][3];
+	__u8 fr[2][3];
+	__u8 class0_hp[2];
+	__u8 hp[2];
+};
+
+#define V4L2_CID_STATELESS_VP9_COMPRESSED_HDR	(V4L2_CID_CODEC_STATELESS_BASE + 301)
+
+#define V4L2_VP9_TX_MODE_ONLY_4X4			0
+#define V4L2_VP9_TX_MODE_ALLOW_8X8			1
+#define V4L2_VP9_TX_MODE_ALLOW_16X16			2
+#define V4L2_VP9_TX_MODE_ALLOW_32X32			3
+#define V4L2_VP9_TX_MODE_SELECT				4
+
+/**
+ * struct v4l2_ctrl_vp9_compressed_hdr - VP9 probability updates control
+ * @tx_mode: specifies the TX mode. Either of V4L2_VP9_TX_MODE_*.
+ * @tx8: TX 8x8 probability updates
+ * @tx16: TX 16x16 probability updates
+ * @tx32: TX 32x32 probability updates
+ * @coef: coefficient probability updates
+ * @skip: skip probability updates
+ * @inter_mode: inter mode probability updates
+ * @interp_filter: interpolation filter probability updates
+ * @is_inter: is inter-block probability updates
+ * @comp_mode: compound prediction mode probability updates
+ * @single_ref: single ref probability updates
+ * @comp_ref: compound ref probability updates
+ * @y_mode: Y prediction mode probability updates
+ * @uv_mode: UV prediction mode probability updates
+ * @partition: partition probability updates
+ * @mv: motion vector probability updates
+ *
+ * This structure holds the probabilities update as parsed in the compressed
+ * header (Spec 6.3). These values represent the value of probability update after
+ * being translated with inv_map_table[] (see 6.3.5). A value of zero in an array element
+ * means that there is no update of the relevant probability.
+ *
+ * This control is optional and needs to be used when dealing with the hardware which is
+ * not capable of parsing the compressed header itself. Only drivers which need it will
+ * implement it.
+ */
+struct v4l2_ctrl_vp9_compressed_hdr {
+	__u8 tx_mode;
+	__u8 tx8[2][1];
+	__u8 tx16[2][2];
+	__u8 tx32[2][3];
+	__u8 coef[4][2][2][6][6][3];
+	__u8 skip[3];
+	__u8 inter_mode[7][3];
+	__u8 interp_filter[4][2];
+	__u8 is_inter[4];
+	__u8 comp_mode[5];
+	__u8 single_ref[5][2];
+	__u8 comp_ref[5];
+	__u8 y_mode[4][9];
+	__u8 uv_mode[10][9];
+	__u8 partition[16][3];
+
+	struct v4l2_vp9_mv_probs mv;
+};
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 58392dcd3bf5..2cd8f7e432c5 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -703,6 +703,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
 #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
 #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
+#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
 #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
@@ -1755,6 +1756,8 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_mpeg2_sequence __user *p_mpeg2_sequence;
 		struct v4l2_ctrl_mpeg2_picture __user *p_mpeg2_picture;
 		struct v4l2_ctrl_mpeg2_quantisation __user *p_mpeg2_quantisation;
+		struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compressed_hdr_probs;
+		struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
@@ -1819,6 +1822,9 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_MPEG2_QUANTISATION   = 0x0250,
 	V4L2_CTRL_TYPE_MPEG2_SEQUENCE       = 0x0251,
 	V4L2_CTRL_TYPE_MPEG2_PICTURE        = 0x0252,
+
+	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR	= 0x0260,
+	V4L2_CTRL_TYPE_VP9_FRAME		= 0x0261,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.17.1

