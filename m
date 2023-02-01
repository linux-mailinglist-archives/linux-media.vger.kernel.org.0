Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAD6687091
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjBAVpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjBAVpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:49 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7A166ED7
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287946; x=1706823946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0G6KgED8Kb4CBMHP/HHyLyyV3uHCnoxQ7MBu3GWLKNc=;
  b=mlRYtpGPuvlIwrJW3oO/3/vzWfLF2IfWw4kIY4K2Nsa61yBN5mP4d4nz
   Eu/1SeC4prlQ/2YFPYFXz0KL3sk4Et47Tw0qB6YbeQzakzRixmvwJosxg
   zgt7R5z2CdweyPdECUBzgQ5ANu70RTCcU5+BJW/qeSyXspXToGrFJrdqT
   6iK/YYoFUDpgmCQWX8BKAhkXwK4VzeppXxG7bPnKXiMQolCyjhjdadH3K
   Oi+fAq7duTRYLMEV5seeJtT+d1KUJU5vvt7UYI9hVUoqKJ0Vt3/meh5vB
   TdicmnVT+DuawLVdlrV9nP1ymvMyBdL9QlD3eYgbQ6gvaNdXhXaA5d2mb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415622"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415622"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527296"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527296"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:43 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8A5CC1227A1;
        Wed,  1 Feb 2023 23:45:40 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 05/26] Revert "media: uvcvideo: Refactor teardown of uvc on USB disconnect"
Date:   Wed,  1 Feb 2023 23:45:14 +0200
Message-Id: <20230201214535.347075-6-sakari.ailus@linux.intel.com>
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

This reverts commit 10e1fdb95809ed21406f53b5b4f064673a1b9ceb.

Temporarily revert this patch to revert a dependent patch. The patch is
re-applied later, rebased on the revert.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 13 ++++---------
 drivers/media/usb/uvc/uvc_status.c | 12 ++++--------
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 11f3d716b5bf..d414b2221dae 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1834,7 +1834,11 @@ static void uvc_delete(struct kref *kref)
 	usb_put_intf(dev->intf);
 	usb_put_dev(dev->udev);
 
+	if (dev->vdev.dev)
+		v4l2_device_unregister(&dev->vdev);
 #ifdef CONFIG_MEDIA_CONTROLLER
+	if (media_devnode_is_registered(dev->mdev.devnode))
+		media_device_unregister(&dev->mdev);
 	media_device_cleanup(&dev->mdev);
 #endif
 
@@ -1891,15 +1895,6 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
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
index 9a596c8d894a..80de6f8395c8 100644
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
2.30.2

