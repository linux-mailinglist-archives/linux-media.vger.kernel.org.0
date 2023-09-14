Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03BE7A041F
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 14:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238452AbjINMld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 08:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238211AbjINMla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 08:41:30 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189A41FCC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 05:41:26 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qglet-0008Mc-7S; Thu, 14 Sep 2023 14:41:23 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 14 Sep 2023 14:40:40 +0200
Subject: [PATCH 08/13] media: rockchip: rga: use pixelformat to find format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v1-8-abfd77260ae3@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the pixelformat instead of the v4l2_format to find the rga_fmt. This
avoids knowing the structure and type of v4l2_format in rga_fmt_find and
simplifies the function.

Also cleanup the users of the function. In try_fmt always return the
found pixel format to make sure that the pixel format is always set.
Thus, we can be sure that we will find the rga_fmt in s_fmt and can drop
the check if a given format has been found.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 49403498bc17..4579023af2ff 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -318,12 +318,12 @@ static struct rga_fmt formats[] = {
 
 #define NUM_FORMATS ARRAY_SIZE(formats)
 
-static struct rga_fmt *rga_fmt_find(struct v4l2_format *f)
+static struct rga_fmt *rga_fmt_find(u32 pixelformat)
 {
 	unsigned int i;
 
 	for (i = 0; i < NUM_FORMATS; i++) {
-		if (formats[i].fourcc == f->fmt.pix.pixelformat)
+		if (formats[i].fourcc == pixelformat)
 			return &formats[i];
 	}
 	return NULL;
@@ -472,11 +472,11 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct rga_fmt *fmt;
 
-	fmt = rga_fmt_find(f);
-	if (!fmt) {
+	fmt = rga_fmt_find(f->fmt.pix.pixelformat);
+	if (!fmt)
 		fmt = &formats[0];
-		f->fmt.pix.pixelformat = fmt->fourcc;
-	}
+
+	f->fmt.pix.pixelformat = fmt->fourcc;
 
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 
@@ -502,7 +502,6 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
-	struct rga_fmt *fmt;
 	int ret = 0;
 
 	/* Adjust all values accordingly to the hardware capabilities
@@ -519,13 +518,10 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	fmt = rga_fmt_find(f);
-	if (!fmt)
-		return -EINVAL;
 	frm->width = f->fmt.pix.width;
 	frm->height = f->fmt.pix.height;
 	frm->size = f->fmt.pix.sizeimage;
-	frm->fmt = fmt;
+	frm->fmt = rga_fmt_find(f->fmt.pix.pixelformat);
 	frm->stride = f->fmt.pix.bytesperline;
 	frm->colorspace = f->fmt.pix.colorspace;
 

-- 
2.39.2

