Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C0C3AD922
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 11:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhFSJtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 05:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhFSJtP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 05:49:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A426C061574;
        Sat, 19 Jun 2021 02:47:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D2E9E1F448EC
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, bin.liu@mediatek.com,
        rick.chang@mediatek.com
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com, mchehab@kernel.org,
        tfiga@chromium.org, matthias.bgg@gmail.com,
        enric.balletbo@collabora.com
Subject: [PATCH] media: mtk-jpeg: fix setting plane paylod
Date:   Sat, 19 Jun 2021 12:46:42 +0300
Message-Id: <20210619094642.17779-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In mtk_jpeg_buf_prepare, in case the format is V4L2_PIX_FMT_JPEG,
then the payload of the vb2_buffer planes can be overwritten
only if 'ctx->enable_exif' is true, in that case, the driver is
a jpeg encoder and the payload is determined by the driver.

If 'ctx->enable_exif' is not set and the format is V4L2_PIX_FMT_JPEG
then the payload might came from userspace (in case of a decoder)
and should not be overwritten by the driver.

In addition, the cb 'queue_setup' should add the MTK_JPEG_MAX_EXIF_SIZE
to the plane sizes in case the format is V4L2_PIX_FMT_JPEG
and ctx->enable_exif is set.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bce569d..397a27888a84 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -651,6 +651,7 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
+	unsigned int exif_extra;
 	int i;
 
 	v4l2_dbg(1, debug, &jpeg->v4l2_dev, "(%d) buf_req count=%u\n",
@@ -660,18 +661,20 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
 	if (!q_data)
 		return -EINVAL;
 
+	exif_extra = ctx->enable_exif && V4L2_TYPE_IS_CAPTURE(q->type) ?
+		     MTK_JPEG_MAX_EXIF_SIZE : 0;
+
 	if (*num_planes) {
 		for (i = 0; i < *num_planes; i++)
-			if (sizes[i] < q_data->pix_mp.plane_fmt[i].sizeimage)
+			if (sizes[i] < q_data->pix_mp.plane_fmt[i].sizeimage + exif_extra)
 				return -EINVAL;
 		return 0;
 	}
 
 	*num_planes = q_data->fmt->colplanes;
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
-		sizes[i] =  q_data->pix_mp.plane_fmt[i].sizeimage;
-		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "sizeimage[%d]=%u\n",
-			 i, sizes[i]);
+		sizes[i] =  q_data->pix_mp.plane_fmt[i].sizeimage + exif_extra;
+		v4l2_dbg(1, debug, &jpeg->v4l2_dev, "sizes[%d]=%u\n", i, sizes[i]);
 	}
 
 	return 0;
@@ -690,12 +693,11 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
-		if (ctx->enable_exif &&
-		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
+		if (q_data->fmt->fourcc != V4L2_PIX_FMT_JPEG)
+			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage);
+		else if (ctx->enable_exif)
+			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage +
 					      MTK_JPEG_MAX_EXIF_SIZE);
-		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
 	}
 
 	return 0;
-- 
2.17.1

