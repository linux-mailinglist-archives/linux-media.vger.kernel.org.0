Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660D339CDB6
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 08:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhFFGxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 02:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhFFGxD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 02:53:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD7FC061766;
        Sat,  5 Jun 2021 23:50:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w21so16155216edv.3;
        Sat, 05 Jun 2021 23:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=469mptNRQwR1f7SnBBAByK4/YLBmZMyMdzbD8tdgyNQ=;
        b=gp/QSnZpXWrJkybcY+lnPKwrEE/p5kJ1/gznsVayr2M34RfymDn3n0zJ6YvdL0p2xU
         +U5Cz6UCW7BFevNPxrm+c5Dsn7qUR0iqoUm+38u4rmXLLjVzFmnzj2z4bYm4NwVcousc
         c8FoD2TVkeBEyXMEZJg5RMKMD448GIaM2GEVhO+TF2sbC1pfB51LVvtR8wHDZOcV3/qq
         73R/XQx0yTZoPiZGKL1AZSC+94GRDLt09JdbC82rcYwm4L8LYAYcMlUHs0v83DBPKvmQ
         D/QkPGOnz6QUDch4nzRlwGRy9nIizi3j7wYShV0Y1OzfbVUcH7tdHQJwUHcCEyobFFBQ
         QHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=469mptNRQwR1f7SnBBAByK4/YLBmZMyMdzbD8tdgyNQ=;
        b=jpgabyL6tYzARVKT8KuBzyMmYbJMDbNqP5wrQQyOhmHZT2Hy54pIRoA4VSJ7C8XiXM
         NcSBYpiOwSyr2AcjlF6hRWxkdRT/mmV+1FpZ+uasTK99V0wJaZyC7uhwPELDh9qtsmHz
         +z3OHRKkmWUA4l0qTo1/XnLZXiBCft93V5n+YBZek4gN2WE+JdWQY6ErWyCQd3bXwBdc
         VV+rEcCDwlpTVgO6P0J2RL3ke9i0eQT7kgAYt+nGEcTFJ8VEU/BEzUp/9Y1zUYvkp7vE
         mbTJjRq84Z6nWcwBTj/5ykRYuLxqodSIQweb4QflaMcCYTOTYXi56gVTOnAugC+MEo27
         sZRA==
X-Gm-Message-State: AOAM532L5vCT040FRoJuDbGkCJBQjnijPoAl9+tsOTmODGEpBwOYSUXh
        2TF56IPnAN5MwoU0IA8C9IQ=
X-Google-Smtp-Source: ABdhPJyJ+hXvGa9AtJ9roIlSjA0yMpvvphvZ3SB43MazsDz2tq/KtRl2XCs9JpMH1CjbF9HAVVUjAQ==
X-Received: by 2002:a50:cb85:: with SMTP id k5mr13949520edi.170.1622962255159;
        Sat, 05 Jun 2021 23:50:55 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id ay24sm5823455edb.2.2021.06.05.23.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 23:50:54 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: cedrus: hevc: Add support for scaling lists
Date:   Sun,  6 Jun 2021 08:50:50 +0200
Message-Id: <20210606065050.414607-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC frames may use scaling list feature. Add support for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---

Note: This patch depends on "Additional features for Hantro HEVC" from
Benjamin Gaignard.
(https://patchwork.linuxtv.org/project/linux-media/cover/20210604130619.491200-1-benjamin.gaignard@collabora.com/)

 drivers/staging/media/sunxi/cedrus/cedrus.c   |  6 ++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 70 ++++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +
 5 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index c0d005dafc6c..8114e2167013 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -135,6 +135,12 @@ static const struct cedrus_control cedrus_controls[] = {
 		},
 		.codec		= CEDRUS_CODEC_H265,
 	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
+		},
+		.codec		= CEDRUS_CODEC_H265,
+	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 88afba17b78b..9c7bfd2b6616 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -78,6 +78,7 @@ struct cedrus_h265_run {
 	const struct v4l2_ctrl_hevc_pps			*pps;
 	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
 	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
+	const struct v4l2_ctrl_hevc_scaling_matrix	*scaling_matrix;
 };
 
 struct cedrus_vp8_run {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 40e8c4123f76..a16c1422558f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -72,6 +72,8 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
 		run.h265.decode_params = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
+		run.h265.scaling_matrix = cedrus_find_control_data(ctx,
+			V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
 		break;
 
 	case V4L2_PIX_FMT_VP8_FRAME:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 6821e3d05d34..788d72d06444 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -238,6 +238,69 @@ static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
 	}
 }
 
+static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
+					   struct cedrus_run *run)
+{
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
+	struct cedrus_dev *dev = ctx->dev;
+	u32 i, j, k, val;
+
+	scaling = run->h265.scaling_matrix;
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
+	cedrus_h265_sram_write_offset(dev, VE_DEC_H265_SRAM_OFFSET_SCALING_LISTS);
+
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 8; j++)
+			for (k = 0; k < 8; k += 4) {
+				val = ((u32)scaling->scaling_list_8x8[i][j + (k + 3) * 8] << 24) |
+				      ((u32)scaling->scaling_list_8x8[i][j + (k + 2) * 8] << 16) |
+				      ((u32)scaling->scaling_list_8x8[i][j + (k + 1) * 8] << 8) |
+				      scaling->scaling_list_8x8[i][j + k * 8];
+				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+			}
+
+	for (i = 0; i < 2; i++)
+		for (j = 0; j < 8; j++)
+			for (k = 0; k < 8; k += 4) {
+				val = ((u32)scaling->scaling_list_32x32[i][j + (k + 3) * 8] << 24) |
+				      ((u32)scaling->scaling_list_32x32[i][j + (k + 2) * 8] << 16) |
+				      ((u32)scaling->scaling_list_32x32[i][j + (k + 1) * 8] << 8) |
+				      scaling->scaling_list_32x32[i][j + k * 8];
+				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+			}
+
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 8; j++)
+			for (k = 0; k < 8; k += 4) {
+				val = ((u32)scaling->scaling_list_16x16[i][j + (k + 3) * 8] << 24) |
+				      ((u32)scaling->scaling_list_16x16[i][j + (k + 2) * 8] << 16) |
+				      ((u32)scaling->scaling_list_16x16[i][j + (k + 1) * 8] << 8) |
+				      scaling->scaling_list_16x16[i][j + k * 8];
+				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+			}
+
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 4; j++) {
+			val = ((u32)scaling->scaling_list_4x4[i][j + 12] << 24) |
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
@@ -521,7 +584,12 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 
 	/* Scaling list. */
 
-	reg = VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
+	if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED) {
+		cedrus_h265_write_scaling_list(ctx, run);
+		reg = VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED;
+	} else {
+		reg = VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
+	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
 	/* Neightbor information address. */
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 92ace87c1c7d..bdb062ad8682 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -494,6 +494,8 @@
 #define VE_DEC_H265_ENTRY_POINT_OFFSET_ADDR	(VE_ENGINE_DEC_H265 + 0x64)
 #define VE_DEC_H265_TILE_START_CTB		(VE_ENGINE_DEC_H265 + 0x68)
 #define VE_DEC_H265_TILE_END_CTB		(VE_ENGINE_DEC_H265 + 0x6c)
+#define VE_DEC_H265_SCALING_LIST_DC_COEF0	(VE_ENGINE_DEC_H265 + 0x78)
+#define VE_DEC_H265_SCALING_LIST_DC_COEF1	(VE_ENGINE_DEC_H265 + 0x7c)
 
 #define VE_DEC_H265_LOW_ADDR			(VE_ENGINE_DEC_H265 + 0x80)
 
-- 
2.31.1

