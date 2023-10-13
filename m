Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8BFD7C83E1
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjJMLBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjJMLBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:01:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FDDBE
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:01:16 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qrFuU-0006xJ-CR; Fri, 13 Oct 2023 13:00:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Oct 2023 13:00:29 +0200
Subject: [PATCH v2 08/13] media: rockchip: rga: use pixelformat to find
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v2-8-bbfa6abf8bbf@pengutronix.de>
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

Use the pixelformat instead of the v4l2_format to find the rga_fmt. This
avoids knowing the structure and type of v4l2_format in rga_fmt_find and
simplifies the function.

Also cleanup the users of the function. In try_fmt always return the
found pixel format to make sure that the pixel format is always set.
Thus, we can be sure that we will find the rga_fmt in s_fmt and can drop
the check if a given format has been found.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2: None
---
 drivers/media/platform/rockchip/rga/rga.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 792084918798..8ae68890a8f7 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -320,12 +320,12 @@ static struct rga_fmt formats[] = {
 
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
@@ -474,11 +474,11 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
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
 
@@ -504,7 +504,6 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_queue *vq;
 	struct rga_frame *frm;
-	struct rga_fmt *fmt;
 	int ret = 0;
 
 	/* Adjust all values accordingly to the hardware capabilities
@@ -521,13 +520,10 @@ static int vidioc_s_fmt(struct file *file, void *prv, struct v4l2_format *f)
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

