Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A36C11E78F
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfLMQEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:04:47 -0500
Received: from mailoutvs54.siol.net ([185.57.226.245]:56576 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728215AbfLMQEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:04:46 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 63D6052454D;
        Fri, 13 Dec 2019 17:04:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Y-bJ71l0u6-E; Fri, 13 Dec 2019 17:04:42 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id CE91452454E;
        Fri, 13 Dec 2019 17:04:42 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 829F6524558;
        Fri, 13 Dec 2019 17:04:40 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] media: cedrus: hevc: Add support for scaling matrix
Date:   Fri, 13 Dec 2019 17:04:26 +0100
Message-Id: <20191213160428.54303-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213160428.54303-1-jernej.skrabec@siol.net>
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC frames may use scaling list feature. Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 ++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 70 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +
 5 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
index c6ddd46eff82..bf68bc6b20c8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -116,6 +116,13 @@ static const struct cedrus_control cedrus_controls[]=
 =3D {
 		.codec		=3D CEDRUS_CODEC_H265,
 		.required	=3D true,
 	},
+	{
+		.cfg =3D {
+			.id	=3D V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
+		},
+		.codec		=3D CEDRUS_CODEC_H265,
+		.required	=3D true,
+	},
 	{
 		.cfg =3D {
 			.id	=3D V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index 96765555ab8a..d945f4f0ff2d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -73,6 +73,7 @@ struct cedrus_h265_run {
 	const struct v4l2_ctrl_hevc_sps			*sps;
 	const struct v4l2_ctrl_hevc_pps			*pps;
 	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
+	const struct v4l2_ctrl_hevc_scaling_matrix	*scaling_matrix;
 };
=20
 struct cedrus_run {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_dec.c
index 4a2fc33a1d79..327ed6c264dc 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -66,6 +66,8 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
 		run.h265.slice_params =3D cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
+		run.h265.scaling_matrix =3D cedrus_find_control_data(ctx,
+			V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
 		break;
=20
 	default:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
index 6945dc74e1d7..888bfd5ca224 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -220,6 +220,69 @@ static void cedrus_h265_pred_weight_write(struct ced=
rus_dev *dev,
 	}
 }
=20
+static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
+					   struct cedrus_run *run)
+{
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
+	struct cedrus_dev *dev =3D ctx->dev;
+	u32 i, j, k, val;
+
+	scaling =3D run->h265.scaling_matrix;
+
+	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF0,
+		     (scaling->scaling_list_dc_coef_32x32[1] << 24) |
+		     (scaling->scaling_list_dc_coef_32x32[0] << 16) |
+		     (scaling->scaling_list_dc_coef_16x16[1] << 8) |
+		     (scaling->scaling_list_dc_coef_16x16[0] << 0));
+
+	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF1,
+		     (scaling->scaling_list_dc_coef_16x16[5] << 24) |
+		     (scaling->scaling_list_dc_coef_16x16[4] << 16) |
+		     (scaling->scaling_list_dc_coef_16x16[3] << 8) |
+		     (scaling->scaling_list_dc_coef_16x16[2] << 0));
+
+	cedrus_h265_sram_write_offset(dev, VE_DEC_H265_SRAM_OFFSET_SCALING_LIST=
S);
+
+	for (i =3D 0; i < 6; i++)
+		for (j =3D 0; j < 8; j++)
+			for (k =3D 0; k < 8; k +=3D 4) {
+				val =3D ((u32)scaling->scaling_list_8x8[i][j + (k + 3) * 8] << 24) |
+				      ((u32)scaling->scaling_list_8x8[i][j + (k + 2) * 8] << 16) |
+				      ((u32)scaling->scaling_list_8x8[i][j + (k + 1) * 8] << 8) |
+				      scaling->scaling_list_8x8[i][j + k * 8];
+				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+			}
+
+	for (i =3D 0; i < 2; i++)
+		for (j =3D 0; j < 8; j++)
+			for (k =3D 0; k < 8; k +=3D 4) {
+				val =3D ((u32)scaling->scaling_list_32x32[i][j + (k + 3) * 8] << 24)=
 |
+				      ((u32)scaling->scaling_list_32x32[i][j + (k + 2) * 8] << 16) |
+				      ((u32)scaling->scaling_list_32x32[i][j + (k + 1) * 8] << 8) |
+				      scaling->scaling_list_32x32[i][j + k * 8];
+				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+			}
+
+	for (i =3D 0; i < 6; i++)
+		for (j =3D 0; j < 8; j++)
+			for (k =3D 0; k < 8; k +=3D 4) {
+				val =3D ((u32)scaling->scaling_list_16x16[i][j + (k + 3) * 8] << 24)=
 |
+				      ((u32)scaling->scaling_list_16x16[i][j + (k + 2) * 8] << 16) |
+				      ((u32)scaling->scaling_list_16x16[i][j + (k + 1) * 8] << 8) |
+				      scaling->scaling_list_16x16[i][j + k * 8];
+				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+			}
+
+	for (i =3D 0; i < 6; i++)
+		for (j =3D 0; j < 4; j++) {
+			val =3D ((u32)scaling->scaling_list_4x4[i][j + 12] << 24) |
+			      ((u32)scaling->scaling_list_4x4[i][j + 8] << 16) |
+			      ((u32)scaling->scaling_list_4x4[i][j + 4] << 8) |
+			      scaling->scaling_list_4x4[i][j];
+			cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+		}
+}
+
 static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 			      struct cedrus_run *run)
 {
@@ -499,7 +562,12 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx=
,
=20
 	/* Scaling list. */
=20
-	reg =3D VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
+	if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED) {
+		cedrus_h265_write_scaling_list(ctx, run);
+		reg =3D VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED;
+	} else {
+		reg =3D VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
+	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
=20
 	/* Neightbor information address. */
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
index 7beb03d3bb39..0d9449fe2b28 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -492,6 +492,8 @@
 #define VE_DEC_H265_ENTRY_POINT_OFFSET_ADDR	(VE_ENGINE_DEC_H265 + 0x64)
 #define VE_DEC_H265_TILE_START_CTB		(VE_ENGINE_DEC_H265 + 0x68)
 #define VE_DEC_H265_TILE_END_CTB		(VE_ENGINE_DEC_H265 + 0x6c)
+#define VE_DEC_H265_SCALING_LIST_DC_COEF0	(VE_ENGINE_DEC_H265 + 0x78)
+#define VE_DEC_H265_SCALING_LIST_DC_COEF1	(VE_ENGINE_DEC_H265 + 0x7c)
=20
 #define VE_DEC_H265_LOW_ADDR			(VE_ENGINE_DEC_H265 + 0x80)
=20
--=20
2.24.0

