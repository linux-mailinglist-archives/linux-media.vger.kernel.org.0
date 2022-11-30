Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B949C63D6AF
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 14:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbiK3N3E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 08:29:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiK3N3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 08:29:03 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738F055A91
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 05:29:01 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1p0N91-0000Ms-O7; Wed, 30 Nov 2022 14:28:59 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p0N90-001Jq3-2R; Wed, 30 Nov 2022 14:28:58 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1p0N90-005VxR-5R; Wed, 30 Nov 2022 14:28:58 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH v8] usb: gadget: uvc: add validate and fix function for uvc response
Date:   Wed, 30 Nov 2022 14:28:55 +0100
Message-Id: <20221130132855.1263114-1-m.grzeschik@pengutronix.de>
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

When the userspace gets the setup requests for UVC_GET_CUR, UVC_GET_MIN,
UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
needs to be validated. Since the kernel also knows the limits we can
return EINVAL if the userspace does try to send invalid data to the
host.

For UVC_GET_MAX and UVC_GET_MIN we fixup the bFrameIndex and
bFormatIndex to the correct boundaries. And for all other requests we
set valid dwFrameInterval, dwMaxPayloadTransferSize and
dwMaxVideoFrameSize if the userspace did not set any value at all.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1: -> v4:
- new patch
v4: -> v5:
- changed uvcg_info to uvcg_dbg for fixups, updated info strings
v5: -> v6:
- no changes
v6 -> v7:
- reworked to not need 'd182bf156c4c ("usb: gadget: uvc: default the ctrl request interface offsets")'
v7 -> v8:
- splitup validate and fix to separate functions
- only validate on UVC_GET_CUR
- return with EINVAL if validate fails
- fixup on UVC_GET_MIN, UVC_GET_MAX and UVC_GET_DEF
- rebased again on necessary patch 'd182bf156c4c ("usb: gadget: uvc: default the ctrl request interface offsets")'
- after validating one streaming request unset the current streaming_request

 drivers/usb/gadget/function/f_uvc.c    |   4 +-
 drivers/usb/gadget/function/uvc.h      |   1 +
 drivers/usb/gadget/function/uvc_v4l2.c | 154 +++++++++++++++++++++++++
 3 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 6e131624011a5e..098bd3c4e3c0b3 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -254,8 +254,10 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	 */
 	mctrl = &uvc_event->req;
 	mctrl->wIndex &= ~cpu_to_le16(0xff);
-	if (interface == uvc->streaming_intf)
+	if (interface == uvc->streaming_intf) {
+		uvc->streaming_request = ctrl->bRequest;
 		mctrl->wIndex = cpu_to_le16(UVC_STRING_STREAMING_IDX);
+	}
 
 	v4l2_event_queue(&uvc->vdev, &v4l2_event);
 
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 40226b1f7e148a..1be4d5f24b46bf 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -151,6 +151,7 @@ struct uvc_device {
 	void *control_buf;
 
 	unsigned int streaming_intf;
+	unsigned char streaming_request;
 
 	/* Events */
 	unsigned int event_length;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index a189b08bba800d..a5a109e7708f4b 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -178,6 +178,137 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
  * Requests handling
  */
 
+/* validate streaming ctrl request response data for valid parameters */
+static int
+uvc_validate_streaming_ctrl(struct uvc_device *uvc,
+			    struct uvc_streaming_control *ctrl)
+{
+	struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
+	unsigned int iformat, iframe;
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+	bool ival_found = false;
+	int i;
+
+	iformat = ctrl->bFormatIndex;
+	iframe = ctrl->bFrameIndex;
+
+	iformat = clamp((unsigned int)iformat, 1U,
+			(unsigned int)uvc->header->num_fmt);
+	if (iformat != ctrl->bFormatIndex) {
+		uvcg_dbg(&uvc->func,
+			 "invalid bFormatIndex set: %d\n",
+			 ctrl->bFormatIndex);
+		return -EINVAL;
+	}
+	uformat = find_format_by_index(uvc, iformat);
+
+	iframe = clamp((unsigned int)iframe, 1U,
+		       (unsigned int)uformat->num_frames);
+	if (iframe != ctrl->bFrameIndex) {
+		uvcg_dbg(&uvc->func,
+			 "invalid bFrameIndex set: %d\n",
+			 ctrl->bFrameIndex);
+		return -EINVAL;
+	}
+	uframe = find_frame_by_index(uvc, uformat, iframe);
+
+	if (ctrl->dwFrameInterval) {
+		for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
+			if (ctrl->dwFrameInterval ==
+				 uframe->dw_frame_interval[i]) {
+				ival_found = true;
+				break;
+			}
+		}
+		if (!ival_found) {
+			uvcg_dbg(&uvc->func,
+				 "invalid dwFrameInterval set: %d\n",
+				 ctrl->dwFrameInterval);
+			return -EINVAL;
+		}
+	}
+
+	if (ctrl->dwMaxPayloadTransferSize >
+				opts->streaming_maxpacket) {
+		uvcg_dbg(&uvc->func,
+			  "invalid dwMaxPayloadTransferSize set: %d\n",
+			  ctrl->dwMaxPayloadTransferSize);
+		return -EINVAL;
+	}
+
+	if (ctrl->dwMaxVideoFrameSize >
+				uframe->frame.dw_max_video_frame_buffer_size) {
+		uvcg_dbg(&uvc->func,
+			  "invalid dwMaxVideoFrameSize set: %d\n",
+			  ctrl->dwMaxVideoFrameSize);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void
+uvc_fixup_streaming_ctrl(struct uvc_device *uvc,
+			    struct uvc_streaming_control *ctrl)
+{
+	struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
+	unsigned int iformat, iframe;
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+
+	iformat = ctrl->bFormatIndex;
+	iframe = ctrl->bFrameIndex;
+
+	/* Fixup the bFormatIndex on UVC_GET_{MIN,MAX} events */
+	if (ctrl->bFormatIndex == U8_MAX || !ctrl->bFormatIndex) {
+		iformat = clamp((unsigned int)iformat, 1U,
+				(unsigned int)uvc->header->num_fmt);
+		ctrl->bFormatIndex = iformat;
+		uvcg_dbg(&uvc->func,
+			  "fixup bFormatIndex: %d\n",
+			  ctrl->bFormatIndex);
+	}
+
+	uformat = find_format_by_index(uvc, iformat);
+
+	/* Fixup the bFrameIndex on UVC_GET_{MIN,MAX} events */
+	if (ctrl->bFrameIndex == U8_MAX || !ctrl->bFrameIndex) {
+		iframe = clamp((unsigned int)iframe, 1U,
+			       (unsigned int)uformat->num_frames);
+		ctrl->bFrameIndex = iframe;
+		uvcg_dbg(&uvc->func,
+			  "fixup bFrameIndex: %d\n",
+			  ctrl->bFrameIndex);
+	}
+
+	uframe = find_frame_by_index(uvc, uformat, iframe);
+
+	/* Fixup values where the userspace does not set the paramters
+	 * but does handover the preparing of the values to the kernel.
+	 */
+	if (!ctrl->dwFrameInterval) {
+		ctrl->dwFrameInterval = uframe->frame.dw_default_frame_interval;
+		uvcg_dbg(&uvc->func,
+			  "fixup dwFrameInterval: %d\n",
+			  ctrl->dwFrameInterval);
+	}
+
+	if (!ctrl->dwMaxPayloadTransferSize) {
+		ctrl->dwMaxPayloadTransferSize = opts->streaming_maxpacket;
+		uvcg_dbg(&uvc->func,
+			  "fixup dwMaxPayloadTransferSize: %d\n",
+			  ctrl->dwMaxPayloadTransferSize);
+	}
+
+	if (!ctrl->dwMaxVideoFrameSize) {
+		ctrl->dwMaxVideoFrameSize = uvc_get_frame_size(uformat, uframe);
+		uvcg_dbg(&uvc->func,
+			  "fixup dwMaxVideoFrameSize: %d\n",
+			  ctrl->dwMaxVideoFrameSize);
+	}
+}
+
 static int
 uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 {
@@ -192,6 +323,29 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 
 	memcpy(req->buf, data->data, req->length);
 
+	/* validate the ctrl content and fixup */
+	if (!uvc->event_setup_out) {
+		struct uvc_streaming_control *ctrl = req->buf;
+		int ret;
+
+		switch (uvc->streaming_request) {
+		case UVC_GET_CUR:
+			ret = uvc_validate_streaming_ctrl(uvc, ctrl);
+			if (ret)
+				return ret;
+			fallthrough;
+		case UVC_GET_MIN:
+		case UVC_GET_MAX:
+		case UVC_GET_DEF:
+			uvc_fixup_streaming_ctrl(uvc, ctrl);
+			break;
+		default:
+			break;
+		}
+
+		uvc->streaming_request = UVC_RC_UNDEFINED;
+	}
+
 	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
 }
 
-- 
2.30.2

