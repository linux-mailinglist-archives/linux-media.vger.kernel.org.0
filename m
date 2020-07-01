Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0FE21158D
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 00:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgGAWB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 18:01:27 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:26298 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgGAWB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 18:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=7H3DbOIR6DWUdA/y3YLDXdf//aCB9yI7dsoADDEwozU=;
        b=Kcvik/5cXSTLA53WDTTVMGXhxNHcp5acdMhICJ2UqO8KfvhWBqBg0rqI8IKX5+iCS4Yd
        T8oMHrbtUN5VANPskoLjqXlHz4mbcwNCTZj4vpSQWcIAX4PhBBHhMn+y8Fvf8EtEqYSREL
        wdAVPVlIfVDOybau5IIn6pB03edoSlPWk=
Received: by filterdrecv-p3iad2-5b55dcd864-n2v2l with SMTP id filterdrecv-p3iad2-5b55dcd864-n2v2l-20-5EFD0686-43
        2020-07-01 21:56:22.80847321 +0000 UTC m=+449226.666074437
Received: from bionic.localdomain (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id EUQFfvG1TEmNXhiQgqGLxw
        Wed, 01 Jul 2020 21:56:22.550 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 5/9] media: v4l2-common: Add helpers to calculate bytesperline
 and sizeimage
Date:   Wed, 01 Jul 2020 21:56:22 +0000 (UTC)
Message-Id: <20200701215616.30874-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701215616.30874-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h0uPT0Fcu4aS=2FJELx?=
 =?us-ascii?Q?zmlrelv=2FRxNNGKdLUb6zfjLL5hY9lxvy0FnaZCc?=
 =?us-ascii?Q?mavxY0dPQ+1i1s4MfBxbGo=2FrSq9p+VL870UklDZ?=
 =?us-ascii?Q?XWdviC6ghk3PqEetIddIit+QBxSQbEVgJxL596h?=
 =?us-ascii?Q?ahcSL3TclL2WTWy6kAZ4EwDpLNqwSnMD+JYgdmL?=
 =?us-ascii?Q?CL8v7Z7I5zW0iycnVAcew=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add helper functions to calculate plane bytesperline and sizeimage, these
new helpers consider block width and height when calculating plane
bytesperline and sizeimage.

This prepare support for new pixel formats added in next patch that make
use of block width and height.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/media/v4l2-core/v4l2-common.c | 77 +++++++++++++--------------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 3dc17ebe14fa..4102c373b48a 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -333,6 +333,33 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 	return info->block_h[plane];
 }
 
+static inline unsigned int v4l2_format_plane_width(const struct v4l2_format_info *info, int plane,
+						   unsigned int width)
+{
+	unsigned int hdiv = plane ? info->hdiv : 1;
+	unsigned int bytes = DIV_ROUND_UP(width * info->bpp[plane],
+				v4l2_format_block_width(info, plane) *
+				v4l2_format_block_height(info, plane));
+
+	return DIV_ROUND_UP(bytes, hdiv);
+}
+
+static inline unsigned int v4l2_format_plane_height(const struct v4l2_format_info *info, int plane,
+						    unsigned int height)
+{
+	unsigned int vdiv = plane ? info->vdiv : 1;
+	unsigned int lines = ALIGN(height, v4l2_format_block_height(info, plane));
+
+	return DIV_ROUND_UP(lines, vdiv);
+}
+
+static inline unsigned int v4l2_format_plane_size(const struct v4l2_format_info *info, int plane,
+						  unsigned int width, unsigned int height)
+{
+	return v4l2_format_plane_width(info, plane, width) *
+	       v4l2_format_plane_height(info, plane, height);
+}
+
 void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize)
 {
@@ -368,37 +395,19 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 
 	if (info->mem_planes == 1) {
 		plane = &pixfmt->plane_fmt[0];
-		plane->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
+		plane->bytesperline = v4l2_format_plane_width(info, 0, width);
 		plane->sizeimage = 0;
 
-		for (i = 0; i < info->comp_planes; i++) {
-			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
-			unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
-			unsigned int aligned_width;
-			unsigned int aligned_height;
-
-			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
-			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
-
-			plane->sizeimage += info->bpp[i] *
-				DIV_ROUND_UP(aligned_width, hdiv) *
-				DIV_ROUND_UP(aligned_height, vdiv);
-		}
+		for (i = 0; i < info->comp_planes; i++)
+			plane->sizeimage +=
+				v4l2_format_plane_size(info, i, width, height);
 	} else {
 		for (i = 0; i < info->comp_planes; i++) {
-			unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
-			unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
-			unsigned int aligned_width;
-			unsigned int aligned_height;
-
-			aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
-			aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
-
 			plane = &pixfmt->plane_fmt[i];
 			plane->bytesperline =
-				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
-			plane->sizeimage =
-				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
+				v4l2_format_plane_width(info, i, width);
+			plane->sizeimage = plane->bytesperline *
+				v4l2_format_plane_height(info, i, height);
 		}
 	}
 	return 0;
@@ -422,22 +431,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 	pixfmt->width = width;
 	pixfmt->height = height;
 	pixfmt->pixelformat = pixelformat;
-	pixfmt->bytesperline = ALIGN(width, v4l2_format_block_width(info, 0)) * info->bpp[0];
+	pixfmt->bytesperline = v4l2_format_plane_width(info, 0, width);
 	pixfmt->sizeimage = 0;
 
-	for (i = 0; i < info->comp_planes; i++) {
-		unsigned int hdiv = (i == 0) ? 1 : info->hdiv;
-		unsigned int vdiv = (i == 0) ? 1 : info->vdiv;
-		unsigned int aligned_width;
-		unsigned int aligned_height;
-
-		aligned_width = ALIGN(width, v4l2_format_block_width(info, i));
-		aligned_height = ALIGN(height, v4l2_format_block_height(info, i));
-
-		pixfmt->sizeimage += info->bpp[i] *
-			DIV_ROUND_UP(aligned_width, hdiv) *
-			DIV_ROUND_UP(aligned_height, vdiv);
-	}
+	for (i = 0; i < info->comp_planes; i++)
+		pixfmt->sizeimage +=
+			v4l2_format_plane_size(info, i, width, height);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
-- 
2.17.1

