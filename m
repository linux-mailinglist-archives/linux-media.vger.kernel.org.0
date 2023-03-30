Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F14596D0427
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbjC3L7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjC3L7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:19 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5409BA255
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177558; x=1711713558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PjfW0NsAB15O0lY7WC1k+zVwG+q0AVXNp46d/1lPZws=;
  b=PawWMlCKog3FP9zn+4Lv1shdqPcrN91rLLpAORAUHrwkQGjRFZx5eWeW
   xIKt11qqvjXTvsxIXAM94s40Q2SGEZJrPe7BmWp0sdqWxWxruWUYqnGjD
   /BWTmFN13GfgkqVb2RGvZVPMB9FTi+qibJAepudnk+YwLjRuo9LUydpaZ
   5XzDoORoYt4YmTr+CTUXnvL4MYflM3Brsy9GFWniGPRAp9RpwJaYGM/8J
   rFHWUuMLYSzq6DvHVlvNjNuPvqA8gN2l3uXKN1ZZYPZElC3z2fMpDzA+y
   3IyndgLpDuTjFiYXD3gJ5WsRNdUv7j4E7f66w9FgPJOvCNtLpxNVx1WvU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111453"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952928"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952928"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 762DB1224B6;
        Thu, 30 Mar 2023 14:59:09 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 11/18] media: marvell: cafe: Register V4L2 device earlier
Date:   Thu, 30 Mar 2023 14:58:46 +0300
Message-Id: <20230330115853.1628216-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Register V4L2 device before the async notifier so the struct device will
be available for the notifier.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/marvell/cafe-driver.c | 12 ++++++++++--
 drivers/media/platform/marvell/mcam-core.c   |  6 ------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index dd1bba70bd79..4d8843623255 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -536,6 +536,11 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto out_pdown;
 
+	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
+	if (ret)
+		goto out_smbus_shutdown;
+
+
 	v4l2_async_nf_init(&mcam->notifier);
 
 	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
@@ -544,12 +549,12 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 				    struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
-		goto out_smbus_shutdown;
+		goto out_v4l2_device_unregister;
 	}
 
 	ret = mccic_register(mcam);
 	if (ret)
-		goto out_smbus_shutdown;
+		goto out_v4l2_device_unregister;
 
 	clkdev_create(mcam->mclk, "xclk", "%d-%04x",
 		i2c_adapter_id(cam->i2c_adapter), ov7670_info.addr);
@@ -565,6 +570,8 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 
 out_mccic_shutdown:
 	mccic_shutdown(mcam);
+out_v4l2_device_unregister:
+	v4l2_device_unregister(&mcam->v4l2_dev);
 out_smbus_shutdown:
 	cafe_smbus_shutdown(cam);
 out_pdown:
@@ -587,6 +594,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 static void cafe_shutdown(struct cafe_camera *cam)
 {
 	mccic_shutdown(&cam->mcam);
+	v4l2_device_unregister(&cam->mcam.v4l2_dev);
 	cafe_smbus_shutdown(cam);
 	free_irq(cam->pdev->irq, cam);
 	pci_iounmap(cam->pdev, cam->mcam.regs);
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index b74a362ec075..2ecdcbcb37fd 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1866,10 +1866,6 @@ int mccic_register(struct mcam_camera *cam)
 	/*
 	 * Register with V4L
 	 */
-	ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
-	if (ret)
-		goto out;
-
 	mutex_init(&cam->s_mutex);
 	cam->state = S_NOTREADY;
 	mcam_set_config_needed(cam, 1);
@@ -1915,7 +1911,6 @@ int mccic_register(struct mcam_camera *cam)
 
 out:
 	v4l2_async_nf_unregister(&cam->notifier);
-	v4l2_device_unregister(&cam->v4l2_dev);
 	v4l2_async_nf_cleanup(&cam->notifier);
 	return ret;
 }
@@ -1937,7 +1932,6 @@ void mccic_shutdown(struct mcam_camera *cam)
 		mcam_free_dma_bufs(cam);
 	v4l2_ctrl_handler_free(&cam->ctrl_handler);
 	v4l2_async_nf_unregister(&cam->notifier);
-	v4l2_device_unregister(&cam->v4l2_dev);
 	v4l2_async_nf_cleanup(&cam->notifier);
 }
 EXPORT_SYMBOL_GPL(mccic_shutdown);
-- 
2.30.2

