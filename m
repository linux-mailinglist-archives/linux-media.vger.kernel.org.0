Return-Path: <linux-media+bounces-2769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5189C819CF0
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 11:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB25B1F21EBE
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 10:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4446320DC3;
	Wed, 20 Dec 2023 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jq8mg5r0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009E20DCC
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703068645; x=1734604645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T/C9ZAO8qLneaLiBytVbO1mPwOAigpXoR7B3eXx1GyA=;
  b=jq8mg5r0ppTdTFAbzsAUR0YdYOal4uL3jAJOwPFJ3zioGMDLmidEtFjP
   QoGyFVPTUm61acaXjH/KNe4bXFc7VR8JyHEH2iRqsm5XhkWkX/9licHSW
   XG2SjYkw9jouNOODPOMZ2yjkqji4WYSWLCDgR8g2Lh+wACWO5EK981UlW
   C/6qQK15n3x0NICRKqjts2FVDbH5KMZjtnaf9h7wcTUw+H+AVsOD3pDod
   xPu7Txx2wwNVbN3M4DaSg+/66qfitq8iBLCa4eTpWzHVd5Afq8DSoGm+1
   pWX9uRZ+qexi4ouvT8lZ78klA9F/O84FP3EKofq+QFs4m939nj7jokPex
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9174330"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="9174330"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769544244"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769544244"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 02:37:21 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 68119120A70;
	Wed, 20 Dec 2023 12:37:18 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 07/29] media: uvcvideo: Refactor teardown of uvc on USB disconnect
Date: Wed, 20 Dec 2023 12:36:51 +0200
Message-Id: <20231220103713.113386-8-sakari.ailus@linux.intel.com>
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

From: Daniel Axtens <dja@axtens.net>

Currently, disconnecting a USB webcam while it is in use prints out a
number of warnings, such as:

WARNING: CPU: 2 PID: 3118 at /build/linux-ezBi1T/linux-4.8.0/fs/sysfs/group.c:237 sysfs_remove_group+0x8b/0x90
sysfs group ffffffffa7cd0780 not found for kobject 'event13'

This has been noticed before. [0]

This is because of the order in which things are torn down.

If there are no streams active during a USB disconnect:

 - uvc_disconnect() is invoked via device_del() through the bus
   notifier mechanism.

 - this calls uvc_unregister_video().

 - uvc_unregister_video() unregisters the video device for each
   stream,

 - because there are no streams open, it calls uvc_delete()

 - uvc_delete() calls uvc_status_cleanup(), which cleans up the status
   input device.

 - uvc_delete() calls media_device_unregister(), which cleans up the
   media device

 - uvc_delete(), uvc_unregister_video() and uvc_disconnect() all
   return, and we end up back in device_del().

 - device_del() then cleans up the sysfs folder for the camera with
   dpm_sysfs_remove(). Because uvc_status_cleanup() and
   media_device_unregister() have already been called, this all works
   nicely.

If, on the other hand, there *are* streams active during a USB disconnect:

 - uvc_disconnect() is invoked

 - this calls uvc_unregister_video()

 - uvc_unregister_video() unregisters the video device for each
   stream,

 - uvc_unregister_video() and uvc_disconnect() return, and we end up
   back in device_del().

 - device_del() then cleans up the sysfs folder for the camera with
   dpm_sysfs_remove(). Because the status input device and the media
   device are children of the USB device, this also deletes their
   sysfs folders.

 - Sometime later, the final stream is closed, invoking uvc_release().

 - uvc_release() calls uvc_delete()

 - uvc_delete() calls uvc_status_cleanup(), which cleans up the status
   input device. Because the sysfs directory has already been removed,
   this causes a WARNing.

 - uvc_delete() calls media_device_unregister(), which cleans up the
   media device. Because the sysfs directory has already been removed,
   this causes another WARNing.

To fix this, we need to make sure the devices are always unregistered
before the end of uvc_disconnect(). To this, move the unregistration
into the disconnect path:

 - split uvc_status_cleanup() into two parts, one on disconnect that
   unregisters and one on delete that frees.

 - move v4l2_device_unregister() and media_device_unregister() into
   the disconnect path.

[0]: https://lkml.org/lkml/2016/12/8/657

[Renamed uvc_input_cleanup() to uvc_input_unregister()]

Signed-off-by: Daniel Axtens <dja@axtens.net>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
[Sakari Ailus: Rebase on patch Revert "[media] media-device: dynamically allocate struct media_devnode"]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_driver.c | 13 +++++++++----
 drivers/media/usb/uvc/uvc_status.c | 12 ++++++++----
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1044e13976b5..7add92f45329 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1859,11 +1859,7 @@ static void uvc_delete(struct kref *kref)
 	usb_put_intf(dev->intf);
 	usb_put_dev(dev->udev);
 
-	if (dev->vdev.dev)
-		v4l2_device_unregister(&dev->vdev);
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (media_devnode_is_registered(&dev->mdev.devnode))
-		media_device_unregister(&dev->mdev);
 	media_device_cleanup(&dev->mdev);
 #endif
 
@@ -1920,6 +1916,15 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
 		uvc_debugfs_cleanup_stream(stream);
 	}
+
+	uvc_status_unregister(dev);
+
+	if (dev->vdev.dev)
+		v4l2_device_unregister(&dev->vdev);
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (media_devnode_is_registered(&dev->mdev.devnode))
+		media_device_unregister(&dev->mdev);
+#endif
 }
 
 int uvc_register_video_device(struct uvc_device *dev,
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 015be0886801..a78a88c710e2 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -73,7 +73,7 @@ static int uvc_input_init(struct uvc_device *dev)
 	return ret;
 }
 
-static void uvc_input_cleanup(struct uvc_device *dev)
+static void uvc_input_unregister(struct uvc_device *dev)
 {
 	if (dev->input)
 		input_unregister_device(dev->input);
@@ -90,7 +90,7 @@ static void uvc_input_report_key(struct uvc_device *dev, unsigned int code,
 
 #else
 #define uvc_input_init(dev)
-#define uvc_input_cleanup(dev)
+#define uvc_input_unregister(dev)
 #define uvc_input_report_key(dev, code, value)
 #endif /* CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV */
 
@@ -290,12 +290,16 @@ int uvc_status_init(struct uvc_device *dev)
 	return 0;
 }
 
-void uvc_status_cleanup(struct uvc_device *dev)
+void uvc_status_unregister(struct uvc_device *dev)
 {
 	usb_kill_urb(dev->int_urb);
+	uvc_input_unregister(dev);
+}
+
+void uvc_status_cleanup(struct uvc_device *dev)
+{
 	usb_free_urb(dev->int_urb);
 	kfree(dev->status);
-	uvc_input_cleanup(dev);
 }
 
 int uvc_status_start(struct uvc_device *dev, gfp_t flags)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ab8de60f5de2..6fb0a78b1b00 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -742,6 +742,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 
 /* Status */
 int uvc_status_init(struct uvc_device *dev);
+void uvc_status_unregister(struct uvc_device *dev);
 void uvc_status_cleanup(struct uvc_device *dev);
 int uvc_status_start(struct uvc_device *dev, gfp_t flags);
 void uvc_status_stop(struct uvc_device *dev);
-- 
2.39.2


