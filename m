Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D06739FC3
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjFVLlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjFVLlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482861BE6
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434063; x=1718970063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r8E0/hwLlq9kraov5CDqN0XINTRJFJ2G6wKROZUueAg=;
  b=FPm/kJ0IGJanj6YhOdZpuFjIxxmBWxDRXdsrscu4cfwtkm3KH7rNWlek
   8yCUo/KnMd3Obzbk4bVajzlTTsdK2w1NIiiICPwFIbbFSNEl4jAqJH24L
   9EHNae1n1QOHYPBtiV+8U9Oyve9qeJETfaZKMu0kLXg2DqbO3GcdfjgfB
   +fIqui+zmBLdR6O0hzSr0agPsS3xfCiA12aRFzzRggwMDkahYr6gCPMGm
   sZLPmJNS2sRfPES3EH2wS1QTgLoTJrU96hE9fz39vv/3C0lOtASlVooex
   DFlhNkJ1MbdB+9oRUfuQGEyNqhCJ72ZL+3v7YVRcgRAVOVHro8NhQKe15
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357957469"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357957469"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804749825"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="804749825"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:40:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C6D481207EB;
        Thu, 22 Jun 2023 14:40:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oSB-2L;
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
Subject: [PATCH v4 04/38] media: xilinx-vipp: Clean up bound async notifier callback
Date:   Thu, 22 Jun 2023 14:39:54 +0300
Message-Id: <20230622114028.908825-5-sakari.ailus@linux.intel.com>
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

The async notifier bound callback does a lot of checks that have probably
been always unnecessary. Remove the lookup of the async subev that we
already have, as well as the debug print that is already printed by the
framework.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 32 ++++-----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 3123216b3f70e..b309af0c83749 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -312,36 +312,14 @@ static int xvip_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 static int xvip_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_subdev *subdev,
-				   struct v4l2_async_subdev *unused)
+				   struct v4l2_async_subdev *asd)
 {
-	struct xvip_composite_device *xdev =
-		container_of(notifier, struct xvip_composite_device, notifier);
-	struct xvip_graph_entity *entity;
-	struct v4l2_async_subdev *asd;
+	struct xvip_graph_entity *entity = to_xvip_entity(asd);
 
-	/* Locate the entity corresponding to the bound subdev and store the
-	 * subdev pointer.
-	 */
-	list_for_each_entry(asd, &xdev->notifier.asd_list, asd_list) {
-		entity = to_xvip_entity(asd);
+	entity->entity = &subdev->entity;
+	entity->subdev = subdev;
 
-		if (entity->asd.match.fwnode != subdev->fwnode)
-			continue;
-
-		if (entity->subdev) {
-			dev_err(xdev->dev, "duplicate subdev for node %p\n",
-				entity->asd.match.fwnode);
-			return -EINVAL;
-		}
-
-		dev_dbg(xdev->dev, "subdev %s bound\n", subdev->name);
-		entity->entity = &subdev->entity;
-		entity->subdev = subdev;
-		return 0;
-	}
-
-	dev_err(xdev->dev, "no entity for subdev %s\n", subdev->name);
-	return -EINVAL;
+	return 0;
 }
 
 static const struct v4l2_async_notifier_operations xvip_graph_notify_ops = {
-- 
2.39.2

