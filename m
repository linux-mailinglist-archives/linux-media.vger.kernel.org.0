Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC74AEE05C
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 13:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbfKDMq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 07:46:27 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43370 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728908AbfKDMq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 07:46:27 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so11227413pgh.10
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2019 04:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1kvr6etgvSqEtBU5agD5x6c3YMkHZYMpZP9Gk+YCwoQ=;
        b=Or1N8Z+ZEe8judaZOBBCjRy6/bzSJ9XWQBm0/lneaeq+tDK32pnf9/4fcu1n7EJWTh
         SSL4bJ2KFh461u9fnrSzyZX+LI1sTWBzwNKARbU3Guse89I6n3SPuB2p1pu5u8TNKxd4
         o/4Sjls/kVvlySao6q8hBA7Agbp/AB+VUwkLepy2XgVcqaZOMS4+SdiHZurAH7i4XM24
         lnMb7Ngu6D5J/orq5qVdoLwJDjWhJcYH3qZViT6NBCR+Mn38Or7W/e0X5pecmMi3DCZ1
         Gy6g+mUnmY3CjX6Kfc9ytqfokpVzVGDUoWkdDgpYNuUhrHJ1je9MQh0aj7IMcfdthtK1
         w6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1kvr6etgvSqEtBU5agD5x6c3YMkHZYMpZP9Gk+YCwoQ=;
        b=sEK3mgrbZACYHt7zSx4+oOiX/wr569CvRtDP1MUPXONDC7d00gTD8REIi9WjvM7Eld
         Ttbp1OluJeUGi+ij9GaBx9FkSLLsCjHs2ghTFqI9e+qQJsPyE1yvBFIgVX4T05dHM3H8
         1fMzT3iOS3aexy7P1TE2NvD2S8iCrFWMXe2Vim+99f0y/pDAdhAz7CJ4pIyCHx+Gp0tT
         LNN+5QtAwaGRjW6138GQmC8xxxgrRUdoFEUGOs5BRTwLDpIIOaVBJQyPXgRQZMhultXT
         bwE44ThL0n5NKmHjWGqruGNq+Og4sHzVNt6afO/Vm+ZmvL54x71wPC1mn15NwrgUwK2u
         D8pg==
X-Gm-Message-State: APjAAAXXrLteNj8jx4ddeI7uqaPdR7QCPk3LlwdzHlX4NltIYfhSdWMF
        V/RJlvXDpB3SfvGgiXNQyvsXeUupWXY=
X-Google-Smtp-Source: APXvYqzRSdEVtM4xTlrHuJpfgIXwJol23fNP0fFtV5ZgRH+J0SUbY7hJRii1eDzoVznk6mzsRfl0MQ==
X-Received: by 2002:a63:1f08:: with SMTP id f8mr30318634pgf.145.1572871583690;
        Mon, 04 Nov 2019 04:46:23 -0800 (PST)
Received: from localhost.localdomain ([223.186.192.194])
        by smtp.gmail.com with ESMTPSA id z2sm6983515pgg.41.2019.11.04.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 04:46:22 -0800 (PST)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] vivid: Add touch support
Date:   Mon,  4 Nov 2019 18:15:44 +0530
Message-Id: <20191104124544.22270-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191022075141.21069-3-bnvandana@gmail.com>
References: <20191022075141.21069-3-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Support to emulate touch devices in vivid driver.

Incorporate changes from https://patchwork.linuxtv.org/patch/59782/,
to avoid the mutex unlocking/relocking around the kthread_stop.

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 drivers/media/platform/vivid/Makefile         |   3 +-
 drivers/media/platform/vivid/vivid-core.c     | 180 +++++++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  19 ++
 drivers/media/platform/vivid/vivid-ctrls.c    |  11 +
 .../media/platform/vivid/vivid-kthread-cap.c  |   1 -
 .../platform/vivid/vivid-kthread-touch.c      | 212 +++++++++++++++++
 .../platform/vivid/vivid-kthread-touch.h      |  13 ++
 .../media/platform/vivid/vivid-touch-cap.c    | 221 ++++++++++++++++++
 .../media/platform/vivid/vivid-touch-cap.h    |  25 ++
 9 files changed, 672 insertions(+), 13 deletions(-)
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
index bd91916980b9..f6f58d7daa71 100644
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
 
@@ -255,6 +262,8 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 		return vivid_radio_rx_g_tuner(file, fh, vt);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
 		return vivid_sdr_g_tuner(file, fh, vt);
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return -EINVAL;
 	return vivid_video_g_tuner(file, fh, vt);
 }
 
@@ -266,6 +275,8 @@ static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *
 		return vivid_radio_rx_s_tuner(file, fh, vt);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
 		return vivid_sdr_s_tuner(file, fh, vt);
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return -EINVAL;
 	return vivid_video_s_tuner(file, fh, vt);
 }
 
@@ -280,6 +291,8 @@ static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency
 			&dev->radio_rx_freq : &dev->radio_tx_freq, vf);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
 		return vivid_sdr_g_frequency(file, fh, vf);
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return -EINVAL;
 	return vivid_video_g_frequency(file, fh, vf);
 }
 
@@ -294,6 +307,8 @@ static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_fre
 			&dev->radio_rx_freq : &dev->radio_tx_freq, vf);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
 		return vivid_sdr_s_frequency(file, fh, vf);
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return -EINVAL;
 	return vivid_video_s_frequency(file, fh, vf);
 }
 
@@ -377,6 +392,8 @@ static int vidioc_g_parm(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_parm_tch(file, fh, parm);
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return vivid_vid_cap_g_parm(file, fh, parm);
 	return vivid_vid_out_g_parm(file, fh, parm);
@@ -387,6 +404,8 @@ static int vidioc_s_parm(struct file *file, void *fh,
 {
 	struct video_device *vdev = video_devdata(file);
 
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_parm_tch(file, fh, parm);
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return vivid_vid_cap_s_parm(file, fh, parm);
 	return -ENOTTY;
@@ -432,6 +451,66 @@ static __poll_t vivid_radio_poll(struct file *file, struct poll_table_struct *wa
 	return vivid_radio_tx_poll(file, wait);
 }
 
+int vivid_enum_input(struct file *file, void *priv, struct v4l2_input *inp)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_enum_input_tch(file, priv, inp);
+	else
+		return vidioc_enum_input(file, priv, inp);
+}
+
+int vivid_s_input(struct file *file, void *priv, unsigned int i)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_s_input_tch(file, priv, i);
+	else
+		return vidioc_s_input(file, priv, i);
+}
+
+int vivid_enum_fmt_cap(struct file *file, void  *priv, struct v4l2_fmtdesc *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_enum_fmt_tch(file, priv, f);
+	else
+		return vivid_enum_fmt_vid(file, priv, f);
+}
+
+int vivid_g_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch(file, priv, f);
+	else
+		return vidioc_g_fmt_vid_cap(file, priv, f);
+}
+
+int vivid_try_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch(file, priv, f);
+	else
+		return vidioc_try_fmt_vid_cap(file, priv, f);
+}
+
+int vivid_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct video_device *vdev = video_devdata(file);
+
+	if (vdev->vfl_type == VFL_TYPE_TOUCH)
+		return vivid_g_fmt_tch(file, priv, f);
+	else
+		return vidioc_s_fmt_vid_cap(file, priv, f);
+}
+
 static bool vivid_is_in_use(struct video_device *vdev)
 {
 	unsigned long flags;
@@ -453,7 +532,8 @@ static bool vivid_is_last_user(struct vivid_dev *dev)
 			vivid_is_in_use(&dev->radio_rx_dev) +
 			vivid_is_in_use(&dev->radio_tx_dev) +
 			vivid_is_in_use(&dev->meta_cap_dev) +
-			vivid_is_in_use(&dev->meta_out_dev);
+			vivid_is_in_use(&dev->meta_out_dev) +
+			vivid_is_in_use(&dev->touch_cap_dev);
 
 	return uses == 1;
 }
@@ -481,6 +561,7 @@ static int vivid_fop_release(struct file *file)
 		set_bit(V4L2_FL_REGISTERED, &dev->radio_tx_dev.flags);
 		set_bit(V4L2_FL_REGISTERED, &dev->meta_cap_dev.flags);
 		set_bit(V4L2_FL_REGISTERED, &dev->meta_out_dev.flags);
+		set_bit(V4L2_FL_REGISTERED, &dev->touch_cap_dev.flags);
 	}
 	mutex_unlock(&dev->mutex);
 	if (file->private_data == dev->overlay_cap_owner)
@@ -522,10 +603,10 @@ static const struct v4l2_file_operations vivid_radio_fops = {
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
@@ -590,9 +671,9 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
 
-	.vidioc_enum_input		= vidioc_enum_input,
+	.vidioc_enum_input		= vivid_enum_input,
 	.vidioc_g_input			= vidioc_g_input,
-	.vidioc_s_input			= vidioc_s_input,
+	.vidioc_s_input			= vivid_s_input,
 	.vidioc_s_audio			= vidioc_s_audio,
 	.vidioc_g_audio			= vidioc_g_audio,
 	.vidioc_enumaudio		= vidioc_enumaudio,
@@ -856,6 +937,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	/* do we create a metadata output device */
 	dev->has_meta_out = node_type & 0x40000;
 
+	/* do we create a touch capture device */
+	dev->has_touch_cap = node_type & 0x80000;
+
 	/* end detecting feature set */
 
 	if (dev->has_vid_cap) {
@@ -929,6 +1013,11 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		if (dev->has_audio_outputs)
 			dev->meta_out_caps |= V4L2_CAP_AUDIO;
 	}
+	/* set up the capabilities of the touch capture device */
+	if (dev->has_touch_cap) {
+		dev->touch_cap_caps = V4L2_CAP_TOUCH | V4L2_CAP_VIDEO_CAPTURE |
+				      V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
+	}
 
 	ret = -ENOMEM;
 	/* initialize the test pattern generator */
@@ -992,6 +1081,9 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_AUDIO);
 		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_AUDIO);
 		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_ENUMAUDIO);
+		v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_S_AUDIO);
+		v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_G_AUDIO);
+		v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUMAUDIO);
 	}
 	if (!dev->has_audio_outputs) {
 		v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_AUDOUT);
@@ -1022,6 +1114,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_FREQUENCY);
 		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_FREQUENCY);
 		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_FREQUENCY);
+		v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_S_FREQUENCY);
+		v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_G_FREQUENCY);
 	}
 	if (!has_tuner) {
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_TUNER);
@@ -1030,6 +1124,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_G_TUNER);
 		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_TUNER);
 		v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_G_TUNER);
+		v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_S_TUNER);
+		v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_G_TUNER);
 	}
 	if (in_type_counter[HDMI] == 0) {
 		v4l2_disable_ioctl(&dev->vid_cap_dev, VIDIOC_S_EDID);
@@ -1056,6 +1152,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_disable_ioctl(&dev->vbi_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->sdr_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->meta_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
+	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_S_HW_FREQ_SEEK);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_S_FREQUENCY);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_G_FREQUENCY);
 	v4l2_disable_ioctl(&dev->vid_out_dev, VIDIOC_ENUM_FRAMESIZES);
@@ -1136,6 +1233,11 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
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
@@ -1148,6 +1250,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	INIT_LIST_HEAD(&dev->sdr_cap_active);
 	INIT_LIST_HEAD(&dev->meta_cap_active);
 	INIT_LIST_HEAD(&dev->meta_out_active);
+	INIT_LIST_HEAD(&dev->touch_cap_active);
 
 	INIT_LIST_HEAD(&dev->cec_work_list);
 	spin_lock_init(&dev->cec_slock);
@@ -1336,6 +1439,27 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		if (ret)
 			goto unreg_dev;
 	}
+	if (dev->has_touch_cap) {
+		/* initialize touch_cap queue */
+		q = &dev->vb_touch_cap_q;
+		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+		if (!allocator)
+			q->io_modes |= VB2_USERPTR;
+		q->drv_priv = dev;
+		q->buf_struct_size = sizeof(struct vivid_buffer);
+		q->ops = &vivid_touch_cap_qops;
+		q->mem_ops = vivid_mem_ops[allocator];
+		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		q->min_buffers_needed = 1;
+		q->lock = &dev->mutex;
+		q->dev = dev->v4l2_dev.dev;
+		q->supports_requests = true;
+
+		ret = vb2_queue_init(q);
+		if (ret)
+			goto unreg_dev;
+	}
 
 #ifdef CONFIG_VIDEO_VIVID_CEC
 	if (dev->has_vid_cap && in_type_counter[HDMI]) {
@@ -1379,6 +1503,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_cap);
 	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_meta_out);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_touch_cap);
 
 	/* finally start creating the device nodes */
 	if (dev->has_vid_cap) {
@@ -1665,6 +1790,33 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 			  video_device_node_name(vfd));
 	}
 
+	if (dev->has_touch_cap) {
+		vfd = &dev->touch_cap_dev;
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
@@ -1681,6 +1833,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	return 0;
 
 unreg_dev:
+	video_unregister_device(&dev->touch_cap_dev);
 	video_unregister_device(&dev->meta_out_dev);
 	video_unregister_device(&dev->meta_cap_dev);
 	video_unregister_device(&dev->radio_tx_dev);
@@ -1809,6 +1962,11 @@ static int vivid_remove(struct platform_device *pdev)
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
index d57066ed31f0..0827f6cf7d54 100644
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
@@ -200,6 +204,7 @@ struct vivid_dev {
 	bool				has_fb;
 	bool				has_meta_cap;
 	bool				has_meta_out;
+	bool				has_touch_cap;
 
 	bool				can_loop_video;
 
@@ -403,6 +408,8 @@ struct vivid_dev {
 	struct list_head		vbi_cap_active;
 	struct vb2_queue		vb_meta_cap_q;
 	struct list_head		meta_cap_active;
+	struct vb2_queue		vb_touch_cap_q;
+	struct list_head		touch_cap_active;
 
 	/* thread for generating video capture stream */
 	struct task_struct		*kthread_vid_cap;
@@ -424,6 +431,18 @@ struct vivid_dev {
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
+
 	/* video output */
 	const struct vivid_fmt		*fmt_out;
 	struct v4l2_fract		timeperframe_vid_out;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index b250fc3764e2..c2a5597a6480 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -1495,6 +1495,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	struct v4l2_ctrl_handler *hdl_sdr_cap = &dev->ctrl_hdl_sdr_cap;
 	struct v4l2_ctrl_handler *hdl_meta_cap = &dev->ctrl_hdl_meta_cap;
 	struct v4l2_ctrl_handler *hdl_meta_out = &dev->ctrl_hdl_meta_out;
+	struct v4l2_ctrl_handler *hdl_tch_cap = &dev->ctrl_hdl_touch_cap;
 
 	struct v4l2_ctrl_config vivid_ctrl_dv_timings = {
 		.ops = &vivid_vid_cap_ctrl_ops,
@@ -1538,6 +1539,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	v4l2_ctrl_new_custom(hdl_meta_cap, &vivid_ctrl_class, NULL);
 	v4l2_ctrl_handler_init(hdl_meta_out, 2);
 	v4l2_ctrl_new_custom(hdl_meta_out, &vivid_ctrl_class, NULL);
+	v4l2_ctrl_handler_init(hdl_tch_cap, 2);
+	v4l2_ctrl_new_custom(hdl_tch_cap, &vivid_ctrl_class, NULL);
 
 	/* User Controls */
 	dev->volume = v4l2_ctrl_new_std(hdl_user_aud, NULL,
@@ -1890,6 +1893,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
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
 
@@ -1911,4 +1921,5 @@ void vivid_free_controls(struct vivid_dev *dev)
 	v4l2_ctrl_handler_free(&dev->ctrl_hdl_fb);
 	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_cap);
 	v4l2_ctrl_handler_free(&dev->ctrl_hdl_meta_out);
+	v4l2_ctrl_handler_free(&dev->ctrl_hdl_touch_cap);
 }
diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index 9f981e8bae6e..84deafac0d26 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -779,7 +779,6 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
 			meta_cap_buf->vb.vb2_buf.index);
 		meta_cap_buf->vb.vb2_buf.timestamp = f_time + dev->cap_frame_eof_offset;
 	}
-
 	dev->dqbuf_error = false;
 
 update_mv:
diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.c b/drivers/media/platform/vivid/vivid-kthread-touch.c
new file mode 100644
index 000000000000..f39f10749a29
--- /dev/null
+++ b/drivers/media/platform/vivid/vivid-kthread-touch.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vivid-kthread-touch.h - touch capture thread support functions.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/font.h>
+#include <linux/mutex.h>
+#include <linux/videodev2.h>
+#include <linux/kthread.h>
+#include <linux/freezer.h>
+#include <linux/random.h>
+#include <linux/v4l2-dv-timings.h>
+#include <asm/div64.h>
+#include <media/videobuf2-vmalloc.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-rect.h>
+
+#include "vivid-core.h"
+#include "vivid-osd.h"
+#include "vivid-ctrls.h"
+#include "vivid-kthread-touch.h"
+#include "vivid-touch-cap.h"
+
+static noinline_for_stack void vivid_thread_tch_cap_tick(struct vivid_dev *dev,
+							 int dropped_bufs)
+{
+	struct vivid_buffer *tch_cap_buf = NULL;
+
+	dprintk(dev, 1, "Touch Capture Thread Tick\n");
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
+		denominator = dev->timeperframe_vid_cap.denominator;
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
+int vivid_start_generating_touch_cap(struct vivid_dev *dev, bool *pstreaming)
+{
+	dprintk(dev, 1, "%s\n", __func__);
+
+	if (dev->kthread_touch_cap) {
+		*pstreaming = true;
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
+	*pstreaming = true;
+	dprintk(dev, 1, "returning from %s\n", __func__);
+	return 0;
+}
+
+void vivid_stop_generating_touch_cap(struct vivid_dev *dev, bool *pstreaming)
+{
+	dprintk(dev, 1, "%s\n", __func__);
+
+	if (!dev->kthread_touch_cap)
+		return;
+
+	*pstreaming = false;
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
+	if (dev->touch_cap_streaming)
+		return;
+
+	kthread_stop(dev->kthread_touch_cap);
+	dev->kthread_touch_cap = NULL;
+}
diff --git a/drivers/media/platform/vivid/vivid-kthread-touch.h b/drivers/media/platform/vivid/vivid-kthread-touch.h
new file mode 100644
index 000000000000..db9cfa1b473c
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
+int vivid_start_generating_touch_cap(struct vivid_dev *dev, bool *pstreaming);
+void vivid_stop_generating_touch_cap(struct vivid_dev *dev, bool *pstreaming);
+
+#endif
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.c b/drivers/media/platform/vivid/vivid-touch-cap.c
new file mode 100644
index 000000000000..480846afc311
--- /dev/null
+++ b/drivers/media/platform/vivid/vivid-touch-cap.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vivid-touch-cap.c - touch support functions.
+ */
+
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-common.h>
+#include <linux/usb/video.h>
+
+#include "vivid-core.h"
+#include "vivid-kthread-touch.h"
+#include "vivid-touch-cap.h"
+
+static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				 unsigned int *nplanes, unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	unsigned int size = sizeof(struct vivid_touch_buf);
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
+	unsigned int size = sizeof(struct vivid_touch_buf);
+
+	dprintk(dev, 1, "%s\n", __func__);
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
+	dprintk(dev, 1, "%s\n", __func__);
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
+	dprintk(dev, 1, "%s\n", __func__);
+	dev->touch_cap_seq_count = 0;
+	if (dev->start_streaming_error) {
+		dev->start_streaming_error = false;
+		err = -EINVAL;
+	} else {
+		err = vivid_start_generating_touch_cap(dev,
+						       &dev->touch_cap_streaming);
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
+	dprintk(dev, 1, "%s\n", __func__);
+	vivid_stop_generating_touch_cap(dev, &dev->touch_cap_streaming);
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
+	struct vivid_dev *dev = video_drvdata(file);
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+	if (f->index)
+		return -EINVAL;
+
+	dprintk(dev, 1, "%s\n", __func__);
+
+	f->pixelformat = V4L2_TCH_FMT_TU16;
+	return 0;
+}
+
+int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct vivid_dev *dev = video_drvdata(file);
+
+	dprintk(dev, 1, "%s\n", __func__);
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	f->fmt.pix = dev->tch_format;
+	return 0;
+}
+
+int vivid_g_parm_tch(struct file *file, void *priv,
+		     struct v4l2_streamparm *parm)
+{
+	struct vivid_dev *dev = video_drvdata(file);
+
+	dprintk(dev, 1, "%s\n", __func__);
+
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+	parm->parm.capture.capability   = V4L2_CAP_TIMEPERFRAME;
+	parm->parm.capture.timeperframe = dev->timeperframe_tch_cap;
+	parm->parm.capture.readbuffers  = 1;
+	return 0;
+}
+
+int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp)
+{
+	struct vivid_dev *dev = video_drvdata(file);
+
+	dprintk(dev, 1, "%s\n", __func__);
+
+	if (inp->index >= dev->num_inputs)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_TOUCH;
+	snprintf(inp->name, sizeof(inp->name), "Vivid Touch %u",
+		 dev->input_name_counter[inp->index]);
+	inp->capabilities = 0;
+	return 0;
+}
+
+int vivid_set_touch(struct vivid_dev *dev, unsigned int i)
+{
+	struct v4l2_pix_format *f = &dev->tch_format;
+
+	if (i >= dev->num_inputs)
+		return -EINVAL;
+
+	dev->input = i;
+	f->pixelformat = V4L2_TCH_FMT_TU16;
+	f->width =  VIVID_TCH_WIDTH;
+	f->height = VIVID_TCH_HEIGHT;
+	f->field = V4L2_FIELD_NONE;
+	f->colorspace = V4L2_COLORSPACE_RAW;
+	f->bytesperline = f->width * sizeof(u16);
+	f->sizeimage = f->width * f->height * sizeof(u16);
+	return 0;
+}
+
+int vivid_s_input_tch(struct file *file, void *priv, unsigned int i)
+{
+	return vivid_set_touch(video_drvdata(file), i);
+}
+
+void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf)
+{
+	int size = VIVID_TCH_WIDTH * VIVID_TCH_HEIGHT;
+	int touch_width = VIVID_TCH_WIDTH / 4;
+	int i = 0, j = 0;
+	struct vivid_touch_buf *tch_buf = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+
+	buf->vb.sequence = dev->touch_cap_seq_count;
+
+	memset(tch_buf, 1, vb2_plane_size(&buf->vb.vb2_buf, 0));
+
+	for (i = 0; i < (size / 4 + touch_width) ; i = i + VIVID_TCH_WIDTH)
+		for (j = i ; j < i + touch_width; j++)
+			tch_buf->buf[j] = buf->vb.sequence;
+}
diff --git a/drivers/media/platform/vivid/vivid-touch-cap.h b/drivers/media/platform/vivid/vivid-touch-cap.h
new file mode 100644
index 000000000000..9286afab5425
--- /dev/null
+++ b/drivers/media/platform/vivid/vivid-touch-cap.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * vivid-touch-cap.h - touch support functions.
+ */
+#ifndef _VIVID_TOUCH_CAP_H_
+#define _VIVID_TOUCH_CAP_H_
+
+#define VIVID_TCH_HEIGHT	24
+#define VIVID_TCH_WIDTH		14
+
+struct vivid_touch_buf {
+	u16	buf[VIVID_TCH_WIDTH * VIVID_TCH_HEIGHT];
+};
+
+extern const struct vb2_ops vivid_touch_cap_qops;
+
+int vivid_enum_fmt_tch(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
+int vivid_g_fmt_tch(struct file *file, void *priv, struct v4l2_format *f);
+int vivid_enum_input_tch(struct file *file, void *priv, struct v4l2_input *inp);
+int vivid_s_input_tch(struct file *file, void *priv, unsigned int i);
+void vivid_fillbuff_tch(struct vivid_dev *dev, struct vivid_buffer *buf);
+int vivid_set_touch(struct vivid_dev *dev, unsigned int i);
+int vivid_g_parm_tch(struct file *file, void *priv,
+		     struct v4l2_streamparm *parm);
+#endif
-- 
2.17.1

