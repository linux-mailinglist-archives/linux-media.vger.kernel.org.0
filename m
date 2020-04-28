Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44C21BCE24
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgD1VDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:03:18 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:34063 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgD1VDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:03:18 -0400
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 54D0D20000D;
        Tue, 28 Apr 2020 21:03:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v5 5/6] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Date:   Tue, 28 Apr 2020 23:06:08 +0200
Message-Id: <20200428210609.6793-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200428210609.6793-1-jacopo@jmondi.org>
References: <20200428210609.6793-1-jacopo@jmondi.org>
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
index f3fe515b8ccb..b8c0071aa4d0 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 #include <linux/videodev2.h>
 #include <linux/export.h>
+#include <linux/version.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -331,6 +332,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
index 03970ce30741..89dc8f2ba6b3 100644
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
+#define V4L2_SUBDEV_CAP_RO_SUBDEV		BIT(0)
+/* The v4l2 sub-device video device node is registered in read/write mode. */
+#define V4L2_SUBDEV_CAP_RW_SUBDEV		BIT(1)
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
+#define VIDIOC_SUBDEV_QUERYCAP			_IOR('V',  0, struct v4l2_subdev_capability)
 #define VIDIOC_SUBDEV_G_FMT			_IOWR('V',  4, struct v4l2_subdev_format)
 #define VIDIOC_SUBDEV_S_FMT			_IOWR('V',  5, struct v4l2_subdev_format)
 #define VIDIOC_SUBDEV_G_FRAME_INTERVAL		_IOWR('V', 21, struct v4l2_subdev_frame_interval)
-- 
2.26.1

