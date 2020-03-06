Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFEF17C328
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 17:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgCFQkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 11:40:25 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:31366 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgCFQkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 11:40:24 -0500
X-Halon-ID: 2704960c-5fc9-11ea-aa6d-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 2704960c-5fc9-11ea-aa6d-005056917f90;
        Fri, 06 Mar 2020 17:40:14 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 1/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Fri,  6 Mar 2020 17:39:33 +0100
Message-Id: <20200306163935.805333-2-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Add a video device capability flag to indicate that its inputs and/or
outputs are controlled by the Media Controller instead of the V4L2 API.
When this flag is set, ioctl for enum inputs and outputs are
automatically enabled and programmed to call a helper function.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- Update documentation for V4L2_CAP_IO_MC
- Only enable VIDIOC_{G,S}_{INPUT,OUTPUT} if V4L2_CAP_IO_MC is set
  (instead of unconditionally)
- Merge v4l2_ioctl_enum_input_mc() into v4l_enuminput()
- Merge v4l2_ioctl_enum_output_mc() into v4l_enumoutput()

* Changes since v2
- Merged the two patches touching V4L2 core stuff to a single patch.
- Updated documentation for V4L2_CAP_IO_MC
- Added is_io_mc bool in determine_valid_ioctls()
- Folded or moved code closer to where it's used
- Remove unneeded memset()
- Use strscpy() instead of strlcpy()
---
 .../media/uapi/v4l/vidioc-querycap.rst        |  6 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-dev.c            | 25 ++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 57 +++++++++++++++++--
 include/uapi/linux/videodev2.h                |  2 +
 5 files changed, 81 insertions(+), 10 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/media/uapi/v4l/vidioc-querycap.rst
index 5f9930195d624c73..497a6aa2cbebad71 100644
--- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
+++ b/Documentation/media/uapi/v4l/vidioc-querycap.rst
@@ -264,6 +264,12 @@ specification the ioctl returns an ``EINVAL`` error code.
     * - ``V4L2_CAP_TOUCH``
       - 0x10000000
       - This is a touch device.
+    * - ``V4L2_CAP_IO_MC``
+      - 0x20000000
+      - There is only one input and/or output seen from userspace. The whole
+        video topology configuration, including which I/O entity is routed to
+        the input/output, is configured by userspace via the Media Controller.
+        See :ref:`media_controller`.
     * - ``V4L2_CAP_DEVICE_CAPS``
       - 0x80000000
       - The driver fills the ``device_caps`` field. This capability can
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index cb6ccf91776e6b56..a625fb90e3a989a7 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -176,6 +176,7 @@ replace define V4L2_CAP_STREAMING device-capabilities
 replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
+replace define V4L2_CAP_IO_MC device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 97b6a3af13614639..a593ea0598b551b4 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -552,6 +552,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		       (vdev->device_caps & meta_caps);
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
+	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
 
 	bitmap_zero(valid_ioctls, BASE_VIDIOC_PRIVATE);
 
@@ -725,9 +726,15 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
 		if (is_rx) {
 			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
-			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
-			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
-			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+			if (is_io_mc) {
+				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
+			} else {
+				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
+				SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
+				SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+			}
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
@@ -735,9 +742,15 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
 		}
 		if (is_tx) {
-			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
-			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
-			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
+			if (is_io_mc) {
+				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
+			} else {
+				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
+				SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
+				SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
+			}
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index fbcc7a20eedf553a..58e9e728f0a7aa4b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1085,6 +1085,32 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 	return ret;
 }
 
+static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
+		       struct file *file, void *fh, void *arg)
+{
+	struct video_device *vfd = video_devdata(file);
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC) {
+		*(unsigned int *)arg = 0;
+		return 0;
+	}
+
+	return ops->vidioc_g_input(file, fh, arg);
+}
+
+static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
+		       struct file *file, void *fh, void *arg)
+{
+	struct video_device *vfd = video_devdata(file);
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC) {
+		*(unsigned int *)arg = 0;
+		return 0;
+	}
+
+	return ops->vidioc_g_output(file, fh, arg);
+}
+
 static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1094,12 +1120,21 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
 	ret = v4l_enable_media_source(vfd);
 	if (ret)
 		return ret;
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return  *(unsigned int *)arg ? -EINVAL : 0;
+
 	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
 }
 
 static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
+	struct video_device *vfd = video_devdata(file);
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return  *(unsigned int *)arg ? -EINVAL : 0;
+
 	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
 }
 
@@ -1143,6 +1178,14 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
 		p->capabilities |= V4L2_IN_CAP_STD;
 
+	if (vfd->device_caps & V4L2_CAP_IO_MC) {
+		if (p->index)
+			return -EINVAL;
+		strscpy(p->name, vfd->name, sizeof(p->name));
+		p->type = V4L2_INPUT_TYPE_CAMERA;
+		return 0;
+	}
+
 	return ops->vidioc_enum_input(file, fh, p);
 }
 
@@ -1161,6 +1204,14 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
 		p->capabilities |= V4L2_OUT_CAP_STD;
 
+	if (vfd->device_caps & V4L2_CAP_IO_MC) {
+		if (p->index)
+			return -EINVAL;
+		strscpy(p->name, vfd->name, sizeof(p->name));
+		p->type = V4L2_OUTPUT_TYPE_ANALOG;
+		return 0;
+	}
+
 	return ops->vidioc_enum_output(file, fh, p);
 }
 
@@ -2678,10 +2729,8 @@ DEFINE_V4L_STUB_FUNC(expbuf)
 DEFINE_V4L_STUB_FUNC(g_std)
 DEFINE_V4L_STUB_FUNC(g_audio)
 DEFINE_V4L_STUB_FUNC(s_audio)
-DEFINE_V4L_STUB_FUNC(g_input)
 DEFINE_V4L_STUB_FUNC(g_edid)
 DEFINE_V4L_STUB_FUNC(s_edid)
-DEFINE_V4L_STUB_FUNC(g_output)
 DEFINE_V4L_STUB_FUNC(g_audout)
 DEFINE_V4L_STUB_FUNC(s_audout)
 DEFINE_V4L_STUB_FUNC(g_jpegcomp)
@@ -2730,11 +2779,11 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
 	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
 	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
-	IOCTL_INFO(VIDIOC_G_INPUT, v4l_stub_g_input, v4l_print_u32, 0),
+	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
 	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
 	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
-	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_stub_g_output, v4l_print_u32, 0),
+	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
 	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
 	IOCTL_INFO(VIDIOC_ENUMOUTPUT, v4l_enumoutput, v4l_print_enumoutput, INFO_FL_CLEAR(v4l2_output, index)),
 	IOCTL_INFO(VIDIOC_G_AUDOUT, v4l_stub_g_audout, v4l_print_audioout, 0),
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5f9357dcb0602126..c793263a37052856 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -487,6 +487,8 @@ struct v4l2_capability {
 
 #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
 
+#define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
+
 #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
 
 /*
-- 
2.25.1

