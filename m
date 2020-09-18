Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8588426E9ED
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 02:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgIRA2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 20:28:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57040 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgIRA2N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 20:28:13 -0400
X-Greylist: delayed 20688 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 20:28:12 EDT
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 56DC829C66E
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Ondrej Jirman <megous@megous.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: cedrus: Propagate OUTPUT resolution to CAPTURE
Date:   Thu, 17 Sep 2020 20:27:51 -0400
Message-Id: <20200918002751.373984-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As per spec, the CAPTURE resolution should be automatically set based on
the OTUPUT resolution. This patch properly propagate width/height to the
capture when the OUTPUT format is set and override the user provided
width/height with configured OUTPUT resolution when the CAPTURE fmt is
updated.

This also prevents userspace from selecting a CAPTURE resolution that is
too small, avoiding kernel oops.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Tested-by: Ondrej Jirman <megous@megous.com>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 16d82309e7b6..667b86dde1ee 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -247,6 +247,8 @@ static int cedrus_try_fmt_vid_cap(struct file *file, void *priv,
 		return -EINVAL;
 
 	pix_fmt->pixelformat = fmt->pixelformat;
+	pix_fmt->width = ctx->src_fmt.width;
+	pix_fmt->height = ctx->src_fmt.height;
 	cedrus_prepare_format(pix_fmt);
 
 	return 0;
@@ -296,10 +298,30 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
 {
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
 	struct vb2_queue *vq;
+	struct vb2_queue *peer_vq;
 	int ret;
 
+	ret = cedrus_try_fmt_vid_out(file, priv, f);
+	if (ret)
+		return ret;
+
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (vb2_is_busy(vq))
+	/*
+	 * In order to support dynamic resolution change,
+	 * the decoder admits a resolution change, as long
+	 * as the pixelformat remains. Can't be done if streaming.
+	 */
+	if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
+	    f->fmt.pix.pixelformat != ctx->src_fmt.pixelformat))
+		return -EBUSY;
+	/*
+	 * Since format change on the OUTPUT queue will reset
+	 * the CAPTURE queue, we can't allow doing so
+	 * when the CAPTURE queue has buffers allocated.
+	 */
+	peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+				  V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (vb2_is_busy(peer_vq))
 		return -EBUSY;
 
 	ret = cedrus_try_fmt_vid_out(file, priv, f);
@@ -319,11 +341,14 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
 		break;
 	}
 
-	/* Propagate colorspace information to capture. */
+	/* Propagate format information to capture. */
 	ctx->dst_fmt.colorspace = f->fmt.pix.colorspace;
 	ctx->dst_fmt.xfer_func = f->fmt.pix.xfer_func;
 	ctx->dst_fmt.ycbcr_enc = f->fmt.pix.ycbcr_enc;
 	ctx->dst_fmt.quantization = f->fmt.pix.quantization;
+	ctx->dst_fmt.width = ctx->src_fmt.width;
+	ctx->dst_fmt.height = ctx->src_fmt.height;
+	cedrus_prepare_format(&ctx->dst_fmt);
 
 	return 0;
 }
-- 
2.26.2

