Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83136D3A1E
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 22:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjDBUBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 16:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjDBUBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 16:01:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD8F93CA
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 13:01:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pj3tJ-0001eL-OY; Sun, 02 Apr 2023 22:01:29 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pj3tI-008WMI-5w; Sun, 02 Apr 2023 22:01:28 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1pj3tH-00CFR0-HZ; Sun, 02 Apr 2023 22:01:27 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [RFC] usb: gadget: uvc: sane shutdown on soft streamoff
Date:   Sun,  2 Apr 2023 22:01:22 +0200
Message-Id: <20230402200122.2919202-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
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

Pending requests in the gadget hardware get dequeued and returned with
ECONNRESET when the available endpoint is not available anymore. This
can be caused by an unplugged cable or the decision to shutdown the
stream, e.g. by switching the alt setting.

In both cases the returned completion handler is marking the gadget
with UVC_QUEUE_DISCONNECTED by calling uvcg_queue_cancel.

Since in userspace applications there might be two threads, one for the
bufferqueueing and one to handle the uvc events. It is likely that the
bufferqueueing thread did not receive the UVC_EVENT_STREAMOFF coming
from the alt_setting change early enough and still tries to queue a
buffer into the already disconnected marked device.

This leads buf_prepare to return ENODEV, which usually makes the
userspace application quit.

To fix the soft-shutdown case this patch is marking the alt setting
change before disabling the endpoint. This way the still completing
requests on the disabled endpoint can call uvcg_queue_cancel without
marking the device disconnected.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
Hi Laurent!

We are running into this issue in gstreamer when the host is stopping
the stream. In fact I am unsure if this is not also an issue when the
real unplug will appear.

Since the v4l2 device is available all the time, and the streamoff
callback is cleaning up all the pending buffers in uvc_video_enable(0),
also the ones that got queued in this short time window of:

 alt_setting(0) -> userspace event handling -> streamoff ioctl

Would it not be also possible to just drop the whole
UVC_QUEUE_DISCONNECTED mechanism?

Thanks,
Michael

 drivers/usb/gadget/function/f_uvc.c     | 3 ++-
 drivers/usb/gadget/function/uvc_video.c | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 5e919fb6583301..01ab8c07d85be9 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -337,6 +337,8 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		if (uvc->state != UVC_STATE_STREAMING)
 			return 0;
 
+		uvc->state = UVC_STATE_CONNECTED;
+
 		if (uvc->video.ep)
 			usb_ep_disable(uvc->video.ep);
 
@@ -344,7 +346,6 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
 		v4l2_event.type = UVC_EVENT_STREAMOFF;
 		v4l2_event_queue(&uvc->vdev, &v4l2_event);
 
-		uvc->state = UVC_STATE_CONNECTED;
 		return 0;
 
 	case 1:
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6f3..2f36fef3824f8e 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -265,9 +265,10 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 		queue->flags |= UVC_QUEUE_DROP_INCOMPLETE;
 		break;
 
-	case -ESHUTDOWN:	/* disconnect from host. */
+	case -ESHUTDOWN:	/* disconnect from host or streamoff pending */
 		uvcg_dbg(&video->uvc->func, "VS request cancelled.\n");
-		uvcg_queue_cancel(queue, 1);
+		uvcg_queue_cancel(queue,
+				  uvc->state != UVC_STATE_STREAMING ? 0 : 1);
 		break;
 
 	default:
-- 
2.39.2

