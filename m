Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7743A5B271C
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 21:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiIHTsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 15:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiIHTsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 15:48:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF373F3BF0
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 12:47:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWNVE-0001Mf-PG; Thu, 08 Sep 2022 21:47:56 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWNVC-004gYH-65; Thu, 08 Sep 2022 21:47:56 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWNVC-00Fjp2-8t; Thu, 08 Sep 2022 21:47:54 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v13 3/6] usb: gadget: uvc: add v4l2 enumeration api calls
Date:   Thu,  8 Sep 2022 21:47:47 +0200
Message-Id: <20220908194750.3750310-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908194750.3750310-1-m.grzeschik@pengutronix.de>
References: <20220908194750.3750310-1-m.grzeschik@pengutronix.de>
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

This patch adds support to the v4l2 VIDIOCs for enum_format,
enum_framesizes and enum_frameintervals. This way, the userspace
application can use these VIDIOCS to query the via configfs exported
frame capabilities. With thes callbacks the userspace doesn't have to
bring its own configfs parser.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v13:
   - refactored the enum_ callbacks to this separate new patch
   - renamed +uvc_v4l2_enum_fmt to uvc_v4l2_enum_format
   - improved coding style
   - removed unused leftover variable uvc_video in enum functions

 drivers/usb/gadget/function/f_uvc.c    |  32 +++++
 drivers/usb/gadget/function/uvc.h      |   2 +
 drivers/usb/gadget/function/uvc_v4l2.c | 176 +++++++++++++++++++++++++
 3 files changed, 210 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index f4f6cf75930beb..7c416170b499e0 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -888,6 +888,7 @@ static void uvc_free(struct usb_function *f)
 	struct uvc_device *uvc = to_uvc(f);
 	struct f_uvc_opts *opts = container_of(f->fi, struct f_uvc_opts,
 					       func_inst);
+	config_item_put(&uvc->header->item);
 	--opts->refcnt;
 	kfree(uvc);
 }
@@ -941,6 +942,7 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	struct uvc_device *uvc;
 	struct f_uvc_opts *opts;
 	struct uvc_descriptor_header **strm_cls;
+	struct config_item *streaming, *header, *h;
 
 	uvc = kzalloc(sizeof(*uvc), GFP_KERNEL);
 	if (uvc == NULL)
@@ -973,6 +975,36 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
 	uvc->desc.fs_streaming = opts->fs_streaming;
 	uvc->desc.hs_streaming = opts->hs_streaming;
 	uvc->desc.ss_streaming = opts->ss_streaming;
+
+	streaming = config_group_find_item(&opts->func_inst.group, "streaming");
+	if (!streaming) {
+		config_item_put(streaming);
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	header = config_group_find_item(to_config_group(streaming), "header");
+	config_item_put(streaming);
+	if (!header) {
+		config_item_put(header);
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	h = config_group_find_item(to_config_group(header), "h");
+	config_item_put(header);
+	if (!h) {
+		config_item_put(h);
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	uvc->header = to_uvcg_streaming_header(h);
+	if (!uvc->header->linked) {
+		mutex_unlock(&opts->lock);
+		return ERR_PTR(-EBUSY);
+	}
+
 	++opts->refcnt;
 	mutex_unlock(&opts->lock);
 
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 58e383afdd4406..641cf2e7afaf6e 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -133,6 +133,8 @@ struct uvc_device {
 	bool func_connected;
 	wait_queue_head_t func_connected_queue;
 
+	struct uvcg_streaming_header *header;
+
 	/* Descriptors */
 	struct {
 		const struct uvc_descriptor_header * const *fs_control;
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 511f106f984375..63cb5a40306c75 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -18,12 +18,92 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-uvc.h>
 
 #include "f_uvc.h"
 #include "uvc.h"
 #include "uvc_queue.h"
 #include "uvc_video.h"
 #include "uvc_v4l2.h"
+#include "uvc_configfs.h"
+
+static struct uvc_format_desc *to_uvc_format(struct uvcg_format *uformat)
+{
+	char guid[16] = UVC_GUID_FORMAT_MJPEG;
+	struct uvc_format_desc *format;
+	struct uvcg_uncompressed *unc;
+
+	if (uformat->type == UVCG_UNCOMPRESSED) {
+		unc = to_uvcg_uncompressed(&uformat->group.cg_item);
+		if (!unc)
+			return ERR_PTR(-EINVAL);
+
+		memcpy(guid, unc->desc.guidFormat, sizeof(guid));
+	}
+
+	format = uvc_format_by_guid(guid);
+	if (!format)
+		return ERR_PTR(-EINVAL);
+
+	return format;
+}
+
+struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int index)
+{
+	struct uvcg_format_ptr *format;
+	struct uvcg_format *uformat = NULL;
+	int i = 1;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (index == i) {
+			uformat = format->fmt;
+			break;
+		}
+		i++;
+	}
+
+	return uformat;
+}
+
+struct uvcg_frame *find_frame_by_index(struct uvc_device *uvc,
+				       struct uvcg_format *uformat,
+				       int index)
+{
+	struct uvcg_format_ptr *format;
+	struct uvcg_frame_ptr *frame;
+	struct uvcg_frame *uframe = NULL;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		if (format->fmt->type != uformat->type)
+			continue;
+		list_for_each_entry(frame, &format->fmt->frames, entry) {
+			if (index == frame->frm->frame.b_frame_index) {
+				uframe = frame->frm;
+				break;
+			}
+		}
+	}
+
+	return uframe;
+}
+
+static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
+					      u32 pixelformat)
+{
+	struct uvcg_format_ptr *format;
+	struct uvcg_format *uformat = NULL;
+
+	list_for_each_entry(format, &uvc->header->formats, entry) {
+		struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
+
+		if (fmtdesc->fcc == pixelformat) {
+			uformat = format->fmt;
+			break;
+		}
+	}
+
+	return uformat;
+}
 
 /* --------------------------------------------------------------------------
  * Requests handling
@@ -134,6 +214,99 @@ uvc_v4l2_set_format(struct file *file, void *fh, struct v4l2_format *fmt)
 	return 0;
 }
 
+static int
+uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
+		struct v4l2_frmivalenum *fival)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvcg_format *uformat = NULL;
+	struct uvcg_frame *uframe = NULL;
+	struct uvcg_frame_ptr *frame;
+
+	uformat = find_format_by_pix(uvc, fival->pixel_format);
+	if (!uformat)
+		return -EINVAL;
+
+	list_for_each_entry(frame, &uformat->frames, entry) {
+		if (frame->frm->frame.w_width == fival->width &&
+		    frame->frm->frame.w_height == fival->height) {
+			uframe = frame->frm;
+			break;
+		}
+	}
+	if (!uframe)
+		return -EINVAL;
+
+	if (fival->index >= uframe->frame.b_frame_interval_type)
+		return -EINVAL;
+
+	fival->discrete.numerator =
+		uframe->dw_frame_interval[fival->index];
+
+	/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete.denominator = 10000000;
+	v4l2_simplify_fraction(&fival->discrete.numerator,
+		&fival->discrete.denominator, 8, 333);
+
+	return 0;
+}
+
+static int
+uvc_v4l2_enum_framesizes(struct file *file, void *fh,
+		struct v4l2_frmsizeenum *fsize)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvcg_format *uformat = NULL;
+	struct uvcg_frame *uframe = NULL;
+
+	uformat = find_format_by_pix(uvc, fsize->pixel_format);
+	if (!uformat)
+		return -EINVAL;
+
+	if (fsize->index >= uformat->num_frames)
+		return -EINVAL;
+
+	uframe = find_frame_by_index(uvc, uformat, fsize->index + 1);
+	if (!uframe)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = uframe->frame.w_width;
+	fsize->discrete.height = uframe->frame.w_height;
+
+	return 0;
+}
+
+static int
+uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct uvc_device *uvc = video_get_drvdata(vdev);
+	struct uvc_format_desc *fmtdesc;
+	struct uvcg_format *uformat;
+
+	if (f->index >= uvc->header->num_fmt)
+		return -EINVAL;
+
+	uformat = find_format_by_index(uvc, f->index + 1);
+	if (!uformat)
+		return -EINVAL;
+
+	if (uformat->type != UVCG_UNCOMPRESSED)
+		f->flags |= V4L2_FMT_FLAG_COMPRESSED;
+
+	fmtdesc = to_uvc_format(uformat);
+	f->pixelformat = fmtdesc->fcc;
+
+	strscpy(f->description, fmtdesc->name, sizeof(f->description));
+	f->description[strlen(fmtdesc->name) - 1] = 0;
+
+	return 0;
+}
+
 static int
 uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
 {
@@ -300,6 +473,9 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
 	.vidioc_querycap = uvc_v4l2_querycap,
 	.vidioc_g_fmt_vid_out = uvc_v4l2_get_format,
 	.vidioc_s_fmt_vid_out = uvc_v4l2_set_format,
+	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
+	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
+	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
 	.vidioc_reqbufs = uvc_v4l2_reqbufs,
 	.vidioc_querybuf = uvc_v4l2_querybuf,
 	.vidioc_qbuf = uvc_v4l2_qbuf,
-- 
2.30.2

