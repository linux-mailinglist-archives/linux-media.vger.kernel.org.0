Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3FCCFA14
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 14:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730915AbfJHMi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 08:38:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43883 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730859AbfJHMi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 08:38:56 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iHolS-00047F-LU; Tue, 08 Oct 2019 14:38:54 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>, kernel@pengutronix.de
Subject: [PATCH] media: hantro: relax s_fmt(out) busy error
Date:   Tue,  8 Oct 2019 14:38:50 +0200
Message-Id: <20191008123850.641-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setting the output format resets the capture queue, so we return -EBUSY
while the capture queue has buffers allocated. If capture dimensions
and pixel format don't change though, we can allow setting the output
format without reallocating the capture queue.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
This applies on top of https://patchwork.linuxtv.org/patch/59337/
("media: hantro: Fix s_fmt for dynamic resolution changes").
---
 drivers/staging/media/hantro/hantro_v4l2.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 586d243cc3cc..05c3edce27a9 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -368,7 +368,7 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
 	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	const struct hantro_fmt *formats;
+	const struct hantro_fmt *raw_vpu_fmt, *formats;
 	unsigned int num_fmts;
 	int ret;
 
@@ -394,8 +394,16 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 		 */
 		peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (vb2_is_busy(peer_vq))
-			return -EBUSY;
+		if (vb2_is_busy(peer_vq)) {
+			formats = hantro_get_formats(ctx, &num_fmts);
+			raw_vpu_fmt = hantro_get_default_fmt(formats, num_fmts,
+							     false);
+
+			if (ctx->dst_fmt.width != pix_mp->width ||
+			    ctx->dst_fmt.height != pix_mp->height ||
+			    ctx->dst_fmt.pixelformat != raw_vpu_fmt->fourcc)
+				return -EBUSY;
+		}
 	} else {
 		/*
 		 * The encoder doesn't admit a format change if
-- 
2.20.1

