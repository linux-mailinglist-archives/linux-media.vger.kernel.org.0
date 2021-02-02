Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B489B30C27B
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbhBBOvD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:51:03 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48399 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234833AbhBBOu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:50:26 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6wzel32bSefbk6wzilkQkd; Tue, 02 Feb 2021 15:49:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612277370; bh=VO6+AXb+Nercoa8KoJR2JJWDUrCSDX7GwlJX/EvE4J4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=aJDJFZ63SckH3Yx6KFmacso/D2ncNsUYiRUsUxM88aI3DHbBVzvYZPxgl2+xm0SUk
         pme75OUxSi1nayRX+yF57hltDinOCivS0q4+cltjnneXi4bsRO3EQeLMIzbsgQQJb9
         qy/mw4q1GcCJs2l6nGggNz/VppgPcAq8TPOhyo4hzyiN3tiopWQcyqu0eS1xz/BF9N
         1WM35WomVWapdMsZBNM6rRH/smsWCbAUtOwRCniBagkf8d50Ef772kyvr6AxXkiGW5
         Hgj98hg51XDqRUhCi33b3f3hNRN5yLBPS8GmNCoMIHopQ9gddIg8DccmiNhZmdcRP2
         XzEjPZ7xYfpIw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 3/4] v4l2-dev: add /sys media_dev attr for V4L2 devices
Date:   Tue,  2 Feb 2021 15:49:25 +0100
Message-Id: <20210202144926.620104-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
References: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfO6uUqsrEFiRjNa9Fmoiux1SKkZGu29xct5yio4NBYpPxUio4i0ClHkEH02a0rxTf92NXZD4hF2cH/ag9FdD1gze7AtjVHLHAB3yg+lHDjYGKwwPGDrT
 G5p2XsTB3uYWbWk/WErBqoHJ6NF6Y5mxseZbJFg6kxOa/fxEPTiNWq6ahu3ujHYhehOSn2LxXwXk2ZbA75L9xKpKApdTHeq0l5lLbxV6uV5fv7frSNzKDyKJ
 gYxcYYObeIBrOe9/csgblz7hyWglNKCJAYGykC+U5YhRBi1uqnIZkdP62Fym9hI2CJYhNEwwoZWoCG0wT+chG5XpHV2OcDFRScXYzBJ7ypc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For each V4L2 device node create a media_dev attribute in /sys
which contains the media device major and minor number.

It is not created if the CONFIG_MEDIA_CONTROLLER is not
defined or if there is no associated media device.

This makes it possible for applications like v4l2-compliance
to find the associated media controller of a V4L2 device node.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 49 +++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b6a72d297775..7a38176259ad 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -87,13 +87,60 @@ static ssize_t name_show(struct device *cd,
 }
 static DEVICE_ATTR_RO(name);
 
+#if defined(CONFIG_MEDIA_CONTROLLER)
+static ssize_t media_dev_show(struct device *cd,
+			      struct device_attribute *attr, char *buf)
+{
+	struct video_device *vdev = to_video_device(cd);
+	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
+	dev_t devt = 0;
+
+	buf[0] = '\0';
+	if (v4l2_dev)
+		devt = media_device_devt(v4l2_dev->mdev);
+	if (!devt)
+		return 0;
+	return sprintf(buf, "%u:%u\n", MAJOR(devt), MINOR(devt));
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

