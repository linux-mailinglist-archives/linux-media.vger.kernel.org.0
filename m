Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563744203E3
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 22:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhJCUQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Oct 2021 16:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbhJCUQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Oct 2021 16:16:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F017C0613EC
        for <linux-media@vger.kernel.org>; Sun,  3 Oct 2021 13:14:14 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX7s8-0002EY-0z; Sun, 03 Oct 2021 22:14:08 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX7s6-0006HS-Cr; Sun, 03 Oct 2021 22:14:06 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, hverkuil@xs4all.nl,
        gregkh@linuxfoundation.org, m.tretter@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [RESEND PATCH v4] usb: gadget: uvc: fix multiple opens
Date:   Sun,  3 Oct 2021 22:13:55 +0200
Message-Id: <20211003201355.24081-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <87pn261h4c.fsf@kernel.org>
References: <87pn261h4c.fsf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>

Currently, the UVC function is activated when open on the corresponding
v4l2 device is called.
On another open the activation of the function fails since the
deactivation counter in `usb_function_activate` equals 0. However the
error is not returned to userspace since the open of the v4l2 device is
successful.

On a close the function is deactivated (since deactivation counter still
equals 0) and the video is disabled in `uvc_v4l2_release`, although the
UVC application potentially is streaming.

Move activation of UVC function to subscription on UVC_EVENT_SETUP
because there we can guarantee for a userspace application utilizing
UVC.
Block subscription on UVC_EVENT_SETUP while another application already
is subscribed to it, indicated by `bool func_connected` in
`struct uvc_device`.
Extend the `struct uvc_file_handle` with member `bool is_uvc_app_handle`
to tag it as the handle used by the userspace UVC application.

With this a process is able to check capabilities of the v4l2 device
without deactivating the function for the actual UVC application.

Reviewed-By: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v4:
  - remove unnecessary inner parentheses
  - keep and use the local video variable in `uvc_v4l2_release()`

v3:
  - replace `unsigned int connections` with `bool func_connected`
  - rename `bool connected` to `bool is_uvc_app_handle`

v2:
  - fix deadlock in `uvc_v4l2_unsubscribe_event()` (mutex is already
  locked in v4l2-core) introduced in v1
- lock mutex in `uvc_v4l2_release()` to suppress ioctls and protect
  connected
---
 drivers/usb/gadget/function/uvc.h      |  2 ++
 drivers/usb/gadget/function/uvc_v4l2.c | 49 ++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 255a61bd6a6a8..9d5f17b551bbd 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -126,6 +126,7 @@ struct uvc_device {
 	enum uvc_state state;
 	struct usb_function func;
 	struct uvc_video video;
+	bool func_connected;
 
 	/* Descriptors */
 	struct {
@@ -156,6 +157,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
 struct uvc_file_handle {
 	struct v4l2_fh vfh;
 	struct uvc_video *device;
+	bool is_uvc_app_handle;
 };
 
 #define to_uvc_file_handle(handle) \
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 4ca89eab61590..197c26f7aec63 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -227,17 +227,55 @@ static int
 uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 			 const struct v4l2_event_subscription *sub)
 {
+	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
+	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
+	int ret;
+
 	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
 		return -EINVAL;
 
-	return v4l2_event_subscribe(fh, sub, 2, NULL);
+	if (sub->type == UVC_EVENT_SETUP && uvc->func_connected)
+		return -EBUSY;
+
+	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
+	if (ret < 0)
+		return ret;
+
+	if (sub->type == UVC_EVENT_SETUP) {
+		uvc->func_connected = true;
+		handle->is_uvc_app_handle = true;
+		uvc_function_connect(uvc);
+	}
+
+	return 0;
+}
+
+static void uvc_v4l2_disable(struct uvc_device *uvc)
+{
+	uvc->func_connected = false;
+	uvc_function_disconnect(uvc);
+	uvcg_video_enable(&uvc->video, 0);
+	uvcg_free_buffers(&uvc->video.queue);
 }
 
 static int
 uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
 			   const struct v4l2_event_subscription *sub)
 {
-	return v4l2_event_unsubscribe(fh, sub);
+	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
+	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
+	int ret;
+
+	ret = v4l2_event_unsubscribe(fh, sub);
+	if (ret < 0)
+		return ret;
+
+	if (sub->type == UVC_EVENT_SETUP && handle->is_uvc_app_handle) {
+		uvc_v4l2_disable(uvc);
+		handle->is_uvc_app_handle = false;
+	}
+
+	return 0;
 }
 
 static long
@@ -292,7 +330,6 @@ uvc_v4l2_open(struct file *file)
 	handle->device = &uvc->video;
 	file->private_data = &handle->vfh;
 
-	uvc_function_connect(uvc);
 	return 0;
 }
 
@@ -304,11 +341,9 @@ uvc_v4l2_release(struct file *file)
 	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
 	struct uvc_video *video = handle->device;
 
-	uvc_function_disconnect(uvc);
-
 	mutex_lock(&video->mutex);
-	uvcg_video_enable(video, 0);
-	uvcg_free_buffers(&video->queue);
+	if (handle->is_uvc_app_handle)
+		uvc_v4l2_disable(uvc);
 	mutex_unlock(&video->mutex);
 
 	file->private_data = NULL;
-- 
2.30.2

