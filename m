Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 987A012CBF
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfECLr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:47:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46234 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbfECLr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:47:26 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 802D628361A;
        Fri,  3 May 2019 12:47:24 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 03/15] media: v4l2-common: Support custom imagesize/bytesperline in fill_pixfmt()
Date:   Fri,  3 May 2019 13:47:07 +0200
Message-Id: <20190503114719.28784-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503114719.28784-1-boris.brezillon@collabora.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Users can define custom sizeimage and bytesperline as long as they're
big enough to store the amount of pixels required for a specific
width/height under a specific format. Avoid overriding those fields in
this case.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Hello Hans,

The sizeimage/bytesperline check on !MPLANE formats is still not 100%
sure, as custom bytesperline might induce bigger sizeimage than what
we calculate.

I tried implementing something smarter taking the per-component plane
bpp + hdiv param as we discussed the other day but decided to step
back after realizing the per-component plane macro block might also
differ at least in theory (not sure that's true in practice) and that
has an impact on bytesperline too.

Let me know how you want to handle that case.

Regards,

Boris

Changes in v5:
* New patch
---
 drivers/media/v4l2-core/v4l2-common.c | 54 +++++++++++++++++++--------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 3c6f5c115fc5..37bfc984a8b5 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -563,9 +563,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 	pixfmt->num_planes = info->mem_planes;
 
 	if (info->mem_planes == 1) {
+		u32 bytesperline, sizeimage = 0;
+
 		plane = &pixfmt->plane_fmt[0];
-		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
-		plane->sizeimage = 0;
+		bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
 
 		for (i = 0; i < info->comp_planes; i++) {
 			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
@@ -576,10 +577,17 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
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
+		/*
+		 * The user might have specified custom sizeimage/bytesperline,
+		 * only override them if they're not big enough.
+		 */
+		plane->sizeimage = max(sizeimage, plane->sizeimage);
+		plane->bytesperline = max(bytesperline, plane->bytesperline);
 	} else {
 		for (i = 0; i < info->comp_planes; i++) {
 			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
@@ -591,10 +599,20 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
 
 			plane = &pixfmt->plane_fmt[i];
-			plane->bytesperline =
-				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
-			plane->sizeimage =
-				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
+
+			/*
+			 * The user might have specified custom
+			 * sizeimage/bytesperline, only override them if
+			 * they're not big enough.
+			 */
+			plane->bytesperline = max_t(u32,
+						    info->bpp[i] *
+						    DIV_ROUND_UP(aligned_width, hdiv),
+						    plane->bytesperline);
+			plane->sizeimage = max_t(u32,
+						 plane->bytesperline *
+						 DIV_ROUND_UP(aligned_height, vdiv),
+						 plane->sizeimage);
 		}
 	}
 	return 0;
@@ -605,6 +623,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height)
 {
 	const struct v4l2_format_info *info;
+	u32 bytesperline, sizeimage = 0;
 	int i;
 
 	info = v4l2_format_info(pixelformat);
@@ -618,8 +637,7 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
-	pixfmt->sizeimage = 0;
+	bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
 
 	for (i = 0; i < info->comp_planes; i++) {
 		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
@@ -629,11 +647,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 
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
+	/*
+	 * The user might have specified its own sizeimage/bytesperline values,
+	 * only override them if they're not big enough.
+	 */
+	pixfmt->sizeimage = max(sizeimage, pixfmt->sizeimage);
+	pixfmt->bytesperline = max(bytesperline, pixfmt->bytesperline);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
-- 
2.20.1

