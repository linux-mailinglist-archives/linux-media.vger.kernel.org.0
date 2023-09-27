Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF5A7AFAF2
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 08:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbjI0GTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 02:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjI0GTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 02:19:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92111B8
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695795548; x=1727331548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p71jLwyaJ+cRA4wPi0IX6Mx4yaKEMlNV4iXy/0ENXCg=;
  b=ij2AnN/1u6EDx6iNUxBhP5/NNG57M3LolYMd8pR2u9xhfxrZ9W0wAX47
   B9oGCC9MrRSmmQgJ1JoRQwyZPfAWsWI4d4HaSYCdcYNby0fxuCkF84QJ6
   et0FJmsZSHqDJeyNeplrRoQ4x+dyskyOeGMov12TDt9toKfG26kVw0EKM
   mh2QOGdUF8QFl8BG9VMcnzgGSAAPKR4N0Llhoxn+izwXeEg/f+KZjNhgI
   eyfjfmeBB4ivrZQcKqSrElbmyNV2xKZB7/r+fkr6XTCgNTGtqOdJ0v0GS
   mHsXR+0luRHIOWN80YH+D8ETiApa5HngNpsqLWaqQY5q+Li1Fka2qln/1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381641182"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="381641182"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742598619"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="742598619"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 23:18:50 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BCA2312061E;
        Wed, 27 Sep 2023 09:18:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v5 12/13] media: mc: Check pad flag validity
Date:   Wed, 27 Sep 2023 09:18:28 +0300
Message-Id: <20230927061829.366107-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927061829.366107-1-sakari.ailus@linux.intel.com>
References: <20230927061829.366107-1-sakari.ailus@linux.intel.com>
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

Check the validity of pad flags on entity init. Exactly one of the flags
must be set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 83468d4a440b..543a392f8635 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 	struct media_device *mdev = entity->graph_obj.mdev;
 	struct media_pad *iter;
 	unsigned int i = 0;
+	int ret = 0;
 
 	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
 		return -E2BIG;
@@ -210,15 +211,27 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 	media_entity_for_each_pad(entity, iter) {
 		iter->entity = entity;
 		iter->index = i++;
+
+		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
+					     MEDIA_PAD_FL_SOURCE)) != 1) {
+			ret = -EINVAL;
+			break;
+		}
+
 		if (mdev)
 			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
 					  &iter->graph_obj);
 	}
 
+	if (ret && mdev) {
+		media_entity_for_each_pad(entity, iter)
+			media_gobj_destroy(&iter->graph_obj);
+	}
+
 	if (mdev)
 		mutex_unlock(&mdev->graph_mutex);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(media_entity_pads_init);
 
-- 
2.39.2

