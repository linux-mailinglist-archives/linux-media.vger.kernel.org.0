Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E72150583
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgBCLl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:41:26 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:52661 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728132AbgBCLl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Feb 2020 06:41:26 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ya6RiS69Jn7E5ya6Vi3UG3; Mon, 03 Feb 2020 12:41:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580730083; bh=Xtiv/27VeIdZHG64au1PeMJeLAf2XJHW+f6L2zCxN+U=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type:From:
         Subject;
        b=M92hzOrwCs6IDtQ0h9zMzG3rbSdJEHlvYUSk3il7QZRK46VgqP8An74da+h2Ri8gn
         00ze+5Ka6lj8HgbxrYklaAVxDI77D16wFZ+jT0WXEbWksvcKJp67mg+OYygnvqKbFM
         p1T3ANK8sU+DYVOCWgNzu7w050KIUL35Yh2qpS+JrB7p4Me5kxaHV9QpUjw2z+EwGV
         i9/ac+qv2Y+0gvaUhAyxbizxnkJ3NMT/wrmESJlM+kotran5drfdYviCZhJ7EBNxeG
         l6ffuacEnvrkMrvVjzo9/3bEgtK9MnvK8Vc5HC8zAAE+byDlJCIL3WLYcitNYi+TwL
         ihieepHTdNY9w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 01/11] media: rename VFL_TYPE_GRABBER to _VIDEO
Date:   Mon,  3 Feb 2020 12:41:09 +0100
Message-Id: <20200203114119.1177490-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
References: <20200203114119.1177490-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIcJpnlN9m/KZZWXUcA/IPSHeRA+n4UEovjZBDx/LgBH0uK9vSpmYLy/Gp/zhucJMSn9yp7K39IasreQ/iVeHZMoX/3u7hgOP7Y8nDmdRCX3VvvPDse+
 PI6HKl1RO9IoBOMLdfMw9SX5QnzLSF+4Gn4IBl2G0WNRDcNlyDTj7e6A1wCJUglgdhsA+jhycoHGsruqYlqTAPs/h3uDEiuU/M16Wj1+7dpkXPOFUFcR/niX
 fyr7+S9y2aXvzptETIL4kBtgzwNNKubh9mV+VF7M7YZADDP9ctHUzFWH7FGVzZRdQKdqIbTyoib5AUmMD1XfyA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We currently have the following devnode types:

enum vfl_devnode_type {
        VFL_TYPE_GRABBER        = 0,
        VFL_TYPE_VBI,
        VFL_TYPE_RADIO,
        VFL_TYPE_SUBDEV,
        VFL_TYPE_SDR,
        VFL_TYPE_TOUCH,
        VFL_TYPE_MAX /* Shall be the last one */
};

They all make sense, except for the first: GRABBER really refers to /dev/videoX
devices, which can be capture, output or m2m, so 'grabber' doesn't even refer to
their function anymore.

Let's call a spade a spade and rename this to VFL_TYPE_VIDEO.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/media/kapi/v4l2-dev.rst                  |  4 ++--
 .../translations/zh_CN/video4linux/v4l2-framework.txt  |  4 ++--
 drivers/media/v4l2-core/v4l2-dev.c                     | 10 +++++-----
 drivers/media/v4l2-core/v4l2-ioctl.c                   |  4 ++--
 include/media/v4l2-dev.h                               |  6 ++++--
 samples/v4l/v4l2-pci-skeleton.c                        |  2 +-
 6 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/Documentation/media/kapi/v4l2-dev.rst b/Documentation/media/kapi/v4l2-dev.rst
index 4c5a15c53dbf..63c064837c00 100644
--- a/Documentation/media/kapi/v4l2-dev.rst
+++ b/Documentation/media/kapi/v4l2-dev.rst
@@ -185,7 +185,7 @@ This will create the character device for you.
 
 .. code-block:: c
 
-	err = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (err) {
 		video_device_release(vdev); /* or kfree(my_vdev); */
 		return err;
@@ -201,7 +201,7 @@ types exist:
 ========================== ====================	 ==============================
 :c:type:`vfl_devnode_type` Device name		 Usage
 ========================== ====================	 ==============================
-``VFL_TYPE_GRABBER``       ``/dev/videoX``       for video input/output devices
+``VFL_TYPE_VIDEO``         ``/dev/videoX``       for video input/output devices
 ``VFL_TYPE_VBI``           ``/dev/vbiX``         for vertical blank data (i.e.
 						 closed captions, teletext)
 ``VFL_TYPE_RADIO``         ``/dev/radioX``       for radio tuners
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
index 66c7c568bd86..9c39ee58ea50 100644
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
@@ -649,7 +649,7 @@ video_device注册
 
 接下来你需要注册视频设备：这会为你创建一个字符设备。
 
-	err = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (err) {
 		video_device_release(vdev); /* or kfree(my_vdev); */
 		return err;
@@ -660,7 +660,7 @@ video_device注册
 
 注册哪种设备是根据类型（type）参数。存在以下类型：
 
-VFL_TYPE_GRABBER: 用于视频输入/输出设备的 videoX
+VFL_TYPE_VIDEO: 用于视频输入/输出设备的 videoX
 VFL_TYPE_VBI: 用于垂直消隐数据的 vbiX (例如，隐藏式字幕，图文电视)
 VFL_TYPE_RADIO: 用于广播调谐器的 radioX
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index da42d172714a..97b6a3af1361 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -542,13 +542,13 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			      V4L2_CAP_META_OUTPUT;
 	DECLARE_BITMAP(valid_ioctls, BASE_VIDIOC_PRIVATE);
 	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
-	bool is_vid = vdev->vfl_type == VFL_TYPE_GRABBER &&
+	bool is_vid = vdev->vfl_type == VFL_TYPE_VIDEO &&
 		      (vdev->device_caps & vid_caps);
 	bool is_vbi = vdev->vfl_type == VFL_TYPE_VBI;
 	bool is_radio = vdev->vfl_type == VFL_TYPE_RADIO;
 	bool is_sdr = vdev->vfl_type == VFL_TYPE_SDR;
 	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
-	bool is_meta = vdev->vfl_type == VFL_TYPE_GRABBER &&
+	bool is_meta = vdev->vfl_type == VFL_TYPE_VIDEO &&
 		       (vdev->device_caps & meta_caps);
 	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
@@ -783,7 +783,7 @@ static int video_register_media_controller(struct video_device *vdev)
 	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;
 
 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		intf_type = MEDIA_INTF_T_V4L_VIDEO;
 		vdev->entity.function = MEDIA_ENT_F_IO_V4L;
 		break;
@@ -891,7 +891,7 @@ int __video_register_device(struct video_device *vdev,
 
 	/* Part 1: check device type */
 	switch (type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		name_base = "video";
 		break;
 	case VFL_TYPE_VBI:
@@ -935,7 +935,7 @@ int __video_register_device(struct video_device *vdev,
 	 * of 128-191 and just pick the first free minor there
 	 * (new style). */
 	switch (type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		minor_offset = 0;
 		minor_cnt = 64;
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index aaf83e254272..fbcc7a20eedf 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -941,12 +941,12 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 			      V4L2_CAP_META_OUTPUT;
 	struct video_device *vfd = video_devdata(file);
 	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
-	bool is_vid = vfd->vfl_type == VFL_TYPE_GRABBER &&
+	bool is_vid = vfd->vfl_type == VFL_TYPE_VIDEO &&
 		      (vfd->device_caps & vid_caps);
 	bool is_vbi = vfd->vfl_type == VFL_TYPE_VBI;
 	bool is_sdr = vfd->vfl_type == VFL_TYPE_SDR;
 	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
-	bool is_meta = vfd->vfl_type == VFL_TYPE_GRABBER &&
+	bool is_meta = vfd->vfl_type == VFL_TYPE_VIDEO &&
 		       (vfd->device_caps & meta_caps);
 	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
 	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 48531e57cc5a..5e7c0f8acd05 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -24,7 +24,8 @@
 /**
  * enum vfl_devnode_type - type of V4L2 device node
  *
- * @VFL_TYPE_GRABBER:	for video input/output devices
+ * @VFL_TYPE_VIDEO:	for video input/output devices
+ * @VFL_TYPE_GRABBER:	deprecated, same as VFL_TYPE_VIDEO
  * @VFL_TYPE_VBI:	for vertical blank data (i.e. closed captions, teletext)
  * @VFL_TYPE_RADIO:	for radio tuners
  * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
@@ -33,7 +34,8 @@
  * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
  */
 enum vfl_devnode_type {
-	VFL_TYPE_GRABBER	= 0,
+	VFL_TYPE_VIDEO,
+	VFL_TYPE_GRABBER = VFL_TYPE_VIDEO,
 	VFL_TYPE_VBI,
 	VFL_TYPE_RADIO,
 	VFL_TYPE_SUBDEV,
diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index f6a551bd57ef..3fa6582b4a68 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -879,7 +879,7 @@ static int skeleton_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	vdev->tvnorms = SKEL_TVNORMS;
 	video_set_drvdata(vdev, skel);
 
-	ret = video_register_device(vdev, VFL_TYPE_GRABBER, -1);
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto free_hdl;
 
-- 
2.24.0

