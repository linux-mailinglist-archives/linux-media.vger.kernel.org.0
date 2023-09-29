Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C16FE7B2EA0
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 10:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbjI2I5g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 04:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjI2I5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 04:57:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E192DF9
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 01:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695977852; x=1727513852;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J5H6nSnT2X2GxQd+O3WvOtv8cLlHPURSbkfqZyI/A1k=;
  b=Yxh4zaLYhg3Cp0v4gU0Cvh0Ggys7Sy7Q1NatK1E2HqaqaDSuPxZfLZ5K
   RDo2JeI/R/EMlNs9AFUwb+6aqN/CWve9G1FxqE3Yfg+xZWBwObZpsj9e7
   fEKWHd2xr0MnrLbNgl5PuAPK6DR9BI+Fla1UVrvX1Sp4MKLpgtbRbhu6+
   Y6xKOR8TLdo7t+lpoGHlfDkURZaI4IAWLsBydlfhQR7vHfbDjH++IarZ9
   qbQqLTz1/6XyOj4d3IflyGsKC+qoXBx6u+L4QqRjsIMXt2A5XS7ie/vHY
   oi+sF5UqUmoTaM6ayS2gqcfQFLqtt3kNdycP4sCsrzyswwvwWvkFj8TQ5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379531831"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="379531831"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 01:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699581693"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="699581693"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 01:57:30 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7968411F94F;
        Fri, 29 Sep 2023 11:57:27 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qm9JB-0030UX-31;
        Fri, 29 Sep 2023 11:57:13 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/1] media: xilinx-vipp: Look for entities also in waiting_list
Date:   Fri, 29 Sep 2023 11:57:03 +0300
Message-Id: <20230929085703.716865-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The big V4L2 async framework overhaul simplified linked lists used by the
V4L2 async framework. This affected a few drivers and it turns out a few
of those drivers rely on searching for entities in both async notifier's
waiting and done lists. Do that by separately traversing both.

Fixes: 9bf19fbf0c8b ("media: v4l: async: Rework internal lists")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 4285770fde18..996684a73038 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -55,11 +55,18 @@ xvip_graph_find_entity(struct xvip_composite_device *xdev,
 {
 	struct xvip_graph_entity *entity;
 	struct v4l2_async_connection *asd;
-
-	list_for_each_entry(asd, &xdev->notifier.done_list, asc_entry) {
-		entity = to_xvip_entity(asd);
-		if (entity->asd.match.fwnode == fwnode)
-			return entity;
+	struct list_head *lists[] = {
+		&xdev->notifier.done_list,
+		&xdev->notifier.waiting_list
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(lists); i++) {
+		list_for_each_entry(asd, lists[i], asc_entry) {
+			entity = to_xvip_entity(asd);
+			if (entity->asd.match.fwnode == fwnode)
+				return entity;
+		}
 	}
 
 	return NULL;
-- 
2.39.2

