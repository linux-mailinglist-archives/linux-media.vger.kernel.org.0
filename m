Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD23D68708D
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 22:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjBAVpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 16:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjBAVpo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 16:45:44 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3268E66ECC
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675287943; x=1706823943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/JCObSNJwyqezd0azm+ENLtFvcxhLnXT5MNmwkW4oqA=;
  b=a9wNCx7HVKTaCZU3EJ9UHF/JyAlVqk1kK3cX5VZNRfbW3wx+EquNhG5Q
   lLY/86UFmaV5Evu6Tr/H7qaxQr8kGpT2JVWfilka8z2GmbhJLetytbP7N
   e356PnG8eR4o/6jkolhTZrVw6HokRyHtInAMESAwwKM08C7EjBBjRIfQu
   ilJmH6AqN5VsiV3GhTZi8h99Iu5EY6L6SFX3JQQu4+AHJ6CT9Koql5LOO
   HCkCWpaEKeTx36gnqjGJsKhGBJ99aWohsH87XccBtxGiSulEYkusjMNFb
   9FJUKrFUNeP2POn4AvSZZEvMkboRV0YhZSysKfa0JMfmtAKS3rHpGntiu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330415607"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="330415607"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695527292"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="695527292"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 13:45:40 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C1D51122774;
        Wed,  1 Feb 2023 23:45:37 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 02/26] Revert "media: utilize new cdev_device_add helper function"
Date:   Wed,  1 Feb 2023 23:45:11 +0200
Message-Id: <20230201214535.347075-3-sakari.ailus@linux.intel.com>
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

This reverts commit 857313e51006ff51524579bcd8808b70f9a80812. This patch is
temporarily reverted for internal rework.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/cec/core/cec-core.c | 16 ++++++++++++----
 drivers/media/mc/mc-devnode.c     | 21 ++++++++++++++++-----
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index af358e901b5f..0eb54aceff13 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -137,19 +137,26 @@ static int __must_check cec_devnode_register(struct cec_devnode *devnode,
 
 	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &cec_devnode_fops);
+	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	devnode->cdev.owner = owner;
 	kobject_set_name(&devnode->cdev.kobj, "cec%d", devnode->minor);
 
 	devnode->registered = true;
-	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
-	if (ret) {
+	ret = cdev_add(&devnode->cdev, devnode->dev.devt, 1);
+	if (ret < 0) {
+		pr_err("%s: cdev_add failed\n", __func__);
 		devnode->registered = false;
-		pr_err("%s: cdev_device_add failed\n", __func__);
 		goto clr_bit;
 	}
 
+	ret = device_add(&devnode->dev);
+	if (ret)
+		goto cdev_del;
+
 	return 0;
 
+cdev_del:
+	cdev_del(&devnode->cdev);
 clr_bit:
 	mutex_lock(&cec_devnode_lock);
 	clear_bit(devnode->minor, cec_devnode_nums);
@@ -193,7 +200,8 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	__cec_s_log_addrs(adap, NULL, false);
 	mutex_unlock(&adap->lock);
 
-	cdev_device_del(&devnode->cdev, &devnode->dev);
+	device_del(&devnode->dev);
+	cdev_del(&devnode->cdev);
 	put_device(&devnode->dev);
 }
 
diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 0ab33214d243..740573552e5d 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -240,23 +240,33 @@ int __must_check media_devnode_register(struct media_device *mdev,
 	dev_set_name(&devnode->dev, "media%d", devnode->minor);
 	device_initialize(&devnode->dev);
 
-	/* Part 2: Initialize the character device */
+	/* Part 2: Initialize and register the character device */
 	cdev_init(&devnode->cdev, &media_devnode_fops);
 	devnode->cdev.owner = owner;
+	devnode->cdev.kobj.parent = &devnode->dev.kobj;
 	kobject_set_name(&devnode->cdev.kobj, "media%d", devnode->minor);
 
-	/* Part 3: Add the media and char device */
-	ret = cdev_device_add(&devnode->cdev, &devnode->dev);
+	ret = cdev_add(&devnode->cdev, MKDEV(MAJOR(media_dev_t),
+					     devnode->minor), 1);
 	if (ret < 0) {
-		pr_err("%s: cdev_device_add failed\n", __func__);
+		pr_err("%s: cdev_add failed\n", __func__);
 		goto cdev_add_error;
 	}
 
+	/* Part 3: Add the media device */
+	ret = device_add(&devnode->dev);
+	if (ret < 0) {
+		pr_err("%s: device_add failed\n", __func__);
+		goto device_add_error;
+	}
+
 	/* Part 4: Activate this minor. The char device can now be used. */
 	set_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 
 	return 0;
 
+device_add_error:
+	cdev_del(&devnode->cdev);
 cdev_add_error:
 	mutex_lock(&media_devnode_lock);
 	clear_bit(devnode->minor, media_devnode_nums);
@@ -276,9 +286,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	mutex_lock(&media_devnode_lock);
 	clear_bit(MEDIA_FLAG_REGISTERED, &devnode->flags);
 	/* Delete the cdev on this minor as well */
-	cdev_device_del(&devnode->cdev, &devnode->dev);
+	cdev_del(&devnode->cdev);
 	devnode->media_dev = NULL;
 	mutex_unlock(&media_devnode_lock);
+	device_del(&devnode->dev);
 
 	put_device(&devnode->dev);
 }
-- 
2.30.2

