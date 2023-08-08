Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B808773F4A
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbjHHQp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:45:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbjHHQoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:44:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E99E16BDB
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510168; x=1723046168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x+LP+4lfNYxrrkLWfRafgulLicRZ0Ly2LjAWyJO66Mc=;
  b=bjGmftVL5GLSqV9y+8Zjd9g475+speulmYnGv6XlnNHITLftc1816Zo6
   ixVVDFy+o4eIKjHG13GW3f0GCTXSWEfNdpZK3wxyiA+5f8UUYVR1WGL+m
   QTKLP/GK4lutI4oxr/TanR9tYBqIf21rfnXRsvP8MJU28Pe1J6cXZpVpo
   l77/rnyjZiaEFhJqcKIBDLBK504hRwcSimTJBTzUM90d8MlDl2mjRq9ji
   KBfK1DhHlIpvtXUYkVjqdJIHimFz3kFIbfblsrUgATjkVm9DdkW56A2wr
   S5gdiVmMh8BWwslwdJOYJM/4YIvLt880yDorfshPaNV1O7sfZhfxUoYT6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369648855"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="369648855"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874627378"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:56:06 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 912D912023A;
        Tue,  8 Aug 2023 10:56:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qTHZE-00ClsM-0b;
        Tue, 08 Aug 2023 10:55:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [PATCH v3 02/10] media: mc: Check pad flag validity
Date:   Tue,  8 Aug 2023 10:55:30 +0300
Message-Id: <20230808075538.3043934-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
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

