Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80ABD7AB16B
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbjIVL56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233926AbjIVL55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:57:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DF018F
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695383871; x=1726919871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p71jLwyaJ+cRA4wPi0IX6Mx4yaKEMlNV4iXy/0ENXCg=;
  b=ZXBbClB3Zm70oIxZkLnuupmzG0lESVDdQ9necLi3WKAJqoZjRrsky/ya
   uJCblDDbROuHTUbx/0xDpn+jnGXk18gpd8Kz9zb692QVNQtJxu4rZuL/Y
   OGlRAmgZTEQ4WGLr/KmI/sSsMLwZXhn089+ZiyqMRrOB3N7xV7wa38fYl
   umPmkbkPVKwsF95HAqBwjyHQsMboYxbr5Ec48PSaFfo0r0/gPaPcAvy/x
   MgvdYUr+sEx7LOl4t4jNNmT8tIqvYEOuFaYhD0sUXQgLmQH/UMLu4A756
   jAX6suHl52HoohoJ0ZCa8aPiip/IpIF5g6ybZOCwENPPMb61dSpZwOuDu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383558632"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383558632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837714698"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="837714698"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:57:49 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 29320120810;
        Fri, 22 Sep 2023 14:57:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v4 12/12] media: mc: Check pad flag validity
Date:   Fri, 22 Sep 2023 14:57:30 +0300
Message-Id: <20230922115730.251779-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
References: <20230922115730.251779-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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

