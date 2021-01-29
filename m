Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B5F3088DC
	for <lists+linux-media@lfdr.de>; Fri, 29 Jan 2021 13:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbhA2MHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jan 2021 07:07:10 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:39879 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232606AbhA2MEU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jan 2021 07:04:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 5REeliT5FW4yN5REilPQZA; Fri, 29 Jan 2021 11:42:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611916965; bh=KEmAHZvZyIp8KrBjMUk8abZyUnQCZItI/AeOfW40v6A=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=c0coTh/4hcKXJJcTzbUvBhLspVn0DZv5MpnhhTES14yU051+Mv/u9NGXm/l8Jh2QI
         hm+yvsxM7vz+9lpPSzdAka8TzNLI9QWhzABZP8DY3KrqLsvWQuFBZWC3GSUIVyCPYA
         IqsDg7YEC01ff/JUEPHsCFonn9OrxFrBpIYWoN1hlx48I7zqNqJnl0TH2sbOxtnESX
         gdhHZUL4dDIbLFYKNeTUdMJXoSnl50GTg8R9CZOvehvu5ZSVkE+888Pz4PBAR7ijLw
         wBeYF3CS02CA/TQtwqDlk3baLY3GgjPkAaMAjZ7RUJyr2NVvZ61vRpPxw5q/bLm+FM
         xWgCRigKjVrnw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCH 2/2] dvbdev: add /sys media_dev attr for dvb devices
Date:   Fri, 29 Jan 2021 11:42:40 +0100
Message-Id: <20210129104240.2289167-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129104240.2289167-1-hverkuil-cisco@xs4all.nl>
References: <20210129104240.2289167-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfH9htlizJ2AYdU4hPmEEkPq1Q2fF5SjCCNZxhYZP+m2oQDQVMno6UZJ4dXcSd/3jYr+4gsE8Z13VXcbBfldxinhq4o4fRanaRHRaAdV5ciyErtFN4U2i
 0TSpy0oL+iS1Q0hqYCh+veHJ2htQhQcDNzMoDR4CCDmULpX27Ojpob5nmjabum0pIbgJW2PAv/Ff8LtDgncx1RMYPmOAEtSHKxZv4AnKuzg8oKWcPXeQb2xh
 8QVD8xBgOOvRNRW1+R9NdgDgzfEkNKMXQOfUkm43WsGoUEnsGuG8qdO2pKEhd+utiqjbs75FY7VBEqKlbQp3+BRTSsREA6wc0rqd6MWwuG4=
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
 drivers/media/dvb-core/dvbdev.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 5ff7bedee247..629f2bef2df8 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -452,6 +452,28 @@ static int dvb_register_media_device(struct dvb_device *dvbdev,
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
+static struct attribute *dvb_device_attrs[] = {
+	&dev_attr_media_dev.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(dvb_device);
+#endif
+
 int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			const struct dvb_device *template, void *priv,
 			enum dvb_device_type type, int demux_sink_pads)
@@ -1056,6 +1078,9 @@ static int __init init_dvbdev(void)
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

