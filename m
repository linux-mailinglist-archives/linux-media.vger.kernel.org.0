Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F0AE591E
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 09:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbfJZHuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 03:50:25 -0400
Received: from mailoutvs22.siol.net ([185.57.226.213]:60209 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725966AbfJZHuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 03:50:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 2AB2B521E31;
        Sat, 26 Oct 2019 09:50:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Q-HjqDkWfWyo; Sat, 26 Oct 2019 09:50:21 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 970F8521C52;
        Sat, 26 Oct 2019 09:50:21 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 34EFE521CAF;
        Sat, 26 Oct 2019 09:50:19 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 2/3] media: cedrus: Fix H264 4k support
Date:   Sat, 26 Oct 2019 09:49:58 +0200
Message-Id: <20191026074959.1073512-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191026074959.1073512-1-jernej.skrabec@siol.net>
References: <20191026074959.1073512-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

H264 decoder needs additional or bigger buffers in order to decode 4k
videos.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 83 +++++++++++++++++--
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 11 +++
 3 files changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index c45fb9a7ad07..96765555ab8a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -116,8 +116,15 @@ struct cedrus_ctx {
 			ssize_t		mv_col_buf_size;
 			void		*pic_info_buf;
 			dma_addr_t	pic_info_buf_dma;
+			ssize_t		pic_info_buf_size;
 			void		*neighbor_info_buf;
 			dma_addr_t	neighbor_info_buf_dma;
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} h264;
 		struct {
 			void		*mv_col_buf;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index d2c854ecdf15..19962f4213d4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -39,7 +39,6 @@ struct cedrus_h264_sram_ref_pic {
 #define CEDRUS_H264_FRAME_NUM		18
=20
 #define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(16 * SZ_1K)
-#define CEDRUS_PIC_INFO_BUF_SIZE	(128 * SZ_1K)
=20
 static void cedrus_h264_write_sram(struct cedrus_dev *dev,
 				   enum cedrus_h264_sram_off off,
@@ -342,6 +341,20 @@ static void cedrus_set_params(struct cedrus_ctx *ctx=
,
 		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
 		     VE_H264_VLD_ADDR_LAST);
=20
+	if (ctx->src_fmt.width > 2048) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.h264.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.h264.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	/*
 	 * FIXME: Since the bitstream parsing is done in software, and
 	 * in userspace, this shouldn't be needed anymore. But it
@@ -502,18 +515,28 @@ static void cedrus_h264_setup(struct cedrus_ctx *ct=
x,
 static int cedrus_h264_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev =3D ctx->dev;
+	unsigned int pic_info_size;
 	unsigned int field_size;
 	unsigned int mv_col_size;
 	int ret;
=20
+	if (ctx->src_fmt.width > 2048)
+		pic_info_size =3D CEDRUS_H264_FRAME_NUM * 0x4000;
+	else
+		pic_info_size =3D CEDRUS_H264_FRAME_NUM * 0x1000;
+
 	/*
-	 * FIXME: It seems that the H6 cedarX code is using a formula
-	 * here based on the size of the frame, while all the older
-	 * code is using a fixed size, so that might need to be
-	 * changed at some point.
+	 * FIXME: If V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is set,
+	 * there is no need to multiply by 2.
 	 */
+	pic_info_size +=3D ctx->src_fmt.height * 2 * 64;
+
+	if (pic_info_size < 130 * SZ_1K)
+		pic_info_size =3D 130 * SZ_1K;
+
+	ctx->codec.h264.pic_info_buf_size =3D pic_info_size;
 	ctx->codec.h264.pic_info_buf =3D
-		dma_alloc_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
+		dma_alloc_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
 				   &ctx->codec.h264.pic_info_buf_dma,
 				   GFP_KERNEL);
 	if (!ctx->codec.h264.pic_info_buf)
@@ -566,15 +589,51 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx=
)
 		goto err_neighbor_buf;
 	}
=20
+	if (ctx->src_fmt.width > 2048) {
+		ctx->codec.h264.deblk_buf_size =3D
+			ALIGN(ctx->src_fmt.width, 32) * 12;
+		ctx->codec.h264.deblk_buf =3D
+			dma_alloc_coherent(dev->dev,
+					   ctx->codec.h264.deblk_buf_size,
+					   &ctx->codec.h264.deblk_buf_dma,
+					   GFP_KERNEL);
+		if (!ctx->codec.h264.deblk_buf) {
+			ret =3D -ENOMEM;
+			goto err_mv_col_buf;
+		}
+
+		ctx->codec.h264.intra_pred_buf_size =3D
+			ALIGN(ctx->src_fmt.width, 64) * 5;
+		ctx->codec.h264.intra_pred_buf =3D
+			dma_alloc_coherent(dev->dev,
+					   ctx->codec.h264.intra_pred_buf_size,
+					   &ctx->codec.h264.intra_pred_buf_dma,
+					   GFP_KERNEL);
+		if (!ctx->codec.h264.intra_pred_buf) {
+			ret =3D -ENOMEM;
+			goto err_deblk_buf;
+		}
+	}
+
 	return 0;
=20
+err_deblk_buf:
+	dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
+			  ctx->codec.h264.deblk_buf,
+			  ctx->codec.h264.deblk_buf_dma);
+
+err_mv_col_buf:
+	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
+			  ctx->codec.h264.mv_col_buf,
+			  ctx->codec.h264.mv_col_buf_dma);
+
 err_neighbor_buf:
 	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
 			  ctx->codec.h264.neighbor_info_buf,
 			  ctx->codec.h264.neighbor_info_buf_dma);
=20
 err_pic_buf:
-	dma_free_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
+	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
 			  ctx->codec.h264.pic_info_buf,
 			  ctx->codec.h264.pic_info_buf_dma);
 	return ret;
@@ -590,9 +649,17 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
 			  ctx->codec.h264.neighbor_info_buf,
 			  ctx->codec.h264.neighbor_info_buf_dma);
-	dma_free_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
+	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
 			  ctx->codec.h264.pic_info_buf,
 			  ctx->codec.h264.pic_info_buf_dma);
+	if (ctx->codec.h264.deblk_buf_size)
+		dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
+				  ctx->codec.h264.deblk_buf,
+				  ctx->codec.h264.deblk_buf_dma);
+	if (ctx->codec.h264.intra_pred_buf_size)
+		dma_free_coherent(dev->dev, ctx->codec.h264.intra_pred_buf_size,
+				  ctx->codec.h264.intra_pred_buf,
+				  ctx->codec.h264.intra_pred_buf_dma);
 }
=20
 static void cedrus_h264_trigger(struct cedrus_ctx *ctx)
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
index ace3d49fcd82..7beb03d3bb39 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -46,6 +46,17 @@
 #define VE_MODE_DEC_H264			(0x01 << 0)
 #define VE_MODE_DEC_MPEG			(0x00 << 0)
=20
+#define VE_BUF_CTRL				0x50
+
+#define VE_BUF_CTRL_INTRAPRED_EXT_RAM		(0x02 << 2)
+#define VE_BUF_CTRL_INTRAPRED_MIXED_RAM		(0x01 << 2)
+#define VE_BUF_CTRL_INTRAPRED_INT_SRAM		(0x00 << 2)
+#define VE_BUF_CTRL_DBLK_EXT_RAM		(0x02 << 0)
+#define VE_BUF_CTRL_DBLK_MIXED_RAM		(0x01 << 0)
+#define VE_BUF_CTRL_DBLK_INT_SRAM		(0x00 << 0)
+
+#define VE_DBLK_DRAM_BUF_ADDR			0x54
+#define VE_INTRAPRED_DRAM_BUF_ADDR		0x58
 #define VE_PRIMARY_CHROMA_BUF_LEN		0xc4
 #define VE_PRIMARY_FB_LINE_STRIDE		0xc8
=20
--=20
2.23.0

