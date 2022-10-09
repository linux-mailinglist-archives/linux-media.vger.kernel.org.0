Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027825F9197
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 00:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbiJIWfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 18:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbiJIWdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 18:33:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8B83ED5D
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 15:20:14 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oheeR-000407-I5; Mon, 10 Oct 2022 00:20:03 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oheeQ-000Zdc-Px; Mon, 10 Oct 2022 00:20:02 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oheeQ-007VmL-2Z; Mon, 10 Oct 2022 00:20:02 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH] usb: gadget: uvc: mark the ctrl request for the streaming interface
Date:   Mon, 10 Oct 2022 00:20:00 +0200
Message-Id: <20221009222000.1790385-1-m.grzeschik@pengutronix.de>
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

For the userspace it is needed to distinguish between reqeuests for the
control or streaming interace. The userspace would have to parse the
configfs to know which interface index it has to compare the ctrl
requests against, since the interface numbers are not fixed, e.g. for
composite gadgets.

The kernel has this information when handing over the ctrl request to
the userspace. This patch adds a variable to indicate if the ctrl
request was meant for the streaming interface.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_uvc.c | 6 ++++++
 include/uapi/linux/usb/g_uvc.h      | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 6e196e06181ecf..132d47798c0f13 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -228,6 +228,7 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	struct uvc_device *uvc = to_uvc(f);
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	unsigned int interface = le16_to_cpu(ctrl->wIndex) & 0xff;
 
 	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) {
 		uvcg_info(f, "invalid request type\n");
@@ -246,6 +247,11 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	uvc->event_length = le16_to_cpu(ctrl->wLength);
 
 	memset(&v4l2_event, 0, sizeof(v4l2_event));
+
+	/* check for the interface number, so the userspace doesn't have to */
+	if (interface == uvc->streaming_intf)
+		uvc_event->ctrlreq_streaming = 1;
+
 	v4l2_event.type = UVC_EVENT_SETUP;
 	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
 	v4l2_event_queue(&uvc->vdev, &v4l2_event);
diff --git a/include/uapi/linux/usb/g_uvc.h b/include/uapi/linux/usb/g_uvc.h
index 652f169a019e7d..8711d706e5bfb0 100644
--- a/include/uapi/linux/usb/g_uvc.h
+++ b/include/uapi/linux/usb/g_uvc.h
@@ -27,6 +27,8 @@ struct uvc_request_data {
 };
 
 struct uvc_event {
+	/* indicate if the ctrl request is for the streaming interface */
+	__u8 ctrlreq_streaming;
 	union {
 		enum usb_device_speed speed;
 		struct usb_ctrlrequest req;
-- 
2.30.2

