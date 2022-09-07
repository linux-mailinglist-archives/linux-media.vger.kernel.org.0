Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F93A5B05FB
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 16:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiIGODH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 10:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiIGODE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 10:03:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406CE74CF4
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 07:03:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVvdr-0004By-Ac; Wed, 07 Sep 2022 16:02:59 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVvdn-004S11-Fa; Wed, 07 Sep 2022 16:02:57 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oVvdo-009ygK-HX; Wed, 07 Sep 2022 16:02:56 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v8 4/4] usb: gadget: uvc: add format/frame handling code
Date:   Wed,  7 Sep 2022 16:02:54 +0200
Message-Id: <20220907140254.2378109-5-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
References: <20220907140254.2378109-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hostside format selection is currently only done in userspace, as
the events for SET_CUR and GET_CUR are always moved to the application
layer. Since the v4l2 device parses the configfs data, the format
negotiation can be done in the kernel. This patch adds the functions to
set the current configuration while continuing to forward all unknown
events to the userspace level.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2:
   - fixed the commit message
   - changed pr_debug to pr_err in events_process_data
   - aligned many indentations
   - simplified uvc_events_process_data
   - fixed uvc_fill_streaming_control calls in uvcg_video_init
   - added setup_subscribed to decide if userspace takes over on EOPNOTSUPP
   - added data_subscribed to decide if userspace takes over on EOPNOTSUPP
   - removed duplicate send_response
   - wrting fmt and frm in full
v2 -> v3:
   - added find_format_index to set the right probe
v3 -> v4:
   - add function find_ival_index and use for cur_ival
   - fix swapped frame and format in uvc_events_process_data on uvc_fill_streaming_control
   - set proper resp.length on ep0 complete
   - dropped setting cur_probe on set_format since function was removed
   - added locking around getting correspondent cur_{frame,format,ival}
v4 -> v5:
   - fixed sparse errors reported by kernel test robot
v5 -> v6:
   - fixed the handling in uvc_function_ep0_complete after events_process_data
v6 -> v7:
   - set dwMaxPayloadTransferSize unconditionally from streaming_maxpacket
   - fixed check for interface with masking for 0xff
v7 -> v8:
   -

 drivers/usb/gadget/function/f_uvc.c     | 237 +++++++++++++++++++++++-
 drivers/usb/gadget/function/uvc.h       |  19 ++
 drivers/usb/gadget/function/uvc_v4l2.c  |  66 ++++++-
 drivers/usb/gadget/function/uvc_video.c |  12 +-
 4 files changed, 322 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index a8dcf5f01f16de..fc3fabc47018cd 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -16,7 +16,6 @@
 #include <linux/string.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
-#include <linux/usb/g_uvc.h>
 #include <linux/usb/video.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -204,21 +203,228 @@ static const struct usb_descriptor_header * const uvc_ss_streaming[] = {
  * Control requests
  */
 
+void uvc_fill_streaming_control(struct uvc_device *uvc,
+			   struct uvc_streaming_control *ctrl,
+			   int iframe, int iformat, unsigned int ival)
+{
+	struct f_uvc_opts *opts;
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+
+	/* Restrict the iformat, iframe and ival to valid values. Negative
+	 * values for ifrmat and iframe will result in the maximum valid value
+	 * being selected
+	 */
+	iformat = clamp((unsigned int)iformat, 1U,
+			(unsigned int)uvc->header->num_fmt);
+	uformat = find_format_by_index(uvc, iformat);
+	if (!uformat)
+		return;
+
+	iframe = clamp((unsigned int)iframe, 1U,
+		       (unsigned int)uformat->num_frames);
+	uframe = find_frame_by_index(uvc, uformat, iframe);
+	if (!uframe)
+		return;
+
+	ival = clamp((unsigned int)ival, 1U,
+		     (unsigned int)uframe->frame.b_frame_interval_type);
+	if (!uframe->dw_frame_interval[ival - 1])
+		return;
+
+	opts = fi_to_f_uvc_opts(uvc->func.fi);
+
+	memset(ctrl, 0, sizeof(*ctrl));
+
+	ctrl->bmHint = 1;
+	ctrl->bFormatIndex = iformat;
+	ctrl->bFrameIndex = iframe;
+	ctrl->dwFrameInterval = uframe->dw_frame_interval[ival - 1];
+	ctrl->dwMaxVideoFrameSize =
+		uframe->frame.dw_max_video_frame_buffer_size;
+
+	ctrl->dwMaxPayloadTransferSize = opts->streaming_maxpacket;
+	ctrl->bmFramingInfo = 3;
+	ctrl->bPreferedVersion = 1;
+	ctrl->bMaxVersion = 1;
+}
+
+static int uvc_events_process_data(struct uvc_device *uvc,
+				   struct usb_request *req)
+{
+	struct uvc_video *video = &uvc->video;
+	struct uvc_streaming_control *target;
+	struct uvc_streaming_control *ctrl;
+	struct uvcg_frame *uframe;
+	struct uvcg_format *uformat;
+
+	switch (video->control) {
+	case UVC_VS_PROBE_CONTROL:
+		pr_debug("setting probe control, length = %d\n", req->actual);
+		target = &video->probe;
+		break;
+
+	case UVC_VS_COMMIT_CONTROL:
+		pr_debug("setting commit control, length = %d\n", req->actual);
+		target = &video->commit;
+		break;
+
+	default:
+		pr_err("setting unknown control, length = %d\n", req->actual);
+		return -EOPNOTSUPP;
+	}
+
+	ctrl = (struct uvc_streaming_control *)req->buf;
+
+	uvc_fill_streaming_control(uvc, target, ctrl->bFrameIndex,
+			   ctrl->bFormatIndex, ctrl->dwFrameInterval);
+
+	if (video->control == UVC_VS_COMMIT_CONTROL) {
+		uformat = find_format_by_index(uvc, target->bFormatIndex);
+		if (!uformat)
+			return -EINVAL;
+
+		uframe = find_frame_by_index(uvc, uformat, ctrl->bFrameIndex);
+		if (!uframe)
+			return -EINVAL;
+
+		spin_lock(&video->frame_lock);
+
+		video->cur_frame = uframe;
+		video->cur_format = uformat;
+		video->cur_ival = find_ival_index(uframe, ctrl->dwFrameInterval);
+
+		spin_unlock(&video->frame_lock);
+	}
+
+	return 0;
+}
+
+static void
+uvc_events_process_streaming(struct uvc_device *uvc, uint8_t req, uint8_t cs,
+			     struct uvc_request_data *resp)
+{
+	struct uvc_streaming_control *ctrl;
+
+	pr_debug("streaming request (req %02x cs %02x)\n", req, cs);
+
+	if (cs != UVC_VS_PROBE_CONTROL && cs != UVC_VS_COMMIT_CONTROL)
+		return;
+
+	ctrl = (struct uvc_streaming_control *)&resp->data;
+	resp->length = sizeof(*ctrl);
+
+	switch (req) {
+	case UVC_SET_CUR:
+		uvc->video.control = cs;
+		resp->length = 34;
+		break;
+
+	case UVC_GET_CUR:
+		if (cs == UVC_VS_PROBE_CONTROL)
+			memcpy(ctrl, &uvc->video.probe, sizeof(*ctrl));
+		else
+			memcpy(ctrl, &uvc->video.commit, sizeof(*ctrl));
+		break;
+
+	case UVC_GET_MIN:
+	case UVC_GET_MAX:
+	case UVC_GET_DEF:
+		if (req == UVC_GET_MAX)
+			uvc_fill_streaming_control(uvc, ctrl, -1, -1, UINT_MAX);
+		else
+			uvc_fill_streaming_control(uvc, ctrl, 1, 1, 0);
+		break;
+
+	case UVC_GET_RES:
+		memset(ctrl, 0, sizeof(*ctrl));
+		break;
+
+	case UVC_GET_LEN:
+		resp->data[0] = 0x00;
+		resp->data[1] = 0x22;
+		resp->length = 2;
+		break;
+
+	case UVC_GET_INFO:
+		resp->data[0] = 0x03;
+		resp->length = 1;
+		break;
+	}
+}
+
+static int
+uvc_events_process_class(struct uvc_device *uvc,
+			 const struct usb_ctrlrequest *ctrl,
+			 struct uvc_request_data *resp)
+{
+	unsigned int interface = le16_to_cpu(ctrl->wIndex) & 0xff;
+
+	if ((ctrl->bRequestType & USB_RECIP_MASK) != USB_RECIP_INTERFACE)
+		return -EINVAL;
+
+	if (interface == uvc->control_intf)
+		return -EOPNOTSUPP;
+	else if (interface == uvc->streaming_intf)
+		uvc_events_process_streaming(uvc, ctrl->bRequest,
+					     le16_to_cpu(ctrl->wValue) >> 8,
+					     resp);
+
+	return 0;
+}
+
+static int
+uvc_events_process_setup(struct uvc_device *uvc,
+			 const struct usb_ctrlrequest *ctrl,
+			 struct uvc_request_data *resp)
+{
+	uvc->video.control = 0;
+
+	pr_debug("bRequestType %02x bRequest %02x wValue %04x wIndex %04x wLength %04x\n",
+		ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
+		ctrl->wIndex, ctrl->wLength);
+
+	switch (ctrl->bRequestType & USB_TYPE_MASK) {
+	case USB_TYPE_STANDARD:
+		return -EOPNOTSUPP;
+
+	case USB_TYPE_CLASS:
+		return uvc_events_process_class(uvc, ctrl, resp);
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static void
 uvc_function_ep0_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct uvc_device *uvc = req->context;
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	int ret;
 
 	if (uvc->event_setup_out) {
 		uvc->event_setup_out = 0;
 
-		memset(&v4l2_event, 0, sizeof(v4l2_event));
-		v4l2_event.type = UVC_EVENT_DATA;
-		uvc_event->data.length = req->actual;
-		memcpy(&uvc_event->data.data, req->buf, req->actual);
-		v4l2_event_queue(&uvc->vdev, &v4l2_event);
+		ret = uvc_events_process_data(uvc, req);
+		/* If we have a real error on process */
+		if (ret == -EINVAL) {
+			struct uvc_request_data resp;
+
+			memset(&resp, 0, sizeof(resp));
+			resp.length = -EL2HLT;
+
+			uvc_send_response(uvc, &resp);
+		} else if (ret == -EOPNOTSUPP && uvc->data_subscribed) {
+			memset(&v4l2_event, 0, sizeof(v4l2_event));
+			v4l2_event.type = UVC_EVENT_DATA;
+			uvc_event->data.length = req->actual;
+			memcpy(&uvc_event->data.data, req->buf, req->actual);
+			v4l2_event_queue(&uvc->vdev, &v4l2_event);
+		}
 	}
 }
 
@@ -228,6 +434,8 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	struct uvc_device *uvc = to_uvc(f);
 	struct v4l2_event v4l2_event;
 	struct uvc_event *uvc_event = (void *)&v4l2_event.u.data;
+	struct uvc_request_data resp;
+	int ret = 0;
 
 	if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_CLASS) {
 		uvcg_info(f, "invalid request type\n");
@@ -245,6 +453,23 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	uvc->event_setup_out = !(ctrl->bRequestType & USB_DIR_IN);
 	uvc->event_length = le16_to_cpu(ctrl->wLength);
 
+	memset(&resp, 0, sizeof(resp));
+	resp.length = -EL2HLT;
+
+	ret = uvc_events_process_setup(uvc, ctrl, &resp);
+	/* If we have no error on process */
+	if (!ret)
+		return uvc_send_response(uvc, &resp);
+
+	/* If we have a real error on process */
+	if (ret != -EOPNOTSUPP)
+		return ret;
+
+	/* If we have -EOPNOTSUPP */
+	if (!uvc->setup_subscribed)
+		return uvc_send_response(uvc, &resp);
+
+	/* If we have setup subscribed */
 	memset(&v4l2_event, 0, sizeof(v4l2_event));
 	v4l2_event.type = UVC_EVENT_SETUP;
 	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 8a71d0c4abbcd5..cdfd46f3a2861c 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -13,6 +13,8 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/usb/composite.h>
+#include <linux/usb/g_uvc.h>
+#include <linux/usb/video.h>
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 
@@ -95,6 +97,12 @@ struct uvc_video {
 	unsigned int cur_ival;
 
 	struct mutex mutex;	/* protects frame parameters */
+	spinlock_t frame_lock;
+
+	struct uvc_streaming_control probe;
+	struct uvc_streaming_control commit;
+
+	int control;
 
 	unsigned int uvc_num_requests;
 
@@ -131,6 +139,8 @@ struct uvc_device {
 	struct uvc_video video;
 	bool func_connected;
 	wait_queue_head_t func_connected_queue;
+	bool setup_subscribed;
+	bool data_subscribed;
 
 	struct uvcg_streaming_header *header;
 
@@ -187,5 +197,14 @@ extern struct uvcg_format *find_format_by_index(struct uvc_device *uvc,
 extern struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
 					      struct uvcg_format *uformat,
 					      int index);
+extern int find_format_index(struct uvc_device *uvc,
+			       struct uvcg_format *uformat);
+extern int find_ival_index(struct uvcg_frame *uframe, int dwFrameInterval);
+extern void uvc_fill_streaming_control(struct uvc_device *uvc,
+				       struct uvc_streaming_control *ctrl,
+				       int iframe, int iformat,
+				       unsigned int ival);
+extern int uvc_send_response(struct uvc_device *uvc,
+			     struct uvc_request_data *data);
 
 #endif /* _UVC_GADGET_H_ */
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 3311e98a040537..e4c4bebd2ee860 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -90,6 +90,33 @@ struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int index)
 	return uformat;
 }
 
+int find_format_index(struct uvc_device *uvc, struct uvcg_format *uformat)
+{
+	struct uvcg_format_ptr *format;
+	int i = 1;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (uformat == format->fmt)
+			return i;
+		i++;
+	}
+
+	return 0;
+}
+
+int find_ival_index(struct uvcg_frame *uframe, int dwFrameInterval)
+{
+	int i;
+
+	for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
+		if (dwFrameInterval == uframe->dw_frame_interval[i])
+			return i + 1;
+	}
+
+	/* fallback */
+	return 1;
+}
+
 struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
 				       struct uvcg_format *uformat,
 				       int index)
@@ -178,8 +205,7 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
  * Requests handling
  */
 
-static int
-uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
+int uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 {
 	struct usb_composite_dev *cdev = uvc->func.config->cdev;
 	struct usb_request *req = uvc->control_req;
@@ -221,6 +247,8 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct uvc_video *video = &uvc->video;
 	struct uvc_format_desc *fmtdesc;
 
+	spin_lock(&video->frame_lock);
+
 	fmtdesc = to_uvc_format(video->cur_format);
 
 	fmt->fmt.pix.pixelformat = fmtdesc->fcc;
@@ -231,6 +259,8 @@ uvc_v4l2_get_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	fmt->fmt.pix.sizeimage = video->imagesize;
 	fmt->fmt.pix.priv = 0;
 
+	spin_unlock(&video->frame_lock);
+
 	return 0;
 }
 
@@ -255,6 +285,7 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	struct uvc_video *video = &uvc->video;
 	struct uvcg_format *uformat;
 	struct uvcg_frame *uframe;
+	int iformat;
 	u8 *fcc;
 
 	if (fmt->type != video->queue.queue.type)
@@ -270,6 +301,10 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	if (!uformat)
 		return -EINVAL;
 
+	iformat = find_format_index(uvc, uformat);
+	if (!iformat)
+		return -EINVAL;
+
 	uframe = find_closest_frame_by_size(uvc, uformat,
 				fmt->fmt.pix.width, fmt->fmt.pix.height);
 	if (!uframe)
@@ -314,8 +349,12 @@ uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
 		if (fival->index >= 1)
 			return -EINVAL;
 
+		spin_lock(&video->frame_lock);
+
 		fival->discrete.numerator =
 			uframe->dw_frame_interval[video->cur_ival - 1];
+
+		spin_unlock(&video->frame_lock);
 	} else {
 		if (fival->index >= uframe->frame.b_frame_interval_type)
 			return -EINVAL;
@@ -347,8 +386,12 @@ uvc_v4l2_enum_framesizes(struct file *file, void *fh,
 		if (fsize->index >= 1)
 			return -EINVAL;
 
+		spin_lock(&video->frame_lock);
+
 		uformat = video->cur_format;
 		uframe = video->cur_frame;
+
+		spin_unlock(&video->frame_lock);
 	} else {
 		uformat = find_format_by_pix(uvc, fsize->pixel_format);
 		if (!uformat)
@@ -382,7 +425,11 @@ uvc_v4l2_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 		if (f->index >= 1)
 			return -EINVAL;
 
+		spin_lock(&video->frame_lock);
+
 		uformat = video->cur_format;
+
+		spin_unlock(&video->frame_lock);
 	} else {
 		if (f->index >= uvc->header->num_fmt)
 			return -EINVAL;
@@ -506,14 +553,20 @@ uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
 	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
 		return -EINVAL;
 
-	if (sub->type == UVC_EVENT_SETUP && uvc->func_connected)
+	if (sub->type == UVC_EVENT_STREAMON && uvc->func_connected)
 		return -EBUSY;
 
 	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
 	if (ret < 0)
 		return ret;
 
-	if (sub->type == UVC_EVENT_SETUP) {
+	if (sub->type == UVC_EVENT_SETUP)
+		uvc->setup_subscribed = true;
+
+	if (sub->type == UVC_EVENT_DATA)
+		uvc->data_subscribed = true;
+
+	if (sub->type == UVC_EVENT_STREAMON) {
 		uvc->func_connected = true;
 		handle->is_uvc_app_handle = true;
 		uvc_function_connect(uvc);
@@ -543,7 +596,10 @@ uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
 	if (ret < 0)
 		return ret;
 
-	if (sub->type == UVC_EVENT_SETUP && handle->is_uvc_app_handle) {
+	if (sub->type == UVC_EVENT_SETUP)
+		uvc->setup_subscribed = false;
+
+	if (sub->type == UVC_EVENT_STREAMON && handle->is_uvc_app_handle) {
 		uvc_v4l2_disable(uvc);
 		handle->is_uvc_app_handle = false;
 	}
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 37867c93073418..c20d832c4a0b8a 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -533,10 +533,11 @@ static int uvc_default_frame_interval(struct uvc_video *video)
  */
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
-	int iframe;
+	int iframe, iformat;
 
 	INIT_LIST_HEAD(&video->req_free);
 	spin_lock_init(&video->req_lock);
+	spin_lock_init(&video->frame_lock);
 	INIT_WORK(&video->pump, uvcg_video_pump);
 
 	if (list_empty(&uvc->header->formats))
@@ -547,6 +548,10 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	if (!video->cur_format)
 		return -EINVAL;
 
+	iformat = find_format_index(uvc, video->cur_format);
+	if (!iformat)
+		return -EINVAL;
+
 	iframe = uvc_frame_default(video->cur_format);
 	if (!iframe)
 		return -EINVAL;
@@ -557,6 +562,11 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 
 	video->cur_ival = uvc_default_frame_interval(video);
 
+	uvc_fill_streaming_control(uvc, &video->probe, iframe, iformat,
+				   video->cur_ival);
+	uvc_fill_streaming_control(uvc, &video->commit, iframe, iformat,
+				   video->cur_ival);
+
 	/* Initialize the video buffers queue. */
 	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
-- 
2.30.2

