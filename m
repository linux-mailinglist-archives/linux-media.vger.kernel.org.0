Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F23A2B277D
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 22:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgKMVwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 16:52:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgKMVvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 16:51:50 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDD7C0613D1;
        Fri, 13 Nov 2020 13:51:50 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CD1131F46BC9
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/9] media: Rename stateful codec control macros
Date:   Fri, 13 Nov 2020 18:51:15 -0300
Message-Id: <20201113215121.505173-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113215121.505173-1-ezequiel@collabora.com>
References: <20201113215121.505173-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For historical reasons, stateful codec controls are named
as {}_MPEG_{}. While we can't at this point sanely
change all control IDs (such as V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER),
we can least change the more meaningful macros such as classes
macros.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
 .../media/v4l/ext-ctrls-codec.rst             |   4 +-
 .../media/v4l/extended-controls.rst           |   8 +-
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
 drivers/media/common/cx2341x.c                |   4 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |   4 +-
 include/media/fwht-ctrls.h                    |   2 +-
 include/media/h264-ctrls.h                    |  16 +-
 include/media/hevc-ctrls.h                    |  10 +-
 include/media/mpeg2-ctrls.h                   |   4 +-
 include/media/vp8-ctrls.h                     |   2 +-
 include/uapi/linux/v4l2-controls.h            | 409 +++++++++---------
 14 files changed, 242 insertions(+), 233 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-mem2mem.rst b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
index d8db46886555..7041bb3d5b8d 100644
--- a/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
+++ b/Documentation/userspace-api/media/v4l/dev-mem2mem.rst
@@ -32,7 +32,7 @@ file handle is visible through another file handle).
 One of the most common memory-to-memory device is the codec. Codecs
 are more complicated than most and require additional setup for
 their codec parameters. This is done through codec controls.
-See :ref:`mpeg-controls`. More details on how to use codec memory-to-memory
+See :ref:`codec-controls`. More details on how to use codec memory-to-memory
 devices are given in the following sections.
 
 .. toctree::
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce728c757eaf..b31c52d9b1da 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1,6 +1,6 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
-.. _mpeg-controls:
+.. _codec-controls:
 
 ***********************
 Codec Control Reference
@@ -26,7 +26,7 @@ Generic Codec Controls
 Codec Control IDs
 -----------------
 
-``V4L2_CID_MPEG_CLASS (class)``
+``V4L2_CID_CODEC_CLASS (class)``
     The Codec class descriptor. Calling
     :ref:`VIDIOC_QUERYCTRL` for this control will
     return a description of this control class. This description can be
diff --git a/Documentation/userspace-api/media/v4l/extended-controls.rst b/Documentation/userspace-api/media/v4l/extended-controls.rst
index 70301538d222..abec5ced748a 100644
--- a/Documentation/userspace-api/media/v4l/extended-controls.rst
+++ b/Documentation/userspace-api/media/v4l/extended-controls.rst
@@ -55,8 +55,8 @@ controls in that array and a control class. Control classes are used to
 group similar controls into a single class. For example, control class
 ``V4L2_CTRL_CLASS_USER`` contains all user controls (i. e. all controls
 that can also be set using the old :ref:`VIDIOC_S_CTRL <VIDIOC_G_CTRL>`
-ioctl). Control class ``V4L2_CTRL_CLASS_MPEG`` contains all controls
-relating to MPEG encoding, etc.
+ioctl). Control class ``V4L2_CTRL_CLASS_CODEC`` contains all controls
+relating to stateful codecs.
 
 All controls in the control array must belong to the specified control
 class. An error is returned if this is not the case.
@@ -130,9 +130,9 @@ control class is found:
 
 .. code-block:: c
 
-    qctrl.id = V4L2_CTRL_CLASS_MPEG | V4L2_CTRL_FLAG_NEXT_CTRL;
+    qctrl.id = V4L2_CTRL_CLASS_CODEC | V4L2_CTRL_FLAG_NEXT_CTRL;
     while (0 == ioctl(fd, VIDIOC_QUERYCTRL, &qctrl)) {
-	if (V4L2_CTRL_ID2CLASS(qctrl.id) != V4L2_CTRL_CLASS_MPEG)
+	if (V4L2_CTRL_ID2CLASS(qctrl.id) != V4L2_CTRL_CLASS_CODEC)
 	    break;
 	/* ... */
 	qctrl.id |= V4L2_CTRL_FLAG_NEXT_CTRL;
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index f2173e310d67..c7aba1b66b6d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -322,10 +322,10 @@ still cause this situation.
 	:ref:`VIDIOC_S_CTRL <VIDIOC_G_CTRL>` and
 	:ref:`VIDIOC_G_CTRL <VIDIOC_G_CTRL>` ioctl belong to this
 	class.
-    * - ``V4L2_CTRL_CLASS_MPEG``
+    * - ``V4L2_CTRL_CLASS_CODEC``
       - 0x990000
-      - The class containing MPEG compression controls. These controls are
-	described in :ref:`mpeg-controls`.
+      - The class containing stateful codec controls. These controls are
+	described in :ref:`codec-controls`.
     * - ``V4L2_CTRL_CLASS_CAMERA``
       - 0x9a0000
       - The class containing camera controls. These controls are described
diff --git a/drivers/media/common/cx2341x.c b/drivers/media/common/cx2341x.c
index 1f67e021138f..1392bd6b0026 100644
--- a/drivers/media/common/cx2341x.c
+++ b/drivers/media/common/cx2341x.c
@@ -166,7 +166,7 @@ static void cx2341x_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *ty
 
 /* Must be sorted from low to high control ID! */
 const u32 cx2341x_mpeg_ctrls[] = {
-	V4L2_CID_MPEG_CLASS,
+	V4L2_CID_CODEC_CLASS,
 	V4L2_CID_MPEG_STREAM_TYPE,
 	V4L2_CID_MPEG_STREAM_VBI_FMT,
 	V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ,
@@ -574,7 +574,7 @@ int cx2341x_ctrl_query(const struct cx2341x_mpeg_params *params,
 	int err;
 
 	switch (qctrl->id) {
-	case V4L2_CID_MPEG_CLASS:
+	case V4L2_CID_CODEC_CLASS:
 		return v4l2_ctrl_query_fill(qctrl, 0, 0, 0, 0);
 	case V4L2_CID_MPEG_STREAM_TYPE:
 		return v4l2_ctrl_query_fill(qctrl,
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index 61e144a35201..a71753d459ba 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -1109,7 +1109,7 @@ const struct v4l2_ioctl_ops *get_dec_v4l2_ioctl_ops(void)
 	return &s5p_mfc_dec_ioctl_ops;
 }
 
-#define IS_MFC51_PRIV(x) ((V4L2_CTRL_ID2WHICH(x) == V4L2_CTRL_CLASS_MPEG) \
+#define IS_MFC51_PRIV(x) ((V4L2_CTRL_ID2WHICH(x) == V4L2_CTRL_CLASS_CODEC) \
 						&& V4L2_CTRL_DRIVER_PRIV(x))
 
 int s5p_mfc_dec_ctrls_setup(struct s5p_mfc_ctx *ctx)
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
index acc2217dd7e9..1fad99edb091 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
@@ -2614,7 +2614,7 @@ const struct v4l2_ioctl_ops *get_enc_v4l2_ioctl_ops(void)
 	return &s5p_mfc_enc_ioctl_ops;
 }
 
-#define IS_MFC51_PRIV(x) ((V4L2_CTRL_ID2WHICH(x) == V4L2_CTRL_CLASS_MPEG) \
+#define IS_MFC51_PRIV(x) ((V4L2_CTRL_ID2WHICH(x) == V4L2_CTRL_CLASS_CODEC) \
 						&& V4L2_CTRL_DRIVER_PRIV(x))
 
 int s5p_mfc_enc_ctrls_setup(struct s5p_mfc_ctx *ctx)
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index bd7f330c941c..04232493d94b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -830,7 +830,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	/* The MPEG controls are applicable to all codec controls
 	 * and the 'MPEG' part of the define is historical */
 	/* Keep the order of the 'case's the same as in videodev2.h! */
-	case V4L2_CID_MPEG_CLASS:		return "Codec Controls";
+	case V4L2_CID_CODEC_CLASS:		return "Codec Controls";
 	case V4L2_CID_MPEG_STREAM_TYPE:		return "Stream Type";
 	case V4L2_CID_MPEG_STREAM_PID_PMT:	return "Stream PMT Program ID";
 	case V4L2_CID_MPEG_STREAM_PID_AUDIO:	return "Stream Audio Program ID";
@@ -1358,7 +1358,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_USER_CLASS:
 	case V4L2_CID_CAMERA_CLASS:
-	case V4L2_CID_MPEG_CLASS:
+	case V4L2_CID_CODEC_CLASS:
 	case V4L2_CID_FM_TX_CLASS:
 	case V4L2_CID_FLASH_CLASS:
 	case V4L2_CID_JPEG_CLASS:
diff --git a/include/media/fwht-ctrls.h b/include/media/fwht-ctrls.h
index 615027410e47..a918b49609e1 100644
--- a/include/media/fwht-ctrls.h
+++ b/include/media/fwht-ctrls.h
@@ -13,7 +13,7 @@
 
 #define V4L2_CTRL_TYPE_FWHT_PARAMS 0x0105
 
-#define V4L2_CID_MPEG_VIDEO_FWHT_PARAMS	(V4L2_CID_MPEG_BASE + 292)
+#define V4L2_CID_MPEG_VIDEO_FWHT_PARAMS	(V4L2_CID_CODEC_BASE + 292)
 
 struct v4l2_ctrl_fwht_params {
 	__u64 backward_ref_ts;
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 893e21354a9b..f86345b8efd1 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -29,14 +29,14 @@
  * would be added during the phase where those controls are not
  * stable. It should be fixed eventually.
  */
-#define V4L2_CID_MPEG_VIDEO_H264_SPS		(V4L2_CID_MPEG_BASE+1000)
-#define V4L2_CID_MPEG_VIDEO_H264_PPS		(V4L2_CID_MPEG_BASE+1001)
-#define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_MPEG_BASE+1002)
-#define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
-#define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
-#define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_MPEG_BASE+1005)
-#define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_MPEG_BASE+1006)
-#define V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS	(V4L2_CID_MPEG_BASE+1007)
+#define V4L2_CID_MPEG_VIDEO_H264_SPS		(V4L2_CID_CODEC_BASE+1000)
+#define V4L2_CID_MPEG_VIDEO_H264_PPS		(V4L2_CID_CODEC_BASE+1001)
+#define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_CODEC_BASE+1002)
+#define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_CODEC_BASE+1003)
+#define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_CODEC_BASE+1004)
+#define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_CODEC_BASE+1005)
+#define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_CODEC_BASE+1006)
+#define V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS	(V4L2_CID_CODEC_BASE+1007)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_H264_SPS			0x0110
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 1009cf0891cc..b4cb2ef02f17 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -16,11 +16,11 @@
 /* The pixel format isn't stable at the moment and will likely be renamed. */
 #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
 
-#define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_MPEG_BASE + 1008)
-#define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_MPEG_BASE + 1009)
-#define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_MPEG_BASE + 1010)
-#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_MPEG_BASE + 1015)
-#define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_MPEG_BASE + 1016)
+#define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
+#define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
+#define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
+#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
+#define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 6601455b3d5e..2a4ae6701166 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -11,8 +11,8 @@
 #ifndef _MPEG2_CTRLS_H_
 #define _MPEG2_CTRLS_H_
 
-#define V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_MPEG_BASE+250)
-#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION		(V4L2_CID_MPEG_BASE+251)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_CODEC_BASE+250)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION		(V4L2_CID_CODEC_BASE+251)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
diff --git a/include/media/vp8-ctrls.h b/include/media/vp8-ctrls.h
index 53cba826e482..75a19d4f4149 100644
--- a/include/media/vp8-ctrls.h
+++ b/include/media/vp8-ctrls.h
@@ -15,7 +15,7 @@
 
 #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F')
 
-#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (V4L2_CID_MPEG_BASE + 2000)
+#define V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER (V4L2_CID_CODEC_BASE + 2000)
 #define V4L2_CTRL_TYPE_VP8_FRAME_HEADER 0x301
 
 #define V4L2_VP8_SEGMENT_HEADER_FLAG_ENABLED              0x01
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 7035f4fb182c..d7a76e80282a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -54,7 +54,7 @@
 
 /* Control classes */
 #define V4L2_CTRL_CLASS_USER		0x00980000	/* Old-style 'user' controls */
-#define V4L2_CTRL_CLASS_MPEG		0x00990000	/* MPEG-compression controls */
+#define V4L2_CTRL_CLASS_CODEC		0x00990000	/* Stateful codec controls */
 #define V4L2_CTRL_CLASS_CAMERA		0x009a0000	/* Camera class controls */
 #define V4L2_CTRL_CLASS_FM_TX		0x009b0000	/* FM Modulator controls */
 #define V4L2_CTRL_CLASS_FLASH		0x009c0000	/* Camera flash controls */
@@ -208,11 +208,11 @@ enum v4l2_colorfx {
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
 
-#define V4L2_CID_MPEG_BASE			(V4L2_CTRL_CLASS_MPEG | 0x900)
-#define V4L2_CID_MPEG_CLASS			(V4L2_CTRL_CLASS_MPEG | 1)
+#define V4L2_CID_CODEC_BASE			(V4L2_CTRL_CLASS_CODEC | 0x900)
+#define V4L2_CID_CODEC_CLASS			(V4L2_CTRL_CLASS_CODEC | 1)
 
 /*  MPEG streams, specific to multiplexed streams */
-#define V4L2_CID_MPEG_STREAM_TYPE		(V4L2_CID_MPEG_BASE+0)
+#define V4L2_CID_MPEG_STREAM_TYPE		(V4L2_CID_CODEC_BASE+0)
 enum v4l2_mpeg_stream_type {
 	V4L2_MPEG_STREAM_TYPE_MPEG2_PS   = 0, /* MPEG-2 program stream */
 	V4L2_MPEG_STREAM_TYPE_MPEG2_TS   = 1, /* MPEG-2 transport stream */
@@ -221,26 +221,26 @@ enum v4l2_mpeg_stream_type {
 	V4L2_MPEG_STREAM_TYPE_MPEG1_VCD  = 4, /* MPEG-1 VCD-compatible stream */
 	V4L2_MPEG_STREAM_TYPE_MPEG2_SVCD = 5, /* MPEG-2 SVCD-compatible stream */
 };
-#define V4L2_CID_MPEG_STREAM_PID_PMT		(V4L2_CID_MPEG_BASE+1)
-#define V4L2_CID_MPEG_STREAM_PID_AUDIO		(V4L2_CID_MPEG_BASE+2)
-#define V4L2_CID_MPEG_STREAM_PID_VIDEO		(V4L2_CID_MPEG_BASE+3)
-#define V4L2_CID_MPEG_STREAM_PID_PCR		(V4L2_CID_MPEG_BASE+4)
-#define V4L2_CID_MPEG_STREAM_PES_ID_AUDIO	(V4L2_CID_MPEG_BASE+5)
-#define V4L2_CID_MPEG_STREAM_PES_ID_VIDEO	(V4L2_CID_MPEG_BASE+6)
-#define V4L2_CID_MPEG_STREAM_VBI_FMT		(V4L2_CID_MPEG_BASE+7)
+#define V4L2_CID_MPEG_STREAM_PID_PMT		(V4L2_CID_CODEC_BASE+1)
+#define V4L2_CID_MPEG_STREAM_PID_AUDIO		(V4L2_CID_CODEC_BASE+2)
+#define V4L2_CID_MPEG_STREAM_PID_VIDEO		(V4L2_CID_CODEC_BASE+3)
+#define V4L2_CID_MPEG_STREAM_PID_PCR		(V4L2_CID_CODEC_BASE+4)
+#define V4L2_CID_MPEG_STREAM_PES_ID_AUDIO	(V4L2_CID_CODEC_BASE+5)
+#define V4L2_CID_MPEG_STREAM_PES_ID_VIDEO	(V4L2_CID_CODEC_BASE+6)
+#define V4L2_CID_MPEG_STREAM_VBI_FMT		(V4L2_CID_CODEC_BASE+7)
 enum v4l2_mpeg_stream_vbi_fmt {
 	V4L2_MPEG_STREAM_VBI_FMT_NONE = 0,  /* No VBI in the MPEG stream */
 	V4L2_MPEG_STREAM_VBI_FMT_IVTV = 1,  /* VBI in private packets, IVTV format */
 };
 
 /*  MPEG audio controls specific to multiplexed streams  */
-#define V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ	(V4L2_CID_MPEG_BASE+100)
+#define V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ	(V4L2_CID_CODEC_BASE+100)
 enum v4l2_mpeg_audio_sampling_freq {
 	V4L2_MPEG_AUDIO_SAMPLING_FREQ_44100 = 0,
 	V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000 = 1,
 	V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000 = 2,
 };
-#define V4L2_CID_MPEG_AUDIO_ENCODING		(V4L2_CID_MPEG_BASE+101)
+#define V4L2_CID_MPEG_AUDIO_ENCODING		(V4L2_CID_CODEC_BASE+101)
 enum v4l2_mpeg_audio_encoding {
 	V4L2_MPEG_AUDIO_ENCODING_LAYER_1 = 0,
 	V4L2_MPEG_AUDIO_ENCODING_LAYER_2 = 1,
@@ -248,7 +248,7 @@ enum v4l2_mpeg_audio_encoding {
 	V4L2_MPEG_AUDIO_ENCODING_AAC     = 3,
 	V4L2_MPEG_AUDIO_ENCODING_AC3     = 4,
 };
-#define V4L2_CID_MPEG_AUDIO_L1_BITRATE		(V4L2_CID_MPEG_BASE+102)
+#define V4L2_CID_MPEG_AUDIO_L1_BITRATE		(V4L2_CID_CODEC_BASE+102)
 enum v4l2_mpeg_audio_l1_bitrate {
 	V4L2_MPEG_AUDIO_L1_BITRATE_32K  = 0,
 	V4L2_MPEG_AUDIO_L1_BITRATE_64K  = 1,
@@ -265,7 +265,7 @@ enum v4l2_mpeg_audio_l1_bitrate {
 	V4L2_MPEG_AUDIO_L1_BITRATE_416K = 12,
 	V4L2_MPEG_AUDIO_L1_BITRATE_448K = 13,
 };
-#define V4L2_CID_MPEG_AUDIO_L2_BITRATE		(V4L2_CID_MPEG_BASE+103)
+#define V4L2_CID_MPEG_AUDIO_L2_BITRATE		(V4L2_CID_CODEC_BASE+103)
 enum v4l2_mpeg_audio_l2_bitrate {
 	V4L2_MPEG_AUDIO_L2_BITRATE_32K  = 0,
 	V4L2_MPEG_AUDIO_L2_BITRATE_48K  = 1,
@@ -282,7 +282,7 @@ enum v4l2_mpeg_audio_l2_bitrate {
 	V4L2_MPEG_AUDIO_L2_BITRATE_320K = 12,
 	V4L2_MPEG_AUDIO_L2_BITRATE_384K = 13,
 };
-#define V4L2_CID_MPEG_AUDIO_L3_BITRATE		(V4L2_CID_MPEG_BASE+104)
+#define V4L2_CID_MPEG_AUDIO_L3_BITRATE		(V4L2_CID_CODEC_BASE+104)
 enum v4l2_mpeg_audio_l3_bitrate {
 	V4L2_MPEG_AUDIO_L3_BITRATE_32K  = 0,
 	V4L2_MPEG_AUDIO_L3_BITRATE_40K  = 1,
@@ -299,34 +299,34 @@ enum v4l2_mpeg_audio_l3_bitrate {
 	V4L2_MPEG_AUDIO_L3_BITRATE_256K = 12,
 	V4L2_MPEG_AUDIO_L3_BITRATE_320K = 13,
 };
-#define V4L2_CID_MPEG_AUDIO_MODE		(V4L2_CID_MPEG_BASE+105)
+#define V4L2_CID_MPEG_AUDIO_MODE		(V4L2_CID_CODEC_BASE+105)
 enum v4l2_mpeg_audio_mode {
 	V4L2_MPEG_AUDIO_MODE_STEREO       = 0,
 	V4L2_MPEG_AUDIO_MODE_JOINT_STEREO = 1,
 	V4L2_MPEG_AUDIO_MODE_DUAL         = 2,
 	V4L2_MPEG_AUDIO_MODE_MONO         = 3,
 };
-#define V4L2_CID_MPEG_AUDIO_MODE_EXTENSION	(V4L2_CID_MPEG_BASE+106)
+#define V4L2_CID_MPEG_AUDIO_MODE_EXTENSION	(V4L2_CID_CODEC_BASE+106)
 enum v4l2_mpeg_audio_mode_extension {
 	V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_4  = 0,
 	V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_8  = 1,
 	V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_12 = 2,
 	V4L2_MPEG_AUDIO_MODE_EXTENSION_BOUND_16 = 3,
 };
-#define V4L2_CID_MPEG_AUDIO_EMPHASIS		(V4L2_CID_MPEG_BASE+107)
+#define V4L2_CID_MPEG_AUDIO_EMPHASIS		(V4L2_CID_CODEC_BASE+107)
 enum v4l2_mpeg_audio_emphasis {
 	V4L2_MPEG_AUDIO_EMPHASIS_NONE         = 0,
 	V4L2_MPEG_AUDIO_EMPHASIS_50_DIV_15_uS = 1,
 	V4L2_MPEG_AUDIO_EMPHASIS_CCITT_J17    = 2,
 };
-#define V4L2_CID_MPEG_AUDIO_CRC			(V4L2_CID_MPEG_BASE+108)
+#define V4L2_CID_MPEG_AUDIO_CRC			(V4L2_CID_CODEC_BASE+108)
 enum v4l2_mpeg_audio_crc {
 	V4L2_MPEG_AUDIO_CRC_NONE  = 0,
 	V4L2_MPEG_AUDIO_CRC_CRC16 = 1,
 };
-#define V4L2_CID_MPEG_AUDIO_MUTE		(V4L2_CID_MPEG_BASE+109)
-#define V4L2_CID_MPEG_AUDIO_AAC_BITRATE		(V4L2_CID_MPEG_BASE+110)
-#define V4L2_CID_MPEG_AUDIO_AC3_BITRATE		(V4L2_CID_MPEG_BASE+111)
+#define V4L2_CID_MPEG_AUDIO_MUTE		(V4L2_CID_CODEC_BASE+109)
+#define V4L2_CID_MPEG_AUDIO_AAC_BITRATE		(V4L2_CID_CODEC_BASE+110)
+#define V4L2_CID_MPEG_AUDIO_AC3_BITRATE		(V4L2_CID_CODEC_BASE+111)
 enum v4l2_mpeg_audio_ac3_bitrate {
 	V4L2_MPEG_AUDIO_AC3_BITRATE_32K  = 0,
 	V4L2_MPEG_AUDIO_AC3_BITRATE_40K  = 1,
@@ -348,7 +348,7 @@ enum v4l2_mpeg_audio_ac3_bitrate {
 	V4L2_MPEG_AUDIO_AC3_BITRATE_576K = 17,
 	V4L2_MPEG_AUDIO_AC3_BITRATE_640K = 18,
 };
-#define V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK	(V4L2_CID_MPEG_BASE+112)
+#define V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK	(V4L2_CID_CODEC_BASE+112)
 enum v4l2_mpeg_audio_dec_playback {
 	V4L2_MPEG_AUDIO_DEC_PLAYBACK_AUTO	    = 0,
 	V4L2_MPEG_AUDIO_DEC_PLAYBACK_STEREO	    = 1,
@@ -357,52 +357,52 @@ enum v4l2_mpeg_audio_dec_playback {
 	V4L2_MPEG_AUDIO_DEC_PLAYBACK_MONO	    = 4,
 	V4L2_MPEG_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO = 5,
 };
-#define V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK (V4L2_CID_MPEG_BASE+113)
+#define V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK (V4L2_CID_CODEC_BASE+113)
 
 /*  MPEG video controls specific to multiplexed streams */
-#define V4L2_CID_MPEG_VIDEO_ENCODING		(V4L2_CID_MPEG_BASE+200)
+#define V4L2_CID_MPEG_VIDEO_ENCODING		(V4L2_CID_CODEC_BASE+200)
 enum v4l2_mpeg_video_encoding {
 	V4L2_MPEG_VIDEO_ENCODING_MPEG_1     = 0,
 	V4L2_MPEG_VIDEO_ENCODING_MPEG_2     = 1,
 	V4L2_MPEG_VIDEO_ENCODING_MPEG_4_AVC = 2,
 };
-#define V4L2_CID_MPEG_VIDEO_ASPECT		(V4L2_CID_MPEG_BASE+201)
+#define V4L2_CID_MPEG_VIDEO_ASPECT		(V4L2_CID_CODEC_BASE+201)
 enum v4l2_mpeg_video_aspect {
 	V4L2_MPEG_VIDEO_ASPECT_1x1     = 0,
 	V4L2_MPEG_VIDEO_ASPECT_4x3     = 1,
 	V4L2_MPEG_VIDEO_ASPECT_16x9    = 2,
 	V4L2_MPEG_VIDEO_ASPECT_221x100 = 3,
 };
-#define V4L2_CID_MPEG_VIDEO_B_FRAMES		(V4L2_CID_MPEG_BASE+202)
-#define V4L2_CID_MPEG_VIDEO_GOP_SIZE		(V4L2_CID_MPEG_BASE+203)
-#define V4L2_CID_MPEG_VIDEO_GOP_CLOSURE		(V4L2_CID_MPEG_BASE+204)
-#define V4L2_CID_MPEG_VIDEO_PULLDOWN		(V4L2_CID_MPEG_BASE+205)
-#define V4L2_CID_MPEG_VIDEO_BITRATE_MODE	(V4L2_CID_MPEG_BASE+206)
+#define V4L2_CID_MPEG_VIDEO_B_FRAMES		(V4L2_CID_CODEC_BASE+202)
+#define V4L2_CID_MPEG_VIDEO_GOP_SIZE		(V4L2_CID_CODEC_BASE+203)
+#define V4L2_CID_MPEG_VIDEO_GOP_CLOSURE		(V4L2_CID_CODEC_BASE+204)
+#define V4L2_CID_MPEG_VIDEO_PULLDOWN		(V4L2_CID_CODEC_BASE+205)
+#define V4L2_CID_MPEG_VIDEO_BITRATE_MODE	(V4L2_CID_CODEC_BASE+206)
 enum v4l2_mpeg_video_bitrate_mode {
 	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0,
 	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1,
 	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ  = 2,
 };
-#define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_MPEG_BASE+207)
-#define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_MPEG_BASE+208)
-#define V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (V4L2_CID_MPEG_BASE+209)
-#define V4L2_CID_MPEG_VIDEO_MUTE		(V4L2_CID_MPEG_BASE+210)
-#define V4L2_CID_MPEG_VIDEO_MUTE_YUV		(V4L2_CID_MPEG_BASE+211)
-#define V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE		(V4L2_CID_MPEG_BASE+212)
-#define V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER	(V4L2_CID_MPEG_BASE+213)
-#define V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB		(V4L2_CID_MPEG_BASE+214)
-#define V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE			(V4L2_CID_MPEG_BASE+215)
-#define V4L2_CID_MPEG_VIDEO_HEADER_MODE				(V4L2_CID_MPEG_BASE+216)
+#define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_CODEC_BASE+207)
+#define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_CODEC_BASE+208)
+#define V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (V4L2_CID_CODEC_BASE+209)
+#define V4L2_CID_MPEG_VIDEO_MUTE		(V4L2_CID_CODEC_BASE+210)
+#define V4L2_CID_MPEG_VIDEO_MUTE_YUV		(V4L2_CID_CODEC_BASE+211)
+#define V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE		(V4L2_CID_CODEC_BASE+212)
+#define V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER	(V4L2_CID_CODEC_BASE+213)
+#define V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB		(V4L2_CID_CODEC_BASE+214)
+#define V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE			(V4L2_CID_CODEC_BASE+215)
+#define V4L2_CID_MPEG_VIDEO_HEADER_MODE				(V4L2_CID_CODEC_BASE+216)
 enum v4l2_mpeg_video_header_mode {
 	V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE			= 0,
 	V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME	= 1,
 
 };
-#define V4L2_CID_MPEG_VIDEO_MAX_REF_PIC			(V4L2_CID_MPEG_BASE+217)
-#define V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE		(V4L2_CID_MPEG_BASE+218)
-#define V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES	(V4L2_CID_MPEG_BASE+219)
-#define V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB		(V4L2_CID_MPEG_BASE+220)
-#define V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE		(V4L2_CID_MPEG_BASE+221)
+#define V4L2_CID_MPEG_VIDEO_MAX_REF_PIC			(V4L2_CID_CODEC_BASE+217)
+#define V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE		(V4L2_CID_CODEC_BASE+218)
+#define V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES	(V4L2_CID_CODEC_BASE+219)
+#define V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB		(V4L2_CID_CODEC_BASE+220)
+#define V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE		(V4L2_CID_CODEC_BASE+221)
 enum v4l2_mpeg_video_multi_slice_mode {
 	V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE		= 0,
 	V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB		= 1,
@@ -413,24 +413,24 @@ enum v4l2_mpeg_video_multi_slice_mode {
 	V4L2_MPEG_VIDEO_MULTI_SICE_MODE_MAX_BYTES	= 2,
 #endif
 };
-#define V4L2_CID_MPEG_VIDEO_VBV_SIZE			(V4L2_CID_MPEG_BASE+222)
-#define V4L2_CID_MPEG_VIDEO_DEC_PTS			(V4L2_CID_MPEG_BASE+223)
-#define V4L2_CID_MPEG_VIDEO_DEC_FRAME			(V4L2_CID_MPEG_BASE+224)
-#define V4L2_CID_MPEG_VIDEO_VBV_DELAY			(V4L2_CID_MPEG_BASE+225)
-#define V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER		(V4L2_CID_MPEG_BASE+226)
-#define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
-#define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
-#define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
+#define V4L2_CID_MPEG_VIDEO_VBV_SIZE			(V4L2_CID_CODEC_BASE+222)
+#define V4L2_CID_MPEG_VIDEO_DEC_PTS			(V4L2_CID_CODEC_BASE+223)
+#define V4L2_CID_MPEG_VIDEO_DEC_FRAME			(V4L2_CID_CODEC_BASE+224)
+#define V4L2_CID_MPEG_VIDEO_VBV_DELAY			(V4L2_CID_CODEC_BASE+225)
+#define V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER		(V4L2_CID_CODEC_BASE+226)
+#define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+227)
+#define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
+#define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
-#define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
 enum v4l2_mpeg_video_mpeg2_level {
 	V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW		= 0,
 	V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN	= 1,
 	V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440	= 2,
 	V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH	= 3,
 };
-#define V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE		(V4L2_CID_MPEG_BASE+271)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE		(V4L2_CID_CODEC_BASE+271)
 enum v4l2_mpeg_video_mpeg2_profile {
 	V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE				= 0,
 	V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN				= 1,
@@ -441,28 +441,28 @@ enum v4l2_mpeg_video_mpeg2_profile {
 };
 
 /* CIDs for the FWHT codec as used by the vicodec driver. */
-#define V4L2_CID_FWHT_I_FRAME_QP             (V4L2_CID_MPEG_BASE + 290)
-#define V4L2_CID_FWHT_P_FRAME_QP             (V4L2_CID_MPEG_BASE + 291)
-
-#define V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP		(V4L2_CID_MPEG_BASE+300)
-#define V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP		(V4L2_CID_MPEG_BASE+301)
-#define V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP		(V4L2_CID_MPEG_BASE+302)
-#define V4L2_CID_MPEG_VIDEO_H263_MIN_QP			(V4L2_CID_MPEG_BASE+303)
-#define V4L2_CID_MPEG_VIDEO_H263_MAX_QP			(V4L2_CID_MPEG_BASE+304)
-#define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP		(V4L2_CID_MPEG_BASE+350)
-#define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP		(V4L2_CID_MPEG_BASE+351)
-#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP		(V4L2_CID_MPEG_BASE+352)
-#define V4L2_CID_MPEG_VIDEO_H264_MIN_QP			(V4L2_CID_MPEG_BASE+353)
-#define V4L2_CID_MPEG_VIDEO_H264_MAX_QP			(V4L2_CID_MPEG_BASE+354)
-#define V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM		(V4L2_CID_MPEG_BASE+355)
-#define V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE		(V4L2_CID_MPEG_BASE+356)
-#define V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE		(V4L2_CID_MPEG_BASE+357)
+#define V4L2_CID_FWHT_I_FRAME_QP             (V4L2_CID_CODEC_BASE + 290)
+#define V4L2_CID_FWHT_P_FRAME_QP             (V4L2_CID_CODEC_BASE + 291)
+
+#define V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP		(V4L2_CID_CODEC_BASE+300)
+#define V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP		(V4L2_CID_CODEC_BASE+301)
+#define V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP		(V4L2_CID_CODEC_BASE+302)
+#define V4L2_CID_MPEG_VIDEO_H263_MIN_QP			(V4L2_CID_CODEC_BASE+303)
+#define V4L2_CID_MPEG_VIDEO_H263_MAX_QP			(V4L2_CID_CODEC_BASE+304)
+#define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP		(V4L2_CID_CODEC_BASE+350)
+#define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP		(V4L2_CID_CODEC_BASE+351)
+#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP		(V4L2_CID_CODEC_BASE+352)
+#define V4L2_CID_MPEG_VIDEO_H264_MIN_QP			(V4L2_CID_CODEC_BASE+353)
+#define V4L2_CID_MPEG_VIDEO_H264_MAX_QP			(V4L2_CID_CODEC_BASE+354)
+#define V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM		(V4L2_CID_CODEC_BASE+355)
+#define V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE		(V4L2_CID_CODEC_BASE+356)
+#define V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE		(V4L2_CID_CODEC_BASE+357)
 enum v4l2_mpeg_video_h264_entropy_mode {
 	V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC	= 0,
 	V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC	= 1,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_I_PERIOD		(V4L2_CID_MPEG_BASE+358)
-#define V4L2_CID_MPEG_VIDEO_H264_LEVEL			(V4L2_CID_MPEG_BASE+359)
+#define V4L2_CID_MPEG_VIDEO_H264_I_PERIOD		(V4L2_CID_CODEC_BASE+358)
+#define V4L2_CID_MPEG_VIDEO_H264_LEVEL			(V4L2_CID_CODEC_BASE+359)
 enum v4l2_mpeg_video_h264_level {
 	V4L2_MPEG_VIDEO_H264_LEVEL_1_0	= 0,
 	V4L2_MPEG_VIDEO_H264_LEVEL_1B	= 1,
@@ -485,15 +485,15 @@ enum v4l2_mpeg_video_h264_level {
 	V4L2_MPEG_VIDEO_H264_LEVEL_6_1	= 18,
 	V4L2_MPEG_VIDEO_H264_LEVEL_6_2	= 19,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA	(V4L2_CID_MPEG_BASE+360)
-#define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA	(V4L2_CID_MPEG_BASE+361)
-#define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE	(V4L2_CID_MPEG_BASE+362)
+#define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA	(V4L2_CID_CODEC_BASE+360)
+#define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA	(V4L2_CID_CODEC_BASE+361)
+#define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE	(V4L2_CID_CODEC_BASE+362)
 enum v4l2_mpeg_video_h264_loop_filter_mode {
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED				= 0,
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED				= 1,
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY	= 2,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_PROFILE		(V4L2_CID_MPEG_BASE+363)
+#define V4L2_CID_MPEG_VIDEO_H264_PROFILE		(V4L2_CID_CODEC_BASE+363)
 enum v4l2_mpeg_video_h264_profile {
 	V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE			= 0,
 	V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE	= 1,
@@ -514,10 +514,10 @@ enum v4l2_mpeg_video_h264_profile {
 	V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH		= 16,
 	V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH		= 17,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT	(V4L2_CID_MPEG_BASE+364)
-#define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH	(V4L2_CID_MPEG_BASE+365)
-#define V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE		(V4L2_CID_MPEG_BASE+366)
-#define V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC		(V4L2_CID_MPEG_BASE+367)
+#define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT	(V4L2_CID_CODEC_BASE+364)
+#define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH	(V4L2_CID_CODEC_BASE+365)
+#define V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE		(V4L2_CID_CODEC_BASE+366)
+#define V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC		(V4L2_CID_CODEC_BASE+367)
 enum v4l2_mpeg_video_h264_vui_sar_idc {
 	V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED	= 0,
 	V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_1x1		= 1,
@@ -538,9 +538,9 @@ enum v4l2_mpeg_video_h264_vui_sar_idc {
 	V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_2x1		= 16,
 	V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED	= 17,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING		(V4L2_CID_MPEG_BASE+368)
-#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0		(V4L2_CID_MPEG_BASE+369)
-#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE	(V4L2_CID_MPEG_BASE+370)
+#define V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING		(V4L2_CID_CODEC_BASE+368)
+#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0		(V4L2_CID_CODEC_BASE+369)
+#define V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE	(V4L2_CID_CODEC_BASE+370)
 enum v4l2_mpeg_video_h264_sei_fp_arrangement_type {
 	V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_CHECKERBOARD	= 0,
 	V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_COLUMN		= 1,
@@ -549,8 +549,8 @@ enum v4l2_mpeg_video_h264_sei_fp_arrangement_type {
 	V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TOP_BOTTOM		= 4,
 	V4L2_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE_TEMPORAL		= 5,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_FMO			(V4L2_CID_MPEG_BASE+371)
-#define V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE		(V4L2_CID_MPEG_BASE+372)
+#define V4L2_CID_MPEG_VIDEO_H264_FMO			(V4L2_CID_CODEC_BASE+371)
+#define V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE		(V4L2_CID_CODEC_BASE+372)
 enum v4l2_mpeg_video_h264_fmo_map_type {
 	V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_INTERLEAVED_SLICES		= 0,
 	V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_SCATTERED_SLICES		= 1,
@@ -560,36 +560,36 @@ enum v4l2_mpeg_video_h264_fmo_map_type {
 	V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_WIPE_SCAN			= 5,
 	V4L2_MPEG_VIDEO_H264_FMO_MAP_TYPE_EXPLICIT			= 6,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP	(V4L2_CID_MPEG_BASE+373)
-#define V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION	(V4L2_CID_MPEG_BASE+374)
+#define V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP	(V4L2_CID_CODEC_BASE+373)
+#define V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION	(V4L2_CID_CODEC_BASE+374)
 enum v4l2_mpeg_video_h264_fmo_change_dir {
 	V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_RIGHT	= 0,
 	V4L2_MPEG_VIDEO_H264_FMO_CHANGE_DIR_LEFT	= 1,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE	(V4L2_CID_MPEG_BASE+375)
-#define V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH		(V4L2_CID_MPEG_BASE+376)
-#define V4L2_CID_MPEG_VIDEO_H264_ASO			(V4L2_CID_MPEG_BASE+377)
-#define V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER	(V4L2_CID_MPEG_BASE+378)
-#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING		(V4L2_CID_MPEG_BASE+379)
-#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE	(V4L2_CID_MPEG_BASE+380)
+#define V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE	(V4L2_CID_CODEC_BASE+375)
+#define V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH		(V4L2_CID_CODEC_BASE+376)
+#define V4L2_CID_MPEG_VIDEO_H264_ASO			(V4L2_CID_CODEC_BASE+377)
+#define V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER	(V4L2_CID_CODEC_BASE+378)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING		(V4L2_CID_CODEC_BASE+379)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE	(V4L2_CID_CODEC_BASE+380)
 enum v4l2_mpeg_video_h264_hierarchical_coding_type {
 	V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B	= 0,
 	V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P	= 1,
 };
-#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER	(V4L2_CID_MPEG_BASE+381)
-#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP	(V4L2_CID_MPEG_BASE+382)
-#define V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION	(V4L2_CID_MPEG_BASE+383)
-#define V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET		(V4L2_CID_MPEG_BASE+384)
-#define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+385)
-#define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+386)
-#define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+387)
-#define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+388)
-#define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_MPEG_BASE+400)
-#define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_MPEG_BASE+401)
-#define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_MPEG_BASE+402)
-#define V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP	(V4L2_CID_MPEG_BASE+403)
-#define V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP	(V4L2_CID_MPEG_BASE+404)
-#define V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL		(V4L2_CID_MPEG_BASE+405)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER	(V4L2_CID_CODEC_BASE+381)
+#define V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP	(V4L2_CID_CODEC_BASE+382)
+#define V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION	(V4L2_CID_CODEC_BASE+383)
+#define V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET		(V4L2_CID_CODEC_BASE+384)
+#define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP	(V4L2_CID_CODEC_BASE+385)
+#define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP	(V4L2_CID_CODEC_BASE+386)
+#define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP	(V4L2_CID_CODEC_BASE+387)
+#define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_CODEC_BASE+388)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_CODEC_BASE+400)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_CODEC_BASE+401)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_CODEC_BASE+402)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP	(V4L2_CID_CODEC_BASE+403)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP	(V4L2_CID_CODEC_BASE+404)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL		(V4L2_CID_CODEC_BASE+405)
 enum v4l2_mpeg_video_mpeg4_level {
 	V4L2_MPEG_VIDEO_MPEG4_LEVEL_0	= 0,
 	V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B	= 1,
@@ -600,7 +600,7 @@ enum v4l2_mpeg_video_mpeg4_level {
 	V4L2_MPEG_VIDEO_MPEG4_LEVEL_4	= 6,
 	V4L2_MPEG_VIDEO_MPEG4_LEVEL_5	= 7,
 };
-#define V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE	(V4L2_CID_MPEG_BASE+406)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE	(V4L2_CID_CODEC_BASE+406)
 enum v4l2_mpeg_video_mpeg4_profile {
 	V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE				= 0,
 	V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE			= 1,
@@ -608,40 +608,40 @@ enum v4l2_mpeg_video_mpeg4_profile {
 	V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE			= 3,
 	V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY	= 4,
 };
-#define V4L2_CID_MPEG_VIDEO_MPEG4_QPEL		(V4L2_CID_MPEG_BASE+407)
+#define V4L2_CID_MPEG_VIDEO_MPEG4_QPEL		(V4L2_CID_CODEC_BASE+407)
 
 /*  Control IDs for VP8 streams
  *  Although VP8 is not part of MPEG we add these controls to the MPEG class
  *  as that class is already handling other video compression standards
  */
-#define V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS		(V4L2_CID_MPEG_BASE+500)
+#define V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS		(V4L2_CID_CODEC_BASE+500)
 enum v4l2_vp8_num_partitions {
 	V4L2_CID_MPEG_VIDEO_VPX_1_PARTITION	= 0,
 	V4L2_CID_MPEG_VIDEO_VPX_2_PARTITIONS	= 1,
 	V4L2_CID_MPEG_VIDEO_VPX_4_PARTITIONS	= 2,
 	V4L2_CID_MPEG_VIDEO_VPX_8_PARTITIONS	= 3,
 };
-#define V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4		(V4L2_CID_MPEG_BASE+501)
-#define V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES		(V4L2_CID_MPEG_BASE+502)
+#define V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4		(V4L2_CID_CODEC_BASE+501)
+#define V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES		(V4L2_CID_CODEC_BASE+502)
 enum v4l2_vp8_num_ref_frames {
 	V4L2_CID_MPEG_VIDEO_VPX_1_REF_FRAME	= 0,
 	V4L2_CID_MPEG_VIDEO_VPX_2_REF_FRAME	= 1,
 	V4L2_CID_MPEG_VIDEO_VPX_3_REF_FRAME	= 2,
 };
-#define V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL		(V4L2_CID_MPEG_BASE+503)
-#define V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS	(V4L2_CID_MPEG_BASE+504)
-#define V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD	(V4L2_CID_MPEG_BASE+505)
-#define V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL	(V4L2_CID_MPEG_BASE+506)
+#define V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL		(V4L2_CID_CODEC_BASE+503)
+#define V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS	(V4L2_CID_CODEC_BASE+504)
+#define V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD	(V4L2_CID_CODEC_BASE+505)
+#define V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL	(V4L2_CID_CODEC_BASE+506)
 enum v4l2_vp8_golden_frame_sel {
 	V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_PREV		= 0,
 	V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_USE_REF_PERIOD	= 1,
 };
-#define V4L2_CID_MPEG_VIDEO_VPX_MIN_QP			(V4L2_CID_MPEG_BASE+507)
-#define V4L2_CID_MPEG_VIDEO_VPX_MAX_QP			(V4L2_CID_MPEG_BASE+508)
-#define V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP		(V4L2_CID_MPEG_BASE+509)
-#define V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP		(V4L2_CID_MPEG_BASE+510)
+#define V4L2_CID_MPEG_VIDEO_VPX_MIN_QP			(V4L2_CID_CODEC_BASE+507)
+#define V4L2_CID_MPEG_VIDEO_VPX_MAX_QP			(V4L2_CID_CODEC_BASE+508)
+#define V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP		(V4L2_CID_CODEC_BASE+509)
+#define V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP		(V4L2_CID_CODEC_BASE+510)
 
-#define V4L2_CID_MPEG_VIDEO_VP8_PROFILE			(V4L2_CID_MPEG_BASE+511)
+#define V4L2_CID_MPEG_VIDEO_VP8_PROFILE			(V4L2_CID_CODEC_BASE+511)
 enum v4l2_mpeg_video_vp8_profile {
 	V4L2_MPEG_VIDEO_VP8_PROFILE_0				= 0,
 	V4L2_MPEG_VIDEO_VP8_PROFILE_1				= 1,
@@ -650,14 +650,14 @@ enum v4l2_mpeg_video_vp8_profile {
 };
 /* Deprecated alias for compatibility reasons. */
 #define V4L2_CID_MPEG_VIDEO_VPX_PROFILE	V4L2_CID_MPEG_VIDEO_VP8_PROFILE
-#define V4L2_CID_MPEG_VIDEO_VP9_PROFILE			(V4L2_CID_MPEG_BASE+512)
+#define V4L2_CID_MPEG_VIDEO_VP9_PROFILE			(V4L2_CID_CODEC_BASE+512)
 enum v4l2_mpeg_video_vp9_profile {
 	V4L2_MPEG_VIDEO_VP9_PROFILE_0				= 0,
 	V4L2_MPEG_VIDEO_VP9_PROFILE_1				= 1,
 	V4L2_MPEG_VIDEO_VP9_PROFILE_2				= 2,
 	V4L2_MPEG_VIDEO_VP9_PROFILE_3				= 3,
 };
-#define V4L2_CID_MPEG_VIDEO_VP9_LEVEL			(V4L2_CID_MPEG_BASE+513)
+#define V4L2_CID_MPEG_VIDEO_VP9_LEVEL			(V4L2_CID_CODEC_BASE+513)
 enum v4l2_mpeg_video_vp9_level {
 	V4L2_MPEG_VIDEO_VP9_LEVEL_1_0	= 0,
 	V4L2_MPEG_VIDEO_VP9_LEVEL_1_1	= 1,
@@ -677,32 +677,32 @@ enum v4l2_mpeg_video_vp9_level {
 
 /* CIDs for HEVC encoding. */
 
-#define V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP		(V4L2_CID_MPEG_BASE + 600)
-#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP		(V4L2_CID_MPEG_BASE + 601)
-#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP	(V4L2_CID_MPEG_BASE + 602)
-#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP	(V4L2_CID_MPEG_BASE + 603)
-#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP	(V4L2_CID_MPEG_BASE + 604)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP	(V4L2_CID_MPEG_BASE + 605)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE (V4L2_CID_MPEG_BASE + 606)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP		(V4L2_CID_CODEC_BASE + 600)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP		(V4L2_CID_CODEC_BASE + 601)
+#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP	(V4L2_CID_CODEC_BASE + 602)
+#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP	(V4L2_CID_CODEC_BASE + 603)
+#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP	(V4L2_CID_CODEC_BASE + 604)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP	(V4L2_CID_CODEC_BASE + 605)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE (V4L2_CID_CODEC_BASE + 606)
 enum v4l2_mpeg_video_hevc_hier_coding_type {
 	V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B	= 0,
 	V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P	= 1,
 };
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER	(V4L2_CID_MPEG_BASE + 607)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP	(V4L2_CID_MPEG_BASE + 608)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP	(V4L2_CID_MPEG_BASE + 609)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP	(V4L2_CID_MPEG_BASE + 610)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP	(V4L2_CID_MPEG_BASE + 611)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP	(V4L2_CID_MPEG_BASE + 612)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP	(V4L2_CID_MPEG_BASE + 613)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP	(V4L2_CID_MPEG_BASE + 614)
-#define V4L2_CID_MPEG_VIDEO_HEVC_PROFILE	(V4L2_CID_MPEG_BASE + 615)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER	(V4L2_CID_CODEC_BASE + 607)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP	(V4L2_CID_CODEC_BASE + 608)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP	(V4L2_CID_CODEC_BASE + 609)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP	(V4L2_CID_CODEC_BASE + 610)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP	(V4L2_CID_CODEC_BASE + 611)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP	(V4L2_CID_CODEC_BASE + 612)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP	(V4L2_CID_CODEC_BASE + 613)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP	(V4L2_CID_CODEC_BASE + 614)
+#define V4L2_CID_MPEG_VIDEO_HEVC_PROFILE	(V4L2_CID_CODEC_BASE + 615)
 enum v4l2_mpeg_video_hevc_profile {
 	V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN = 0,
 	V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE = 1,
 	V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 = 2,
 };
-#define V4L2_CID_MPEG_VIDEO_HEVC_LEVEL		(V4L2_CID_MPEG_BASE + 616)
+#define V4L2_CID_MPEG_VIDEO_HEVC_LEVEL		(V4L2_CID_CODEC_BASE + 616)
 enum v4l2_mpeg_video_hevc_level {
 	V4L2_MPEG_VIDEO_HEVC_LEVEL_1	= 0,
 	V4L2_MPEG_VIDEO_HEVC_LEVEL_2	= 1,
@@ -718,56 +718,56 @@ enum v4l2_mpeg_video_hevc_level {
 	V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1	= 11,
 	V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2	= 12,
 };
-#define V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION	(V4L2_CID_MPEG_BASE + 617)
-#define V4L2_CID_MPEG_VIDEO_HEVC_TIER			(V4L2_CID_MPEG_BASE + 618)
+#define V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION	(V4L2_CID_CODEC_BASE + 617)
+#define V4L2_CID_MPEG_VIDEO_HEVC_TIER			(V4L2_CID_CODEC_BASE + 618)
 enum v4l2_mpeg_video_hevc_tier {
 	V4L2_MPEG_VIDEO_HEVC_TIER_MAIN = 0,
 	V4L2_MPEG_VIDEO_HEVC_TIER_HIGH = 1,
 };
-#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH	(V4L2_CID_MPEG_BASE + 619)
-#define V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE	(V4L2_CID_MPEG_BASE + 620)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH	(V4L2_CID_CODEC_BASE + 619)
+#define V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE	(V4L2_CID_CODEC_BASE + 620)
 enum v4l2_cid_mpeg_video_hevc_loop_filter_mode {
 	V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED			 = 0,
 	V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED			 = 1,
 	V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY = 2,
 };
-#define V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2	(V4L2_CID_MPEG_BASE + 621)
-#define V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2	(V4L2_CID_MPEG_BASE + 622)
-#define V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE		(V4L2_CID_MPEG_BASE + 623)
+#define V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2	(V4L2_CID_CODEC_BASE + 621)
+#define V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2	(V4L2_CID_CODEC_BASE + 622)
+#define V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE		(V4L2_CID_CODEC_BASE + 623)
 enum v4l2_cid_mpeg_video_hevc_refresh_type {
 	V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE		= 0,
 	V4L2_MPEG_VIDEO_HEVC_REFRESH_CRA		= 1,
 	V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR		= 2,
 };
-#define V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD		(V4L2_CID_MPEG_BASE + 624)
-#define V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU		(V4L2_CID_MPEG_BASE + 625)
-#define V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED	(V4L2_CID_MPEG_BASE + 626)
-#define V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT		(V4L2_CID_MPEG_BASE + 627)
-#define V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB		(V4L2_CID_MPEG_BASE + 628)
-#define V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID		(V4L2_CID_MPEG_BASE + 629)
-#define V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING	(V4L2_CID_MPEG_BASE + 630)
-#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1	(V4L2_CID_MPEG_BASE + 631)
-#define V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT		(V4L2_CID_MPEG_BASE + 632)
-#define V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION		(V4L2_CID_MPEG_BASE + 633)
-#define V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE	(V4L2_CID_MPEG_BASE + 634)
-#define V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD	(V4L2_CID_MPEG_BASE + 635)
+#define V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD		(V4L2_CID_CODEC_BASE + 624)
+#define V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU		(V4L2_CID_CODEC_BASE + 625)
+#define V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED	(V4L2_CID_CODEC_BASE + 626)
+#define V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT		(V4L2_CID_CODEC_BASE + 627)
+#define V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB		(V4L2_CID_CODEC_BASE + 628)
+#define V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID		(V4L2_CID_CODEC_BASE + 629)
+#define V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING	(V4L2_CID_CODEC_BASE + 630)
+#define V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1	(V4L2_CID_CODEC_BASE + 631)
+#define V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT		(V4L2_CID_CODEC_BASE + 632)
+#define V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION		(V4L2_CID_CODEC_BASE + 633)
+#define V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE	(V4L2_CID_CODEC_BASE + 634)
+#define V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD	(V4L2_CID_CODEC_BASE + 635)
 enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 	V4L2_MPEG_VIDEO_HEVC_SIZE_0		= 0,
 	V4L2_MPEG_VIDEO_HEVC_SIZE_1		= 1,
 	V4L2_MPEG_VIDEO_HEVC_SIZE_2		= 2,
 	V4L2_MPEG_VIDEO_HEVC_SIZE_4		= 3,
 };
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR	(V4L2_CID_MPEG_BASE + 636)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR	(V4L2_CID_MPEG_BASE + 637)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR	(V4L2_CID_MPEG_BASE + 638)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR	(V4L2_CID_MPEG_BASE + 639)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR	(V4L2_CID_MPEG_BASE + 640)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR	(V4L2_CID_MPEG_BASE + 641)
-#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
-#define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
-#define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
-#define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
-#define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_MPEG_BASE + 646)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR	(V4L2_CID_CODEC_BASE + 636)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR	(V4L2_CID_CODEC_BASE + 637)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR	(V4L2_CID_CODEC_BASE + 638)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR	(V4L2_CID_CODEC_BASE + 639)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR	(V4L2_CID_CODEC_BASE + 640)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR	(V4L2_CID_CODEC_BASE + 641)
+#define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_CODEC_BASE + 642)
+#define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_CODEC_BASE + 643)
+#define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_CODEC_BASE + 644)
+#define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_CODEC_BASE + 645)
+#define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_CODEC_BASE + 646)
 enum v4l2_mpeg_video_frame_skip_mode {
 	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
 	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
@@ -775,14 +775,14 @@ enum v4l2_mpeg_video_frame_skip_mode {
 };
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
-#define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-#define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_MPEG_CX2341X_BASE+0)
+#define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
 enum v4l2_mpeg_cx2341x_video_spatial_filter_mode {
 	V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_MANUAL = 0,
 	V4L2_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE_AUTO   = 1,
 };
-#define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER		(V4L2_CID_MPEG_CX2341X_BASE+1)
-#define V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE	(V4L2_CID_MPEG_CX2341X_BASE+2)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER		(V4L2_CID_CODEC_CX2341X_BASE+1)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE	(V4L2_CID_CODEC_CX2341X_BASE+2)
 enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type {
 	V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_OFF                  = 0,
 	V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_1D_HOR               = 1,
@@ -790,18 +790,18 @@ enum v4l2_mpeg_cx2341x_video_luma_spatial_filter_type {
 	V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_HV_SEPARABLE      = 3,
 	V4L2_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE_2D_SYM_NON_SEPARABLE = 4,
 };
-#define V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE	(V4L2_CID_MPEG_CX2341X_BASE+3)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE	(V4L2_CID_CODEC_CX2341X_BASE+3)
 enum v4l2_mpeg_cx2341x_video_chroma_spatial_filter_type {
 	V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_OFF    = 0,
 	V4L2_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE_1D_HOR = 1,
 };
-#define V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE	(V4L2_CID_MPEG_CX2341X_BASE+4)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE	(V4L2_CID_CODEC_CX2341X_BASE+4)
 enum v4l2_mpeg_cx2341x_video_temporal_filter_mode {
 	V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_MANUAL = 0,
 	V4L2_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE_AUTO   = 1,
 };
-#define V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER		(V4L2_CID_MPEG_CX2341X_BASE+5)
-#define V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE		(V4L2_CID_MPEG_CX2341X_BASE+6)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER		(V4L2_CID_CODEC_CX2341X_BASE+5)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE		(V4L2_CID_CODEC_CX2341X_BASE+6)
 enum v4l2_mpeg_cx2341x_video_median_filter_type {
 	V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_OFF      = 0,
 	V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR      = 1,
@@ -809,38 +809,38 @@ enum v4l2_mpeg_cx2341x_video_median_filter_type {
 	V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_HOR_VERT = 3,
 	V4L2_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE_DIAG     = 4,
 };
-#define V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM	(V4L2_CID_MPEG_CX2341X_BASE+7)
-#define V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP	(V4L2_CID_MPEG_CX2341X_BASE+8)
-#define V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM	(V4L2_CID_MPEG_CX2341X_BASE+9)
-#define V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP	(V4L2_CID_MPEG_CX2341X_BASE+10)
-#define V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS		(V4L2_CID_MPEG_CX2341X_BASE+11)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM	(V4L2_CID_CODEC_CX2341X_BASE+7)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP	(V4L2_CID_CODEC_CX2341X_BASE+8)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM	(V4L2_CID_CODEC_CX2341X_BASE+9)
+#define V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP	(V4L2_CID_CODEC_CX2341X_BASE+10)
+#define V4L2_CID_MPEG_CX2341X_STREAM_INSERT_NAV_PACKETS		(V4L2_CID_CODEC_CX2341X_BASE+11)
 
 /*  MPEG-class control IDs specific to the Samsung MFC 5.1 driver as defined by V4L2 */
-#define V4L2_CID_MPEG_MFC51_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1100)
+#define V4L2_CID_CODEC_MFC51_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1100)
 
-#define V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY		(V4L2_CID_MPEG_MFC51_BASE+0)
-#define V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE	(V4L2_CID_MPEG_MFC51_BASE+1)
-#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE			(V4L2_CID_MPEG_MFC51_BASE+2)
+#define V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY		(V4L2_CID_CODEC_MFC51_BASE+0)
+#define V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE	(V4L2_CID_CODEC_MFC51_BASE+1)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE			(V4L2_CID_CODEC_MFC51_BASE+2)
 enum v4l2_mpeg_mfc51_video_frame_skip_mode {
 	V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED		= 0,
 	V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
 	V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT		= 2,
 };
-#define V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE			(V4L2_CID_MPEG_MFC51_BASE+3)
+#define V4L2_CID_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE			(V4L2_CID_CODEC_MFC51_BASE+3)
 enum v4l2_mpeg_mfc51_video_force_frame_type {
 	V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_DISABLED		= 0,
 	V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_I_FRAME		= 1,
 	V4L2_MPEG_MFC51_VIDEO_FORCE_FRAME_TYPE_NOT_CODED	= 2,
 };
-#define V4L2_CID_MPEG_MFC51_VIDEO_PADDING				(V4L2_CID_MPEG_MFC51_BASE+4)
-#define V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV				(V4L2_CID_MPEG_MFC51_BASE+5)
-#define V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT			(V4L2_CID_MPEG_MFC51_BASE+6)
-#define V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF			(V4L2_CID_MPEG_MFC51_BASE+7)
-#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY		(V4L2_CID_MPEG_MFC51_BASE+50)
-#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK			(V4L2_CID_MPEG_MFC51_BASE+51)
-#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH		(V4L2_CID_MPEG_MFC51_BASE+52)
-#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC		(V4L2_CID_MPEG_MFC51_BASE+53)
-#define V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P		(V4L2_CID_MPEG_MFC51_BASE+54)
+#define V4L2_CID_MPEG_MFC51_VIDEO_PADDING				(V4L2_CID_CODEC_MFC51_BASE+4)
+#define V4L2_CID_MPEG_MFC51_VIDEO_PADDING_YUV				(V4L2_CID_CODEC_MFC51_BASE+5)
+#define V4L2_CID_MPEG_MFC51_VIDEO_RC_FIXED_TARGET_BIT			(V4L2_CID_CODEC_MFC51_BASE+6)
+#define V4L2_CID_MPEG_MFC51_VIDEO_RC_REACTION_COEFF			(V4L2_CID_CODEC_MFC51_BASE+7)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_ACTIVITY		(V4L2_CID_CODEC_MFC51_BASE+50)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_DARK			(V4L2_CID_CODEC_MFC51_BASE+51)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_SMOOTH		(V4L2_CID_CODEC_MFC51_BASE+52)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H264_ADAPTIVE_RC_STATIC		(V4L2_CID_CODEC_MFC51_BASE+53)
+#define V4L2_CID_MPEG_MFC51_VIDEO_H264_NUM_REF_PIC_FOR_P		(V4L2_CID_CODEC_MFC51_BASE+54)
 
 /*  Camera class control IDs */
 
@@ -1177,4 +1177,13 @@ enum v4l2_detect_md_mode {
 #define V4L2_CID_DETECT_MD_THRESHOLD_GRID	(V4L2_CID_DETECT_CLASS_BASE + 3)
 #define V4L2_CID_DETECT_MD_REGION_GRID		(V4L2_CID_DETECT_CLASS_BASE + 4)
 
+/* MPEG-compression definitions kept for backwards compatibility */
+#ifndef __KERNEL__
+#define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
+#define V4L2_CID_MPEG_CLASS             (V4L2_CTRL_CLASS_MPEG | 1)
+#define V4L2_CID_MPEG_BASE              (V4L2_CTRL_CLASS_MPEG | 0x900)
+#define V4L2_CID_MPEG_CX2341X_BASE	(V4L2_CTRL_CLASS_MPEG | 0x1000)
+#define V4L2_CID_MPEG_MFC51_BASE	(V4L2_CTRL_CLASS_MPEG | 0x1100)
+#endif
+
 #endif
-- 
2.27.0

