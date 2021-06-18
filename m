Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9ED3ACBEA
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 15:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbhFRNR7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 09:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhFRNR4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 09:17:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DF4C061574;
        Fri, 18 Jun 2021 06:15:47 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:141f:c87a:873e:7b6f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EE6C21F448D6;
        Fri, 18 Jun 2021 14:15:44 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 7/8] media: hevc: Add scaling matrix control
Date:   Fri, 18 Jun 2021 15:15:25 +0200
Message-Id: <20210618131526.566762-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC scaling lists are used for the scaling process for transform
coefficients.
V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED has to set when they are
encoded in the bitstream.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
Note: V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED is not change by this
patch. There is a thread about the naming/usage of this flag here:
https://lore.kernel.org/linux-arm-kernel/20210610154442.806107-8-benjamin.gaignard@collabora.com/
but that doesn't concern the scaling matrix control by itself.

version 2:
 - Fix structure name in ext-ctrls-codec.rst

 .../media/v4l/ext-ctrls-codec.rst             | 45 +++++++++++++++++++
 .../media/v4l/vidioc-queryctrl.rst            |  6 +++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  6 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++
 include/media/hevc-ctrls.h                    | 11 +++++
 5 files changed, 72 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 8c6e2a11ed95..d4f40bb85263 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3068,6 +3068,51 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 
     \normalsize
 
+``V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX (struct)``
+    Specifies the HEVC scaling matrix parameters used for the scaling process
+    for transform coefficients.
+    These matrix and parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.5 "Scaling list data semantics" of
+    the specification.
+
+.. c:type:: v4l2_ctrl_hevc_scaling_matrix
+
+.. raw:: latex
+
+    \scriptsize
+
+.. tabularcolumns:: |p{5.4cm}|p{6.8cm}|p{5.1cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_scaling_matrix
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``scaling_list_4x4[6][16]``
+      -
+    * - __u8
+      - ``scaling_list_8x8[6][64]``
+      -
+    * - __u8
+      - ``scaling_list_16x16[6][64]``
+      -
+    * - __u8
+      - ``scaling_list_32x32[2][64]``
+      -
+    * - __u8
+      - ``scaling_list_dc_coef_16x16[6]``
+      -
+    * - __u8
+      - ``scaling_list_dc_coef_32x32[2]``
+      -
+
+.. raw:: latex
+
+    \normalsize
+
 .. c:type:: v4l2_hevc_dpb_entry
 
 .. raw:: latex
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index f9ecf6276129..2f491c17dd5d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -495,6 +495,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_hevc_slice_params`, containing HEVC
 	slice parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_scaling_matrix`, containing HEVC
+	scaling matrix for stateless video decoders.
     * - ``V4L2_CTRL_TYPE_VP8_FRAME``
       - n/a
       - n/a
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c4b5082849b6..70adfc1b9c81 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -687,6 +687,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 		break;
 
+	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
+		break;
+
 	case V4L2_CTRL_TYPE_AREA:
 		area = p;
 		if (!area->width || !area->height)
@@ -1240,6 +1243,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
 		break;
+	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_scaling_matrix);
+		break;
 	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_hevc_decode_params);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index b6344bbf1e00..cb29c2a7fabe 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -996,6 +996,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
+	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:		return "HEVC Scaling Matrix";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
@@ -1488,6 +1489,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:
+		*type = V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX;
+		break;
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
 		break;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 53c0038c792b..0e5c4a2eecff 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -19,6 +19,7 @@
 #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
 #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
 #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
+#define V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX	(V4L2_CID_CODEC_BASE + 1011)
 #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 1012)
 #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
 #define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
@@ -27,6 +28,7 @@
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
 #define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
 #define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
+#define V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX 0x0123
 #define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
 
 enum v4l2_mpeg_video_hevc_decode_mode {
@@ -224,6 +226,15 @@ struct v4l2_ctrl_hevc_decode_params {
 	__u64	flags;
 };
 
+struct v4l2_ctrl_hevc_scaling_matrix {
+	__u8	scaling_list_4x4[6][16];
+	__u8	scaling_list_8x8[6][64];
+	__u8	scaling_list_16x16[6][64];
+	__u8	scaling_list_32x32[2][64];
+	__u8	scaling_list_dc_coef_16x16[6];
+	__u8	scaling_list_dc_coef_32x32[2];
+};
+
 /*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */
 #define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
 /*
-- 
2.25.1

