Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1007376D9EC
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 23:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233879AbjHBVrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 17:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbjHBVqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 17:46:42 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F084225
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691012768; x=1722548768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x+LP+4lfNYxrrkLWfRafgulLicRZ0Ly2LjAWyJO66Mc=;
  b=isZrcCKy1iitCwVzOylsWwED1hTyaYZQ4Q9YN71I/KD07rKWoDPw5RfB
   uwnQlt/SyvG5Q56IB88jsRZ4Avm2oJpXtP6RK7T2EmlrqdwEKW4sMxoxe
   AJL5QOBeyyF6w3mzmaygBFUSnjVDDvPDVe8hEPOoD/2Lxy2ozRbq514ag
   5wCvdYrqDGViVa7YxY8nCW1Z3in/cLpOL9I1hhd1pvuH7BQuXHLbfAw77
   hSfRXCw+5pD+8f3qrgzLqYK/6b2409+1sO8odz5KKNpBgc/K026GpAb8i
   IVmkFQbbFQhU2HzfDHFWWV+ctBvxrhO08jbU5mLaipBuCEnEsVwUObPsw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372442049"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372442049"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853009295"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="853009295"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 14:46:02 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 45450120BBA;
        Thu,  3 Aug 2023 00:45:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v2 2/9] media: mc: Check pad flag validity
Date:   Thu,  3 Aug 2023 00:45:49 +0300
Message-Id: <20230802214556.180589-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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

