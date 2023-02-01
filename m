Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A63868709C
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjBAVqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjBAVqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:46:04 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D3168128
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287961; x=1706823961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZUurEOy8ElwcaUTXxPIydMqSnjPXWrdqw8HIZK8djbU=;
  b=e2vizJpuw6lbNgzPyfVYJDQLe8SRAQGpGLXW3maI8+fqng3qwdLRVrFf
   2/VmfAFQTZqYVAgS1Ko0Zi3FOATgSc+QLZ8yX5cx0FKJbLz31xWbh+ggF
   j/QU9GB2garVecNQehFTFU0p5CcZtlUxGf2wjTS2zNoJVAVjb5mSQEUOW
   j32vftcicipjdEJFfEw+w8Ae0Lv3HsFuGqOTevVPnmK7ZhFBcqkABFfmv
   y/CHy3Wt9DeCbdjVDLP3o2U7kbu1K0+eyHFeXQZ/FW6aLhqZ9fHAUVHLw
   C3Q64wY9jtt48JhZYitx4qQGZrwAmvmhS/R7lP/7vlqdu7UEXFGWK0dmC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415661"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415661"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527314"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527314"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:50 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 09979122774;
        Wed,  1 Feb 2023 23:45:47 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 15/26] v4l: Acquire a reference to the media device for every video device
Date:   Wed,  1 Feb 2023 23:45:24 +0200
Message-Id: <20230201214535.347075-16-sakari.ailus@linux.intel.com>
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

The video device depends on the existence of its media device --- if there
is one. Acquire a reference to it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 397d553177fa..6386948eefaa 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -176,6 +176,9 @@ static void v4l2_device_release(struct device *cd)
 {
 	struct video_device *vdev = to_video_device(cd);
 	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_device *mdev = v4l2_dev->mdev;
+#endif
 
 	mutex_lock(&videodev_lock);
 	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
@@ -198,8 +201,8 @@ static void v4l2_device_release(struct device *cd)
 
 	mutex_unlock(&videodev_lock);
 
-#if defined(CONFIG_MEDIA_CONTROLLER)
-	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
 		/* Remove interfaces and interface links */
 		media_devnode_remove(vdev->intf_devnode);
 		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
@@ -225,6 +228,11 @@ static void v4l2_device_release(struct device *cd)
 	/* Decrease v4l2_device refcount */
 	if (v4l2_dev)
 		v4l2_device_put(v4l2_dev);
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (mdev)
+		media_device_put(mdev);
+#endif
 }
 
 static struct class video_class = {
@@ -872,6 +880,7 @@ static int video_register_media_controller(struct video_device *vdev)
 
 	/* FIXME: how to create the other interface links? */
 
+	media_device_get(vdev->v4l2_dev->mdev);
 #endif
 	return 0;
 }
-- 
2.30.2

