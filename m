Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928716C66E7
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjCWLli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbjCWLle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7B41043F
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:33 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJJz-0007OB-Oi; Thu, 23 Mar 2023 12:41:31 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 23 Mar 2023 12:41:12 +0100
Subject: [PATCH 4/8] usb: gadget: uvc: move video format initialization to uvc_v4l2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-uvc-gadget-cleanup-v1-4-e41f0c5d9d8e@pengutronix.de>
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

Move the setup of the initial video format to uvc_v4l2.c that handles
all the format negotiation. This keeps all format setup and
configuration code in uvc_v4l2.c and avoids scattering the format setup
across multiple files.

Furthermore, it allows to setup the default format using the format
configured in the configfs.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c     |  2 ++
 drivers/usb/gadget/function/uvc_v4l2.c  | 11 +++++++++++
 drivers/usb/gadget/function/uvc_v4l2.h  |  3 +++
 drivers/usb/gadget/function/uvc_video.c |  5 -----
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 5e919fb65833..a16c8f80a50a 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -434,6 +434,8 @@ uvc_register_video(struct uvc_device *uvc)
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;
 	int ret;
 
+	uvc_init_default_format(uvc);
+
 	/* TODO reference counting. */
 	memset(&uvc->vdev, 0, sizeof(uvc->vdev));
 	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 4b8bf94e06fc..5620546eb43b 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -130,6 +130,17 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
 	return uformat;
 }
 
+void uvc_init_default_format(struct uvc_device *uvc)
+{
+	struct uvc_video *video = &uvc->video;
+
+	video->fcc = V4L2_PIX_FMT_YUYV;
+	video->bpp = 16;
+	video->width = 320;
+	video->height = 240;
+	video->imagesize = 320 * 240 * 2;
+}
+
 static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
 					   struct uvcg_format *uformat,
 					   u16 rw, u16 rh)
diff --git a/drivers/usb/gadget/function/uvc_v4l2.h b/drivers/usb/gadget/function/uvc_v4l2.h
index 1576005b61fd..5c3a97de0776 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.h
+++ b/drivers/usb/gadget/function/uvc_v4l2.h
@@ -16,4 +16,7 @@
 extern const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops;
 extern const struct v4l2_file_operations uvc_v4l2_fops;
 
+struct uvc_device;
+void uvc_init_default_format(struct uvc_device *uvc);
+
 #endif /* __UVC_V4L2_H__ */
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6..27ff9ef49e16 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -516,11 +516,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 		return -EINVAL;
 
 	video->uvc = uvc;
-	video->fcc = V4L2_PIX_FMT_YUYV;
-	video->bpp = 16;
-	video->width = 320;
-	video->height = 240;
-	video->imagesize = 320 * 240 * 2;
 
 	/* Initialize the video buffers queue. */
 	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,

-- 
2.30.2
