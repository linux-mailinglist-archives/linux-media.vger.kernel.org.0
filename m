Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE4A468708F
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjBAVpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjBAVpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:47 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600FE6601A
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287945; x=1706823945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xloCx4/hBtlKlBrilJK3QgZzZS9Y+UBQ1Ab1wxqk2Pc=;
  b=GdHnB2Grxu+ZXSLbvi+ZUpKK5b9xvyW7p5FG3ptcSNNUpEOtOvnOSMmi
   KbGm3Kolwm1F0/btF1Bti9COePwSK96LbcaHXaUbOShzlgv3o/OeBc65p
   Nhwv5N7GYxvC0erQyB0kCg+990D3q145rhLUNxktbAi1lT6xyQct2fRxC
   6F/zIlWisL12gpwxoLrlxQguGI1l9s80Qx4mQJ50EPh4hs6aL7JMcS+br
   TOxcfxjGwWzld0LpgR9cQKGjX1SvTzVXh43xpq5z+XiroeahFcyjPJUC6
   e3/opnHTvzLcJbX335TJS4uMSeg7zVawvin5bVeaAYKdMGIifEtxlZPYc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415619"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415619"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527294"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527294"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:42 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E7B691227A0;
        Wed,  1 Feb 2023 23:45:39 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 04/26] media: utilize new cdev_device_add helper function
Date:   Wed,  1 Feb 2023 23:45:13 +0200
Message-Id: <20230201214535.347075-5-sakari.ailus@linux.intel.com>
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

From: Logan Gunthorpe <logang@deltatee.com>

Replace the open coded registration of the cdev and dev with the
new device_add_cdev() helper. The helper replaces a common pattern by
taking the proper reference against the parent device and adding both
the cdev and the device.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/cec/core/cec-core.c | 16 ++++------------
 drivers/media/mc/mc-devnode.c     | 23 +++++++++--------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 0eb54aceff13..57023d020973 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -137,26 +137,19 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 
 	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &cec_devnode_fops);
-	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "cec%d", devnode->minor);
 
 	devnode->registered = true;
-	ret = cdev_add(&devnode->cdev, devnode->dev.devt, 1);
-	if (ret < 0) {
-		pr_err("%s: cdev_add failed\n", __func__);
+	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
+	if (ret) {
+		pr_err("%s: cdev_device_add failed\n", __func__);
 		devnode->registered = false;
 		goto clr_bit;
 	}
 
-	ret = device_add(&devnode->dev);
-	if (ret)
-		goto cdev_del;
-
 	return 0;
 
-cdev_del:
-	cdev_del(&devnode->cdev);
 clr_bit:
 	mutex_lock(&cec_devnode_lock);
 	clear_bit(devnode->minor, cec_devnode_nums);
@@ -200,8 +193,7 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	__cec_s_log_addrs(adap, NULL, false);
 	mutex_unlock(&adap->lock);
 
-	device_del(&devnode->dev);
-	cdev_del(&devnode->cdev);
+	cdev_device_del(&devnode->cdev, &devnode->dev);
 	put_device(&devnode->dev);
 }
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 1e1792c3ae3f..fabcd646679b 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -232,29 +232,24 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	devnode->minor = minor;
 	devnode->media_dev = mdev;
 
-	/* Part 2: Initialize and register the character device */
+	/* Part 2: Initialize the media and character devices */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
 
-	ret = cdev_add(&devnode->cdev, MKDEV(MAJOR(media_dev_t),
-					     devnode->minor), 1);
-	if (ret < 0) {
-		pr_err("%s: cdev_add failed\n", __func__);
-		goto error;
-	}
-
-	/* Part 3: Register the media device */
 	devnode->dev.bus = &media_bus_type;
 	devnode->dev.devt = MKDEV(MAJOR(media_dev_t), devnode->minor);
 	devnode->dev.release = media_devnode_release;
 	if (devnode->parent)
 		devnode->dev.parent = devnode->parent;
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
-	ret = device_register(&devnode->dev);
+	device_initialize(&devnode->dev);
+
+	/* Part 3: Add the media and character devices */
+	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
 	if (ret < 0) {
-		pr_err("%s: device_register failed\n", __func__);
-		goto error;
+		pr_err("%s: cdev_device_add failed\n", __func__);
+		goto cdev_add_error;
 	}
 
 	/* Part 4: Activate this minor. The char device can now be used. */
@@ -262,9 +257,9 @@ int __must_check media_devnode_register(struct media_device *mdev,
 
 	return 0;
 
-error:
+cdev_add_error:
 	mutex_lock(&media_devnode_lock);
-	cdev_del(&devnode->cdev);
+	cdev_device_del(&devnode->cdev, &devnode->dev);
 	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
 
-- 
2.30.2

