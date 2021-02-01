Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B1B30A47C
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 10:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhBAJhs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 04:37:48 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57635 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232890AbhBAJhr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 04:37:47 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6VdjlublEefbk6VdnlfvZr; Mon, 01 Feb 2021 10:37:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612172223; bh=85XpFs+a2BCZuvt8ezGGmr/FGhvvQibEvXyQ65II7cs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=TjtQGeb94tR60iPEqP29TcGZPWHPsp4Pzoy4VEHDV4dt8NfA5ux7KWkUlo/CJZy+2
         vTvFvSRVHsRLC+cpp1yDHA8UJgf4qwGce5xv9BQ62CEtdmjj+xiZs7r/k/4rmxbPed
         VQsR3SU/XdFSRhQ135y3WnGC3r7LIgSqFhprWGsdnrvzvx9L3o4AR3DrupIfNxbeD7
         UbgWoSGKAzjqfENS9jInc+p5S8WgCqMkr1tOMHc8Q53HKzKUuXCuix8eR+9uDpB+N/
         e+tLZ+MGSS8QbD9j1hs4+EEykVuiqeoNuC6H/XS+9Msq/20e8vfCOfnx9348KlS2c3
         j8PmbgX32b6Aw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 2/2] dvbdev: add /sys media_dev attr for dvb devices
Date:   Mon,  1 Feb 2021 10:36:59 +0100
Message-Id: <20210201093659.2945449-3-hverkuil-cisco@xs4all.nl>
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

Create a media_dev attribute in /sys for each dvb device
which contains the media device major and minor number (or
is empty if there is no associated media device).

It is not created if the CONFIG_MEDIA_CONTROLLER_DVB is not
defined.

This makes it possible for applications like v4l2-compliance
to find the associated media controller of a dvb device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/dvb-core/dvbdev.c | 46 +++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 5ff7bedee247..e63cee1fc331 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -452,6 +452,49 @@ static int dvb_register_media_device(struct dvb_device *dvbdev,
 	return 0;
 }
 
+#if defined(CONFIG_MEDIA_CONTROLLER_DVB)
+static ssize_t media_dev_show(struct device *cd,
+			 struct device_attribute *attr, char *buf)
+{
+	struct dvb_device *dvbdev = dev_get_drvdata(cd);
+
+	buf[0] = '\0';
+	if (!dvbdev->adapter->mdev)
+		return 0;
+	return sprintf(buf, "%u:%u\n",
+		       MAJOR(dvbdev->adapter->mdev->devnode->dev.devt),
+		       MINOR(dvbdev->adapter->mdev->devnode->dev.devt));
+}
+static DEVICE_ATTR_RO(media_dev);
+
+static umode_t dvb_device_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int n)
+{
+	struct dvb_device *dvbdev = dev_get_drvdata(kobj_to_dev(kobj));
+
+	if (attr == &dev_attr_media_dev.attr) {
+		if (!dvbdev->adapter->mdev)
+			return 0;
+	}
+	return attr->mode;
+}
+
+static struct attribute *dvb_device_attrs[] = {
+	&dev_attr_media_dev.attr,
+	NULL,
+};
+
+static const struct attribute_group dvb_device_group = {
+	.is_visible = dvb_device_attr_is_visible,
+	.attrs = dvb_device_attrs,
+};
+
+static const struct attribute_group *dvb_device_groups[] = {
+	&dvb_device_group,
+	NULL
+};
+#endif
+
 int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			const struct dvb_device *template, void *priv,
 			enum dvb_device_type type, int demux_sink_pads)
@@ -1056,6 +1099,9 @@ static int __init init_dvbdev(void)
 	}
 	dvb_class->dev_uevent = dvb_uevent;
 	dvb_class->devnode = dvb_devnode;
+#if defined(CONFIG_MEDIA_CONTROLLER_DVB)
+	dvb_class->dev_groups = dvb_device_groups;
+#endif
 	return 0;
 
 error:
-- 
2.29.2

