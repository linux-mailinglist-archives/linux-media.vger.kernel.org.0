Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270F070F521
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjEXLZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjEXLZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:25:18 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C72A13E
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927501; x=1716463501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GSsQkGs3JmD3/HC3WN8/S2yBpulQ9RyX3oGCHcitps8=;
  b=nVZRUaP0rInc6G6+Ae8gmqiL7fshkW/lNoHspsxKMY48dyzOK020/Rqt
   h17SVNbZIB3IikSm3ZBTqxmH/XnMF0BrB5o6jaXZaqZqNftzGvFHWTzkk
   DZ7KsAktJLC9y3VfIUsQ78puYO+SamCwOFgU5cGYACgxZTPTZvW8zg+tp
   kYqVmfNCBfOko7NLOOA8XmEmNbl/SvLu5xKfPkJjnfEhsBFrQKu4frdXi
   6Dt5sT08/vwn5C8jm2kY5ebQfjMKwQ0DT11afQnXV7tGqx3pcTuWy+mcK
   EddRmbMlQC8tH3l1DA+86kkM40r04h5i1gQ9hzP7lqjEi8g+x8G3WzTKI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758378"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758378"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540620"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540620"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C76C0122FF9;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb2-008z7P-6c; Wed, 24 May 2023 14:24:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 25/32] media: marvell: cafe: Register V4L2 device earlier
Date:   Wed, 24 May 2023 14:23:42 +0300
Message-Id: <20230524112349.2141396-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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

