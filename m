Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5B0BEC42
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 08:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfIZG6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 02:58:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40591 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727244AbfIZG6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 02:58:34 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DNjPiJv8jKKNGDNjTi0iNT; Thu, 26 Sep 2019 08:58:31 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH] media: rename VFL_TYPE_GRABBER to _VIDEO
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <54111b26-b5ff-6b4c-e13e-933180cd13f9@xs4all.nl>
Date:   Thu, 26 Sep 2019 08:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKdS4WjMIz7pOM1mDPcTchyusmdHmpT3nw26cFhLN8qZPpJrN7iINZx+c3xVklAR0+pa1HRRgROENsogsENkDVRM3ncBlN5k6A2ocu9aJ1JAAQU8fWvv
 NNTwAZ0DmMDaX0c64/7i3tGKVnQvlgfB8ooLlHL8OD3AOviXbY2TNS9UTBQI0675qok+qNIRF2PNeA==
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
---
This patch converts the core files. If others are OK with this, then I can post
a full series that also converts all drivers that use it (very easy search-and-replace)
and finally remove the old GRABBER enum.
---
 Documentation/media/kapi/v4l2-dev.rst                  |  4 ++--
 .../translations/zh_CN/video4linux/v4l2-framework.txt  |  4 ++--
 drivers/media/v4l2-core/v4l2-dev.c                     | 10 +++++-----
 drivers/media/v4l2-core/v4l2-ioctl.c                   |  2 +-
 include/media/v4l2-dev.h                               |  6 ++++--
 samples/v4l/v4l2-pci-skeleton.c                        |  2 +-
 6 files changed, 15 insertions(+), 13 deletions(-)

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
index 4037689a945a..694108b12a27 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -535,7 +535,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 {
 	DECLARE_BITMAP(valid_ioctls, BASE_VIDIOC_PRIVATE);
 	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
-	bool is_vid = vdev->vfl_type == VFL_TYPE_GRABBER;
+	bool is_vid = vdev->vfl_type == VFL_TYPE_VIDEO;
 	bool is_vbi = vdev->vfl_type == VFL_TYPE_VBI;
 	bool is_radio = vdev->vfl_type == VFL_TYPE_RADIO;
 	bool is_sdr = vdev->vfl_type == VFL_TYPE_SDR;
@@ -719,7 +719,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
 			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
 			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
 		}
-		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_GRABBER &&
+		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_VIDEO &&
 					ops->vidioc_g_std))
 			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);
 		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
@@ -761,7 +761,7 @@ static int video_register_media_controller(struct video_device *vdev)
 	vdev->entity.function = MEDIA_ENT_F_UNKNOWN;

 	switch (vdev->vfl_type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		intf_type = MEDIA_INTF_T_V4L_VIDEO;
 		vdev->entity.function = MEDIA_ENT_F_IO_V4L;
 		break;
@@ -869,7 +869,7 @@ int __video_register_device(struct video_device *vdev,

 	/* Part 1: check device type */
 	switch (type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		name_base = "video";
 		break;
 	case VFL_TYPE_VBI:
@@ -913,7 +913,7 @@ int __video_register_device(struct video_device *vdev,
 	 * of 128-191 and just pick the first free minor there
 	 * (new style). */
 	switch (type) {
-	case VFL_TYPE_GRABBER:
+	case VFL_TYPE_VIDEO:
 		minor_offset = 0;
 		minor_cnt = 64;
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 51b912743f0f..e87954fbcc0d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -934,7 +934,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
 {
 	struct video_device *vfd = video_devdata(file);
 	const struct v4l2_ioctl_ops *ops = vfd->ioctl_ops;
-	bool is_vid = vfd->vfl_type == VFL_TYPE_GRABBER;
+	bool is_vid = vfd->vfl_type == VFL_TYPE_VIDEO;
 	bool is_vbi = vfd->vfl_type == VFL_TYPE_VBI;
 	bool is_sdr = vfd->vfl_type == VFL_TYPE_SDR;
 	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
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
2.23.0.rc1


