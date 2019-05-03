Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADBA12CD6
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbfECLr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:47:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46258 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbfECLr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:47:26 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1414728361F;
        Fri,  3 May 2019 12:47:25 +0100 (BST)
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
Subject: [PATCH v5 04/15] rockchip/vpu: Use v4l2_apply_frmsize_constraints() where appropriate
Date:   Fri,  3 May 2019 13:47:08 +0200
Message-Id: <20190503114719.28784-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190503114719.28784-1-boris.brezillon@collabora.com>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the v4l2_apply_frmsize_constraints() helper instead of open-coding
it.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v5:
* New patch
---
 .../media/rockchip/vpu/rockchip_vpu_enc.c     | 44 ++++++-------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
index 7c7c20ab2733..aa00df9a7ecb 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
@@ -197,15 +197,9 @@ vidioc_try_fmt_cap_mplane(struct file *file, void *priv, struct v4l2_format *f)
 
 	pix_mp->num_planes = 1;
 	pix_mp->field = V4L2_FIELD_NONE;
-	pix_mp->width = clamp(pix_mp->width,
-			      fmt->frmsize.min_width,
-			      fmt->frmsize.max_width);
-	pix_mp->height = clamp(pix_mp->height,
-			       fmt->frmsize.min_height,
-			       fmt->frmsize.max_height);
-	/* Round up to macroblocks. */
-	pix_mp->width = round_up(pix_mp->width, fmt->frmsize.step_width);
-	pix_mp->height = round_up(pix_mp->height, fmt->frmsize.step_height);
+
+	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
+				       &fmt->frmsize);
 
 	/*
 	 * For compressed formats the application can specify
@@ -226,7 +220,6 @@ vidioc_try_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	struct rockchip_vpu_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	const struct rockchip_vpu_fmt *fmt;
-	unsigned int width, height;
 	int i;
 
 	vpu_debug(4, "%c%c%c%c\n",
@@ -242,18 +235,13 @@ vidioc_try_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	}
 
 	pix_mp->field = V4L2_FIELD_NONE;
-	width = clamp(pix_mp->width,
-		      ctx->vpu_dst_fmt->frmsize.min_width,
-		      ctx->vpu_dst_fmt->frmsize.max_width);
-	height = clamp(pix_mp->height,
-		       ctx->vpu_dst_fmt->frmsize.min_height,
-		       ctx->vpu_dst_fmt->frmsize.max_height);
-	/* Round up to macroblocks. */
-	width = round_up(width, ctx->vpu_dst_fmt->frmsize.step_width);
-	height = round_up(height, ctx->vpu_dst_fmt->frmsize.step_height);
+
+	v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
+				       &ctx->vpu_dst_fmt->frmsize);
 
 	/* Fill remaining fields */
-	v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, width, height);
+	v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
+			    pix_mp->height);
 
 	for (i = 0; i < pix_mp->num_planes; i++) {
 		memset(pix_mp->plane_fmt[i].reserved, 0,
@@ -272,10 +260,8 @@ void rockchip_vpu_enc_reset_dst_fmt(struct rockchip_vpu_dev *vpu,
 	memset(fmt, 0, sizeof(*fmt));
 
 	fmt->num_planes = 1;
-	fmt->width = clamp(fmt->width, ctx->vpu_dst_fmt->frmsize.min_width,
-			   ctx->vpu_dst_fmt->frmsize.max_width);
-	fmt->height = clamp(fmt->height, ctx->vpu_dst_fmt->frmsize.min_height,
-			    ctx->vpu_dst_fmt->frmsize.max_height);
+	v4l2_apply_frmsize_constraints(&fmt->width, &fmt->height,
+				       &ctx->vpu_dst_fmt->frmsize);
 	fmt->pixelformat = ctx->vpu_dst_fmt->fourcc;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_JPEG,
@@ -291,23 +277,21 @@ void rockchip_vpu_enc_reset_src_fmt(struct rockchip_vpu_dev *vpu,
 				    struct rockchip_vpu_ctx *ctx)
 {
 	struct v4l2_pix_format_mplane *fmt = &ctx->src_fmt;
-	unsigned int width, height;
 
 	ctx->vpu_src_fmt = rockchip_vpu_get_default_fmt(ctx, false);
 
 	memset(fmt, 0, sizeof(*fmt));
 
-	width = clamp(fmt->width, ctx->vpu_dst_fmt->frmsize.min_width,
-		      ctx->vpu_dst_fmt->frmsize.max_width);
-	height = clamp(fmt->height, ctx->vpu_dst_fmt->frmsize.min_height,
-		       ctx->vpu_dst_fmt->frmsize.max_height);
+	v4l2_apply_frmsize_constraints(&fmt->width, &fmt->height,
+				       &ctx->vpu_src_fmt->frmsize);
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_JPEG,
 	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
-	v4l2_fill_pixfmt_mp(fmt, ctx->vpu_src_fmt->fourcc, width, height);
+	v4l2_fill_pixfmt_mp(fmt, ctx->vpu_src_fmt->fourcc, fmt->width,
+			    fmt->height);
 }
 
 static int
-- 
2.20.1

