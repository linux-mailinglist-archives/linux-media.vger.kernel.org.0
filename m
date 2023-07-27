Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F366E764604
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbjG0Fq6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjG0Fqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:46:36 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E219130FC
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436757; x=1721972757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kHefxlgEkUKGCVAPQDujxEjZWvHyInDM2u8g+k6D54k=;
  b=UgjlmtMdt2cW6ICTSBPhienK9Ja8uGd+UWglSanU0wGBZlDogai277HA
   HGwcnIOqaTAoLdQDIIY8D4IEoVgqWD0fmp/9BzNYJwXLQSDpG4CN5vIb1
   28AZeJ7M61Ih41PYi1V8Es6OnOSqmpBFW0t4JuTF/Mj/YkRevgd2vMQdt
   8y71bCI33giOQAgtjnKrLjF1CUC/UnEfAZupdUYYen5p+NPyN4SD4uFqL
   FfNohmX145qfTjJpcKIHmkymHJ5MYYZUp43r8g4j/1q0k346hzAXVwL1e
   Dh0ENFDa0GUo+fNWynhmDhk/KCYKzajL5rmVlrr5FMp6lRIEEQZEy9K/L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399150434"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399150434"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840584033"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840584033"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:29 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 818DD12091C;
        Thu, 27 Jul 2023 08:44:18 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmD-004xqZ-2Q;
        Thu, 27 Jul 2023 08:43:05 +0300
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
Subject: [PATCH v6 05/38] media: omap3isp: Move link creation to bound callback
Date:   Thu, 27 Jul 2023 08:42:22 +0300
Message-Id: <20230727054255.1183255-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
References: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index 2f9c7d688a1c..b01d70dbd0c4 100644
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

