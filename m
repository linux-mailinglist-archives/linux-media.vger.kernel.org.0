Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66B5730408
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfE3VPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:44 -0400
Received: from mailoutvs48.siol.net ([185.57.226.239]:55402 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726694AbfE3VPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 921095227EC;
        Thu, 30 May 2019 23:15:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id r9Y_XVt21vjG; Thu, 30 May 2019 23:15:40 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 2C5BA5228C1;
        Thu, 30 May 2019 23:15:40 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id DAF1E5228C2;
        Thu, 30 May 2019 23:15:37 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] media: cedrus: Remove dst_bufs from context
Date:   Thu, 30 May 2019 23:15:13 +0200
Message-Id: <20190530211516.1891-5-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530211516.1891-1-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This array is just duplicated capture buffer queue. Remove it and adjust
code to look into capture buffer queue instead.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  4 +---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  4 ++--
 .../staging/media/sunxi/cedrus/cedrus_video.c | 22 -------------------
 3 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index 3f476d0fd981..d8e6777e5e27 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -100,8 +100,6 @@ struct cedrus_ctx {
 	struct v4l2_ctrl_handler	hdl;
 	struct v4l2_ctrl		**ctrls;
=20
-	struct vb2_buffer		*dst_bufs[VIDEO_MAX_FRAME];
-
 	union {
 		struct {
 			void		*mv_col_buf;
@@ -187,7 +185,7 @@ static inline dma_addr_t cedrus_dst_buf_addr(struct c=
edrus_ctx *ctx,
 	if (index < 0)
 		return 0;
=20
-	buf =3D ctx->dst_bufs[index];
+	buf =3D ctx->fh.m2m_ctx->cap_q_ctx.q.bufs[index];
 	return buf ? cedrus_buf_addr(buf, &ctx->dst_fmt, plane) : 0;
 }
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index d0ee3f90ff46..b2290f98d81a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -119,7 +119,7 @@ static void cedrus_write_frame_list(struct cedrus_ctx=
 *ctx,
 		if (buf_idx < 0)
 			continue;
=20
-		cedrus_buf =3D vb2_to_cedrus_buffer(ctx->dst_bufs[buf_idx]);
+		cedrus_buf =3D vb2_to_cedrus_buffer(cap_q->bufs[buf_idx]);
 		position =3D cedrus_buf->codec.h264.position;
 		used_dpbs |=3D BIT(position);
=20
@@ -194,7 +194,7 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
 		if (buf_idx < 0)
 			continue;
=20
-		ref_buf =3D to_vb2_v4l2_buffer(ctx->dst_bufs[buf_idx]);
+		ref_buf =3D to_vb2_v4l2_buffer(cap_q->bufs[buf_idx]);
 		cedrus_buf =3D vb2_v4l2_to_cedrus_buffer(ref_buf);
 		position =3D cedrus_buf->codec.h264.position;
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index e2b530b1a956..681dfe3367a6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -411,26 +411,6 @@ static void cedrus_queue_cleanup(struct vb2_queue *v=
q, u32 state)
 	}
 }
=20
-static int cedrus_buf_init(struct vb2_buffer *vb)
-{
-	struct vb2_queue *vq =3D vb->vb2_queue;
-	struct cedrus_ctx *ctx =3D vb2_get_drv_priv(vq);
-
-	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
-		ctx->dst_bufs[vb->index] =3D vb;
-
-	return 0;
-}
-
-static void cedrus_buf_cleanup(struct vb2_buffer *vb)
-{
-	struct vb2_queue *vq =3D vb->vb2_queue;
-	struct cedrus_ctx *ctx =3D vb2_get_drv_priv(vq);
-
-	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
-		ctx->dst_bufs[vb->index] =3D NULL;
-}
-
 static int cedrus_buf_out_validate(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
@@ -517,8 +497,6 @@ static void cedrus_buf_request_complete(struct vb2_bu=
ffer *vb)
 static struct vb2_ops cedrus_qops =3D {
 	.queue_setup		=3D cedrus_queue_setup,
 	.buf_prepare		=3D cedrus_buf_prepare,
-	.buf_init		=3D cedrus_buf_init,
-	.buf_cleanup		=3D cedrus_buf_cleanup,
 	.buf_queue		=3D cedrus_buf_queue,
 	.buf_out_validate	=3D cedrus_buf_out_validate,
 	.buf_request_complete	=3D cedrus_buf_request_complete,
--=20
2.21.0

