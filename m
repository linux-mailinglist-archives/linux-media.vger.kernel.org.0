Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D14A1BCE22
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 23:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgD1VDQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 17:03:16 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:45811 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgD1VDP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 17:03:15 -0400
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 34E38200005;
        Tue, 28 Apr 2020 21:03:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v5 4/6] media: v4l2-subdev: Assume V4L2_SUBDEV_API is selected
Date:   Tue, 28 Apr 2020 23:06:07 +0200
Message-Id: <20200428210609.6793-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200428210609.6793-1-jacopo@jmondi.org>
References: <20200428210609.6793-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A sub-device device node can be registered in user space only if the
CONFIG_V4L2_SUBDEV_API Kconfig option is selected.

Remove checks from the v4l2-subdev file handle open/close functions and
ioctl handler as they are only accessible if a device node was registered
to user space in first place.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1dc263c2ca0a..f3fe515b8ccb 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -24,22 +24,19 @@
 
 static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	if (sd->entity.num_pads) {
 		fh->pad = v4l2_subdev_alloc_pad_config(sd);
 		if (fh->pad == NULL)
 			return -ENOMEM;
 	}
-#endif
+
 	return 0;
 }
 
 static void subdev_fh_free(struct v4l2_subdev_fh *fh)
 {
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	v4l2_subdev_free_pad_config(fh->pad);
 	fh->pad = NULL;
-#endif
 }
 
 static int subdev_open(struct file *file)
@@ -329,10 +326,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
 	struct v4l2_fh *vfh = file->private_data;
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
-#endif
 	int rval;
 
 	switch (cmd) {
@@ -466,7 +461,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		return ret;
 	}
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 	case VIDIOC_SUBDEV_G_FMT: {
 		struct v4l2_subdev_format *format = arg;
 
@@ -646,7 +640,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 	case VIDIOC_SUBDEV_QUERYSTD:
 		return v4l2_subdev_call(sd, video, querystd, arg);
-#endif
+
 	default:
 		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
 	}
-- 
2.26.1

