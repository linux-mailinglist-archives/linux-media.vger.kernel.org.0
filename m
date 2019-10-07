Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0618ECEAE3
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 19:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbfJGRqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 13:46:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60824 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbfJGRqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 13:46:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4268628D406
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 for 5.4 1/4] media: hantro: Fix s_fmt for dynamic resolution changes
Date:   Mon,  7 Oct 2019 14:45:02 -0300
Message-Id: <20191007174505.10681-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191007174505.10681-1-ezequiel@collabora.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
changed the conditions under S_FMT was allowed for OUTPUT
CAPTURE buffers.

However, and according to the mem-to-mem stateless decoder specification,
in order to support dynamic resolution changes, S_FMT should be allowed
even if OUTPUT buffers have been allocated.

Relax decoder S_FMT restrictions on OUTPUT buffers, allowing a resolution
modification, provided the pixel format stays the same.

Tested on RK3288 platforms using ChromiumOS Video Decode/Encode Accelerator Unittests.

Fixes: 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
--
v2:
* Call try_fmt_out before using the format,
  pointed out by Philipp.

 drivers/staging/media/hantro/hantro_v4l2.c | 28 +++++++++++++++-------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 3dae52abb96c..586d243cc3cc 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -367,19 +367,26 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct hantro_ctx *ctx = fh_to_ctx(priv);
+	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	const struct hantro_fmt *formats;
 	unsigned int num_fmts;
-	struct vb2_queue *vq;
 	int ret;
 
-	/* Change not allowed if queue is busy. */
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (vb2_is_busy(vq))
-		return -EBUSY;
+	ret = vidioc_try_fmt_out_mplane(file, priv, f);
+	if (ret)
+		return ret;
 
 	if (!hantro_is_encoder_ctx(ctx)) {
 		struct vb2_queue *peer_vq;
 
+		/*
+		 * In other to support dynamic resolution change,
+		 * the decoder admits a resolution change, as long
+		 * as the pixelformat remains. Can't be done if streaming.
+		 */
+		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
+		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
+			return -EBUSY;
 		/*
 		 * Since format change on the OUTPUT queue will reset
 		 * the CAPTURE queue, we can't allow doing so
@@ -389,12 +396,15 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 		if (vb2_is_busy(peer_vq))
 			return -EBUSY;
+	} else {
+		/*
+		 * The encoder doesn't admit a format change if
+		 * there are OUTPUT buffers allocated.
+		 */
+		if (vb2_is_busy(vq))
+			return -EBUSY;
 	}
 
-	ret = vidioc_try_fmt_out_mplane(file, priv, f);
-	if (ret)
-		return ret;
-
 	formats = hantro_get_formats(ctx, &num_fmts);
 	ctx->vpu_src_fmt = hantro_find_format(formats, num_fmts,
 					      pix_mp->pixelformat);
-- 
2.22.0

