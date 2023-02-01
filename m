Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1846687093
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjBAVpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjBAVpv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:51 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7B4677B1
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287949; x=1706823949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QWK7YEarN+YlvW1WGbMgZtp1wGCUvLK3q1yiKO1PcpU=;
  b=eFpG3ftz47Wn1qhn9YPSj9jESDDyHWLkU/zv3ze148OE/LQikj2VcFMs
   81PieAVwUxKiFpQDdPOx2vXVn2uWiQux+nxbvX8dUtIHsuXhkanm880Mv
   RnDRsRwK9EjGYfXgyhX0dwRPjwpUqY0ziZvmVg3/dd7ogiWFyibePqt2U
   73+FEc5C1U8Ad/SXBpmuYcQ3LobewtsFD4Xri1Jrb08fnLa3zQn5QvNFS
   uzaQtnyqg5Oz42SrsEDIkvfhOG+/Pk8EPVsDvRUr5EjyrjlEX2KpgjijE
   iHtWDm2CzBjQpoDMey89Mdw1bPeKeFrsm9FQNcd7cSLmxcH743VuyoHbQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415629"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415629"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527301"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527301"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:45 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5964E120339;
        Wed,  1 Feb 2023 23:45:42 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 07/26] media: uvcvideo: Refactor teardown of uvc on USB disconnect
Date:   Wed,  1 Feb 2023 23:45:16 +0200
Message-Id: <20230201214535.347075-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
---
 drivers/media/usb/uvc/uvc_driver.c | 13 +++++++++----
 drivers/media/usb/uvc/uvc_status.c | 12 ++++++++----
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e13b9e012e05..5beefbb25fcc 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1834,11 +1834,7 @@ static void uvc_delete(struct kref *kref)
 	usb_put_intf(dev->intf);
 	usb_put_dev(dev->udev);
 
-	if (dev->vdev.dev)
-		v4l2_device_unregister(&dev->vdev);
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (media_devnode_is_registered(&dev->mdev.devnode))
-		media_device_unregister(&dev->mdev);
 	media_device_cleanup(&dev->mdev);
 #endif
 
@@ -1895,6 +1891,15 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
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
index 80de6f8395c8..9a596c8d894a 100644
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
2.30.2

