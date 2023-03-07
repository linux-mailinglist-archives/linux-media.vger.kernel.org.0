Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 013266AF795
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbjCGV2d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjCGV2a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:30 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B33B99D7A
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224509; x=1709760509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ziISN3yBdwXMofYvWCmozrA9AvLjXrHOwqBYrSZJMyk=;
  b=NzKZGTq11pY6OydOnc4cL5Q4vSYMVJMPM+ck9jfW9WU2OHSE1S9tCXKr
   hcrc4i+pZH0O9D4AmnS2hcOSoHmrxFQ+yIyYUr18Nrfjx94azaeco9AvI
   oZIRZkDKScWDtOMnTy8JIYsxvBFx4Cc/h+FVG+mWPzPmJoFowlFC8Uzoz
   Ay2TPMkNxmGOk9x3IvF6/DNLLDlwkQiqxLhiGbkcNDmPyILFM62iKZcpE
   MGhY9vqgLRLV9Z3mCY65Bx2l9hrMX9/g21ry6etwSJd2LPQj8x/u92wCa
   FNqeqdlM/1z5EfPUGHMYXvdg1cM5OViAulP3kiPSokLF2rT6/tR8Ap/oY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557130"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557130"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710140"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710140"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:15 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E7053122D9B;
        Tue,  7 Mar 2023 23:20:43 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 05/10] media: v4l: async: Clean testing for duplicated async subdevs
Date:   Tue,  7 Mar 2023 23:20:33 +0200
Message-Id: <20230307212038.968381-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
References: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a need to verify that a single async sub-device isn't being added
multiple times, this would be an error. This takes place at the time of
adding the async sub-device to the notifier's list as well as when the
notifier is added to the global notifier's list.

Use the pointer to the sub-device for testing this instead of an index to an
array that is long gone.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index bb78e3618ab5..f554dc8c95c1 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -456,12 +456,11 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
 /*
  * Find out whether an async sub-device was set up already or
- * whether it exists in a given notifier before @this_index.
- * If @this_index < 0, search the notifier's entire @asd_list.
+ * whether it exists in a given notifier.
  */
 static bool
 v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
-			       struct v4l2_async_subdev *asd, int this_index)
+			       struct v4l2_async_subdev *asd, bool skip_self)
 {
 	struct v4l2_async_subdev *asd_y;
 	int j = 0;
@@ -470,7 +469,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
 	/* Check that an asd is not being added more than once. */
 	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
-		if (this_index >= 0 && j++ >= this_index)
+		if (asd == asd_y)
 			break;
 		if (asd_equal(asd, asd_y))
 			return true;
@@ -486,7 +485,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
 static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd,
-				   int this_index)
+				   bool skip_self)
 {
 	struct device *dev =
 		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
@@ -497,7 +496,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	switch (asd->match.type) {
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
-		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
+		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
 			dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
 			return -EEXIST;
 		}
@@ -520,7 +519,7 @@ EXPORT_SYMBOL(v4l2_async_nf_init);
 static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_subdev *asd;
-	int ret, i = 0;
+	int ret;
 
 	INIT_LIST_HEAD(&notifier->waiting);
 	INIT_LIST_HEAD(&notifier->done);
@@ -528,7 +527,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
-		ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
+		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
 		if (ret)
 			goto err_unlock;
 
@@ -661,7 +660,7 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_asd_valid(notifier, asd, -1);
+	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
 	if (ret)
 		goto unlock;
 
-- 
2.30.2

