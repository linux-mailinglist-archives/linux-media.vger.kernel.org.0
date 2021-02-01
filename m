Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6C930A47A
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 10:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232892AbhBAJhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 04:37:47 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46815 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232509AbhBAJhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 04:37:46 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6VdjlublEefbk6VdnlfvZi; Mon, 01 Feb 2021 10:37:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612172223; bh=DkNNwRtMlKHsIWFqX2Lp3HevWj3aKF0UkiTP7rpd2Qs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=jxvl4g7GG4H+rRzVf/r1kVnjSzWnWFyGuX1VvWlCddTmLD5LkDnx7hrnUbxBlYtR6
         G+nfcgmWgJvAx7aeFPzzJxukR6oP6l9BGP4RdNF4La9geUAX0trrFZhCAIAnpZra4W
         MCNwwbEk/EAVr13WR0Zlrq9vzcNGLnXC6g9WqETPEyDtLLDKufkv8lxZ9XHb2DRADk
         po2W0mJJyP53jKE9tWxy12z12Va4v/t4MndNghSACVnQNTYNx+XuIQ1FUeazDvN4Lk
         z/YJEGlmw17wlHjnn3h5LInGcJbV5kJfFLTBnKUlBWeu9um8f9bmXTKvbAPPqsxp81
         OKc+n1LN5n5Fw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 1/2] v4l2-dev: add /sys media_dev attr for video devices
Date:   Mon,  1 Feb 2021 10:36:58 +0100
Message-Id: <20210201093659.2945449-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201093659.2945449-1-hverkuil-cisco@xs4all.nl>
References: <20210201093659.2945449-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJDubjhqzPc4SJmxZIbFvxw6EAT4hJ12G3mVbbxZxJq6c14eVSZaoiFEc9KLQdj3elkTi2l9laRPE2p/IkvBPznQcJmLbgYtttNWWyhL6cYDP8/N4yWW
 kacmTi1cUmMwmwBUNB2uQYTVUMlyVmuoMozCDMe973vwzV0ff5x0bonak+xCXjC7BFnEY2/Wnqj4gfDi1lj7udO6IK/rllTUFDjOPBlz+Ae70wfTccy+5kLE
 AbcQIrbERLm76QG5i99DcVvG3Ppa0JKF5vW/ijBUumQBqnST6X+d1SBETRRxUuOwdYKsRR4fbZFMwVRZ7vWA3YC+uppijtiYtWDGoPM5rz0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a media_dev attribute in /sys for each video device
which contains the media device major and minor number (or
is empty if there is no associated media device).

It is not created if the CONFIG_MEDIA_CONTROLLER is not
defined.

This makes it possible for applications like v4l2-compliance
to find the associated media controller of a video device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 48 +++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b6a72d297775..85b94b25aba2 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -87,13 +87,59 @@ static ssize_t name_show(struct device *cd,
 }
 static DEVICE_ATTR_RO(name);
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+static ssize_t media_dev_show(struct device *cd,
+			 struct device_attribute *attr, char *buf)
+{
+	struct video_device *vdev = to_video_device(cd);
+	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
+
+	buf[0] = '\0';
+	if (!v4l2_dev->mdev)
+		return 0;
+	return sprintf(buf, "%u:%u\n",
+		       MAJOR(v4l2_dev->mdev->devnode->dev.devt),
+		       MINOR(v4l2_dev->mdev->devnode->dev.devt));
+}
+
+static DEVICE_ATTR_RO(media_dev);
+#endif
+
+static umode_t video_device_attr_is_visible(struct kobject *kobj,
+					    struct attribute *attr, int n)
+{
+	struct video_device *vdev = to_video_device(kobj_to_dev(kobj));
+
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	if (attr == &dev_attr_media_dev.attr) {
+		struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
+
+		if (!v4l2_dev->mdev)
+			return 0;
+	}
+#endif
+	return attr->mode;
+}
+
 static struct attribute *video_device_attrs[] = {
 	&dev_attr_name.attr,
 	&dev_attr_dev_debug.attr,
 	&dev_attr_index.attr,
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	&dev_attr_media_dev.attr,
+#endif
 	NULL,
 };
-ATTRIBUTE_GROUPS(video_device);
+
+static const struct attribute_group video_device_group = {
+	.is_visible = video_device_attr_is_visible,
+	.attrs = video_device_attrs,
+};
+
+static const struct attribute_group *video_device_groups[] = {
+	&video_device_group,
+	NULL
+};
 
 /*
  *	Active devices
-- 
2.29.2

