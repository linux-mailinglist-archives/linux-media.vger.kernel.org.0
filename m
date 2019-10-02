Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7BCC9278
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 21:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbfJBTgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 15:36:12 -0400
Received: from mailoutvs35.siol.net ([185.57.226.226]:42394 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727594AbfJBTgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 15:36:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id DBBFC523B2B;
        Wed,  2 Oct 2019 21:36:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id HIr41ruBPwmH; Wed,  2 Oct 2019 21:36:07 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 8994F523B0A;
        Wed,  2 Oct 2019 21:36:07 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 3F4AE523B34;
        Wed,  2 Oct 2019 21:36:05 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: cedrus: Use helpers to access capture queue
Date:   Wed,  2 Oct 2019 21:35:53 +0200
Message-Id: <20191002193553.1633467-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002193553.1633467-1-jernej.skrabec@siol.net>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Accessing capture queue structue directly is not safe. Use helpers for
that.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h      | 8 ++++++--
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index 986e059e3202..c45fb9a7ad07 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -197,12 +197,16 @@ static inline dma_addr_t cedrus_buf_addr(struct vb2=
_buffer *buf,
 static inline dma_addr_t cedrus_dst_buf_addr(struct cedrus_ctx *ctx,
 					     int index, unsigned int plane)
 {
-	struct vb2_buffer *buf;
+	struct vb2_buffer *buf =3D NULL;
+	struct vb2_queue *vq;
=20
 	if (index < 0)
 		return 0;
=20
-	buf =3D ctx->fh.m2m_ctx->cap_q_ctx.q.bufs[index];
+	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vq)
+		buf =3D vb2_get_buffer(vq, index);
+
 	return buf ? cedrus_buf_addr(buf, &ctx->dst_fmt, plane) : 0;
 }
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index 4a0e69855c7f..4650982c69a8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -97,7 +97,7 @@ static void cedrus_write_frame_list(struct cedrus_ctx *=
ctx,
 	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.decode_=
params;
 	const struct v4l2_ctrl_h264_slice_params *slice =3D run->h264.slice_par=
ams;
 	const struct v4l2_ctrl_h264_sps *sps =3D run->h264.sps;
-	struct vb2_queue *cap_q =3D &ctx->fh.m2m_ctx->cap_q_ctx.q;
+	struct vb2_queue *cap_q;
 	struct cedrus_buffer *output_buf;
 	struct cedrus_dev *dev =3D ctx->dev;
 	unsigned long used_dpbs =3D 0;
@@ -105,6 +105,8 @@ static void cedrus_write_frame_list(struct cedrus_ctx=
 *ctx,
 	unsigned int output =3D 0;
 	unsigned int i;
=20
+	cap_q =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE)=
;
+
 	memset(pic_list, 0, sizeof(pic_list));
=20
 	for (i =3D 0; i < ARRAY_SIZE(decode->dpb); i++) {
@@ -168,12 +170,14 @@ static void _cedrus_write_ref_list(struct cedrus_ct=
x *ctx,
 				   enum cedrus_h264_sram_off sram)
 {
 	const struct v4l2_ctrl_h264_decode_params *decode =3D run->h264.decode_=
params;
-	struct vb2_queue *cap_q =3D &ctx->fh.m2m_ctx->cap_q_ctx.q;
+	struct vb2_queue *cap_q;
 	struct cedrus_dev *dev =3D ctx->dev;
 	u8 sram_array[CEDRUS_MAX_REF_IDX];
 	unsigned int i;
 	size_t size;
=20
+	cap_q =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE)=
;
+
 	memset(sram_array, 0, sizeof(sram_array));
=20
 	for (i =3D 0; i < num_ref; i++) {
--=20
2.23.0

