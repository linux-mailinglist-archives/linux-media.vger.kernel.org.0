Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3212756474
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjGQNWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbjGQNVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:39 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE332121
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600058; x=1721136058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SBD/oAjxhxYo5zM/84mpUDEuzlhf5IolVTb/OfK8/sU=;
  b=PxoWo39xKG+ekZqis5GTOeuMIZDS9SfvaQoQK5QNwQIRELLfkD4iMYKQ
   0EtBNTIwmgPTZT05V69+Qi1euG+zfh7FXZkEqNu4xUoRuzSQPhj5lh78S
   3m/btPGx1qBX7IgoBHwQ+FRpvi4Hhk1BPfeLKN+4ygIf9xGxmS139xXXW
   Y6+aPyyDW4WCCtBZqqBYdQ+xPA45qzpjtLZExbovoWrOGGAi53WkeWpV4
   L/cn2/R2koo0CBwPRnKgW8H15wfWuB9pBnt/o/M9deHKyAUWLAXr/dHMY
   CtPEszp/KT0Rzk+GLVI+WzlTPSW5QkVCVPlFy/9GfflogZLLmqbgJ9+P6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097496"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097496"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726541903"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726541903"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id CB768120B8F;
        Mon, 17 Jul 2023 16:20:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8F-004s0A-37;
        Mon, 17 Jul 2023 16:19:19 +0300
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
Subject: [PATCH v5 05/38] media: omap3isp: Move link creation to bound callback
Date:   Mon, 17 Jul 2023 16:18:36 +0300
Message-Id: <20230717131909.1160787-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
References: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
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
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/platform/ti/omap3isp/isp.c | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f3aaa9e76492..c3872eadf5df 100644
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

