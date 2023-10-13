Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929FD7C83EA
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjJMLBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjJMLBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:01:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7777CC0
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:01:16 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qrFuU-0006xJ-EI; Fri, 13 Oct 2023 13:00:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Oct 2023 13:00:30 +0200
Subject: [PATCH v2 09/13] media: rockchip: rga: add local variable for
 pix_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v2-9-bbfa6abf8bbf@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The local variable allows to simplify the accessed to the format and
makes it easier to change the type of the format.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2: None
---
 drivers/media/platform/rockchip/rga/rga.c | 55 ++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 8ae68890a8f7..f5d0d87cce22 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -448,6 +448,7 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
+	struct v4l2_pix_format *pix_fmt = &f->fmt.pix;
 	struct rga_ctx *ctx = prv;
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
@@ -459,47 +460,49 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
 
-	f->fmt.pix.width = frm->width;
-	f->fmt.pix.height = frm->height;
-	f->fmt.pix.field = V4L2_FIELD_NONE;
-	f->fmt.pix.pixelformat = frm->fmt->fourcc;
-	f->fmt.pix.bytesperline = frm->stride;
-	f->fmt.pix.sizeimage = frm->size;
-	f->fmt.pix.colorspace = frm->colorspace;
+	pix_fmt->width = frm->width;
+	pix_fmt->height = frm->height;
+	pix_fmt->field = V4L2_FIELD_NONE;
+	pix_fmt->pixelformat = frm->fmt->fourcc;
+	pix_fmt->bytesperline = frm->stride;
+	pix_fmt->sizeimage = frm->size;
+	pix_fmt->colorspace = frm->colorspace;
 
 	return 0;
 }
 
 static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
+	struct v4l2_pix_format *pix_fmt = &f->fmt.pix;
 	struct rga_fmt *fmt;
 
 	fmt = rga_fmt_find(f->fmt.pix.pixelformat);
 	if (!fmt)
 		fmt = &formats[0];
 
-	f->fmt.pix.pixelformat = fmt->fourcc;
+	pix_fmt->pixelformat = fmt->fourcc;
 
-	f->fmt.pix.field = V4L2_FIELD_NONE;
+	pix_fmt->field = V4L2_FIELD_NONE;
 
-	f->fmt.pix.width = clamp(f->fmt.pix.width,
-				 (u32)MIN_WIDTH, (u32)MAX_WIDTH);
-	f->fmt.pix.height = clamp(f->fmt.pix.height,
-				  (u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
+	pix_fmt->width = clamp(pix_fmt->width,
+			       (u32)MIN_WIDTH, (u32)MAX_WIDTH);
+	pix_fmt->height = clamp(pix_fmt->height,
+				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
 
 	if (fmt->hw_format >= RGA_COLOR_FMT_YUV422SP)
-		f->fmt.pix.bytesperline = f->fmt.pix.width;
+		pix_fmt->bytesperline = pix_fmt->width;
 	else
-		f->fmt.pix.bytesperline = (f->fmt.pix.width * fmt->depth) >> 3;
+		pix_fmt->bytesperline = (pix_fmt->width * fmt->depth) >> 3;
 
-	f->fmt.pix.sizeimage =
-		f->fmt.pix.height * (f->fmt.pix.width * fmt->depth) >> 3;
+	pix_fmt->sizeimage =
+		pix_fmt->height * (pix_fmt->width * fmt->depth) >> 3;
 
 	return 0;
 }
 
 static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
+	struct v4l2_pix_format *pix_fmt = &f->fmt.pix;
 	struct rga_ctx *ctx = prv;
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_queue *vq;
@@ -520,12 +523,12 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	frm->width = f->fmt.pix.width;
-	frm->height = f->fmt.pix.height;
-	frm->size = f->fmt.pix.sizeimage;
-	frm->fmt = rga_fmt_find(f->fmt.pix.pixelformat);
-	frm->stride = f->fmt.pix.bytesperline;
-	frm->colorspace = f->fmt.pix.colorspace;
+	frm->width = pix_fmt->width;
+	frm->height = pix_fmt->height;
+	frm->size = pix_fmt->sizeimage;
+	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
+	frm->stride = pix_fmt->bytesperline;
+	frm->colorspace = pix_fmt->colorspace;
 
 	/* Reset crop settings */
 	frm->crop.left = 0;
@@ -533,6 +536,12 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	frm->crop.width = frm->width;
 	frm->crop.height = frm->height;
 
+	v4l2_dbg(debug, 1, &rga->v4l2_dev,
+		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
+		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
+		  &frm->fmt->fourcc, frm->width, frm->height,
+		  frm->stride, frm->size);
+
 	return 0;
 }
 

-- 
2.39.2

