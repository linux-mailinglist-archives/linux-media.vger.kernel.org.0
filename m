Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0148E739FE1
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjFVLmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjFVLmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:42:36 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B622128
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434118; x=1718970118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LjXLcO+v3YuoiO4jDNwsM9hxz55JwJevbk46iPOtuRk=;
  b=htY7dD57FtsaU0GNvOjTFKx0d2rO9VOMqm4M9CYRu+EFKv5i2LYsaDDG
   T/4R+W9/BnTueyOfYwidd8eDRfH+rcD6jjJ16RmzYJvXAj9kxZTUgNRfN
   AlExGRtkc+Y6vBAxNcS+a3Z3Y05iszOJQ0vknugKQJYzvmfQ2AVllOnfZ
   sh5apCZjhMsfgWva0WCXGk18SK5xC71/aAMyStY5/6T/5eQrKt2VGWPwI
   IZeed4W0gBZiWWPTV0RVYZTd4moMlhDxQCtQTHYP/z2Ct3+h1mrB2vaC7
   Hj6JFLE/X93Ko40GrGDw+xDERPYMOzipWLjnbPnIZ30DTK14ukwIyVfg5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800545"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800545"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013564"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013564"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 58718120ED2;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg3-003oUM-0r;
        Thu, 22 Jun 2023 14:40:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v4 31/38] media: marvell: cafe: Register V4L2 device earlier
Date:   Thu, 22 Jun 2023 14:40:21 +0300
Message-Id: <20230622114028.908825-32-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Register V4L2 device before the async notifier. This way the device can be
made available to the V4L2 async framework from the notifier init time
onwards. A subsequent patch will add struct v4l2_device as an argument to
v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/platform/marvell/cafe-driver.c | 11 +++++++++--
 drivers/media/platform/marvell/mcam-core.c   |  9 ---------
 2 files changed, 9 insertions(+), 11 deletions(-)

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
index 3cee6d6b83fa9..7a6e043ac7539 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1863,13 +1863,6 @@ int mccic_register(struct mcam_camera *cam)
 		goto out;
 	}
 
-	/*
-	 * Register with V4L
-	 */
-	ret = v4l2_device_register(cam->dev, &cam->v4l2_dev);
-	if (ret)
-		goto out;
-
 	mutex_init(&cam->s_mutex);
 	cam->state = S_NOTREADY;
 	mcam_set_config_needed(cam, 1);
@@ -1915,7 +1908,6 @@ int mccic_register(struct mcam_camera *cam)
 
 out:
 	v4l2_async_nf_unregister(&cam->notifier);
-	v4l2_device_unregister(&cam->v4l2_dev);
 	v4l2_async_nf_cleanup(&cam->notifier);
 	return ret;
 }
@@ -1937,7 +1929,6 @@ void mccic_shutdown(struct mcam_camera *cam)
 		mcam_free_dma_bufs(cam);
 	v4l2_ctrl_handler_free(&cam->ctrl_handler);
 	v4l2_async_nf_unregister(&cam->notifier);
-	v4l2_device_unregister(&cam->v4l2_dev);
 	v4l2_async_nf_cleanup(&cam->notifier);
 }
 EXPORT_SYMBOL_GPL(mccic_shutdown);
-- 
2.39.2

