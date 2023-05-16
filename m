Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0C07049C2
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjEPJ4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbjEPJ4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:06 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D977B49EB
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230962; x=1715766962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H6szkz+b/Y1mnD82wbXv00UXSbh8DH/dRYrv3EX9gSY=;
  b=MNRH3VEicir1ylen7yLciHQGNHhHnKVcW+q3dntjgznPshO9LXENU37S
   7P3teIt0+Em6JLpFtCGBrSDqSAaGeG0ZQnzyn/VYbyr9YbC49mE3TybIv
   15T2wk9cVije/8bb+5ZDU1/cDxcycfu7RG0g/PQDCckz+oSHuZ3NXdO4H
   0V/5cUVBd1bKkuQgePOc6d0/rV/2QJNKANxxTvFL5sXD4OVbYsBp8KOyI
   1g/B767z1V2m6VZzXC0ACC01D4qeYnc3Aomoeo3ysV7FX/5+ECBLBkRht
   XEq5kIWsrO8sFMRs4hb4O9GqfxL541BrEYDz2GtgwV9wZ9VKGXoplA1dc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353715198"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="353715198"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="678791315"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="678791315"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:38 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E23781214C7;
        Tue, 16 May 2023 12:55:35 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOx-002Z9j-TY; Tue, 16 May 2023 12:55:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 03/31] media: xilinx-vipp: Clean up bound async notifier callback
Date:   Tue, 16 May 2023 12:54:49 +0300
Message-Id: <20230516095517.611711-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
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
been always unnecessary. Remove the lookup of the async connection that we
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

