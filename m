Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00EB371087E
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239626AbjEYJRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239475AbjEYJRA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:00 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4862119D
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006219; x=1716542219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZEWyYL5WvYiji8mWWE5qZP8f4HceskEQYPpLeB/CW5Q=;
  b=mXa8qb7Jl9ZtAuIa/COpkKg/enXU+rys8NsRe3+G1YWDzzGV1KoVj81v
   hP9OjpQcDR9t4lcM0FxkBii3yN27FKJRpSgKsJZs1hwQPmj/v51DJV+Vz
   JwihP9lBccfQC9k22RTAXEUcCesUmusUI/t7FC5iQciaJxmgAv/vUxfEJ
   K5zDDMXOo5Nnw/mSb1G80nTS3VhXvjE8zhVNyY5xbaXt9hut8TmSc/UdM
   YsfUae2m8qTCYvzxKupsEpcsSJIWyv1pDnYhnu7Lw0fBZFGuVcT7buVgg
   F0I1RMz3q99TJpoaitt0XAGq2R/vAu8eJhvQniqXHd0YE7Z4DyAV3SO8/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343307706"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="343307706"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="794590855"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="794590855"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:16:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 186BC12160F;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2757-009kob-Uh; Thu, 25 May 2023 12:16:25 +0300
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
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [RESEND PATCH v3 03/32] media: xilinx-vipp: Clean up bound async notifier callback
Date:   Thu, 25 May 2023 12:15:46 +0300
Message-Id: <20230525091615.2324824-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
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
2.30.2

