Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F7930C279
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234856AbhBBOvB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:51:01 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56973 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234830AbhBBOuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:50:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6wzel32bSefbk6wzilkQkT; Tue, 02 Feb 2021 15:49:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612277370; bh=UJOSA/AlptaPsHccog6qnCSI+XcbZdNBw0WGpS/T4qY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=sr1ynB0rRTJBocNf8sihu8U5WkLTM2BLXEAVC69giodxXLPmgSveGcmpISi1S94S1
         jsyIy7XGGveoeypboQ0em1atYeX7EUlzzv8IQg/fO0PqRCBTgzp2r712GpqH6QsDP3
         d230hA90lGfc2rotvlocoVwrP/cOFrVLOZf7lJQjTy8Rab2JGJO/WKdV09BGRXgKA/
         9m5mfNZ+m4+Z0pqQvaPuoLz7RKItkFQvXGDEVTDZ2A+vlVis/Jwpqw3MC0q/UK20Xn
         y9MdhrRvIF3TFdEAwb8JTbVVrU3upcmPEuNw8Pf6avIUDmiX99uFjUxkesiTBfjNWO
         gBaYfl+9xMgFQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 2/4] media-device: add media_device_devt function
Date:   Tue,  2 Feb 2021 15:49:24 +0100
Message-Id: <20210202144926.620104-3-hverkuil-cisco@xs4all.nl>
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

Add a helper function for use by the DVB and V4L2 core frameworks
that safely returns the major and minor numbers of the media
device node, or 0 if the device node is not registered.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/mc/mc-device.c | 16 ++++++++++++++++
 include/media/media-device.h | 10 ++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 9e56d2ad6b94..2207f1b01456 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -850,6 +850,22 @@ void media_device_unregister(struct media_device *mdev)
 }
 EXPORT_SYMBOL_GPL(media_device_unregister);
 
+dev_t media_device_devt(struct media_device *mdev)
+{
+	dev_t devt = 0;
+
+	if (!mdev)
+		return 0;
+
+	mutex_lock(&mdev->graph_mutex);
+	/* Check if mdev is registered */
+	if (media_devnode_is_registered(mdev->devnode))
+		devt = mdev->devnode->dev.devt;
+	mutex_unlock(&mdev->graph_mutex);
+	return devt;
+}
+EXPORT_SYMBOL_GPL(media_device_devt);
+
 #if IS_ENABLED(CONFIG_PCI)
 void media_device_pci_init(struct media_device *mdev,
 			   struct pci_dev *pci_dev,
diff --git a/include/media/media-device.h b/include/media/media-device.h
index 1345e6da688a..af089b1c55ef 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -300,6 +300,16 @@ int __must_check __media_device_register(struct media_device *mdev,
  */
 void media_device_unregister(struct media_device *mdev);
 
+/**
+ * media_device_devt() - return media device major/minor numbers
+ *
+ * @mdev:	pointer to struct &media_device
+ *
+ * Returns 0 if the media device node is not registered, otherwise
+ * it will return the major/minor number of the media device node.
+ */
+dev_t media_device_devt(struct media_device *mdev);
+
 /**
  * media_device_register_entity() - registers a media entity inside a
  *	previously registered media device.
-- 
2.29.2

