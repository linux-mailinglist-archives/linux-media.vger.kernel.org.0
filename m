Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95F830C27D
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhBBOvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:51:14 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59921 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234807AbhBBOu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:50:26 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6wzel32bSefbk6wzilkQkx; Tue, 02 Feb 2021 15:49:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612277371; bh=7BxqW813mVLNphWaKrrp2cW22dwtJIYqDxQvwDRAjqg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=dljx19JZtVwRVnJV0g9R//nzelYldzhjzABjzLDNAvD4SeUY4Tz/0Yj+AH2zU/wIi
         0qUiSbfsS3RBfdR9zF8xhnJMx8L1ReZwkbg8kEjGtxAuZmhXih/3vcJvpfZ6aWz4Yt
         I1Vxi4at8pY8YuLHCGRVJmzxM9wc9rztZe/5L6JGLFwcpEPjeap0gn4/U5JM3kCBAr
         gaJI7yC0gdko16o/jjr4ItDmty0YGZDZKjoXOzvPei9SD4JWlshrDH+9ILZHVRq667
         fAex8iKK5yCpYu1l3n1dbOq5wpU87mFSN34x8zHOihKL40bo24Ttnb9huB3lJyr0VB
         z/jGUtm8T7VuQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 4/4] dvbdev: add /sys media_dev attr for DVB devices
Date:   Tue,  2 Feb 2021 15:49:26 +0100
Message-Id: <20210202144926.620104-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
References: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfM3JNz5zsqwFUQMlaY8tQtjoapRDEUHcBXMu6hnLJGsRH12NeqaJpHrr8411zJH8r5j63qv/eYZvJ/WvuqS0eTjrz0UC8um4c9uXH1zTeuza3C+aSnUG
 sLRzEkXxYGRBBI2MKvAH2mWMxNl1IhpkcPOX6fiyzy3m0RVlN52PX+wdl2g+xT5lbHBak31kL6CB2eOYjD9pQCltLlNccwHxDB0IEgES8IWC+rrMg3WRzOeu
 44qiVLmssbmaRNgMDaISnbo2pRu5uhEkSgOMTesSGN9F1RTArJiHv5BPbkmUtXxtRsuMO+q25P8iaiZ8enjcDYXzsKTrcPeLTFW0L5y9oYA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For each DVB device node create a media_dev attribute in /sys
which contains the media device major and minor number.

It is not created if the CONFIG_MEDIA_CONTROLLER_DVB is not
defined or if there is no associated media device.

This makes it possible for applications like v4l2-compliance
to find the associated media controller of a DVB device.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/dvb-core/dvbdev.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 5ff7bedee247..db8bddcc5780 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -452,6 +452,48 @@ static int dvb_register_media_device(struct dvb_device *dvbdev,
 	return 0;
 }
 
+#if defined(CONFIG_MEDIA_CONTROLLER_DVB)
+static ssize_t media_dev_show(struct device *cd,
+			      struct device_attribute *attr, char *buf)
+{
+	struct dvb_device *dvbdev = dev_get_drvdata(cd);
+	dev_t devt = media_device_devt(dvbdev->adapter->mdev);
+
+	buf[0] = '\0';
+	if (!devt)
+		return 0;
+	return sprintf(buf, "%u:%u\n", MAJOR(devt), MINOR(devt));
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
@@ -1056,6 +1098,9 @@ static int __init init_dvbdev(void)
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

