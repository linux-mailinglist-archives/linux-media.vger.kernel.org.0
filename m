Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB296C66E2
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbjCWLlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjCWLlf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF171A978
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:34 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJK0-0007OB-44; Thu, 23 Mar 2023 12:41:32 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 23 Mar 2023 12:41:13 +0100
Subject: [PATCH 5/8] usb: gadget: uvc: initialize video format using configfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-uvc-gadget-cleanup-v1-5-e41f0c5d9d8e@pengutronix.de>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The configfs is supported to get a list of valid formats, which will be
checked in TRY_FMT and ENUM_FMT. The device should be initialized with a
valid format instead of some arbitrary format that the user space won't
be able to set.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_v4l2.c | 67 +++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 5620546eb43b..3f728f451ed5 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -90,6 +90,15 @@ static struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int inde
 	return uformat;
 }
 
+static struct uvcg_format *get_default_format(struct uvc_device *uvc)
+{
+	/*
+	 * UVC does not specify which format index shall be used as default.
+	 * Use the first format of the descriptor as default.
+	 */
+	return find_format_by_index(uvc, 1);
+}
+
 static struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
 				       struct uvcg_format *uformat,
 				       int index)
@@ -112,6 +121,29 @@ static struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
 	return uframe;
 }
 
+static struct uvcg_frame *get_default_frame(struct uvc_device *uvc,
+					    struct uvcg_format *uformat)
+{
+	struct uvcg_frame *frame = NULL;
+	int frame_index = 0;
+
+	if (uformat->type == UVCG_UNCOMPRESSED) {
+		struct uvcg_uncompressed *u;
+
+		u = to_uvcg_uncompressed(&uformat->group.cg_item);
+		frame_index = u->desc.bDefaultFrameIndex;
+	} else if (uformat->type == UVCG_MJPEG) {
+		struct uvcg_mjpeg *u;
+
+		u = to_uvcg_mjpeg(&uformat->group.cg_item);
+		frame_index = u->desc.bDefaultFrameIndex;
+	}
+	if (frame_index != 0)
+		frame = find_frame_by_index(uvc, uformat, frame_index);
+
+	return frame;
+}
+
 static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
 					      u32 pixelformat)
 {
@@ -133,12 +165,37 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
 void uvc_init_default_format(struct uvc_device *uvc)
 {
 	struct uvc_video *video = &uvc->video;
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe = NULL;
 
-	video->fcc = V4L2_PIX_FMT_YUYV;
-	video->bpp = 16;
-	video->width = 320;
-	video->height = 240;
-	video->imagesize = 320 * 240 * 2;
+	uformat = get_default_format(uvc);
+	if (uformat)
+		uframe = get_default_frame(uvc, uformat);
+
+	/* Fallback on some arbitrary default */
+	if (!uframe) {
+		video->fcc = V4L2_PIX_FMT_YUYV;
+		video->bpp = 16;
+		video->width = 320;
+		video->height = 240;
+		video->imagesize = 320 * 240 * 2;
+
+		return;
+	}
+
+	video->fcc = to_uvc_format(uformat)->fcc;
+
+	if (uformat->type == UVCG_UNCOMPRESSED) {
+		struct uvcg_uncompressed *u;
+
+		u = to_uvcg_uncompressed(&uformat->group.cg_item);
+		video->bpp = u->desc.bBitsPerPixel;
+	} else {
+		video->bpp = 0;
+	}
+	video->width = uframe->frame.w_width;
+	video->height = uframe->frame.w_height;
+	video->imagesize = uvc_get_frame_size(uformat, uframe);
 }
 
 static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,

-- 
2.30.2
