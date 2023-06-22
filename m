Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3645739FC9
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbjFVLlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjFVLlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:14 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBEF1BE6
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434073; x=1718970073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fncVFRl8+6RV56tkQCB29Z2i0FGn582VpnBdz6xEowY=;
  b=FAJ/ceAGHzv2umMk3ds/34f8N30HQG0TEqV6okRzJvM2xa2eea1cTYMh
   lve82DEXNzeoQa54cVsRlVRHO+ete6qsZ4lvlQ0OiyG4/DkrL+uFIjvts
   91ZkcEeMgk6waRfg7V5C0M92wozXHDBZHTDeBW5poneZvJoJLVI8QrqoU
   wM5UBIa68YtbQswRkQfJtcf0bhrQqWMFgvfNs1jSptrdg5IVs5waQ70t2
   g0o/FI2trAufv7Q71hcy8BR3g0lcaFJMx4By3njUsL1fBQ01/qh5qS7BN
   IEPS/9dJeWHPgO0sqrYI1Qx+Ahg/j6bpJCtyyobJRQjdi4+ugGqRNTJ7Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357957602"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357957602"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804749887"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="804749887"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:02 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id CC0971209CA;
        Thu, 22 Jun 2023 14:40:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oSG-2P;
        Thu, 22 Jun 2023 14:40:38 +0300
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
Subject: [PATCH v4 05/38] media: omap3isp: Move link creation to bound callback
Date:   Thu, 22 Jun 2023 14:39:55 +0300
Message-Id: <20230622114028.908825-6-sakari.ailus@linux.intel.com>
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

Move the creation of the links between external sub-devices and ISP
sub-devices to the bound callback. This way we can also remove the need to
access the sub-device's notifier field that will soon be removed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/platform/ti/omap3isp/isp.c | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f3aaa9e76492e..c3872eadf5dff 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2022,35 +2022,34 @@ enum isp_of_phy {
 	ISP_OF_PHY_CSIPHY2,
 };
 
-static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
+static int isp_subdev_notifier_bound(struct v4l2_async_notifier *async,
+				     struct v4l2_subdev *sd,
+				     struct v4l2_async_subdev *asd)
 {
 	struct isp_device *isp = container_of(async, struct isp_device,
 					      notifier);
-	struct v4l2_device *v4l2_dev = &isp->v4l2_dev;
-	struct v4l2_subdev *sd;
+	struct isp_bus_cfg *bus_cfg =
+		&container_of(asd, struct isp_async_subdev, asd)->bus;
 	int ret;
 
 	mutex_lock(&isp->media_dev.graph_mutex);
+	ret = isp_link_entity(isp, &sd->entity, bus_cfg->interface);
+	mutex_unlock(&isp->media_dev.graph_mutex);
 
-	ret = media_entity_enum_init(&isp->crashed, &isp->media_dev);
-	if (ret) {
-		mutex_unlock(&isp->media_dev.graph_mutex);
-		return ret;
-	}
-
-	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
-		if (sd->notifier != &isp->notifier)
-			continue;
+	return ret;
+}
 
-		ret = isp_link_entity(isp, &sd->entity,
-				      v4l2_subdev_to_bus_cfg(sd)->interface);
-		if (ret < 0) {
-			mutex_unlock(&isp->media_dev.graph_mutex);
-			return ret;
-		}
-	}
+static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
+{
+	struct isp_device *isp = container_of(async, struct isp_device,
+					      notifier);
+	int ret;
 
+	mutex_lock(&isp->media_dev.graph_mutex);
+	ret = media_entity_enum_init(&isp->crashed, &isp->media_dev);
 	mutex_unlock(&isp->media_dev.graph_mutex);
+	if (ret)
+		return ret;
 
 	ret = v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
 	if (ret < 0)
@@ -2240,6 +2239,7 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 }
 
 static const struct v4l2_async_notifier_operations isp_subdev_notifier_ops = {
+	.bound = isp_subdev_notifier_bound,
 	.complete = isp_subdev_notifier_complete,
 };
 
-- 
2.39.2

