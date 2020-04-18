Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C991AEBD2
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 12:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgDRKaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 06:30:00 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54423 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgDRK37 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 06:29:59 -0400
X-Originating-IP: 87.13.136.104
Received: from uno.homenet.telecomitalia.it (unknown [87.13.136.104])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4617060002;
        Sat, 18 Apr 2020 10:29:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v4 4/5] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Date:   Sat, 18 Apr 2020 12:32:15 +0200
Message-Id: <20200418103216.140572-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200418103216.140572-1-jacopo@jmondi.org>
References: <20200418103216.140572-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

While normal video/radio/vbi/swradio nodes have a proper QUERYCAP ioctl
that apps can call to determine that it is indeed a V4L2 device, there
is currently no equivalent for v4l-subdev nodes. Adding this ioctl will
solve that, and it will allow utilities like v4l2-compliance to be used
with these devices as well.

SUBDEV_QUERYCAP currently returns the version and subdev_caps of the
subdevice. Define as the initial set of subdev_caps the read-only or
read/write flags, to signal to userspace which set of IOCTLs are
available on the subdevice.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++++
 include/uapi/linux/v4l2-subdev.h      | 15 +++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1dc263c2ca0a..ca0aa54429c5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 #include <linux/videodev2.h>
 #include <linux/export.h>
+#include <linux/version.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -336,6 +337,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	int rval;
 
 	switch (cmd) {
+	case VIDIOC_SUBDEV_QUERYCAP: {
+		struct v4l2_subdev_capability *cap = arg;
+
+		memset(cap, 0, sizeof(*cap));
+		cap->version = LINUX_VERSION_CODE;
+		cap->subdev_caps |= ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV
+					      : V4L2_SUBDEV_CAP_RW_SUBDEV;
+
+		return 0;
+	}
+
 	case VIDIOC_QUERYCTRL:
 		/*
 		 * TODO: this really should be folded into v4l2_queryctrl (this
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 03970ce30741..0886f88be193 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -155,9 +155,24 @@ struct v4l2_subdev_selection {
 	__u32 reserved[8];
 };
 
+/**
+ * struct v4l2_subdev_capability - subdev capabilities
+ * @device_caps: the subdev capabilities, see V4L2_SUBDEV_CAP_*.
+ */
+struct v4l2_subdev_capability {
+	__u32 version;
+	__u32 subdev_caps;
+};
+
+/* The v4l2 sub-device video device node is registered in read-only mode. */
+#define V4L2_SUBDEV_CAP_RO_SUBDEV		(1 << 0)
+/* The v4l2 sub-device video device node is registered in read/write mode. */
+#define V4L2_SUBDEV_CAP_RW_SUBDEV		(1 << 1)
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
+#define VIDIOC_SUBDEV_QUERYCAP			_IOR('V',  0, struct v4l2_subdev_capability)
 #define VIDIOC_SUBDEV_G_FMT			_IOWR('V',  4, struct v4l2_subdev_format)
 #define VIDIOC_SUBDEV_S_FMT			_IOWR('V',  5, struct v4l2_subdev_format)
 #define VIDIOC_SUBDEV_G_FRAME_INTERVAL		_IOWR('V', 21, struct v4l2_subdev_frame_interval)
-- 
2.26.1

