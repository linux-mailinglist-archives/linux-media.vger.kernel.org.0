Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA84D2CCE9
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfE1RD3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45890 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RD3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 165F7263952
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v6 03/16] media: v4l2-common: Support custom imagesize in fill_pixfmt()
Date:   Tue, 28 May 2019 14:02:19 -0300
Message-Id: <20190528170232.2091-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528170232.2091-1-ezequiel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Users can define custom sizeimage as long as they're big enough to
store the amount of pixels required for a specific width/height under a
specific format. Avoid overriding those fields in this case.

We could possibly do the same for bytesperline, but it gets tricky when
dealing with !MPLANE definitions, so this case is omitted for now and
->bytesperline is always overwritten with the value calculated in
fill_pixfmt().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes from v5:
* Overwrite bytesperline with the value calculated in fill_pixfmt()

Changes from v4:
* New patch

 drivers/media/v4l2-core/v4l2-common.c | 58 ++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index b2d1e55d9561..fd286f6e17d7 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -585,9 +585,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 	pixfmt->num_planes = info->mem_planes;
 
 	if (info->mem_planes == 1) {
+		u32 sizeimage = 0;
+
 		plane = &pixfmt->plane_fmt[0];
-		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
-		plane->sizeimage = 0;
 
 		for (i = 0; i < info->comp_planes; i++) {
 			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
@@ -598,10 +598,21 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
 			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
 
-			plane->sizeimage += info->bpp[i] *
-				DIV_ROUND_UP(aligned_width, hdiv) *
-				DIV_ROUND_UP(aligned_height, vdiv);
+			sizeimage += info->bpp[i] *
+				     DIV_ROUND_UP(aligned_width, hdiv) *
+				     DIV_ROUND_UP(aligned_height, vdiv);
 		}
+
+		/* Custom bytesperline value is not supported yet. */
+		plane->bytesperline = ALIGN(width,
+					    v4l2_format_block_width(info, 0)) *
+				      info->bpp[0];
+
+		/*
+		 * The user might have specified a custom sizeimage, only
+		 * override it if it's not big enough.
+		 */
+		plane->sizeimage = max(sizeimage, plane->sizeimage);
 	} else {
 		for (i = 0; i < info->comp_planes; i++) {
 			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
@@ -613,10 +624,19 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
 
 			plane = &pixfmt->plane_fmt[i];
-			plane->bytesperline =
-				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
-			plane->sizeimage =
-				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
+
+			/* Custom bytesperline value is not supported yet. */
+			plane->bytesperline = info->bpp[i] *
+					      DIV_ROUND_UP(aligned_width, hdiv);
+
+			/*
+			 * The user might have specified a custom sizeimage,
+			 * only override it if it's not big enough.
+			 */
+			plane->sizeimage = max_t(u32,
+						 plane->bytesperline *
+						 DIV_ROUND_UP(aligned_height, vdiv),
+						 plane->sizeimage);
 		}
 	}
 	return 0;
@@ -627,6 +647,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height)
 {
 	const struct v4l2_format_info *info;
+	u32 sizeimage = 0;
 	int i;
 
 	info = v4l2_format_info(pixelformat);
@@ -640,8 +661,6 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
-	pixfmt->sizeimage = 0;
 
 	for (i = 0; i < info->comp_planes; i++) {
 		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
@@ -651,11 +670,20 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 
 		aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
 		aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
-
-		pixfmt->sizeimage += info->bpp[i] *
-			DIV_ROUND_UP(aligned_width, hdiv) *
-			DIV_ROUND_UP(aligned_height, vdiv);
+		sizeimage += info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) *
+			     DIV_ROUND_UP(aligned_height, vdiv);
 	}
+
+	/* Custom bytesperline value is not supported yet. */
+	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) *
+			       info->bpp[0];
+
+	/*
+	 * The user might have specified its own sizeimage value, only override
+	 * it if it's not big enough.
+	 */
+	pixfmt->sizeimage = max(sizeimage, pixfmt->sizeimage);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
-- 
2.20.1

