Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11DF8DE4A
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbfHNUER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:04:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57560 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729169AbfHNUER (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:04:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 14D8328CB4C
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
Subject: [PATCH v6 04/11] media: uapi: h264: Add the concept of start code
Date:   Wed, 14 Aug 2019 16:59:24 -0300
Message-Id: <20190814195931.6587-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814195931.6587-1-ezequiel@collabora.com>
References: <20190814195931.6587-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stateless decoders have different expectations about the
start code that is prepended on H264 slices. Add a
menu control to express the supported start code types
(including no start code).

Drivers are allowed to support only one start code type,
but they can support both too.

Note that this is independent of the H264 decoding mode,
which specifies the granularity of the decoding operations.
Either in frame-based or slice-based mode, this new control
will allow to define the start code expected on H264 slices.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v6:
* Rename to START_CODE and enum values
  as suggested by Hand and Paul.
Changes in v5:
* Improve specification as suggested by Hans.
Changes in v4:
* New patch.
---
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 33 +++++++++++++++++++
 .../media/uapi/v4l/pixfmt-compressed.rst      |  5 +--
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
 include/media/h264-ctrls.h                    |  6 ++++
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index 623b34f61b32..799df02f7ef8 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -2066,6 +2066,39 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
         The OUTPUT buffer must contain all slices needed to decode the
         frame. The OUTPUT buffer must also contain both fields.
 
+``V4L2_CID_MPEG_VIDEO_H264_START_CODE (enum)``
+    Specifies the H264 slice start code expected for each slice.
+    This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
+    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
+    are required to set this control in order to specify the start code
+    that is expected for the buffer.
+    Drivers may expose a single or multiple start codes, depending
+    on what they can support.
+
+    .. note::
+
+       This menu control is not yet part of the public kernel API and
+       it is expected to change.
+
+.. c:type:: v4l2_mpeg_video_h264_start_code
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG_VIDEO_H264_START_CODE_NONE``
+      - 0
+      - Selecting this value specifies that H264 slices are passed
+        to the driver without any start code.
+    * - ``V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B``
+      - 1
+      - Selecting this value specifies that H264 slices are expected
+        to be prefixed by Annex B start codes. According to :ref:`h264`
+        valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
 .. _v4l2-mpeg-mpeg2:
 
 ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
index d666eb51741a..493b6020107d 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
@@ -60,8 +60,9 @@ Compressed Formats
 	extracted from the H264 bitstream.  This format is adapted for
 	stateless video decoders that implement an H264 pipeline
 	(using the :ref:`mem2mem` and :ref:`media-request-api`).
-	This pixelformat has a modifier that must be set at least once
-	through the ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE`` control.
+	This pixelformat has two modifiers that must be set at least once
+	through the ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE``
+        and ``V4L2_CID_MPEG_VIDEO_H264_START_CODE`` controls.
 	In addition, metadata associated with the frame to decode are
 	required to be passed through the ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
 	``V4L2_CID_MPEG_VIDEO_H264_PPS``,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 2c67f9fc4d5b..1d8f38824631 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -407,6 +407,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"Frame-Based",
 		NULL,
 	};
+	static const char * const h264_start_code[] = {
+		"No Start Code",
+		"Annex B Start Code",
+		NULL,
+	};
 	static const char * const mpeg_mpeg2_level[] = {
 		"Low",
 		"Main",
@@ -640,6 +645,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return h264_fmo_map_type;
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:
 		return h264_decode_mode;
+	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:
+		return h264_start_code;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 		return mpeg_mpeg2_level;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
@@ -860,6 +867,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:		return "H264 Decode Mode";
+	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:		return "H264 Start Code";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
 	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
@@ -1229,6 +1237,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
 	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:
+	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 928c48c57282..ba2876a64cf6 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -27,6 +27,7 @@
 #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_MPEG_BASE+1005)
+#define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_MPEG_BASE+1006)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_H264_SPS			0x0110
@@ -40,6 +41,11 @@ enum v4l2_mpeg_video_h264_decode_mode {
 	V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
 };
 
+enum v4l2_mpeg_video_h264_start_code {
+	V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
+	V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+};
+
 #define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
 #define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
 #define V4L2_H264_SPS_CONSTRAINT_SET2_FLAG			0x04
-- 
2.22.0

