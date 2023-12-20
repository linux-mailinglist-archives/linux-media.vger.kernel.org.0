Return-Path: <linux-media+bounces-2766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F5819CED
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10391F22157
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA02B20DDD;
	Wed, 20 Dec 2023 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUi4pFkG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE120B24
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068644; x=1734604644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L17h0r0iEjhtzkeRVkRm3svQatuR622eHCre3ky53EY=;
  b=YUi4pFkGWpTtrXGN1nEeLMp1Q/wE5uq8IXQ4e3flKcWQZG/lKlGA/c0z
   13shPYfI4wHAiCnKKbOo7vIoRsQr8hpM6sN7UP9iMEVWNA94dZ8BCFMzp
   oyD9pK69tAUUX9a1nPD/7xxbZSgU5Z7C7lR7pfdrOkxHCQjA8l97YjHvH
   4H79LSBjNnjOnAke60J7N8qsTTBr2jt+fDbG2uHXhlJ7riE38inla3L14
   cdX+3NnxylxepZO6ysY6NhX//XrG/mRbU53Akm9VjpAigOBVZLpjKydH1
   kIqQDBBwHT06lf1Qimq7ZjIGAQk2rzrO9c8nsfIu9kunlftXJs+Ra9v1t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174323"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174323"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544240"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544240"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CD26B120788;
	Wed, 20 Dec 2023 12:37:16 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 05/29] Revert "media: uvcvideo: Refactor teardown of uvc on USB disconnect"
Date: Wed, 20 Dec 2023 12:36:49 +0200
Message-Id: <20231220103713.113386-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 10e1fdb95809ed21406f53b5b4f064673a1b9ceb.

Temporarily revert this patch to revert a dependent patch. The patch is
re-applied later, rebased on the revert.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_driver.c | 13 ++++---------
 drivers/media/usb/uvc/uvc_status.c | 12 ++++--------
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bbd90123a4e7..fe8b251f47e7 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1859,7 +1859,11 @@ static void uvc_delete(struct kref *kref)
 	usb_put_intf(dev->intf);
 	usb_put_dev(dev->udev);
 
+	if (dev->vdev.dev)
+		v4l2_device_unregister(&dev->vdev);
 #ifdef CONFIG_MEDIA_CONTROLLER
+	if (media_devnode_is_registered(dev->mdev.devnode))
+		media_device_unregister(&dev->mdev);
 	media_device_cleanup(&dev->mdev);
 #endif
 
@@ -1916,15 +1920,6 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
 		uvc_debugfs_cleanup_stream(stream);
 	}
-
-	uvc_status_unregister(dev);
-
-	if (dev->vdev.dev)
-		v4l2_device_unregister(&dev->vdev);
-#ifdef CONFIG_MEDIA_CONTROLLER
-	if (media_devnode_is_registered(dev->mdev.devnode))
-		media_device_unregister(&dev->mdev);
-#endif
 }
 
 int uvc_register_video_device(struct uvc_device *dev,
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index a78a88c710e2..015be0886801 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -73,7 +73,7 @@ static int uvc_input_init(struct uvc_device *dev)
 	return ret;
 }
 
-static void uvc_input_unregister(struct uvc_device *dev)
+static void uvc_input_cleanup(struct uvc_device *dev)
 {
 	if (dev->input)
 		input_unregister_device(dev->input);
@@ -90,7 +90,7 @@ static void uvc_input_report_key(struct uvc_device *dev, unsigned int code,
 
 #else
 #define uvc_input_init(dev)
-#define uvc_input_unregister(dev)
+#define uvc_input_cleanup(dev)
 #define uvc_input_report_key(dev, code, value)
 #endif /* CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV */
 
@@ -290,16 +290,12 @@ int uvc_status_init(struct uvc_device *dev)
 	return 0;
 }
 
-void uvc_status_unregister(struct uvc_device *dev)
-{
-	usb_kill_urb(dev->int_urb);
-	uvc_input_unregister(dev);
-}
-
 void uvc_status_cleanup(struct uvc_device *dev)
 {
+	usb_kill_urb(dev->int_urb);
 	usb_free_urb(dev->int_urb);
 	kfree(dev->status);
+	uvc_input_cleanup(dev);
 }
 
 int uvc_status_start(struct uvc_device *dev, gfp_t flags)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..ab8de60f5de2 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -742,7 +742,6 @@ int uvc_register_video_device(struct uvc_device *dev,
 
 /* Status */
 int uvc_status_init(struct uvc_device *dev);
-void uvc_status_unregister(struct uvc_device *dev);
 void uvc_status_cleanup(struct uvc_device *dev);
 int uvc_status_start(struct uvc_device *dev, gfp_t flags);
 void uvc_status_stop(struct uvc_device *dev);
-- 
2.39.2


