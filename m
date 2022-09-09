Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696BB5B3F4F
	for <lists+linux-media@lfdr.de>; Fri,  9 Sep 2022 21:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiIITQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Sep 2022 15:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiIITQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Sep 2022 15:16:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253D213B54C
        for <linux-media@vger.kernel.org>; Fri,  9 Sep 2022 12:16:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWjUM-0005iz-T5; Fri, 09 Sep 2022 21:16:31 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWjUK-004sQO-9D; Fri, 09 Sep 2022 21:16:30 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWjUK-00HZkO-Ve; Fri, 09 Sep 2022 21:16:28 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v1 4/4] usb: gadget: uvc: add v4l2 try_format api call
Date:   Fri,  9 Sep 2022 21:16:27 +0200
Message-Id: <20220909191627.4188908-5-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909191627.4188908-1-m.grzeschik@pengutronix.de>
References: <20220909191627.4188908-1-m.grzeschik@pengutronix.de>
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

This patch adds the uvc_v4l2_try_format api call to validate
the setting of v4l2_format. It will fallback to the nearest
allowed framesize.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v13 -> v1:
    - moved to this smaller patch series

 drivers/usb/gadget/function/uvc_v4l2.c | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 00c107ed30796b..60e477ce42d4e7 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -48,6 +48,31 @@ static struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
 	return format;
 }
 
+static int uvc_v4l2_get_bytesperline(struct uvcg_format *uformat,
+			      struct uvcg_frame *uframe)
+{
+	struct uvcg_uncompressed *u;
+
+	if (uformat->type == UVCG_UNCOMPRESSED) {
+		u = to_uvcg_uncompressed(&uformat->group.cg_item);
+		if (!u)
+			return 0;
+
+		return u->desc.bBitsPerPixel * uframe->frame.w_width / 8;
+	}
+
+	return 0;
+}
+
+int uvc_get_frame_size(struct uvcg_format *uformat,
+		       struct uvcg_frame *uframe)
+{
+	unsigned int bpl = uvc_v4l2_get_bytesperline(uformat, uframe);
+
+	return bpl ? bpl * uframe->frame.w_height :
+		uframe->frame.dw_max_video_frame_buffer_size;
+}
+
 struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int index)
 {
 	struct uvcg_format_ptr *format;
@@ -105,6 +130,50 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
 	return uformat;
 }
 
+static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
+					   struct uvcg_format *uformat,
+					   u16 rw, u16 rh)
+{
+	struct uvc_video *video = &uvc->video;
+	struct uvcg_format_ptr *format;
+	struct uvcg_frame_ptr *frame;
+	struct uvcg_frame *uframe = NULL;
+	unsigned int d, maxd;
+
+	/* Find the closest image size. The distance between image sizes is
+	 * the size in pixels of the non-overlapping regions between the
+	 * requested size and the frame-specified size.
+	 */
+	maxd = (unsigned int)-1;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (format->fmt->type != uformat->type)
+			continue;
+
+		list_for_each_entry(frame, &format->fmt->frames, entry) {
+			u16 w, h;
+
+			w = frame->frm->frame.w_width;
+			h = frame->frm->frame.w_height;
+
+			d = min(w, rw) * min(h, rh);
+			d = w*h + rw*rh - 2*d;
+			if (d < maxd) {
+				maxd = d;
+				uframe = frame->frm;
+			}
+
+			if (maxd == 0)
+				break;
+		}
+	}
+
+	if (!uframe)
+		uvcg_dbg(&video->uvc->func, "Unsupported size %ux%u\n", rw, rh);
+
+	return uframe;
+}
+
 /* --------------------------------------------------------------------------
  * Requests handling
  */
@@ -214,6 +283,46 @@ uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	return 0;
 }
 
+static int
+uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+	u8 *fcc;
+
+	if (fmt->type != video->queue.queue.type)
+		return -EINVAL;
+
+	fcc = (u8 *)&fmt->fmt.pix.pixelformat;
+	uvcg_dbg(&uvc->func, "Trying format 0x%08x (%c%c%c%c): %ux%u\n",
+		fmt->fmt.pix.pixelformat,
+		fcc[0], fcc[1], fcc[2], fcc[3],
+		fmt->fmt.pix.width, fmt->fmt.pix.height);
+
+	uformat = find_format_by_pix(uvc, fmt->fmt.pix.pixelformat);
+	if (!uformat)
+		return -EINVAL;
+
+	uframe = find_closest_frame_by_size(uvc, uformat,
+				fmt->fmt.pix.width, fmt->fmt.pix.height);
+	if (!uframe)
+		return -EINVAL;
+
+	fmt->fmt.pix.width = uframe->frame.w_width;
+	fmt->fmt.pix.height = uframe->frame.w_height;
+	fmt->fmt.pix.field = V4L2_FIELD_NONE;
+	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(uformat, uframe);
+	fmt->fmt.pix.sizeimage = uvc_get_frame_size(uformat, uframe);
+	fmt->fmt.pix.pixelformat = to_uvc_format(uformat)->fcc;
+	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->fmt.pix.priv = 0;
+
+	return 0;
+}
+
 static int
 uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
 		struct v4l2_frmivalenum *fival)
@@ -471,6 +580,7 @@ uvc_v4l2_ioctl_default(struct file *file, void *fh, bool valid_prio,
 
 const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
 	.vidioc_querycap = uvc_v4l2_querycap,
+	.vidioc_try_fmt_vid_out = uvc_v4l2_try_format,
 	.vidioc_g_fmt_vid_out = uvc_v4l2_get_format,
 	.vidioc_s_fmt_vid_out = uvc_v4l2_set_format,
 	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
-- 
2.30.2

