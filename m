Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668FD60E71A
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 20:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbiJZSWv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 14:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbiJZSWu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 14:22:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31ECD25B7
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 11:22:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1onl3A-0002xx-4X; Wed, 26 Oct 2022 20:22:48 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1onl39-000YXp-14; Wed, 26 Oct 2022 20:22:46 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1onl37-001WSj-Bz; Wed, 26 Oct 2022 20:22:45 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH] usb: gadget: uvc: also use try_format in set_format
Date:   Wed, 26 Oct 2022 20:22:40 +0200
Message-Id: <20221026182240.363055-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since e219a712bc06 (usb: gadget: uvc: add v4l2 try_format api call) the
try_format function is available. With this function includes checks for
valid configurations programmed in the configfs. We use this function to
ensure to return valid values on the set_format callback.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
 drivers/usb/gadget/function/uvc_v4l2.c | 72 ++++++++------------------
 1 file changed, 21 insertions(+), 51 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index d5bb3038626267..a12475d289167a 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -275,16 +275,6 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
  * V4L2 ioctls
  */
 
-struct uvc_format {
-	u8 bpp;
-	u32 fcc;
-};
-
-static struct uvc_format uvc_formats[] = {
-	{ 16, V4L2_PIX_FMT_YUYV  },
-	{ 0,  V4L2_PIX_FMT_MJPEG },
-};
-
 static int
 uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 {
@@ -318,47 +308,6 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	return 0;
 }
 
-static int
-uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct uvc_device *uvc = video_get_drvdata(vdev);
-	struct uvc_video *video = &uvc->video;
-	struct uvc_format *format;
-	unsigned int imagesize;
-	unsigned int bpl;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(uvc_formats); ++i) {
-		format = &uvc_formats[i];
-		if (format->fcc == fmt->fmt.pix.pixelformat)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(uvc_formats)) {
-		uvcg_info(&uvc->func, "Unsupported format 0x%08x.\n",
-			  fmt->fmt.pix.pixelformat);
-		return -EINVAL;
-	}
-
-	bpl = format->bpp * fmt->fmt.pix.width / 8;
-	imagesize = bpl ? bpl * fmt->fmt.pix.height : fmt->fmt.pix.sizeimage;
-
-	video->fcc = format->fcc;
-	video->bpp = format->bpp;
-	video->width = fmt->fmt.pix.width;
-	video->height = fmt->fmt.pix.height;
-	video->imagesize = imagesize;
-
-	fmt->fmt.pix.field = V4L2_FIELD_NONE;
-	fmt->fmt.pix.bytesperline = bpl;
-	fmt->fmt.pix.sizeimage = imagesize;
-	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->fmt.pix.priv = 0;
-
-	return 0;
-}
-
 static int
 uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 {
@@ -399,6 +348,27 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	return 0;
 }
 
+static int
+uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+	int ret;
+
+	ret = uvc_v4l2_try_format(file, fh, fmt);
+	if (ret)
+		return ret;
+
+	video->fcc = fmt->fmt.pix.pixelformat;
+	video->bpp = fmt->fmt.pix.bytesperline * 8 / video->width;
+	video->width = fmt->fmt.pix.width;
+	video->height = fmt->fmt.pix.height;
+	video->imagesize = fmt->fmt.pix.sizeimage;
+
+	return ret;
+}
+
 static int
 uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
 		struct v4l2_frmivalenum *fival)
-- 
2.30.2

