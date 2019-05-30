Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC21303FE
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfE3VPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:51 -0400
Received: from mailoutvs50.siol.net ([185.57.226.241]:55424 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726812AbfE3VPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 8E450522867;
        Thu, 30 May 2019 23:15:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id v59_8rc0df4p; Thu, 30 May 2019 23:15:47 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 1AFFE5227EC;
        Thu, 30 May 2019 23:15:47 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id C8CFD522867;
        Thu, 30 May 2019 23:15:44 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] media: cedrus: Improve H264 memory efficiency
Date:   Thu, 30 May 2019 23:15:16 +0200
Message-Id: <20190530211516.1891-8-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530211516.1891-1-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

H264 decoder driver preallocated pretty big worst case mv col buffer
pool. It turns out that pool is most of the time much bigger than it
needs to be.

Solution implemented here is to allocate memory only if capture buffer
is actually used and only as much as it is really necessary.

This is also preparation for 4K video decoding support, which will be
implemented later.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 -
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 81 +++++++------------
 2 files changed, 28 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index 16c1bdfd243a..fcbbbef65494 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -106,10 +106,6 @@ struct cedrus_ctx {
=20
 	union {
 		struct {
-			void		*mv_col_buf;
-			dma_addr_t	mv_col_buf_dma;
-			ssize_t		mv_col_buf_field_size;
-			ssize_t		mv_col_buf_size;
 			void		*pic_info_buf;
 			dma_addr_t	pic_info_buf_dma;
 			void		*neighbor_info_buf;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index b2290f98d81a..758fd0049e8f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -54,17 +54,14 @@ static void cedrus_h264_write_sram(struct cedrus_dev =
*dev,
 		cedrus_write(dev, VE_AVC_SRAM_PORT_DATA, *buffer++);
 }
=20
-static dma_addr_t cedrus_h264_mv_col_buf_addr(struct cedrus_ctx *ctx,
-					      unsigned int position,
+static dma_addr_t cedrus_h264_mv_col_buf_addr(struct cedrus_buffer *buf,
 					      unsigned int field)
 {
-	dma_addr_t addr =3D ctx->codec.h264.mv_col_buf_dma;
-
-	/* Adjust for the position */
-	addr +=3D position * ctx->codec.h264.mv_col_buf_field_size * 2;
+	dma_addr_t addr =3D buf->extra_buf_dma;
=20
 	/* Adjust for the field */
-	addr +=3D field * ctx->codec.h264.mv_col_buf_field_size;
+	if (field)
+		addr +=3D buf->extra_buf_size / 2;
=20
 	return addr;
 }
@@ -76,7 +73,6 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx,
 				struct cedrus_h264_sram_ref_pic *pic)
 {
 	struct vb2_buffer *vbuf =3D &buf->m2m_buf.vb.vb2_buf;
-	unsigned int position =3D buf->codec.h264.position;
=20
 	pic->top_field_order_cnt =3D cpu_to_le32(top_field_order_cnt);
 	pic->bottom_field_order_cnt =3D cpu_to_le32(bottom_field_order_cnt);
@@ -84,10 +80,8 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *ctx=
,
=20
 	pic->luma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0));
 	pic->chroma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 1)=
);
-	pic->mv_col_top_ptr =3D
-		cpu_to_le32(cedrus_h264_mv_col_buf_addr(ctx, position, 0));
-	pic->mv_col_bot_ptr =3D
-		cpu_to_le32(cedrus_h264_mv_col_buf_addr(ctx, position, 1));
+	pic->mv_col_top_ptr =3D cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 0)=
);
+	pic->mv_col_bot_ptr =3D cpu_to_le32(cedrus_h264_mv_col_buf_addr(buf, 1)=
);
 }
=20
 static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
@@ -142,6 +136,28 @@ static void cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
 	output_buf =3D vb2_to_cedrus_buffer(&run->dst->vb2_buf);
 	output_buf->codec.h264.position =3D position;
=20
+	if (!output_buf->extra_buf_size) {
+		const struct v4l2_ctrl_h264_sps *sps =3D run->h264.sps;
+		unsigned int field_size;
+
+		field_size =3D DIV_ROUND_UP(ctx->src_fmt.width, 16) *
+			DIV_ROUND_UP(ctx->src_fmt.height, 16) * 16;
+		if (!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE))
+			field_size =3D field_size * 2;
+		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+			field_size =3D field_size * 2;
+
+		output_buf->extra_buf_size =3D field_size * 2;
+		output_buf->extra_buf =3D
+			dma_alloc_coherent(dev->dev,
+					   output_buf->extra_buf_size,
+					   &output_buf->extra_buf_dma,
+					   GFP_KERNEL);
+
+		if (!output_buf->extra_buf)
+			output_buf->extra_buf_size =3D 0;
+	}
+
 	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
 		output_buf->codec.h264.pic_type =3D CEDRUS_H264_PIC_TYPE_FIELD;
 	else if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
@@ -476,8 +492,6 @@ static void cedrus_h264_setup(struct cedrus_ctx *ctx,
 static int cedrus_h264_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev =3D ctx->dev;
-	unsigned int field_size;
-	unsigned int mv_col_size;
 	int ret;
=20
 	/*
@@ -509,44 +523,8 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 		goto err_pic_buf;
 	}
=20
-	field_size =3D DIV_ROUND_UP(ctx->src_fmt.width, 16) *
-		DIV_ROUND_UP(ctx->src_fmt.height, 16) * 16;
-
-	/*
-	 * FIXME: This is actually conditional to
-	 * V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE not being set, we
-	 * might have to rework this if memory efficiency ever is
-	 * something we need to work on.
-	 */
-	field_size =3D field_size * 2;
-
-	/*
-	 * FIXME: This is actually conditional to
-	 * V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY not being set, we might
-	 * have to rework this if memory efficiency ever is something
-	 * we need to work on.
-	 */
-	field_size =3D field_size * 2;
-	ctx->codec.h264.mv_col_buf_field_size =3D field_size;
-
-	mv_col_size =3D field_size * 2 * CEDRUS_H264_FRAME_NUM;
-	ctx->codec.h264.mv_col_buf_size =3D mv_col_size;
-	ctx->codec.h264.mv_col_buf =3D dma_alloc_coherent(dev->dev,
-							ctx->codec.h264.mv_col_buf_size,
-							&ctx->codec.h264.mv_col_buf_dma,
-							GFP_KERNEL);
-	if (!ctx->codec.h264.mv_col_buf) {
-		ret =3D -ENOMEM;
-		goto err_neighbor_buf;
-	}
-
 	return 0;
=20
-err_neighbor_buf:
-	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
-			  ctx->codec.h264.neighbor_info_buf,
-			  ctx->codec.h264.neighbor_info_buf_dma);
-
 err_pic_buf:
 	dma_free_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
 			  ctx->codec.h264.pic_info_buf,
@@ -558,9 +536,6 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev =3D ctx->dev;
=20
-	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
-			  ctx->codec.h264.mv_col_buf,
-			  ctx->codec.h264.mv_col_buf_dma);
 	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
 			  ctx->codec.h264.neighbor_info_buf,
 			  ctx->codec.h264.neighbor_info_buf_dma);
--=20
2.21.0

