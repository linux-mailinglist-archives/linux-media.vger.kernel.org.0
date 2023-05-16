Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091907049D8
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbjEPJ4o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjEPJ4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:30 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670593A9A
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230988; x=1715766988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSsQkGs3JmD3/HC3WN8/S2yBpulQ9RyX3oGCHcitps8=;
  b=PTNzs1S/DMF81pYxL7FJ6p3JWjeDulUgClQEa6b6zjLbKouXCWcAu+4c
   DRmiQwiKv+0nFg+6okBoxyD8MLs97i7h802/w+qeX4iR5q8j/AQh3+BvM
   ntIN6sTVWmn2hMZVv7R0r4ET5OBtNgWeUDxw+0Z/7DCHAiO+wWf78896/
   gffWgl/fimaDuJplsWKNok7zM2eYaq5CWQ28tpEo+/fouUc4WE7/HED2p
   mevnkOUT2aRSWQIY73zs8A85EG92MLtARspapT8zzz2+ftV7+vcGyRjZT
   h2nGHBFHW/tWycDE5PU3oaD+pKPlwfM3gnJorHc1clAoAu4gSm2gSItc3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601531"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601531"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931865"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931865"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6D5EA122FB0;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAy-EQ; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 24/31] media: marvell: cafe: Register V4L2 device earlier
Date:   Tue, 16 May 2023 12:55:10 +0300
Message-Id: <20230516095517.611711-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Register V4L2 device before the async notifier so the struct device will
be available for the notifier which makes it possible to use it for debug
prints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/marvell/cafe-driver.c | 11 +++++++++--
 drivers/media/platform/marvell/mcam-core.c   |  6 ------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index dd1bba70bd791..fbfbb9f67ddfc 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -536,6 +536,10 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto out_pdown;
 
+	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
+	if (ret)
+		goto out_smbus_shutdown;
+
 	v4l2_async_nf_init(&mcam->notifier);
 
 	asd = v4l2_async_nf_add_i2c(&mcam->notifier,
@@ -544,12 +548,12 @@ static int cafe_pci_probe(struct pci_dev *pdev,
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
@@ -565,6 +569,8 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 
 out_mccic_shutdown:
 	mccic_shutdown(mcam);
+out_v4l2_device_unregister:
+	v4l2_device_unregister(&mcam->v4l2_dev);
 out_smbus_shutdown:
 	cafe_smbus_shutdown(cam);
 out_pdown:
@@ -587,6 +593,7 @@ static int cafe_pci_probe(struct pci_dev *pdev,
 static void cafe_shutdown(struct cafe_camera *cam)
 {
 	mccic_shutdown(&cam->mcam);
+	v4l2_device_unregister(&cam->mcam.v4l2_dev);
 	cafe_smbus_shutdown(cam);
 	free_irq(cam->pdev->irq, cam);
 	pci_iounmap(cam->pdev, cam->mcam.regs);
diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index 3cee6d6b83fa9..bcfcecdb03ea2 100644
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

