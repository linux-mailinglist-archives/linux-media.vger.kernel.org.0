Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB69FFE8EB
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfKOX5Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:57:16 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:51323 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727406AbfKOX5Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:16 -0500
X-Halon-ID: a2efb674-0803-11ea-a0b9-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a2efb674-0803-11ea-a0b9-005056917f90;
        Sat, 16 Nov 2019 00:57:12 +0100 (CET)
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
Subject: [PATCH v2 4/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
Date:   Sat, 16 Nov 2019 00:55:57 +0100
Message-Id: <20191115235559.806041-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a video device capability flag to indicate that its inputs and/or
outputs are controlled by the Media Controller instead of the V4L2 API.
When this flag is set, ioctl for enum inputs and outputs are
automatically enabled and programmed to call a helper function.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../media/uapi/v4l/vidioc-querycap.rst        |  3 ++
 .../media/videodev2.h.rst.exceptions          |  1 +
 drivers/media/v4l2-core/v4l2-dev.c            | 10 ++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          | 36 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  2 ++
 5 files changed, 50 insertions(+), 2 deletions(-)

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
index 4293df8d664f70b3..f0f5fcaa618c7be8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -725,7 +725,6 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_STD, vidioc_g_std);
 		if (is_rx) {
 			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
-			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
 			set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
 			set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
@@ -733,14 +732,21 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
 			SET_VALID_IOCTL(ops, VIDIOC_QUERY_DV_TIMINGS, vidioc_query_dv_timings);
 			SET_VALID_IOCTL(ops, VIDIOC_S_EDID, vidioc_s_edid);
+			if (vdev->device_caps & V4L2_CAP_IO_MC)
+				set_bit(_IOC_NR(VIDIOC_ENUMINPUT), valid_ioctls);
+			else
+				SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
 		}
 		if (is_tx) {
-			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
 			set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
 			set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
 			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
+			if (vdev->device_caps & V4L2_CAP_IO_MC)
+				set_bit(_IOC_NR(VIDIOC_ENUMOUTPUT), valid_ioctls);
+			else
+				SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
 		}
 		if (ops->vidioc_g_parm || ops->vidioc_g_std)
 			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4a461de28677c5a8..a1c048c8fe6eff2f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1085,6 +1085,36 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
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
 static int v4l2_ioctl_g_single_input(struct file *file, void *priv, unsigned int *i)
 {
 	*i = 0;
@@ -1181,6 +1211,9 @@ static int v4l_enuminput(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
 		p->capabilities |= V4L2_IN_CAP_STD;
 
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_enum_input_mc(file, fh, p);
+
 	return ops->vidioc_enum_input(file, fh, p);
 }
 
@@ -1199,6 +1232,9 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
 	if (is_valid_ioctl(vfd, VIDIOC_S_STD))
 		p->capabilities |= V4L2_OUT_CAP_STD;
 
+	if (vfd->device_caps & V4L2_CAP_IO_MC)
+		return v4l2_ioctl_enum_output_mc(file, fh, p);
+
 	return ops->vidioc_enum_output(file, fh, p);
 }
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 04481c717fee75c4..c97b55bc19eb892a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -487,6 +487,8 @@ struct v4l2_capability {
 
 #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
 
+#define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
+
 #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
 
 /*
-- 
2.24.0

