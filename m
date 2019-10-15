Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75627D78C0
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 16:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732806AbfJOOhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 10:37:01 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:17315 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732770AbfJOOhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 10:37:01 -0400
X-Halon-ID: 0d8ef4e4-ef59-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 0d8ef4e4-ef59-11e9-837a-0050569116f7;
        Tue, 15 Oct 2019 16:35:37 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Tue, 15 Oct 2019 16:35:50 +0200
Message-Id: <20191015143552.317669-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a video device capability flag to indicate that its inputs and/or
outputs are controlled by the Media Controller instead of the V4L2 API.
When this flag is set, ioctls for get, set and enum inputs and outputs
are automatically enabled and programmed to call helper function

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../media/uapi/v4l/vidioc-querycap.rst        |  3 +
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-dev.c            | 24 +++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 87 ++++++++++++++++++-
 include/uapi/linux/videodev2.h                |  2 +
 5 files changed, 107 insertions(+), 10 deletions(-)

diff --git a/Documentation/media/uapi/v4l/vidioc-querycap.rst b/Documentation/media/uapi/v4l/vidioc-querycap.rst
index 5f9930195d624c73..8b621ecb906afe96 100644
--- a/Documentation/media/uapi/v4l/vidioc-querycap.rst
+++ b/Documentation/media/uapi/v4l/vidioc-querycap.rst
@@ -264,6 +264,9 @@ specification the ioctl returns an ``EINVAL`` error code.
     * - ``V4L2_CAP_TOUCH``
       - 0x10000000
       - This is a touch device.
+    * - ``V4L2_CAP_IO_MC``
+      - 0x20000000
+      - The inputs and/or outputs of this device are controlled by the Media Controller see :ref:`media_controller`.
     * - ``V4L2_CAP_DEVICE_CAPS``
       - 0x80000000
       - The driver fills the ``device_caps`` field. This capability can
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index b58e381bdf7bd38a..6c78a79fa45de283 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -173,6 +173,7 @@ replace define V4L2_CAP_STREAMING device-capabilities
 replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
+replace define V4L2_CAP_IO_MC device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 4037689a945a5330..851e645414600941 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -702,22 +702,34 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
 		if (is_rx) {
 			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
-			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
-			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
-			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
 			SET_VALID_IOCTL(ops, VIDIOC_QUERY_DV_TIMINGS, vidioc_query_dv_timings);
 			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
+			if (vdev->device_caps & V4L2_CAP_IO_MC) {
+				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
+			} else {
+				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
+				SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
+				SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
+			}
 		}
 		if (is_tx) {
-			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
-			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
-			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
+			if (vdev->device_caps & V4L2_CAP_IO_MC) {
+				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
+				set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
+			} else {
+				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
+				SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
+				SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
+			}
 		}
 		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_GRABBER &&
 					ops->vidioc_g_std))
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f4f6f..e4d2ec4ccd49f65e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1075,6 +1075,72 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
 	return ret;
 }
 
+static int v4l2_ioctl_enum_input_mc(struct file *file, void *priv,
+				    struct v4l2_input *i)
+{
+	struct video_device *vfd = video_devdata(file);
+
+	if (i->index > 0)
+		return -EINVAL;
+
+	memset(i, 0, sizeof(*i));
+	strlcpy(i->name, vfd->name, sizeof(i->name));
+	i->type = V4L2_INPUT_TYPE_CAMERA;
+
+	return 0;
+}
+
+static int v4l2_ioctl_enum_output_mc(struct file *file, void *priv,
+				     struct v4l2_output *o)
+{
+	struct video_device *vfd = video_devdata(file);
+
+	if (o->index > 0)
+		return -EINVAL;
+
+	memset(o, 0, sizeof(*o));
+	strlcpy(o->name, vfd->name, sizeof(o->name));
+	o->type = V4L2_OUTPUT_TYPE_ANALOG;
+
+	return 0;
+}
+
+static int v4l2_ioctl_g_input_mc(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+#define v4l2_ioctl_g_output_mc v4l2_ioctl_g_input_mc
+
+static int v4l2_ioctl_s_input_mc(struct file *file, void *priv, unsigned int i)
+{
+	return i ? -EINVAL : 0;
+}
+#define v4l2_ioctl_s_output_mc v4l2_ioctl_s_input_mc
+
+
+static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
+		       struct file *file, void *fh, void *arg)
+{
+	struct video_device *vfd = video_devdata(file);
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_g_input_mc(file, fh, arg);
+
+	return ops->vidioc_g_input(file, fh, arg);
+}
+
+static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
+		       struct file *file, void *fh, void *arg)
+{
+	struct video_device *vfd = video_devdata(file);
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_g_output_mc(file, fh, arg);
+
+	return ops->vidioc_g_output(file, fh, arg);
+}
+
 static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
@@ -1084,12 +1150,21 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
 	ret = v4l_enable_media_source(vfd);
 	if (ret)
 		return ret;
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_s_input_mc(file, fh, *(unsigned int *)arg);
+
 	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
 }
 
 static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
+	struct video_device *vfd = video_devdata(file);
+
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_s_output_mc(file, fh, *(unsigned int *)arg);
+
 	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
 }
 
@@ -1133,6 +1208,9 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
 		p->capabilities |= V4L2_IN_CAP_STD;
 
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_enum_input_mc(file, fh, p);
+
 	return ops->vidioc_enum_input(file, fh, p);
 }
 
@@ -1151,6 +1229,9 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
 		p->capabilities |= V4L2_OUT_CAP_STD;
 
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_enum_output_mc(file, fh, p);
+
 	return ops->vidioc_enum_output(file, fh, p);
 }
 
@@ -2663,10 +2744,8 @@ DEFINE_V4L_STUB_FUNC(expbuf)
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
@@ -2715,11 +2794,11 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
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
index b3c0961b62a0cba7..8c86f6f5b3d06b26 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -487,6 +487,8 @@ struct v4l2_capability {
 
 #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
 
+#define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
+
 #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
 
 /*
-- 
2.23.0

