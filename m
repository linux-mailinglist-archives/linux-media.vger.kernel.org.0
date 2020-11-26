Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C152C5547
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390021AbgKZN1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:27:34 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36415 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389997AbgKZN1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:27:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iHIrkPCQhN7XgiHJ3kYrXz; Thu, 26 Nov 2020 14:27:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606397250; bh=JA8eIOfRDpMnB8v9XPOBvHE5zb9CE4EuyTfbqjmHp2Y=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=GvsVcy4mEZmTBYAlEhHeSvJO31qaq+9ngwOiHdLLzyxRkY4nKnE9AtpaavCEQ5B4x
         VQZWgp8NOmKXv1WVRumEi2F8Kg4FWWRtTjGHwyZ/qxyOd/TrrZpZuej7hk19nBdet6
         Emsy41VDrLnEYkkrQc8Ws45pQqU4PKrGtfsi5RJE0ntg1ygPkDYyPVddymVCP5lyDU
         dGdTjrtX0GKyLgYFAaaMZDmuSVu38EF7874SMUv/Y208z3URU034KNbHnsRBaQ4go0
         ogH9gI79WCbFaKcoT2H1ubk4am5uDc2xZnlSwsIa3DWy92kZp6CMk5j0yogWO3lWZ0
         UPt9IL6+TksGQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/6] ext-ctrls-codec.rst: move FWHT docs to ext-ctrls-codec-stateless.rst
Date:   Thu, 26 Nov 2020 14:27:14 +0100
Message-Id: <20201126132717.1216907-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPKsg8oJiWG9OdslvPLewlhgUU054b3LqQP4rktgPBMGRZ8Vt+F3eBeqw9An1OHSIcFptow873r56aX/AXRSfpyhXVJzRDqTBTgWN9Ju6qgMMGIUt7XO
 kwR0j9UCgbt4kSaXBB01jErLR3coCvr79UTQNEIWPSLLduvWok59M+dZdkaWIhYNcgMFW1t80qamJGURsRZukDP5QoxBOgU1+UTkZBdy9bdSm4AVcL5MMW9M
 eyW5ERt/fFhsJtsRcAaIWYi8fl1Ghq/Yr73IUxQFFHM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the documentation for the stateless FWHT codec to
ext-ctrls-codec-stateless.rst since that is the proper place
for the stable stateless API documentation.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 120 +++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 121 ------------------
 2 files changed, 120 insertions(+), 121 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 12f3308fd2b3..01e3b1a3fb99 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -671,3 +671,123 @@ Stateless Codec Control ID
       - Selecting this value specifies that H264 slices are expected
         to be prefixed by Annex B start codes. According to :ref:`h264`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
+
+.. _codec-stateless-fwht:
+
+``V4L2_CID_STATELESS_FWHT_PARAMS (struct)``
+    Specifies the FWHT (Fast Walsh Hadamard Transform) parameters (as extracted
+    from the bitstream) for the associated FWHT data. This includes the necessary
+    parameters for configuring a stateless hardware decoding pipeline for FWHT.
+    This codec is specific to the vicodec test driver.
+
+.. c:type:: v4l2_ctrl_fwht_params
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{1.4cm}|p{4.3cm}|p{11.8cm}|
+
+.. flat-table:: struct v4l2_ctrl_fwht_params
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u64
+      - ``backward_ref_ts``
+      - Timestamp of the V4L2 capture buffer to use as backward reference, used
+        with P-coded frames. The timestamp refers to the
+	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
+	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
+	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
+    * - __u32
+      - ``version``
+      - The version of the codec. Set to ``V4L2_FWHT_VERSION``.
+    * - __u32
+      - ``width``
+      - The width of the frame.
+    * - __u32
+      - ``height``
+      - The height of the frame.
+    * - __u32
+      - ``flags``
+      - The flags of the frame, see :ref:`fwht-flags`.
+    * - __u32
+      - ``colorspace``
+      - The colorspace of the frame, from enum :c:type:`v4l2_colorspace`.
+    * - __u32
+      - ``xfer_func``
+      - The transfer function, from enum :c:type:`v4l2_xfer_func`.
+    * - __u32
+      - ``ycbcr_enc``
+      - The Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
+    * - __u32
+      - ``quantization``
+      - The quantization range, from enum :c:type:`v4l2_quantization`.
+
+
+
+.. _fwht-flags:
+
+FWHT Flags
+==========
+
+.. cssclass:: longtable
+
+.. tabularcolumns:: |p{6.8cm}|p{2.4cm}|p{8.3cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - ``V4L2_FWHT_FL_IS_INTERLACED``
+      - 0x00000001
+      - Set if this is an interlaced format.
+    * - ``V4L2_FWHT_FL_IS_BOTTOM_FIRST``
+      - 0x00000002
+      - Set if this is a bottom-first (NTSC) interlaced format.
+    * - ``V4L2_FWHT_FL_IS_ALTERNATE``
+      - 0x00000004
+      - Set if each 'frame' contains just one field.
+    * - ``V4L2_FWHT_FL_IS_BOTTOM_FIELD``
+      - 0x00000008
+      - If V4L2_FWHT_FL_IS_ALTERNATE was set, then this is set if this 'frame' is the
+	bottom field, else it is the top field.
+    * - ``V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED``
+      - 0x00000010
+      - Set if the Y' (luma) plane is uncompressed.
+    * - ``V4L2_FWHT_FL_CB_IS_UNCOMPRESSED``
+      - 0x00000020
+      - Set if the Cb plane is uncompressed.
+    * - ``V4L2_FWHT_FL_CR_IS_UNCOMPRESSED``
+      - 0x00000040
+      - Set if the Cr plane is uncompressed.
+    * - ``V4L2_FWHT_FL_CHROMA_FULL_HEIGHT``
+      - 0x00000080
+      - Set if the chroma plane has the same height as the luma plane,
+	else the chroma plane is half the height of the luma plane.
+    * - ``V4L2_FWHT_FL_CHROMA_FULL_WIDTH``
+      - 0x00000100
+      - Set if the chroma plane has the same width as the luma plane,
+	else the chroma plane is half the width of the luma plane.
+    * - ``V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED``
+      - 0x00000200
+      - Set if the alpha plane is uncompressed.
+    * - ``V4L2_FWHT_FL_I_FRAME``
+      - 0x00000400
+      - Set if this is an I-frame.
+    * - ``V4L2_FWHT_FL_COMPONENTS_NUM_MSK``
+      - 0x00070000
+      - The number of color components - 1.
+    * - ``V4L2_FWHT_FL_PIXENC_MSK``
+      - 0x00180000
+      - The mask for the pixel encoding.
+    * - ``V4L2_FWHT_FL_PIXENC_YUV``
+      - 0x00080000
+      - Set if the pixel encoding is YUV.
+    * - ``V4L2_FWHT_FL_PIXENC_RGB``
+      - 0x00100000
+      - Set if the pixel encoding is RGB.
+    * - ``V4L2_FWHT_FL_PIXENC_HSV``
+      - 0x00180000
+      - Set if the pixel encoding is HSV.
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 34173ed326fc..454ecd9a0f83 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2213,127 +2213,6 @@ enum v4l2_mpeg_mfc51_video_force_frame_type -
       - Force a non-coded frame.
 
 
-.. _v4l2-mpeg-fwht:
-
-``V4L2_CID_MPEG_VIDEO_FWHT_PARAMS (struct)``
-    Specifies the fwht parameters (as extracted from the bitstream) for the
-    associated FWHT data. This includes the necessary parameters for
-    configuring a stateless hardware decoding pipeline for FWHT.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_fwht_params
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{1.4cm}|p{4.3cm}|p{11.8cm}|
-
-.. flat-table:: struct v4l2_ctrl_fwht_params
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u64
-      - ``backward_ref_ts``
-      - Timestamp of the V4L2 capture buffer to use as backward reference, used
-        with P-coded frames. The timestamp refers to the
-	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
-	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
-	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
-    * - __u32
-      - ``version``
-      - The version of the codec
-    * - __u32
-      - ``width``
-      - The width of the frame
-    * - __u32
-      - ``height``
-      - The height of the frame
-    * - __u32
-      - ``flags``
-      - The flags of the frame, see :ref:`fwht-flags`.
-    * - __u32
-      - ``colorspace``
-      - The colorspace of the frame, from enum :c:type:`v4l2_colorspace`.
-    * - __u32
-      - ``xfer_func``
-      - The transfer function, from enum :c:type:`v4l2_xfer_func`.
-    * - __u32
-      - ``ycbcr_enc``
-      - The Y'CbCr encoding, from enum :c:type:`v4l2_ycbcr_encoding`.
-    * - __u32
-      - ``quantization``
-      - The quantization range, from enum :c:type:`v4l2_quantization`.
-
-
-
-.. _fwht-flags:
-
-FWHT Flags
-============
-
-.. cssclass:: longtable
-
-.. tabularcolumns:: |p{6.8cm}|p{2.4cm}|p{8.3cm}|
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       3 1 4
-
-    * - ``V4L2_FWHT_FL_IS_INTERLACED``
-      - 0x00000001
-      - Set if this is an interlaced format
-    * - ``V4L2_FWHT_FL_IS_BOTTOM_FIRST``
-      - 0x00000002
-      - Set if this is a bottom-first (NTSC) interlaced format
-    * - ``V4L2_FWHT_FL_IS_ALTERNATE``
-      - 0x00000004
-      - Set if each 'frame' contains just one field
-    * - ``V4L2_FWHT_FL_IS_BOTTOM_FIELD``
-      - 0x00000008
-      - If V4L2_FWHT_FL_IS_ALTERNATE was set, then this is set if this 'frame' is the
-	bottom field, else it is the top field.
-    * - ``V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED``
-      - 0x00000010
-      - Set if the luma plane is uncompressed
-    * - ``V4L2_FWHT_FL_CB_IS_UNCOMPRESSED``
-      - 0x00000020
-      - Set if the cb plane is uncompressed
-    * - ``V4L2_FWHT_FL_CR_IS_UNCOMPRESSED``
-      - 0x00000040
-      - Set if the cr plane is uncompressed
-    * - ``V4L2_FWHT_FL_CHROMA_FULL_HEIGHT``
-      - 0x00000080
-      - Set if the chroma plane has the same height as the luma plane,
-	else the chroma plane is half the height of the luma plane
-    * - ``V4L2_FWHT_FL_CHROMA_FULL_WIDTH``
-      - 0x00000100
-      - Set if the chroma plane has the same width as the luma plane,
-	else the chroma plane is half the width of the luma plane
-    * - ``V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED``
-      - 0x00000200
-      - Set if the alpha plane is uncompressed
-    * - ``V4L2_FWHT_FL_I_FRAME``
-      - 0x00000400
-      - Set if this is an I-frame
-    * - ``V4L2_FWHT_FL_COMPONENTS_NUM_MSK``
-      - 0x00070000
-      - A 4-values flag - the number of components - 1
-    * - ``V4L2_FWHT_FL_PIXENC_YUV``
-      - 0x00080000
-      - Set if the pixel encoding is YUV
-    * - ``V4L2_FWHT_FL_PIXENC_RGB``
-      - 0x00100000
-      - Set if the pixel encoding is RGB
-    * - ``V4L2_FWHT_FL_PIXENC_HSV``
-      - 0x00180000
-      - Set if the pixel encoding is HSV
-
-
 CX2341x MPEG Controls
 =====================
 
-- 
2.29.2

