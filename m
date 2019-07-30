Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709527A159
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 08:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfG3GiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 02:38:22 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:37383 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726546AbfG3GiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 02:38:21 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3159:f139:4aff:7185])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sLm5hAKSWqTdhsLm6hkdQU; Tue, 30 Jul 2019 08:38:18 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] omap_vout: fix various v4l2-compliance failures
Date:   Tue, 30 Jul 2019 08:38:16 +0200
Message-Id: <20190730063817.47674-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730063817.47674-1-hverkuil-cisco@xs4all.nl>
References: <20190730063817.47674-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNCABzaRMCy4mrLv+GCudo+fTMXV3SjWaE05MHk1ZJjriUyBPqEa1piSY5BsqWYFzvbQ5WNWU0mMku8SXgyKsvajL5E/Dm4x5Q6AOkId93rgM1kKmsbF
 5sk81JCkUFGwcLJzZSlJ4BJwWvqD44LEOGHKYCd6NFRq2a7YCUGfeIAufziJE6DOoc63iVpDbYgnE6KtgNyZRaEMyEZ6IC8xAoau2dsjdNcrXCyOVaqC5W/E
 rkx5pdHnMIk7e+qp1cKe4uwcRQBWuy5j79YWS+hLilz9N+Bj6abEDB8dAB8nQ/FIy4WkFSzK8rOcN8ugCn5ncmDCWauXG4+UpuJNbGyIEJ7XwCPReyxIBNxK
 RabAWk1ON8KO32YXhH+qX+nwHxclPA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the following v4l2-compliance failures:

- FIELD_ANY could be returned, which is not allowed.
- JPEG colorspace was set instead of SRGB.
- No control events.
- Empty bus_info in QUERYCAP.
- Overlay format handling wasn't zeroing bitmap/clips and
  didn't return the chromakey correctly.
- G_FBUF didn't fill in many of the v4l2_framebuffer values.
  Now also return the base address of the corresponding
  framebuffer that this overlays.
- Missing ENUM/G/S_OUTPUT ioctls.
- ROTATE/VFLIP controls were added when the HW didn't support them.

With these changes 'v4l2-compliance' passes all non-streaming tests.

Tested on a Pandaboard and a Beagle XM board.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/omap/omap_vout.c    | 170 ++++++++++++++++-----
 drivers/media/platform/omap/omap_voutlib.c |   6 +-
 2 files changed, 134 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
index b0f03c2ca65d..6d31c34e168d 100644
--- a/drivers/media/platform/omap/omap_vout.c
+++ b/drivers/media/platform/omap/omap_vout.c
@@ -43,6 +43,7 @@
 #include <media/videobuf-dma-contig.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
 
 #include <video/omapvrfb.h>
 #include <video/omapfb_dss.h>
@@ -159,13 +160,13 @@ static int omap_vout_try_format(struct v4l2_pix_format *pix)
 		ifmt = 0;
 
 	pix->pixelformat = omap_formats[ifmt].pixelformat;
-	pix->field = V4L2_FIELD_ANY;
+	pix->field = V4L2_FIELD_NONE;
 
 	switch (pix->pixelformat) {
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_UYVY:
 	default:
-		pix->colorspace = V4L2_COLORSPACE_JPEG;
+		pix->colorspace = V4L2_COLORSPACE_SRGB;
 		bpp = YUYV_BPP;
 		break;
 	case V4L2_PIX_FMT_RGB565:
@@ -836,10 +837,16 @@ static void omap_vout_buffer_release(struct videobuf_queue *q,
 static __poll_t omap_vout_poll(struct file *file,
 				   struct poll_table_struct *wait)
 {
+	__poll_t req_events = poll_requested_events(wait);
 	struct omap_vout_device *vout = video_drvdata(file);
 	struct videobuf_queue *q = &vout->vbq;
+	__poll_t res = 0;
 
-	return videobuf_poll_stream(file, q, wait);
+	if (req_events & EPOLLPRI)
+		res = v4l2_ctrl_poll(file, wait);
+	if (req_events & (EPOLLOUT | EPOLLWRNORM))
+		res |= videobuf_poll_stream(file, q, wait);
+	return res;
 }
 
 static void omap_vout_vm_open(struct vm_area_struct *vma)
@@ -1039,7 +1046,8 @@ static int vidioc_querycap(struct file *file, void *fh,
 
 	strscpy(cap->driver, VOUT_NAME, sizeof(cap->driver));
 	strscpy(cap->card, vout->vfd->name, sizeof(cap->card));
-	cap->bus_info[0] = '\0';
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s.%d", VOUT_NAME, vout->vid);
 	return 0;
 }
 
@@ -1176,12 +1184,8 @@ static int vidioc_try_fmt_vid_overlay(struct file *file, void *fh,
 
 	ret = omap_vout_try_window(&vout->fbuf, win);
 
-	if (!ret) {
-		if ((ovl->caps & OMAP_DSS_OVL_CAP_GLOBAL_ALPHA) == 0)
-			win->global_alpha = 255;
-		else
-			win->global_alpha = f->fmt.win.global_alpha;
-	}
+	if (!ret && !(ovl->caps & OMAP_DSS_OVL_CAP_GLOBAL_ALPHA))
+		win->global_alpha = 0;
 
 	return ret;
 }
@@ -1201,13 +1205,35 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *fh,
 
 	ret = omap_vout_new_window(&vout->crop, &vout->win, &vout->fbuf, win);
 	if (!ret) {
+		enum omap_dss_trans_key_type key_type =
+			OMAP_DSS_COLOR_KEY_GFX_DST;
+		int enable;
+
 		/* Video1 plane does not support global alpha on OMAP3 */
-		if ((ovl->caps & OMAP_DSS_OVL_CAP_GLOBAL_ALPHA) == 0)
-			vout->win.global_alpha = 255;
+		if (ovl->caps & OMAP_DSS_OVL_CAP_GLOBAL_ALPHA)
+			vout->win.global_alpha = win->global_alpha;
+		else
+			win->global_alpha = 0;
+		if (vout->fbuf.flags & (V4L2_FBUF_FLAG_CHROMAKEY |
+					V4L2_FBUF_FLAG_SRC_CHROMAKEY))
+			enable = 1;
 		else
-			vout->win.global_alpha = f->fmt.win.global_alpha;
+			enable = 0;
+		if (vout->fbuf.flags & V4L2_FBUF_FLAG_SRC_CHROMAKEY)
+			key_type = OMAP_DSS_COLOR_KEY_VID_SRC;
+
+		if (ovl->manager && ovl->manager->get_manager_info &&
+		    ovl->manager->set_manager_info) {
+			struct omap_overlay_manager_info info;
 
-		vout->win.chromakey = f->fmt.win.chromakey;
+			ovl->manager->get_manager_info(ovl->manager, &info);
+			info.trans_enabled = enable;
+			info.trans_key_type = key_type;
+			info.trans_key = vout->win.chromakey;
+
+			if (ovl->manager->set_manager_info(ovl->manager, &info))
+				ret = -EINVAL;
+		}
 	}
 	mutex_unlock(&vout->lock);
 	return ret;
@@ -1216,11 +1242,9 @@ static int vidioc_s_fmt_vid_overlay(struct file *file, void *fh,
 static int vidioc_g_fmt_vid_overlay(struct file *file, void *fh,
 			struct v4l2_format *f)
 {
-	u32 key_value =  0;
 	struct omap_overlay *ovl;
 	struct omapvideo_info *ovid;
 	struct omap_vout_device *vout = video_drvdata(file);
-	struct omap_overlay_manager_info info;
 	struct v4l2_window *win = &f->fmt.win;
 
 	ovid = &vout->vid_info;
@@ -1228,13 +1252,14 @@ static int vidioc_g_fmt_vid_overlay(struct file *file, void *fh,
 
 	win->w = vout->win.w;
 	win->field = vout->win.field;
-	win->global_alpha = vout->win.global_alpha;
-
-	if (ovl->manager && ovl->manager->get_manager_info) {
-		ovl->manager->get_manager_info(ovl->manager, &info);
-		key_value = info.trans_key;
-	}
-	win->chromakey = key_value;
+	win->chromakey = vout->win.chromakey;
+	if (ovl->caps & OMAP_DSS_OVL_CAP_GLOBAL_ALPHA)
+		win->global_alpha = vout->win.global_alpha;
+	else
+		win->global_alpha = 0;
+	win->clips = NULL;
+	win->clipcount = 0;
+	win->bitmap = NULL;
 	return 0;
 }
 
@@ -1733,15 +1758,34 @@ static int vidioc_g_fbuf(struct file *file, void *fh,
 	struct omapvideo_info *ovid;
 	struct omap_vout_device *vout = video_drvdata(file);
 	struct omap_overlay_manager_info info;
+	struct omap_video_timings *timing;
+	struct omap_dss_device *dssdev;
 
 	ovid = &vout->vid_info;
 	ovl = ovid->overlays[0];
+	/* get the display device attached to the overlay */
+	dssdev = ovl->get_device(ovl);
 
-	/* The video overlay must stay within the framebuffer and can't be
-	   positioned independently. */
-	a->flags = V4L2_FBUF_FLAG_OVERLAY;
-	a->capability = V4L2_FBUF_CAP_LOCAL_ALPHA | V4L2_FBUF_CAP_CHROMAKEY
-		| V4L2_FBUF_CAP_SRC_CHROMAKEY;
+	if (!dssdev)
+		return -EINVAL;
+
+	timing = &dssdev->panel.timings;
+
+	vout->fbuf.fmt.height = timing->y_res;
+	vout->fbuf.fmt.width = timing->x_res;
+	a->fmt.field = V4L2_FIELD_NONE;
+	a->fmt.colorspace = V4L2_COLORSPACE_SRGB;
+	a->fmt.pixelformat = V4L2_PIX_FMT_RGBA32;
+	a->fmt.height = vout->fbuf.fmt.height;
+	a->fmt.width = vout->fbuf.fmt.width;
+	a->fmt.bytesperline = vout->fbuf.fmt.width * 4;
+	a->fmt.sizeimage = a->fmt.height * a->fmt.bytesperline;
+	a->base = vout->fbuf.base;
+
+	a->flags = vout->fbuf.flags;
+	a->capability = vout->fbuf.capability;
+	a->flags &= ~(V4L2_FBUF_FLAG_SRC_CHROMAKEY | V4L2_FBUF_FLAG_CHROMAKEY |
+		      V4L2_FBUF_FLAG_LOCAL_ALPHA);
 
 	if (ovl->manager && ovl->manager->get_manager_info) {
 		ovl->manager->get_manager_info(ovl->manager, &info);
@@ -1749,9 +1793,6 @@ static int vidioc_g_fbuf(struct file *file, void *fh,
 			a->flags |= V4L2_FBUF_FLAG_SRC_CHROMAKEY;
 		if (info.trans_key_type == OMAP_DSS_COLOR_KEY_GFX_DST)
 			a->flags |= V4L2_FBUF_FLAG_CHROMAKEY;
-	}
-	if (ovl->manager && ovl->manager->get_manager_info) {
-		ovl->manager->get_manager_info(ovl->manager, &info);
 		if (info.partial_alpha_enabled)
 			a->flags |= V4L2_FBUF_FLAG_LOCAL_ALPHA;
 	}
@@ -1759,6 +1800,27 @@ static int vidioc_g_fbuf(struct file *file, void *fh,
 	return 0;
 }
 
+static int vidioc_enum_output(struct file *file, void *priv_fh,
+				 struct v4l2_output *out)
+{
+	if (out->index)
+		return -EINVAL;
+	snprintf(out->name, sizeof(out->name), "Overlay");
+	out->type = V4L2_OUTPUT_TYPE_ANALOGVGAOVERLAY;
+	return 0;
+}
+
+static int vidioc_g_output(struct file *file, void *priv_fh, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int vidioc_s_output(struct file *file, void *priv_fh, unsigned int i)
+{
+	return i ? -EINVAL : 0;
+}
+
 static const struct v4l2_ioctl_ops vout_ioctl_ops = {
 	.vidioc_querycap			= vidioc_querycap,
 	.vidioc_enum_fmt_vid_out		= vidioc_enum_fmt_vid_out,
@@ -1772,12 +1834,17 @@ static const struct v4l2_ioctl_ops vout_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_overlay		= vidioc_g_fmt_vid_overlay,
 	.vidioc_g_selection			= vidioc_g_selection,
 	.vidioc_s_selection			= vidioc_s_selection,
+	.vidioc_enum_output			= vidioc_enum_output,
+	.vidioc_g_output			= vidioc_g_output,
+	.vidioc_s_output			= vidioc_s_output,
 	.vidioc_reqbufs				= vidioc_reqbufs,
 	.vidioc_querybuf			= vidioc_querybuf,
 	.vidioc_qbuf				= vidioc_qbuf,
 	.vidioc_dqbuf				= vidioc_dqbuf,
 	.vidioc_streamon			= vidioc_streamon,
 	.vidioc_streamoff			= vidioc_streamoff,
+	.vidioc_subscribe_event			= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event		= v4l2_event_unsubscribe,
 };
 
 static const struct v4l2_file_operations omap_vout_fops = {
@@ -1808,32 +1875,41 @@ static int __init omap_vout_setup_video_data(struct omap_vout_device *vout)
 
 	/* Default pixel format is RGB 5-6-5 */
 	pix->pixelformat = V4L2_PIX_FMT_RGB565;
-	pix->field = V4L2_FIELD_ANY;
+	pix->field = V4L2_FIELD_NONE;
 	pix->bytesperline = pix->width * 2;
 	pix->sizeimage = pix->bytesperline * pix->height;
-	pix->colorspace = V4L2_COLORSPACE_JPEG;
+	pix->colorspace = V4L2_COLORSPACE_SRGB;
 
 	vout->bpp = RGB565_BPP;
 	vout->fbuf.fmt.width  =  display->panel.timings.x_res;
 	vout->fbuf.fmt.height =  display->panel.timings.y_res;
 
 	/* Set the data structures for the overlay parameters*/
-	vout->win.global_alpha = 255;
-	vout->fbuf.flags = 0;
+	vout->fbuf.flags = V4L2_FBUF_FLAG_OVERLAY;
 	vout->fbuf.capability = V4L2_FBUF_CAP_LOCAL_ALPHA |
-		V4L2_FBUF_CAP_SRC_CHROMAKEY | V4L2_FBUF_CAP_CHROMAKEY;
-	vout->win.chromakey = 0;
+		V4L2_FBUF_CAP_SRC_CHROMAKEY | V4L2_FBUF_CAP_CHROMAKEY |
+		V4L2_FBUF_CAP_EXTERNOVERLAY;
+	if (ovl->caps & OMAP_DSS_OVL_CAP_GLOBAL_ALPHA) {
+		vout->win.global_alpha = 255;
+		vout->fbuf.capability |= V4L2_FBUF_CAP_GLOBAL_ALPHA;
+		vout->fbuf.flags |= V4L2_FBUF_FLAG_GLOBAL_ALPHA;
+	} else {
+		vout->win.global_alpha = 0;
+	}
+	vout->win.field = V4L2_FIELD_NONE;
 
 	omap_vout_new_format(pix, &vout->fbuf, &vout->crop, &vout->win);
 
 	hdl = &vout->ctrl_handler;
 	v4l2_ctrl_handler_init(hdl, 3);
-	v4l2_ctrl_new_std(hdl, &omap_vout_ctrl_ops,
-			  V4L2_CID_ROTATE, 0, 270, 90, 0);
+	if (vout->vid_info.rotation_type == VOUT_ROT_VRFB) {
+		v4l2_ctrl_new_std(hdl, &omap_vout_ctrl_ops,
+				  V4L2_CID_ROTATE, 0, 270, 90, 0);
+		v4l2_ctrl_new_std(hdl, &omap_vout_ctrl_ops,
+				  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 	v4l2_ctrl_new_std(hdl, &omap_vout_ctrl_ops,
 			  V4L2_CID_BG_COLOR, 0, 0xffffff, 1, 0);
-	v4l2_ctrl_new_std(hdl, &omap_vout_ctrl_ops,
-			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	if (hdl->error)
 		return hdl->error;
 
@@ -1930,6 +2006,10 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = platform_get_drvdata(pdev);
 	struct omap2video_device *vid_dev = container_of(v4l2_dev,
 			struct omap2video_device, v4l2_dev);
+	struct omap_overlay *ovl = vid_dev->overlays[0];
+	struct omap_overlay_info info;
+
+	ovl->get_overlay_info(ovl, &info);
 
 	for (k = 0; k < pdev->num_resources; k++) {
 
@@ -1950,6 +2030,14 @@ static int __init omap_vout_create_video_devices(struct platform_device *pdev)
 			vout->vid_info.overlays[0] = vid_dev->overlays[k + 1];
 		vout->vid_info.num_overlays = 1;
 		vout->vid_info.id = k + 1;
+		/*
+		 * Set the framebuffer base, this allows applications to find
+		 * the fb corresponding to this overlay.
+		 *
+		 * To be precise: fbuf.base should match smem_start of
+		 * struct fb_fix_screeninfo.
+		 */
+		vout->fbuf.base = (void *)info.paddr;
 
 		/* Set VRFB as rotation_type for omap2 and omap3 */
 		if (omap_vout_dss_omap24xx() || omap_vout_dss_omap34xx())
diff --git a/drivers/media/platform/omap/omap_voutlib.c b/drivers/media/platform/omap/omap_voutlib.c
index 58a25fdf0cce..480a7e95533d 100644
--- a/drivers/media/platform/omap/omap_voutlib.c
+++ b/drivers/media/platform/omap/omap_voutlib.c
@@ -95,7 +95,11 @@ int omap_vout_try_window(struct v4l2_framebuffer *fbuf,
 
 	/* We now have a valid preview window, so go with it */
 	new_win->w = try_win;
-	new_win->field = V4L2_FIELD_ANY;
+	new_win->field = V4L2_FIELD_NONE;
+	new_win->clips = NULL;
+	new_win->clipcount = 0;
+	new_win->bitmap = NULL;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(omap_vout_try_window);
-- 
2.20.1

