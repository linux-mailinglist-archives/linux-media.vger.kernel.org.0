Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42D56C66EB
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbjCWLlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbjCWLlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5438E1B327
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:35 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJK1-0007OB-6p; Thu, 23 Mar 2023 12:41:33 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 23 Mar 2023 12:41:16 +0100
Subject: [PATCH 8/8] usb: gadget: uvc: implement s/g_parm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-uvc-gadget-cleanup-v1-8-e41f0c5d9d8e@pengutronix.de>
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

As the UVC gadget implements ENUM_FRAMEINTERVALS it should also
implement S_PARM and G_PARM to allow to get and set the frame interval.
While the driver doesn't actually do something with the frame interval,
it should still handle and store the interval correctly, if the user
space request it.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/usb/gadget/function/uvc.h      |  1 +
 drivers/usb/gadget/function/uvc_v4l2.c | 94 ++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 6b4ab3e07173..a9a5a9d2f554 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -96,6 +96,7 @@ struct uvc_video {
 	unsigned int width;
 	unsigned int height;
 	unsigned int imagesize;
+	struct v4l2_fract timeperframe;
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 673532ff0faa..a9564dc2445d 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -185,6 +185,9 @@ void uvc_init_default_format(struct uvc_device *uvc)
 		video->xfer_func = V4L2_XFER_FUNC_SRGB;
 		video->ycbcr_enc = V4L2_YCBCR_ENC_601;
 
+		video->timeperframe.numerator = 1;
+		video->timeperframe.denominator = 30;
+
 		return;
 	}
 
@@ -209,6 +212,11 @@ void uvc_init_default_format(struct uvc_device *uvc)
 	video->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	video->xfer_func = V4L2_XFER_FUNC_SRGB;
 	video->ycbcr_enc = V4L2_YCBCR_ENC_601;
+
+	video->timeperframe.numerator = uframe->frame.dw_default_frame_interval;
+	video->timeperframe.denominator = 10000000;
+	v4l2_simplify_fraction(&video->timeperframe.numerator,
+			       &video->timeperframe.denominator, 8, 333);
 }
 
 static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
@@ -255,6 +263,46 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
 	return uframe;
 }
 
+static void find_closest_timeperframe(struct uvc_device *uvc,
+				      struct v4l2_fract *timeperframe)
+{
+	struct uvc_video *video = &uvc->video;
+	struct uvcg_format *uformat;
+	struct uvcg_frame *uframe;
+	unsigned long interval;
+	unsigned int best_interval;
+	unsigned int curr;
+	unsigned int dist;
+	unsigned int best_dist = UINT_MAX;
+	int i;
+
+	if (timeperframe->denominator == 0)
+		timeperframe->denominator = video->timeperframe.denominator;
+	if (timeperframe->numerator == 0)
+		timeperframe->numerator = video->timeperframe.numerator;
+
+	uformat = find_format_by_pix(uvc, video->fcc);
+	uframe = find_closest_frame_by_size(uvc, uformat,
+					    video->width, video->height);
+
+	interval = timeperframe->numerator * 10000000;
+	do_div(interval, timeperframe->denominator);
+
+	for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
+		curr = uframe->dw_frame_interval[i];
+		dist = interval > curr ? interval - curr : curr - interval;
+		if (dist < best_dist) {
+			best_dist = dist;
+			best_interval = curr;
+		}
+	}
+
+	timeperframe->numerator = best_interval;
+	timeperframe->denominator = 10000000;
+	v4l2_simplify_fraction(&timeperframe->numerator,
+			       &timeperframe->denominator, 8, 333);
+}
+
 /* --------------------------------------------------------------------------
  * Requests handling
  */
@@ -456,6 +504,50 @@ uvc_v4l2_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
+static int
+uvc_v4l2_s_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+	struct v4l2_outputparm *out;
+
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	out = &parm->parm.output;
+
+	memset(out->reserved, 0, sizeof(out->reserved));
+
+	out->capability = V4L2_CAP_TIMEPERFRAME;
+	find_closest_timeperframe(uvc, &out->timeperframe);
+
+	video->timeperframe = out->timeperframe;
+
+	return 0;
+}
+
+static int
+uvc_v4l2_g_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_video *video = &uvc->video;
+	struct v4l2_outputparm *out;
+
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return -EINVAL;
+
+	out = &parm->parm.output;
+
+	out->capability |= V4L2_CAP_TIMEPERFRAME;
+	out->timeperframe = video->timeperframe;
+
+	return 0;
+}
+
 static int
 uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 {
@@ -671,6 +763,8 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
 	.vidioc_s_fmt_vid_out = uvc_v4l2_set_format,
 	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
 	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
+	.vidioc_g_parm = uvc_v4l2_g_parm,
+	.vidioc_s_parm = uvc_v4l2_s_parm,
 	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
 	.vidioc_enum_output = uvc_v4l2_enum_output,
 	.vidioc_g_output = uvc_v4l2_g_output,

-- 
2.30.2
