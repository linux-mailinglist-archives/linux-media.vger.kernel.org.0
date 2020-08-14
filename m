Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF85244A9C
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgHNNh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:37:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43298 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgHNNh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:37:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CC63529A823
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 09/19] media: uapi: h264: Clarify SLICE_BASED mode
Date:   Fri, 14 Aug 2020 10:36:24 -0300
Message-Id: <20200814133634.95665-10-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the SLICE_BASED and FRAME_BASED modes documentation
is misleading and not matching the intended use-cases.

Drop non-required fields SLICE_PARAMS 'start_byte_offset' and
DECODE_PARAMS 'num_slices' and clarify the decoding modes in the
documentation.

On SLICE_BASED mode, a single slice is expected per OUTPUT buffer,
and therefore 'start_byte_offset' is not needed (since the offset
to the slice is the start of the buffer).

This mode requires the use of CAPTURE buffer holding, and so
the number of slices shall not be required.

On FRAME_BASED mode, the devices are expected to take care of slice
parsing. Neither SLICE_PARAMS are required (and shouldn't be
exposed by frame-based drivers), nor the number of slices.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 39 +++++--------------
 include/media/h264-ctrls.h                    |  4 --
 2 files changed, 10 insertions(+), 33 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e88c207d945b..90caf6a0d5a0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1748,9 +1748,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
        This compound control is not yet part of the public kernel API
        and it is expected to change.
 
-       This structure is expected to be passed as an array, with one
-       entry for each slice included in the bitstream buffer.
-
 .. c:type:: v4l2_ctrl_h264_slice_params
 
 .. cssclass:: longtable
@@ -1760,17 +1757,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - __u32
-      - ``start_byte_offset``
-        Offset (in bytes) from the beginning of the OUTPUT buffer to the start
-        of the slice. If the slice starts with a start code, then this is the
-        offset to such start code. When operating in slice-based decoding mode
-        (see :c:type:`v4l2_mpeg_video_h264_decode_mode`), this field should
-        be set to 0. When operating in frame-based decoding mode, this field
-        should be 0 for the first slice.
     * - __u32
       - ``header_bit_size``
-      -
+      - Offset in bits to slice_data() from the beginning of this slice.
     * - __u32
       - ``first_mb_in_slice``
       -
@@ -1998,12 +1987,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - struct :c:type:`v4l2_h264_dpb_entry`
       - ``dpb[16]``
       -
-    * - __u16
-      - ``num_slices``
-      - Number of slices needed to decode the current frame/field. When
-        operating in slice-based decoding mode (see
-        :c:type:`v4l2_mpeg_video_h264_decode_mode`), this field
-        should always be set to one.
     * - __u16
       - ``nal_ref_idc``
       - NAL reference ID value coming from the NAL Unit header
@@ -2121,22 +2104,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED``
       - 0
       - Decoding is done at the slice granularity.
-        In this mode, ``num_slices`` field in struct
-        :c:type:`v4l2_ctrl_h264_decode_params` should be set to 1,
-        and ``start_byte_offset`` in struct
-        :c:type:`v4l2_ctrl_h264_slice_params` should be set to 0.
         The OUTPUT buffer must contain a single slice.
+        When this mode is selected, the ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS``
+        control shall be set. When multiple slices compose a frame,
+        use of ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` flag
+        is required.
     * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED``
       - 1
-      - Decoding is done at the frame granularity.
-        In this mode, ``num_slices`` field in struct
-        :c:type:`v4l2_ctrl_h264_decode_params` should be set to the number
-        of slices in the frame, and ``start_byte_offset`` in struct
-        :c:type:`v4l2_ctrl_h264_slice_params` should be set accordingly
-        for each slice. For the first slice, ``start_byte_offset`` should
-        be zero.
+      - Decoding is done at the frame granularity,
         The OUTPUT buffer must contain all slices needed to decode the
         frame. The OUTPUT buffer must also contain both fields.
+        This mode will be supported by devices that
+        parse the slice(s) header(s) in hardware. When this mode is
+        selected, the ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS``
+        control shall not be set.
 
 ``V4L2_CID_MPEG_VIDEO_H264_START_CODE (enum)``
     Specifies the H264 slice start code expected for each slice.
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index afcae3052085..e180501e6385 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -165,9 +165,6 @@ struct v4l2_h264_reference {
 };
 
 struct v4l2_ctrl_h264_slice_params {
-	/* Offset in bytes to the start of slice in the OUTPUT buffer. */
-	__u32 start_byte_offset;
-
 	/* Offset in bits to slice_data() from the beginning of this slice. */
 	__u32 header_bit_size;
 
@@ -226,7 +223,6 @@ struct v4l2_h264_dpb_entry {
 
 struct v4l2_ctrl_h264_decode_params {
 	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
-	__u16 num_slices;
 	__u16 nal_ref_idc;
 	__s32 top_field_order_cnt;
 	__s32 bottom_field_order_cnt;
-- 
2.27.0

