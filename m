Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEBF56CA78
	for <lists+linux-media@lfdr.de>; Sat,  9 Jul 2022 17:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiGIP7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jul 2022 11:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGIP7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jul 2022 11:59:23 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C85101EC
        for <linux-media@vger.kernel.org>; Sat,  9 Jul 2022 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657382362; x=1688918362;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=is7HLdfJ6jI8Hu0HKhPpIJ7LyktCgiqRPC0T43eGvjk=;
  b=MjWdFfAXitDmepDBbhq5/EUOSIULXy8zl1CJugpUQapQKhdoStqGnajN
   Y+cmnhuulEHH10hcajYWaCwwzFQ6ZTpHcd2bF7OX1w7Dq1rZskTpzci6K
   bgn0DDCsa31IFufJJ1LSwJWVBS23MzGq6RNa+xH6la0FBPgwQr9qHL6be
   T/bJoin11XYwsHq6B6ST7t30TwwcXSijrmI8zJvx2ic7m5jFQ5f7R7dbu
   nzYl0LHgLrPiOL+6fr7B+TX9xFFP7vus+/gTQsSi9G3Z2SmhuS7rDC7hl
   n5KKN1v6yAhlqXRwh2v8Nz1juP4V18+OtqPPn+6/mv5qMw1onEXl/FG/E
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="285570170"
X-IronPort-AV: E=Sophos;i="5.92,258,1650956400"; 
   d="scan'208";a="285570170"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 08:59:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,258,1650956400"; 
   d="scan'208";a="569277323"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 08:59:20 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id D4DAF20146;
        Sat,  9 Jul 2022 18:59:18 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1oACtX-00Cj7N-8F; Sat, 09 Jul 2022 19:01:23 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, djrscally@gmail.com,
        mchehab@kernel.org
Subject: [PATCH v2 1/1] v4l: async: Also match secondary fwnode endpoints
Date:   Sat,  9 Jul 2022 19:01:23 +0300
Message-Id: <20220709160123.3033324-1-sakari.ailus@linux.intel.com>
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
With correct indentation this time.

 drivers/media/v4l2-core/v4l2-async.c | 49 ++++++++++++++++------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index c6995718237a4..2db5d7a8af82b 100644
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

