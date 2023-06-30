Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E0F744369
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 22:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbjF3Unu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 16:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232590AbjF3Uns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 16:43:48 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D17B3C0B
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688157827; x=1719693827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x+LP+4lfNYxrrkLWfRafgulLicRZ0Ly2LjAWyJO66Mc=;
  b=a9cS1vNDziTIRziszEk7BVwR4w83L7WCCUzD5j3XmVBRQe4VckzdrC0k
   H7n61skK6khpA4mULpc6BrPTl317KDNqXrCEbY1y+5h0WZfWCuBqsDWor
   ILhFbWYT6MBT6EYPqHTuojU3K/UMPO5LWGjVf6qjbUGUIJgnG0JHdG1Lo
   bGhln9vtKBWnPguETHgrmvRyKxjlmKBuAUi49Y+EURYyU179hXYFewTeg
   CkEO7GaNw+bIsFHkA8SOun8tmYU1KGiv9io9EeZeKN6yPWy03/Bno8LwA
   KezqdvFxXdx63GAK4UULiLLjb25V/75wTGRgWkTUnJuh+LVrqKENu0SHM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="448866688"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="448866688"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841987156"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841987156"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 13:43:46 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7595112075E;
        Fri, 30 Jun 2023 23:43:41 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: [PATCH 1/7] media: mc: Check pad flag validity
Date:   Fri, 30 Jun 2023 23:43:32 +0300
Message-Id: <20230630204338.126583-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check the validity of pad flags on entity init. Exactly one of the flags
must be set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 83468d4a440b..4991281dcccc 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 	struct media_device *mdev = entity->graph_obj.mdev;
 	struct media_pad *iter;
 	unsigned int i = 0;
+	int ret = 0;
 
 	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
 		return -E2BIG;
@@ -210,6 +211,14 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 	media_entity_for_each_pad(entity, iter) {
 		iter->entity = entity;
 		iter->index = i++;
+
+		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
+					     MEDIA_PAD_FL_SOURCE))
+		    != 1) {
+			ret = -EINVAL;
+			break;
+		}
+
 		if (mdev)
 			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
 					  &iter->graph_obj);
@@ -218,7 +227,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 	if (mdev)
 		mutex_unlock(&mdev->graph_mutex);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(media_entity_pads_init);
 
-- 
2.39.2

