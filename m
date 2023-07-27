Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251957645FC
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbjG0Fqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjG0FqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:46:15 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1ED30F2
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436729; x=1721972729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u1uZR3MzpTvdGySut+ZeLzoc4SZc6xvpTD4YHBTQwvk=;
  b=VgDi0JbFy4DeTzaMOY54G8g+X+8h/+/FDh19ZTk5w29Uz8drXHsqgFnE
   OD+8M1WEBEP4VjtuG6lXfmEkVL6oSfcp+kwAoc4FMLpe+cMRQeLslgal3
   cT5WO4CilZQ9u5u3Wp4mKD5ihu37QedVfI/wQNrFt9dGNm3g3CLj6bKNX
   L/1eRxf32dLoepubhdlh0KAObo++IsNxDn2zWs4ntryUUYnXk/jVJsDBl
   ZHxGNQtPbZYQIiopkTEMjtoUq4MegHWqdN2rR90NO8Qz0R5maQLQQf5Ni
   xqLZOauov6obVAyqRYkcXVTloeguizuHgZHcLnw1WdCQABeYBqFM93+cF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399150294"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399150294"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840583999"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840583999"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:21 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D96D1207F9;
        Thu, 27 Jul 2023 08:44:18 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmD-004xqT-2M;
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
Subject: [PATCH v6 04/38] media: xilinx-vipp: Clean up bound async notifier callback
Date:   Thu, 27 Jul 2023 08:42:21 +0300
Message-Id: <20230727054255.1183255-5-sakari.ailus@linux.intel.com>
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

The async notifier bound callback does a lot of checks that have probably
been always unnecessary. Remove the lookup of the async subev that we
already have, as well as the debug print that is already printed by the
framework.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 32 ++++-----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 3123216b3f70..b309af0c8374 100644
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

