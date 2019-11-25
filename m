Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB2B1087D9
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 05:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfKYEXt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 23:23:49 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34921 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfKYEXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 23:23:49 -0500
Received: by mail-pl1-f196.google.com with SMTP id s10so5938626plp.2
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 20:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g/bXMO2KW05+PWJ5YRPd3RkGr8pffGAlfxq9ffWDhX0=;
        b=rB4KMhV4Sojj4zF/QdR461cxc3O0pQVlseVX/Z2uAv+oq7NuRJQJm/pbuPbk5jak1S
         Z2TL3dbcz0pl28MmkypjI3OpitkIosGQzSj+5Bm1cq1nyjFNA7j4yqaZcwni0jgHGQc4
         4sJhWYC9lM17LccsQv9Fh5Gzu8g+nJ6LnaE01kcRGbH06DHzIsObq0IuomDnaWeaizNU
         wuuPHwT/bXroDUfY1K01ZWpikq3tydqSpsV9N5xjn74iZoeDt7SdG8t+b9FaflL1HKqu
         TyeAr0OFOf4JgfK3j4kTbrOBeRXHEfWm9700FnCSQB46XQbvPEqVLzq04M6ewhzho9Ih
         8zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g/bXMO2KW05+PWJ5YRPd3RkGr8pffGAlfxq9ffWDhX0=;
        b=MOLBAxxf9szttdy6iPe7bqo/RD5Ul6kZoOAGWrbmvtJNN6s0czb0tQw/miYMVL+P/h
         DFW8iTc03q5LwtL4j6m8ByZibLkI0nRDCh5lT0W7zHBQnaWksz3SD4i2Tt0+GfbUOME6
         10IUFs2EU6kplMtec4K0tmNjzTExcvDz3sLHdVC0N4mdmCm2lJehFlcapsCz0iUHXNzX
         kWNwAXFifbPGjEKQ2G7NhN6kDhjKLgPED5K8S524r2N0lRM5zI6I29b5OHYvHbPaH5n1
         GHxCnJj61bF+lfIUmQn8RMK7LvzZi1mgV+GP6vNa0pt0MsYpuSq6TFs6IqiP5CIj4Tqr
         LvJQ==
X-Gm-Message-State: APjAAAWUb7O+YZqJy3YfjfgttF6d36H8RU4RmCoN69ZC5oBDMo2Yrrma
        J3L1YX2STbUjyBGaMvQaTo974R14BeQ=
X-Google-Smtp-Source: APXvYqyiWmuun7IRvCZmOGvd1kl9B5zdMgig6nS9pVphepHmtvSS53toqqT0KXndMlO8Bmkd9SqxaQ==
X-Received: by 2002:a17:90b:318:: with SMTP id ay24mr35354709pjb.25.1574655826734;
        Sun, 24 Nov 2019 20:23:46 -0800 (PST)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.207.43])
        by smtp.gmail.com with ESMTPSA id a66sm6053174pfb.166.2019.11.24.20.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 20:23:46 -0800 (PST)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v8] vivid: Add touch support
Date:   Mon, 25 Nov 2019 09:53:36 +0530
Message-Id: <20191125042336.6205-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <665e3259-e7c8-ffcd-1873-be36a12b67a3@xs4all.nl>
References: <665e3259-e7c8-ffcd-1873-be36a12b67a3@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support to emulate touch devices in vivid driver.
It generates touch patterns simulating single tap, double tap, triple
tap, move from left to right, zoom in, zoom out, palm press simulating
large area being pressed on screen, and simulating 16 different
simultaneous touch points.The values generated are based on
behavior of the rmi_f54 driver.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/platform/vivid/Makefile         |   3 +-
 drivers/media/platform/vivid/vivid-core.c     | 164 ++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  20 ++
 drivers/media/platform/vivid/vivid-ctrls.c    |  11 +
 .../platform/vivid/vivid-kthread-touch.c      | 181 ++++++++++
 .../platform/vivid/vivid-kthread-touch.h      |  13 +
 .../media/platform/vivid/vivid-touch-cap.c    | 320 ++++++++++++++++++
 .../media/platform/vivid/vivid-touch-cap.h    |  38 +++
 8 files changed, 737 insertions(+), 13 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h

diff --git a/drivers/media/platform/vivid/Makefile b/drivers/media/platform/vivid/Makefile
index e8a50c506dc9..b12ad0152a3e 100644
--- a/drivers/media/platform/vivid/Makefile
+++ b/drivers/media/platform/vivid/Makefile
@@ -3,7 +3,8 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
 		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
 		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
 		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
-		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o
+		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o \
+		vivid-kthread-touch.o vivid-touch-cap.o
 ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
   vivid-objs += vivid-cec.o
 endif
diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index c184f9b0be69..9eef606541a2 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -39,6 +39,7 @@
 #include "vivid-ctrls.h"
 #include "vivid-meta-cap.h"
 #include "vivid-meta-out.h"
+#include "vivid-touch-cap.h"
 
 #define VIVID_MODULE_NAME "vivid"
 
@@ -89,6 +90,10 @@ static int meta_out_nr[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
 module_param_array(meta_out_nr, int, NULL, 0444);
 MODULE_PARM_DESC(meta_out_nr, " videoX start number, -1 is autodetect");
 
+static int touch_cap_nr[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
+module_param_array(touch_cap_nr, int, NULL, 0444);
+MODULE_PARM_DESC(touch_cap_nr, " v4l-touchX start number, -1 is autodetect");
+
 static int ccs_cap_mode[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = -1 };
 module_param_array(ccs_cap_mode, int, NULL, 0444);
 MODULE_PARM_DESC(ccs_cap_mode, " capture crop/compose/scale mode:\n"
@@ -110,10 +115,10 @@ MODULE_PARM_DESC(multiplanar, " 1 (default) creates a single planar device, 2 cr
  * vbi-out + vid-out + meta-cap
  */
 static unsigned int node_types[VIVID_MAX_DEVS] = {
-	[0 ... (VIVID_MAX_DEVS - 1)] = 0x61d3d
+	[0 ... (VIVID_MAX_DEVS - 1)] = 0xe1d3d
 };
 module_param_array(node_types, uint, NULL, 0444);
-MODULE_PARM_DESC(node_types, " node types, default is 0x61d3d. Bitmask with the following meaning:\n"
+MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the following meaning:\n"
 			     "\t\t    bit 0: Video Capture node\n"
 			     "\t\t    bit 2-3: VBI Capture node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
 			     "\t\t    bit 4: Radio Receiver node\n"
@@ -123,7 +128,8 @@ MODULE_PARM_DESC(node_types, " node types, default is 0x61d3d. Bitmask with the
 			     "\t\t    bit 12: Radio Transmitter node\n"
 			     "\t\t    bit 16: Framebuffer for testing overlays\n"
 			     "\t\t    bit 17: Metadata Capture node\n"
-			     "\t\t    bit 18: Metadata Output node\n");
+			     "\t\t    bit 18: Metadata Output node\n"
+			     "\t\t    bit 19: Touch Capture node\n");
 
 /* Default: 4 inputs */
 static unsigned num_inputs[VIVID_MAX_DEVS] = { [0 ... (VIVID_MAX_DEVS - 1)] = 4 };
@@ -223,7 +229,8 @@ static int vidioc_querycap(struct file *file, void  *priv,
 		dev->vbi_cap_caps | dev->vbi_out_caps |
 		dev->radio_rx_caps | dev->radio_tx_caps |
 		dev->sdr_cap_caps | dev->meta_cap_caps |
-		dev->meta_out_caps | V4L2_CAP_DEVICE_CAPS;
+		dev->meta_out_caps | dev->touch_cap_caps |
+		V4L2_CAP_DEVICE_CAPS;
 	return 0;
 }
 
@@ -377,6 +384,8 @@ static int vidioc_g_parm(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_parm_tch(file, fh, parm);
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return vivid_vid_cap_g_parm(file, fh, parm);
 	return vivid_vid_out_g_parm(file, fh, parm);
@@ -432,6 +441,74 @@ static __poll_t vivid_radio_poll(struct file *file, struct poll_table_struct *wa
 	return vivid_radio_tx_poll(file, wait);
 }
 
+static int vivid_enum_input(struct file *file, void *priv,
+			    struct v4l2_input *inp)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_enum_input_tch(file, priv, inp);
+	return vidioc_enum_input(file, priv, inp);
+}
+
+static int vivid_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_input_tch(file, priv, i);
+	return vidioc_g_input(file, priv, i);
+}
+
+static int vivid_s_input(struct file *file, void *priv, unsigned int i)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_s_input_tch(file, priv, i);
+	return vidioc_s_input(file, priv, i);
+}
+
+static int vivid_enum_fmt_cap(struct file *file, void  *priv,
+			      struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_enum_fmt_tch(file, priv, f);
+	return vivid_enum_fmt_vid(file, priv, f);
+}
+
+static int vivid_g_fmt_cap(struct file *file, void *priv,
+			   struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch(file, priv, f);
+	return vidioc_g_fmt_vid_cap(file, priv, f);
+}
+
+static int vivid_try_fmt_cap(struct file *file, void *priv,
+			     struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch(file, priv, f);
+	return vidioc_try_fmt_vid_cap(file, priv, f);
+}
+
+static int vivid_s_fmt_cap(struct file *file, void *priv,
+			   struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch(file, priv, f);
+	return vidioc_s_fmt_vid_cap(file, priv, f);
+}
+
 static bool vivid_is_in_use(struct video_device *vdev)
 {
 	unsigned long flags;
@@ -453,7 +530,8 @@ static bool vivid_is_last_user(struct vivid_dev *dev)
 			vivid_is_in_use(&dev->radio_rx_dev) +
 			vivid_is_in_use(&dev->radio_tx_dev) +
 			vivid_is_in_use(&dev->meta_cap_dev) +
-			vivid_is_in_use(&dev->meta_out_dev);
+			vivid_is_in_use(&dev->meta_out_dev) +
+			vivid_is_in_use(&dev->touch_cap_dev);
 
 	return uses == 1;
 }
@@ -481,6 +559,7 @@ static int vivid_fop_release(struct file *file)
 		set_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
 		set_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
 		set_bit(V4L2_FL_REGISTERED, &dev->meta_out_dev.flags);
+		set_bit(V4L2_FL_REGISTERED, &dev->touch_cap_dev.flags);
 	}
 	mutex_unlock(&dev->mutex);
 	if (file->private_data == dev->overlay_cap_owner)
@@ -522,10 +601,10 @@ static const struct v4l2_file_operations vivid_radio_fops = {
 static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_querycap		= vidioc_querycap,
 
-	.vidioc_enum_fmt_vid_cap	= vivid_enum_fmt_vid,
-	.vidioc_g_fmt_vid_cap		= vidioc_g_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap		= vidioc_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap		= vidioc_s_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap	= vivid_enum_fmt_cap,
+	.vidioc_g_fmt_vid_cap		= vivid_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap		= vivid_try_fmt_cap,
+	.vidioc_s_fmt_vid_cap		= vivid_s_fmt_cap,
 	.vidioc_g_fmt_vid_cap_mplane	= vidioc_g_fmt_vid_cap_mplane,
 	.vidioc_try_fmt_vid_cap_mplane	= vidioc_try_fmt_vid_cap_mplane,
 	.vidioc_s_fmt_vid_cap_mplane	= vidioc_s_fmt_vid_cap_mplane,
@@ -590,9 +669,9 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
 
-	.vidioc_enum_input		= vidioc_enum_input,
-	.vidioc_g_input			= vidioc_g_input,
-	.vidioc_s_input			= vidioc_s_input,
+	.vidioc_enum_input		= vivid_enum_input,
+	.vidioc_g_input			= vivid_g_input,
+	.vidioc_s_input			= vivid_s_input,
 	.vidioc_s_audio			= vidioc_s_audio,
 	.vidioc_g_audio			= vidioc_g_audio,
 	.vidioc_enumaudio		= vidioc_enumaudio,
@@ -921,6 +1000,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			dev->has_scaler_out ? 'Y' : 'N');
 	}
 
+	/* do we create a touch capture device */
+	dev->has_touch_cap = node_type & 0x80000;
+
 	/* end detecting feature set */
 
 	if (dev->has_vid_cap) {
@@ -994,6 +1076,10 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		if (dev->has_audio_outputs)
 			dev->meta_out_caps |= V4L2_CAP_AUDIO;
 	}
+	/* set up the capabilities of the touch capture device */
+	if (dev->has_touch_cap)
+		dev->touch_cap_caps = V4L2_CAP_TOUCH | V4L2_CAP_VIDEO_CAPTURE |
+				      V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 
 	ret = -ENOMEM;
 	/* initialize the test pattern generator */
@@ -1129,6 +1215,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_disable_ioctl(&dev->vbi_out_dev, VIDIOC_G_FREQUENCY);
 	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_S_FREQUENCY);
 	v4l2_disable_ioctl(&dev->meta_out_dev, VIDIOC_G_FREQUENCY);
+	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_S_PARM);
+	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUM_FRAMESIZES);
+	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUM_FRAMEINTERVALS);
 
 	/* configure internal data */
 	dev->fmt_cap = &vivid_formats[0];
@@ -1201,6 +1290,11 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	dev->fb_cap.fmt.bytesperline = dev->src_rect.width * tpg_g_twopixelsize(&dev->tpg, 0) / 2;
 	dev->fb_cap.fmt.sizeimage = dev->src_rect.height * dev->fb_cap.fmt.bytesperline;
 
+	/* update touch configuration */
+	dev->timeperframe_tch_cap.numerator = 1;
+	dev->timeperframe_tch_cap.denominator = 10;
+	vivid_set_touch(dev, 0);
+
 	/* initialize locks */
 	spin_lock_init(&dev->slock);
 	mutex_init(&dev->mutex);
@@ -1213,6 +1307,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	INIT_LIST_HEAD(&dev->sdr_cap_active);
 	INIT_LIST_HEAD(&dev->meta_cap_active);
 	INIT_LIST_HEAD(&dev->meta_out_active);
+	INIT_LIST_HEAD(&dev->touch_cap_active);
 
 	INIT_LIST_HEAD(&dev->cec_work_list);
 	spin_lock_init(&dev->cec_slock);
@@ -1294,6 +1389,15 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			goto unreg_dev;
 	}
 
+	if (dev->has_touch_cap) {
+		/* initialize touch_cap queue */
+		ret = vivid_create_queue(dev, &dev->vb_touch_cap_q,
+					 V4L2_BUF_TYPE_VIDEO_CAPTURE, 1,
+					 &vivid_touch_cap_qops);
+		if (ret)
+			goto unreg_dev;
+	}
+
 	if (dev->has_fb) {
 		/* Create framebuffer for testing capture/output overlay */
 		ret = vivid_fb_init(dev);
@@ -1345,6 +1449,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_cap);
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_out);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_touch_cap);
 
 	/* finally start creating the device nodes */
 	if (dev->has_vid_cap) {
@@ -1635,6 +1740,35 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			  video_device_node_name(vfd));
 	}
 
+	if (dev->has_touch_cap) {
+		vfd = &dev->touch_cap_dev;
+		snprintf(vfd->name, sizeof(vfd->name),
+			 "vivid-%03d-touch-cap", inst);
+		vfd->fops = &vivid_fops;
+		vfd->ioctl_ops = &vivid_ioctl_ops;
+		vfd->device_caps = dev->touch_cap_caps;
+		vfd->release = video_device_release_empty;
+		vfd->v4l2_dev = &dev->v4l2_dev;
+		vfd->queue = &dev->vb_touch_cap_q;
+		vfd->tvnorms = tvnorms_cap;
+		vfd->lock = &dev->mutex;
+		video_set_drvdata(vfd, dev);
+#ifdef CONFIG_MEDIA_CONTROLLER
+		dev->touch_cap_pad.flags = MEDIA_PAD_FL_SINK;
+		ret = media_entity_pads_init(&vfd->entity, 1,
+					     &dev->touch_cap_pad);
+		if (ret)
+			goto unreg_dev;
+#endif
+		ret = video_register_device(vfd, VFL_TYPE_TOUCH,
+					    touch_cap_nr[inst]);
+		if (ret < 0)
+			goto unreg_dev;
+		v4l2_info(&dev->v4l2_dev,
+			  "V4L2 touch capture device registered as %s\n",
+			  video_device_node_name(vfd));
+	}
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 	/* Register the media device */
 	ret = media_device_register(&dev->mdev);
@@ -1651,6 +1785,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	return 0;
 
 unreg_dev:
+	video_unregister_device(&dev->touch_cap_dev);
 	video_unregister_device(&dev->meta_out_dev);
 	video_unregister_device(&dev->meta_cap_dev);
 	video_unregister_device(&dev->radio_tx_dev);
@@ -1778,6 +1913,11 @@ static int vivid_remove(struct platform_device *pdev)
 				  video_device_node_name(&dev->meta_out_dev));
 			video_unregister_device(&dev->meta_out_dev);
 		}
+		if (dev->has_touch_cap) {
+			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
+				  video_device_node_name(&dev->touch_cap_dev));
+			video_unregister_device(&dev->touch_cap_dev);
+		}
 		cec_unregister_adapter(dev->cec_rx_adap);
 		for (j = 0; j < MAX_OUTPUTS; j++)
 			cec_unregister_adapter(dev->cec_tx_adap[j]);
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 59192b67231c..99e69b8f770f 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -133,6 +133,7 @@ struct vivid_dev {
 	struct media_pad		sdr_cap_pad;
 	struct media_pad		meta_cap_pad;
 	struct media_pad		meta_out_pad;
+	struct media_pad		touch_cap_pad;
 #endif
 	struct v4l2_ctrl_handler	ctrl_hdl_user_gen;
 	struct v4l2_ctrl_handler	ctrl_hdl_user_vid;
@@ -159,6 +160,8 @@ struct vivid_dev {
 	struct v4l2_ctrl_handler	ctrl_hdl_meta_cap;
 	struct video_device		meta_out_dev;
 	struct v4l2_ctrl_handler	ctrl_hdl_meta_out;
+	struct video_device		touch_cap_dev;
+	struct v4l2_ctrl_handler	ctrl_hdl_touch_cap;
 
 	spinlock_t			slock;
 	struct mutex			mutex;
@@ -173,6 +176,7 @@ struct vivid_dev {
 	u32				radio_tx_caps;
 	u32				meta_cap_caps;
 	u32				meta_out_caps;
+	u32				touch_cap_caps;
 
 	/* supported features */
 	bool				multiplanar;
@@ -201,6 +205,7 @@ struct vivid_dev {
 	bool				has_meta_cap;
 	bool				has_meta_out;
 	bool				has_tv_tuner;
+	bool				has_touch_cap;
 
 	bool				can_loop_video;
 
@@ -404,6 +409,8 @@ struct vivid_dev {
 	struct list_head		vbi_cap_active;
 	struct vb2_queue		vb_meta_cap_q;
 	struct list_head		meta_cap_active;
+	struct vb2_queue		vb_touch_cap_q;
+	struct list_head		touch_cap_active;
 
 	/* thread for generating video capture stream */
 	struct task_struct		*kthread_vid_cap;
@@ -425,6 +432,19 @@ struct vivid_dev {
 	u32				meta_cap_seq_count;
 	bool				meta_cap_streaming;
 
+	/* Touch capture */
+	struct task_struct		*kthread_touch_cap;
+	unsigned long			jiffies_touch_cap;
+	u64				touch_cap_stream_start;
+	u32				touch_cap_seq_offset;
+	bool				touch_cap_seq_resync;
+	u32				touch_cap_seq_start;
+	u32				touch_cap_seq_count;
+	bool				touch_cap_streaming;
+	struct v4l2_fract		timeperframe_tch_cap;
+	struct v4l2_pix_format		tch_format;
+	int				tch_pat_random;
+
 	/* video output */
 	const struct vivid_fmt		*fmt_out;
 	struct v4l2_fract		timeperframe_vid_out;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 68e8124c7973..334130568dcb 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -1508,6 +1508,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	struct v4l2_ctrl_handler *hdl_sdr_cap = &dev->ctrl_hdl_sdr_cap;
 	struct v4l2_ctrl_handler *hdl_meta_cap = &dev->ctrl_hdl_meta_cap;
 	struct v4l2_ctrl_handler *hdl_meta_out = &dev->ctrl_hdl_meta_out;
+	struct v4l2_ctrl_handler *hdl_tch_cap = &dev->ctrl_hdl_touch_cap;
 
 	struct v4l2_ctrl_config vivid_ctrl_dv_timings = {
 		.ops = &vivid_vid_cap_ctrl_ops,
@@ -1551,6 +1552,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	v4l2_ctrl_new_custom(hdl_meta_cap, &vivid_ctrl_class, NULL);
 	v4l2_ctrl_handler_init(hdl_meta_out, 2);
 	v4l2_ctrl_new_custom(hdl_meta_out, &vivid_ctrl_class, NULL);
+	v4l2_ctrl_handler_init(hdl_tch_cap, 2);
+	v4l2_ctrl_new_custom(hdl_tch_cap, &vivid_ctrl_class, NULL);
 
 	/* User Controls */
 	dev->volume = v4l2_ctrl_new_std(hdl_user_aud, NULL,
@@ -1904,6 +1907,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			return hdl_meta_out->error;
 		dev->meta_out_dev.ctrl_handler = hdl_meta_out;
 	}
+	if (dev->has_touch_cap) {
+		v4l2_ctrl_add_handler(hdl_tch_cap, hdl_user_gen, NULL, false);
+		v4l2_ctrl_add_handler(hdl_tch_cap, hdl_streaming, NULL, false);
+		if (hdl_tch_cap->error)
+			return hdl_tch_cap->error;
+		dev->touch_cap_dev.ctrl_handler = hdl_tch_cap;
+	}
 	return 0;
 }
 
@@ -1925,4 +1935,5 @@ void vivid_free_controls(struct vivid_dev *dev)
 	v4l2_ctrl_handler_free(&dev->ctrl_hdl_fb);
 	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_cap);
 	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_out);
+	v4l2_ctrl_handler_free(&dev->ctrl_hdl_touch_cap);
 }
diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.c b/drivers/media/platform/vivid/vivid-kthread-touch.c
new file mode 100644
index 000000000000..674507b5ccb5
--- /dev/null
+++ b/drivers/media/platform/vivid/vivid-kthread-touch.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vivid-kthread-touch.c - touch capture thread support functions.
+ *
+ */
+
+#include <linux/freezer.h>
+#include "vivid-core.h"
+#include "vivid-kthread-touch.h"
+#include "vivid-touch-cap.h"
+
+static noinline_for_stack void vivid_thread_tch_cap_tick(struct vivid_dev *dev,
+							 int dropped_bufs)
+{
+	struct vivid_buffer *tch_cap_buf = NULL;
+
+	spin_lock(&dev->slock);
+	if (!list_empty(&dev->touch_cap_active)) {
+		tch_cap_buf = list_entry(dev->touch_cap_active.next,
+					 struct vivid_buffer, list);
+		list_del(&tch_cap_buf->list);
+	}
+
+	spin_unlock(&dev->slock);
+
+	if (tch_cap_buf) {
+		v4l2_ctrl_request_setup(tch_cap_buf->vb.vb2_buf.req_obj.req,
+					&dev->ctrl_hdl_touch_cap);
+
+		vivid_fillbuff_tch(dev, tch_cap_buf);
+		v4l2_ctrl_request_complete(tch_cap_buf->vb.vb2_buf.req_obj.req,
+					   &dev->ctrl_hdl_touch_cap);
+		vb2_buffer_done(&tch_cap_buf->vb.vb2_buf, dev->dqbuf_error ?
+				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+		dprintk(dev, 2, "touch_cap buffer %d done\n",
+			tch_cap_buf->vb.vb2_buf.index);
+
+		tch_cap_buf->vb.vb2_buf.timestamp = ktime_get_ns() + dev->time_wrap_offset;
+	}
+	dev->dqbuf_error = false;
+}
+
+static int vivid_thread_touch_cap(void *data)
+{
+	struct vivid_dev *dev = data;
+	u64 numerators_since_start;
+	u64 buffers_since_start;
+	u64 next_jiffies_since_start;
+	unsigned long jiffies_since_start;
+	unsigned long cur_jiffies;
+	unsigned int wait_jiffies;
+	unsigned int numerator;
+	unsigned int denominator;
+	int dropped_bufs;
+
+	dprintk(dev, 1, "Touch Capture Thread Start\n");
+
+	set_freezable();
+
+	/* Resets frame counters */
+	dev->touch_cap_seq_offset = 0;
+	dev->touch_cap_seq_count = 0;
+	dev->touch_cap_seq_resync = false;
+	dev->jiffies_touch_cap = jiffies;
+
+	for (;;) {
+		try_to_freeze();
+		if (kthread_should_stop())
+			break;
+
+		if (!mutex_trylock(&dev->mutex)) {
+			schedule_timeout_uninterruptible(1);
+			continue;
+		}
+		cur_jiffies = jiffies;
+		if (dev->touch_cap_seq_resync) {
+			dev->jiffies_touch_cap = cur_jiffies;
+			dev->touch_cap_seq_offset = dev->touch_cap_seq_count + 1;
+			dev->touch_cap_seq_count = 0;
+			dev->cap_seq_resync = false;
+		}
+		denominator = dev->timeperframe_tch_cap.denominator;
+		numerator = dev->timeperframe_tch_cap.numerator;
+
+		/* Calculate the number of jiffies since we started streaming */
+		jiffies_since_start = cur_jiffies - dev->jiffies_touch_cap;
+		/* Get the number of buffers streamed since the start */
+		buffers_since_start = (u64)jiffies_since_start * denominator +
+				      (HZ * numerator) / 2;
+		do_div(buffers_since_start, HZ * numerator);
+
+		/*
+		 * After more than 0xf0000000 (rounded down to a multiple of
+		 * 'jiffies-per-day' to ease jiffies_to_msecs calculation)
+		 * jiffies have passed since we started streaming reset the
+		 * counters and keep track of the sequence offset.
+		 */
+		if (jiffies_since_start > JIFFIES_RESYNC) {
+			dev->jiffies_touch_cap = cur_jiffies;
+			dev->cap_seq_offset = buffers_since_start;
+			buffers_since_start = 0;
+		}
+		dropped_bufs = buffers_since_start + dev->touch_cap_seq_offset - dev->touch_cap_seq_count;
+		dev->touch_cap_seq_count = buffers_since_start + dev->touch_cap_seq_offset;
+
+		vivid_thread_tch_cap_tick(dev, dropped_bufs);
+
+		/*
+		 * Calculate the number of 'numerators' streamed
+		 * since we started, including the current buffer.
+		 */
+		numerators_since_start = ++buffers_since_start * numerator;
+
+		/* And the number of jiffies since we started */
+		jiffies_since_start = jiffies - dev->jiffies_touch_cap;
+
+		mutex_unlock(&dev->mutex);
+
+		/*
+		 * Calculate when that next buffer is supposed to start
+		 * in jiffies since we started streaming.
+		 */
+		next_jiffies_since_start = numerators_since_start * HZ +
+					   denominator / 2;
+		do_div(next_jiffies_since_start, denominator);
+		/* If it is in the past, then just schedule asap */
+		if (next_jiffies_since_start < jiffies_since_start)
+			next_jiffies_since_start = jiffies_since_start;
+
+		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
+		schedule_timeout_interruptible(wait_jiffies ? wait_jiffies : 1);
+	}
+	dprintk(dev, 1, "Touch Capture Thread End\n");
+	return 0;
+}
+
+int vivid_start_generating_touch_cap(struct vivid_dev *dev)
+{
+	if (dev->kthread_touch_cap) {
+		dev->touch_cap_streaming = true;
+		return 0;
+	}
+
+	dev->kthread_touch_cap = kthread_run(vivid_thread_touch_cap, dev,
+					     "%s-tch-cap", dev->v4l2_dev.name);
+
+	if (IS_ERR(dev->kthread_touch_cap)) {
+		int err = PTR_ERR(dev->kthread_touch_cap);
+
+		dev->kthread_touch_cap = NULL;
+		v4l2_err(&dev->v4l2_dev, "kernel_thread() failed\n");
+		return err;
+	}
+	dev->touch_cap_streaming = true;
+	dprintk(dev, 1, "returning from %s\n", __func__);
+	return 0;
+}
+
+void vivid_stop_generating_touch_cap(struct vivid_dev *dev)
+{
+	if (!dev->kthread_touch_cap)
+		return;
+
+	dev->touch_cap_streaming = false;
+
+	while (!list_empty(&dev->touch_cap_active)) {
+		struct vivid_buffer *buf;
+
+		buf = list_entry(dev->touch_cap_active.next,
+				 struct vivid_buffer, list);
+		list_del(&buf->list);
+		v4l2_ctrl_request_complete(buf->vb.vb2_buf.req_obj.req,
+					   &dev->ctrl_hdl_touch_cap);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		dprintk(dev, 2, "touch_cap buffer %d done\n",
+			buf->vb.vb2_buf.index);
+	}
+
+	kthread_stop(dev->kthread_touch_cap);
+	dev->kthread_touch_cap = NULL;
+}
diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.h b/drivers/media/platform/vivid/vivid-kthread-touch.h
new file mode 100644
index 000000000000..ecf79b46209e
--- /dev/null
+++ b/drivers/media/platform/vivid/vivid-kthread-touch.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * vivid-kthread-cap.h - video/vbi capture thread support functions.
+ *
+ */
+
+#ifndef _VIVID_KTHREAD_CAP_H_
+#define _VIVID_KTHREAD_CAP_H_
+
+int vivid_start_generating_touch_cap(struct vivid_dev *dev);
+void vivid_stop_generating_touch_cap(struct vivid_dev *dev);
+
+#endif
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.c b/drivers/media/platform/vivid/vivid-touch-cap.c
new file mode 100644
index 000000000000..b867ddfcbca8
--- /dev/null
+++ b/drivers/media/platform/vivid/vivid-touch-cap.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vivid-touch-cap.c - touch support functions.
+ */
+
+#include "vivid-core.h"
+#include "vivid-kthread-touch.h"
+#include "vivid-touch-cap.h"
+
+static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				 unsigned int *nplanes, unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+	struct v4l2_pix_format *f = &dev->tch_format;
+	unsigned int size = f->sizeimage;
+
+	if (*nplanes) {
+		if (sizes[0] < size)
+			return -EINVAL;
+	} else {
+		sizes[0] = size;
+	}
+
+	if (vq->num_buffers + *nbuffers < 2)
+		*nbuffers = 2 - vq->num_buffers;
+
+	*nplanes = 1;
+	return 0;
+}
+
+static int touch_cap_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct v4l2_pix_format *f = &dev->tch_format;
+	unsigned int size = f->sizeimage;
+
+	if (dev->buf_prepare_error) {
+		/*
+		 * Error injection: test what happens if buf_prepare() returns
+		 * an error.
+		 */
+		dev->buf_prepare_error = false;
+		return -EINVAL;
+	}
+	if (vb2_plane_size(vb, 0) < size) {
+		dprintk(dev, 1, "%s data will not fit into plane (%lu < %u)\n",
+			__func__, vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+	vb2_set_plane_payload(vb, 0, size);
+
+	return 0;
+}
+
+static void touch_cap_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct vivid_buffer *buf = container_of(vbuf, struct vivid_buffer, vb);
+
+	spin_lock(&dev->slock);
+	list_add_tail(&buf->list, &dev->touch_cap_active);
+	spin_unlock(&dev->slock);
+}
+
+static int touch_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+	int err;
+
+	dev->touch_cap_seq_count = 0;
+	if (dev->start_streaming_error) {
+		dev->start_streaming_error = false;
+		err = -EINVAL;
+	} else {
+		err = vivid_start_generating_touch_cap(dev);
+	}
+	if (err) {
+		struct vivid_buffer *buf, *tmp;
+
+		list_for_each_entry_safe(buf, tmp,
+					 &dev->touch_cap_active, list) {
+			list_del(&buf->list);
+			vb2_buffer_done(&buf->vb.vb2_buf,
+					VB2_BUF_STATE_QUEUED);
+		}
+	}
+	return err;
+}
+
+/* abort streaming and wait for last buffer */
+static void touch_cap_stop_streaming(struct vb2_queue *vq)
+{
+	struct vivid_dev *dev = vb2_get_drv_priv(vq);
+
+	vivid_stop_generating_touch_cap(dev);
+}
+
+static void touch_cap_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &dev->ctrl_hdl_touch_cap);
+}
+
+const struct vb2_ops vivid_touch_cap_qops = {
+	.queue_setup		= touch_cap_queue_setup,
+	.buf_prepare		= touch_cap_buf_prepare,
+	.buf_queue		= touch_cap_buf_queue,
+	.start_streaming	= touch_cap_start_streaming,
+	.stop_streaming		= touch_cap_stop_streaming,
+	.buf_request_complete	= touch_cap_buf_request_complete,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_TCH_FMT_DELTA_TD16;
+	return 0;
+}
+
+int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct vivid_dev *dev = video_drvdata(file);
+
+	f->fmt.pix = dev->tch_format;
+	return 0;
+}
+
+int vivid_g_parm_tch(struct file *file, void *priv,
+		     struct v4l2_streamparm *parm)
+{
+	struct vivid_dev *dev = video_drvdata(file);
+
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	parm->parm.capture.capability   = V4L2_CAP_TIMEPERFRAME;
+	parm->parm.capture.timeperframe = dev->timeperframe_tch_cap;
+	parm->parm.capture.readbuffers  = 1;
+	return 0;
+}
+
+int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp)
+{
+	if (inp->index)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_TOUCH;
+	strscpy(inp->name, "Vivid Touch", sizeof(inp->name));
+	inp->capabilities = 0;
+	return 0;
+}
+
+int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+int vivid_set_touch(struct vivid_dev *dev, unsigned int i)
+{
+	struct v4l2_pix_format *f = &dev->tch_format;
+
+	if (i)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_TCH_FMT_DELTA_TD16;
+	f->width =  VIVID_TCH_WIDTH;
+	f->height = VIVID_TCH_HEIGHT;
+	f->field = V4L2_FIELD_NONE;
+	f->colorspace = V4L2_COLORSPACE_RAW;
+	f->bytesperline = f->width * sizeof(s16);
+	f->sizeimage = f->width * f->height * sizeof(s16);
+	return 0;
+}
+
+int vivid_s_input_tch(struct file *file, void *priv, unsigned int i)
+{
+	return vivid_set_touch(video_drvdata(file), i);
+}
+
+static void vivid_fill_buff_noise(__s16 *tch_buf, int size)
+{
+	int i;
+
+	/* Fill 10% of the values within range -3 and 3, zero the others */
+	for (i = 0; i < size; i++) {
+		unsigned int rand = get_random_int();
+
+		if (rand % 10)
+			tch_buf[i] = 0;
+		else
+			tch_buf[i] = (rand / 10) % 7 - 3;
+	}
+}
+
+static inline int get_random_pressure(void)
+{
+	return get_random_int() % VIVID_PRESSURE_LIMIT;
+}
+
+static void vivid_tch_buf_set(struct v4l2_pix_format *f,
+			      __s16 *tch_buf,
+			      int index)
+{
+	unsigned int x = index % f->width;
+	unsigned int y = index / f->width;
+	unsigned int offset = VIVID_MIN_PRESSURE;
+
+	tch_buf[index] = offset + get_random_pressure();
+	offset /= 2;
+	if (x)
+		tch_buf[index - 1] = offset + get_random_pressure();
+	if (x < f->width - 1)
+		tch_buf[index + 1] = offset + get_random_pressure();
+	if (y)
+		tch_buf[index - f->width] = offset + get_random_pressure();
+	if (y < f->height - 1)
+		tch_buf[index + f->width] = offset + get_random_pressure();
+	offset /= 2;
+	if (x && y)
+		tch_buf[index - 1 - f->width] = offset + get_random_pressure();
+	if (x < f->width - 1 && y)
+		tch_buf[index + 1 - f->width] = offset + get_random_pressure();
+	if (x && y < f->height - 1)
+		tch_buf[index - 1 + f->width] = offset + get_random_pressure();
+	if (x < f->width - 1 && y < f->height - 1)
+		tch_buf[index + 1 + f->width] = offset + get_random_pressure();
+}
+
+void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf)
+{
+	struct v4l2_pix_format *f = &dev->tch_format;
+	int size = f->width * f->height;
+	int x, y, xstart, ystart, offset_x, offset_y;
+	unsigned int test_pattern, test_pat_idx, rand;
+
+	__s16 *tch_buf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+
+	buf->vb.sequence = dev->touch_cap_seq_count;
+	test_pattern = (buf->vb.sequence / TCH_SEQ_COUNT) % TEST_CASE_MAX;
+	test_pat_idx = buf->vb.sequence % TCH_SEQ_COUNT;
+
+	vivid_fill_buff_noise(tch_buf, size);
+
+	if (test_pat_idx >= TCH_PATTERN_COUNT)
+		return;
+
+	if (test_pat_idx == 0)
+		dev->tch_pat_random = get_random_int();
+	rand = dev->tch_pat_random;
+
+	switch (test_pattern) {
+	case SINGLE_TAP:
+		if (test_pat_idx == 5)
+			vivid_tch_buf_set(f, tch_buf, rand % size);
+		break;
+	case DOUBLE_TAP:
+		if (test_pat_idx == 3 || test_pat_idx == 6)
+			vivid_tch_buf_set(f, tch_buf, rand % size);
+		break;
+	case TRIPLE_TAP:
+		if (test_pat_idx == 3 || test_pat_idx == 6 || test_pat_idx == 9)
+			vivid_tch_buf_set(f, tch_buf, rand % size);
+		break;
+	case MOVE_LEFT_TO_RIGHT:
+		vivid_tch_buf_set(f, tch_buf,
+				  (rand % f->height) * f->width +
+				  test_pat_idx * (f->width / 10));
+		break;
+	case ZOOM_IN:
+		x = f->width / 2;
+		y = f->height / 2;
+		offset_x = ((TCH_PATTERN_COUNT - 1 - test_pat_idx) * x) /
+				TCH_PATTERN_COUNT;
+		offset_y = ((TCH_PATTERN_COUNT - 1 - test_pat_idx) * y) /
+				TCH_PATTERN_COUNT;
+		vivid_tch_buf_set(f, tch_buf,
+				  (x - offset_x) + f->width * (y - offset_y));
+		vivid_tch_buf_set(f, tch_buf,
+				  (x + offset_x) + f->width * (y + offset_y));
+		break;
+	case ZOOM_OUT:
+		x = f->width / 2;
+		y = f->height / 2;
+		offset_x = (test_pat_idx * x) / TCH_PATTERN_COUNT;
+		offset_y = (test_pat_idx * y) / TCH_PATTERN_COUNT;
+		vivid_tch_buf_set(f, tch_buf,
+				  (x - offset_x) + f->width * (y - offset_y));
+		vivid_tch_buf_set(f, tch_buf,
+				  (x + offset_x) + f->width * (y + offset_y));
+		break;
+	case PALM_PRESS:
+		for (x = 0; x < f->width; x++)
+			for (y = f->height / 2; y < f->height; y++)
+				vivid_tch_buf_set(f, tch_buf, x + f->width * y);
+		break;
+	case MULTIPLE_PRESS:
+		/* 16 pressure points */
+		for (y = 0; y < 4; y++) {
+			for (x = 0; x < 4; x++) {
+				ystart = (y * f->height) / 4 + f->height / 8;
+				xstart = (x * f->width) / 4 + f->width / 8;
+				vivid_tch_buf_set(f, tch_buf,
+						  ystart * f->width + xstart);
+			}
+		}
+		break;
+	}
+#ifdef __BIG_ENDIAN__
+	for (x = 0; x < size; x++)
+		tch_buf[x] = (__force s16)__cpu_to_le16((u16)tch_buf[x]);
+#endif
+}
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.h b/drivers/media/platform/vivid/vivid-touch-cap.h
new file mode 100644
index 000000000000..761050b652eb
--- /dev/null
+++ b/drivers/media/platform/vivid/vivid-touch-cap.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * vivid-touch-cap.h - touch support functions.
+ */
+#ifndef _VIVID_TOUCH_CAP_H_
+#define _VIVID_TOUCH_CAP_H_
+
+#define VIVID_TCH_HEIGHT	12
+#define VIVID_TCH_WIDTH		21
+#define VIVID_MIN_PRESSURE	180
+#define VIVID_PRESSURE_LIMIT	40
+#define TCH_SEQ_COUNT		16
+#define TCH_PATTERN_COUNT	12
+
+enum vivid_tch_test {
+	SINGLE_TAP,
+	DOUBLE_TAP,
+	TRIPLE_TAP,
+	MOVE_LEFT_TO_RIGHT,
+	ZOOM_IN,
+	ZOOM_OUT,
+	PALM_PRESS,
+	MULTIPLE_PRESS,
+	TEST_CASE_MAX
+};
+
+extern const struct vb2_ops vivid_touch_cap_qops;
+
+int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
+int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
+int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
+int vivid_g_input_tch(struct file *file, void *priv, unsigned int *i);
+int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
+void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf);
+int vivid_set_touch(struct vivid_dev *dev, unsigned int i);
+int vivid_g_parm_tch(struct file *file, void *priv,
+		     struct v4l2_streamparm *parm);
+#endif
-- 
2.17.1

