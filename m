Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C745D56CA74
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 17:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiGIP45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 11:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGIP44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 11:56:56 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2159211C06
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657382216; x=1688918216;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/FTukGAHdJv7n0ZUyCB1QihtAUuiv4DWZXStk2vvFOw=;
  b=GCR6c3Pvf5gJWZcIQyeNegvha80drw0xvFvyCdk49HPdcgGrHnY0CMrB
   3Q+te0OBN62oLBveT4CwhJ6qy8InTcwRLS9muyI+0jJp0Q+C1DWpKTOrE
   D/BgPaj96E4kmviW499Fv7dUraaJAQy6yPoene2Pm7bOFvLBSLMDVkRdI
   RX2cihuNMZuI3UpZ0W8wEnlIr0BghAp10po4wvwCbcmezW4PI6odL7MyC
   jaAcmRK0nPFjHOm5X+45MHsz2d5vxu1KL192yLtBCqIn6iVjSr8iSdppZ
   /xICFYxYXienju6FCQgODfKLzf3mAVISXm8ro0QDc9G6FkQMefuMJX0Zz
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="370753838"
X-IronPort-AV: E=Sophos;i="5.92,258,1650956400"; 
   d="scan'208";a="370753838"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 08:56:55 -0700
X-IronPort-AV: E=Sophos;i="5.92,258,1650956400"; 
   d="scan'208";a="771094760"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 08:56:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id BB8CC20146;
        Sat,  9 Jul 2022 18:56:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oACrA-00Cj4a-4o; Sat, 09 Jul 2022 18:58:56 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, djrscally@gmail.com,
        mchehab@kernel.org
Subject: [PATCH 1/1] v4l: async: Also match secondary fwnode endpoints
Date:   Sat,  9 Jul 2022 18:58:55 +0300
Message-Id: <20220709155855.3033151-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For camera sensor devices the firmware information comes from non-DT (or
some ACPI variants), the kernel makes the information visible to the
drivers in a form similar to DT. This takes place through device's
secondary fwnodes, in which case also the secondary fwnode needs to be
heterogenously (endpoint vs. device) matched.

Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
This should go to v5.19.

 drivers/media/v4l2-core/v4l2-async.c | 49 ++++++++++++++++------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index c6995718237a4..8db1c900e59e2 100644
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
+		struct v4l2_async_subdev *asd)
 {
 	struct fwnode_handle *other_fwnode;
 	struct fwnode_handle *dev_fwnode;
@@ -75,22 +77,6 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	bool sd_fwnode_is_ep;
 	struct device *dev;
 
-	/*
-	 * Both the subdev and the async subdev can provide either an endpoint
-	 * fwnode or a device fwnode. Start with the simple case of direct
-	 * fwnode matching.
-	 */
-	if (sd->fwnode == asd->match.fwnode)
-		return true;
-
-	/*
-	 * Check the same situation for any possible secondary assigned to the
-	 * subdev's fwnode
-	 */
-	if (!IS_ERR_OR_NULL(sd->fwnode->secondary) &&
-	    sd->fwnode->secondary == asd->match.fwnode)
-		return true;
-
 	/*
 	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
 	 * endpoint or a device. If they're of the same type, there's no match.
@@ -99,7 +85,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	 * ACPI. This won't make a difference, as drivers should not try to
 	 * match unconnected endpoints.
 	 */
-	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd->fwnode);
+	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
 	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
 
 	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
@@ -110,11 +96,11 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
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
@@ -143,6 +129,27 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	return true;
 }
 
+static bool match_fwnode(struct v4l2_async_notifier *notifier,
+			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+{
+	/*
+	 * Both the subdev and the async subdev can provide either an endpoint
+	 * fwnode or a device fwnode. Start with the simple case of direct
+	 * fwnode matching.
+	 */
+	if (sd->fwnode == asd->match.fwnode)
+		return true;
+
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

