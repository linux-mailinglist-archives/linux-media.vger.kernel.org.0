Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3062F56CE07
	for <lists+linux-media@lfdr.de>; Sun, 10 Jul 2022 10:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiGJImd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 04:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiGJImT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 04:42:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0045193EF
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 01:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657442534; x=1688978534;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LPs3GoQwRQEe8O2XnjKksjntHcvzai+LCTiiFyQqvd4=;
  b=H/Oyvng4rRJHIZiUHzEJVGRGcz10itOQj8FN6SbVhHVddR2pZakXTwzl
   P5Ebe97B2iuokHB9MYO0M2PzwJtYcZ4Z8ms2iUwHuOlZylAx14wNhr4TU
   EA8yVGELeYUX/aL3NiWthXNZnBZVsV3dAAhyvj4kaAUot4lxGWpb/piW9
   QqCVYwjwogag1QqCgRM9p9pNsHwaYZGLITFkQaphG3+zaniqQXFxVCBkP
   v38LhalkbuMbgEmnZcFrwr5Z+fPNmp43f8bPHpuDQvt3d/LBuBbl7tDEJ
   fI0XM0zKZe2mZxJhZtezIKMLUs8hH7Xc8EYKadQJNJMPHWjq3WN+7q/X+
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="285620469"
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="285620469"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 01:42:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="771215654"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 01:42:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 907C6201C5;
        Sun, 10 Jul 2022 11:42:10 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oASY4-00Cmyw-GI; Sun, 10 Jul 2022 11:44:16 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, djrscally@gmail.com,
        mchehab@kernel.org
Subject: [PATCH v3 1/1] v4l: async: Also match secondary fwnode endpoints
Date:   Sun, 10 Jul 2022 11:44:16 +0300
Message-Id: <20220710084416.3048177-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For camera sensor devices the firmware information of which comes from
non-DT (or some ACPI variants), the kernel makes the information visible
to the drivers in a form similar to DT. This takes place through device's
secondary fwnodes, in which case also the secondary fwnode needs to be
heterogenously (endpoint vs. device) matched.

Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Also check direct match with secondary fwnode.

 drivers/media/v4l2-core/v4l2-async.c | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index c6995718237a4..b16f3ce8e5ef1 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -66,8 +66,10 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
 #endif
 }
 
-static bool match_fwnode(struct v4l2_async_notifier *notifier,
-			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+static bool
+match_fwnode_one(struct v4l2_async_notifier *notifier,
+		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
+		 struct v4l2_async_subdev *asd)
 {
 	struct fwnode_handle *other_fwnode;
 	struct fwnode_handle *dev_fwnode;
@@ -80,15 +82,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	 * fwnode or a device fwnode. Start with the simple case of direct
 	 * fwnode matching.
 	 */
-	if (sd->fwnode == asd->match.fwnode)
-		return true;
-
-	/*
-	 * Check the same situation for any possible secondary assigned to the
-	 * subdev's fwnode
-	 */
-	if (!IS_ERR_OR_NULL(sd->fwnode->secondary) &&
-	    sd->fwnode->secondary == asd->match.fwnode)
+	if (sd_fwnode == asd->match.fwnode)
 		return true;
 
 	/*
@@ -99,7 +93,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	 * ACPI. This won't make a difference, as drivers should not try to
 	 * match unconnected endpoints.
 	 */
-	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd->fwnode);
+	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
 	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
 
 	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
@@ -110,11 +104,11 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	 * parent of the endpoint fwnode, and compare it with the other fwnode.
 	 */
 	if (sd_fwnode_is_ep) {
-		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
+		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
 		other_fwnode = asd->match.fwnode;
 	} else {
 		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
-		other_fwnode = sd->fwnode;
+		other_fwnode = sd_fwnode;
 	}
 
 	fwnode_handle_put(dev_fwnode);
@@ -143,6 +137,19 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	return true;
 }
 
+static bool match_fwnode(struct v4l2_async_notifier *notifier,
+			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+{
+	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
+		return true;
+
+	/* Also check the secondary fwnode. */
+	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
+		return false;
+
+	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
+}
+
 static LIST_HEAD(subdev_list);
 static LIST_HEAD(notifier_list);
 static DEFINE_MUTEX(list_lock);
-- 
2.30.2

