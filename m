Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF645B0F9D
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 23:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiIGV60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 17:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiIGV6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 17:58:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02077C2293
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 14:58:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oW33u-0005Gz-Cy; Wed, 07 Sep 2022 23:58:22 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oW33r-004Vmc-JN; Wed, 07 Sep 2022 23:58:21 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oW33s-00BCd6-Ia; Wed, 07 Sep 2022 23:58:20 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH v4] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Date:   Wed,  7 Sep 2022 23:58:18 +0200
Message-Id: <20220907215818.2670097-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is changing the simple workqueue in the gadget driver to be
allocated as async_wq with a higher priority. The pump worker, that is
filling the usb requests, will have a higher priority and will not be
scheduled away so often while the video stream is handled. This will
lead to fewer streaming underruns.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v3 -> v4: - improved commit message to be more clear
v2 -> v3: - renamed workqueue to "uvcgadget"
v1 -> v2: - added destroy_workqueue in uvc_function_unbind
          - reworded comment above allow_workqueue

 drivers/usb/gadget/function/f_uvc.c     | 4 ++++
 drivers/usb/gadget/function/uvc.h       | 1 +
 drivers/usb/gadget/function/uvc_v4l2.c  | 2 +-
 drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index f4f6cf75930beb..09961f4ca981da 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -897,10 +897,14 @@ static void uvc_function_unbind(struct usb_configuration *c,
 {
 	struct usb_composite_dev *cdev = c->cdev;
 	struct uvc_device *uvc = to_uvc(f);
+	struct uvc_video *video = &uvc->video;
 	long wait_ret = 1;
 
 	uvcg_info(f, "%s()\n", __func__);
 
+	if (video->async_wq)
+		destroy_workqueue(video->async_wq);
+
 	/*
 	 * If we know we're connected via v4l2, then there should be a cleanup
 	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 58e383afdd4406..1a31e6c6a5ffb8 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -88,6 +88,7 @@ struct uvc_video {
 	struct usb_ep *ep;
 
 	struct work_struct pump;
+	struct workqueue_struct *async_wq;
 
 	/* Frame parameters */
 	u8 bpp;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 511f106f984375..d6dbf9b763b2e1 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -170,7 +170,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
 		return ret;
 
 	if (uvc->state == UVC_STATE_STREAMING)
-		schedule_work(&video->pump);
+		queue_work(video->async_wq, &video->pump);
 
 	return ret;
 }
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index c00ce0e91f5d5c..bb037fcc90e69e 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -277,7 +277,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	spin_unlock_irqrestore(&video->req_lock, flags);
 
 	if (uvc->state == UVC_STATE_STREAMING)
-		schedule_work(&video->pump);
+		queue_work(video->async_wq, &video->pump);
 }
 
 static int
@@ -485,7 +485,7 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 
 	video->req_int_count = 0;
 
-	schedule_work(&video->pump);
+	queue_work(video->async_wq, &video->pump);
 
 	return ret;
 }
@@ -499,6 +499,11 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	spin_lock_init(&video->req_lock);
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
+	/* Allocate a work queue for asynchronous video pump handler. */
+	video->async_wq = alloc_workqueue("uvcgadget", WQ_UNBOUND | WQ_HIGHPRI, 0);
+	if (!video->async_wq)
+		return -EINVAL;
+
 	video->uvc = uvc;
 	video->fcc = V4L2_PIX_FMT_YUYV;
 	video->bpp = 16;
-- 
2.30.2

