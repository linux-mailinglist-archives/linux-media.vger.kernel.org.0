Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78635E5E43
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 19:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfJZRrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 13:47:19 -0400
Received: from mailoutvs13.siol.net ([185.57.226.204]:35615 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726326AbfJZRrT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 13:47:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 0B5F452378C;
        Sat, 26 Oct 2019 19:47:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id js9lqMMlP81c; Sat, 26 Oct 2019 19:47:16 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 8C04B520606;
        Sat, 26 Oct 2019 19:47:16 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id E903F52378C;
        Sat, 26 Oct 2019 19:47:13 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 1/4] media: uapi: hevc: Add scaling matrix control
Date:   Sat, 26 Oct 2019 19:47:00 +0200
Message-Id: <20191026174703.1120023-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191026174703.1120023-1-jernej.skrabec@siol.net>
References: <20191026174703.1120023-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC has a scaling matrix concept. Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 41 +++++++++++++++++++
 .../media/uapi/v4l/pixfmt-compressed.rst      |  1 +
 drivers/media/v4l2-core/v4l2-ctrls.c          | 10 +++++
 include/media/hevc-ctrls.h                    | 11 +++++
 4 files changed, 63 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documenta=
tion/media/uapi/v4l/ext-ctrls-codec.rst
index a1209f68c5e8..382e85e16444 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -4176,6 +4176,47 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - ``padding[6]``
       - Applications and drivers must set this to zero.
=20
+``V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX (struct)``
+    Specifies the scaling matrix (as extracted from the bitstream) for
+    the associated HEVC slice data. The bitstream parameters are
+    defined according to :ref:`hevc`, section 7.4.5 "Scaling list
+    data semantics". For further documentation, refer to the above
+    specification, unless there is an explicit comment stating
+    otherwise.
+
+    .. note::
+
+       This compound control is not yet part of the public kernel API an=
d
+       it is expected to change.
+
+.. c:type:: v4l2_ctrl_hevc_scaling_matrix
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
 ``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based an=
d
     frame-based decoding but new modes might be added later on.
diff --git a/Documentation/media/uapi/v4l/pixfmt-compressed.rst b/Documen=
tation/media/uapi/v4l/pixfmt-compressed.rst
index 561bda112809..3aabc322daa4 100644
--- a/Documentation/media/uapi/v4l/pixfmt-compressed.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-compressed.rst
@@ -207,6 +207,7 @@ Compressed Formats
         * ``V4L2_CID_MPEG_VIDEO_HEVC_SPS``
         * ``V4L2_CID_MPEG_VIDEO_HEVC_PPS``
         * ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS``
+        * ``V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX``
 	See the :ref:`associated Codec Control IDs <v4l2-mpeg-hevc>`.
 	Buffers associated with this pixel format must contain the appropriate
 	number of macroblocks to decode a full corresponding frame.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
index b4caf2d4d076..2803165cbc6a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -975,6 +975,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Se=
t";
 	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set=
";
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Paramet=
ers";
+	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:		return "HEVC Scaling Mat=
rix";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
=20
@@ -1407,6 +1408,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
 		*type =3D V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX:
+		*type =3D V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX;
+		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
 		*type =3D V4L2_CTRL_TYPE_AREA;
 		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
@@ -1856,6 +1860,9 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
 		zero_padding(*p_hevc_slice_params);
 		break;
=20
+	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
+		break;
+
 	case V4L2_CTRL_TYPE_AREA:
 		area =3D p;
 		if (!area->width || !area->height)
@@ -2545,6 +2552,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_=
ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		elem_size =3D sizeof(struct v4l2_ctrl_hevc_slice_params);
 		break;
+	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
+		elem_size =3D sizeof(struct v4l2_ctrl_hevc_scaling_matrix);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size =3D sizeof(struct v4l2_area);
 		break;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 1009cf0891cc..1592e52c3614 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -19,6 +19,7 @@
 #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_MPEG_BASE + 1008)
 #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_MPEG_BASE + 1009)
 #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_MPEG_BASE + 1010=
)
+#define V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX	(V4L2_CID_MPEG_BASE + 10=
11)
 #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_MPEG_BASE + 1015)
 #define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_MPEG_BASE + 1016)
=20
@@ -26,6 +27,7 @@
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
 #define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
 #define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
+#define V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX 0x0123
=20
 enum v4l2_mpeg_video_hevc_decode_mode {
 	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
@@ -209,4 +211,13 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u64	flags;
 };
=20
+struct v4l2_ctrl_hevc_scaling_matrix {
+	__u8	scaling_list_4x4[6][16];
+	__u8	scaling_list_8x8[6][64];
+	__u8	scaling_list_16x16[6][64];
+	__u8	scaling_list_32x32[2][64];
+	__u8	scaling_list_dc_coef_16x16[6];
+	__u8	scaling_list_dc_coef_32x32[2];
+};
+
 #endif
--=20
2.23.0

