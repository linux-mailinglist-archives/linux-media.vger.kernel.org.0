Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1545FA34D
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 20:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJJSUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 14:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiJJSUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 14:20:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E9C193E2
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 11:20:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ohxOD-00027t-58; Mon, 10 Oct 2022 20:20:33 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1ohxOC-000kEL-B1; Mon, 10 Oct 2022 20:20:32 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1ohxOB-001kJd-N5; Mon, 10 Oct 2022 20:20:31 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH] usb: gadget: uvc: default the ctrl request interface offsets
Date:   Mon, 10 Oct 2022 20:20:28 +0200
Message-Id: <20221010182028.402155-1-m.grzeschik@pengutronix.de>
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

For the userspace it is needed to distinguish between requests for the
control or streaming interface. The userspace would have to parse the
configfs to know which interface index it has to compare the ctrl
requests against. Since the interface numbers are not fixed, e.g. for
composite gadgets, the interface offset depends on the setup.

The kernel has this information when handing over the ctrl request to
the userspace. This patch removes the offset from the interface numbers
and expose the default interface defines in the uapi g_uvc.h.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c | 16 +++++++++++++---
 include/uapi/linux/usb/g_uvc.h      |  3 +++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 6e196e06181ecf..d6e7821c9f3121 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -39,9 +39,6 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
 
 /* string IDs are assigned dynamically */
 
-#define UVC_STRING_CONTROL_IDX			0
-#define UVC_STRING_STREAMING_IDX		1
-
 static struct usb_string uvc_en_us_strings[] = {
 	/* [UVC_STRING_CONTROL_IDX].s = DYNAMIC, */
 	[UVC_STRING_STREAMING_IDX].s = "Video Streaming",
@@ -228,6 +225,8 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	struct uvc_device *uvc = to_uvc(f);
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	unsigned int interface = le16_to_cpu(ctrl->wIndex) & 0xff;
+	struct usb_ctrlrequest *mctrl;
 
 	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) {
 		uvcg_info(f, "invalid request type\n");
@@ -248,6 +247,17 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	memset(&v4l2_event, 0, sizeof(v4l2_event));
 	v4l2_event.type = UVC_EVENT_SETUP;
 	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
+
+
+	/* check for the interface number, fixup the interface number in
+	 * the ctrl request so the userspace doesn't have to bother with
+	 * offset and configfs parsing
+	 */
+	mctrl = &uvc_event->req;
+	mctrl->wIndex &= ~cpu_to_le16(0xff);
+	if (interface == uvc->streaming_intf)
+		mctrl->wIndex = cpu_to_le16(UVC_STRING_STREAMING_IDX);
+
 	v4l2_event_queue(&uvc->vdev, &v4l2_event);
 
 	return 0;
diff --git a/include/uapi/linux/usb/g_uvc.h b/include/uapi/linux/usb/g_uvc.h
index 652f169a019e7d..8d7824dde1b2f9 100644
--- a/include/uapi/linux/usb/g_uvc.h
+++ b/include/uapi/linux/usb/g_uvc.h
@@ -21,6 +21,9 @@
 #define UVC_EVENT_DATA			(V4L2_EVENT_PRIVATE_START + 5)
 #define UVC_EVENT_LAST			(V4L2_EVENT_PRIVATE_START + 5)
 
+#define UVC_STRING_CONTROL_IDX			0
+#define UVC_STRING_STREAMING_IDX		1
+
 struct uvc_request_data {
 	__s32 length;
 	__u8 data[60];
-- 
2.30.2

