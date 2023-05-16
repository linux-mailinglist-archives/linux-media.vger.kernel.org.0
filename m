Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD147049C9
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjEPJ4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbjEPJ4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:11 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224B63C0C
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230969; x=1715766969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaE5rmXoGEPwqX+Oi360L0Qse5Ngq1X84yo/T2Lf/Ys=;
  b=arZ3Gfbj+u//xehKVHSs6CvGVA3Ire2zycrgxhkZ0P0W2EV5etgBtXXb
   iqJ21Tbavb+sEF1lh5+aS/kTyanNniFbzP1o6IwRu4ykhYPZPAQNpi7xW
   NcYF4gS2bWtqc0etlZi809eCGEoC6wQmHWWFczBGHLSSvV3BkY2XX6Mhh
   CnrlQfBBoPO7ccjGdRfR1yXGpe7c4wUoqdqoS62qpTfBlSwimPBANYsrU
   dON1bOhLu9w+JNAmB7k7ya2lXzGQv1bDK2iTbmWW1LCRdru+/A0GFNkLm
   ZLNJwy7rgUd2aCgVdO15llrsFm/leefwWn2dWXtN05HvOH41F7qV9hY0h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601383"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601383"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931799"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931799"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ED03C1222FD;
        Tue, 16 May 2023 12:55:35 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOx-002Z9p-VJ; Tue, 16 May 2023 12:55:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 05/31] media: v4l: async: Clean testing for duplicated async subdevs
Date:   Tue, 16 May 2023 12:54:51 +0300
Message-Id: <20230516095517.611711-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
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

There's a need to verify that a single async sub-device isn't being added
multiple times, this would be an error. This takes place at the time of
adding the async sub-device to the notifier's list as well as when the
notifier is added to the global notifier's list.

Use the pointer to the sub-device for testing this instead of an index to
an array that is long gone. (There was an array of async sub-devices in
the notifier before it was converted to a linked list by commit
66beb323e4a0 ("media: v4l2: async: Remove notifier subdevs array").

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 5f43107910e89..22c8c8a2a69dd 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -520,21 +520,19 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
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
-	int j = 0;
 
 	lockdep_assert_held(&list_lock);
 
 	/* Check that an asd is not being added more than once. */
 	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
-		if (this_index >= 0 && j++ >= this_index)
+		if (skip_self && asd == asd_y)
 			break;
 		if (asd_equal(asd, asd_y))
 			return true;
@@ -550,7 +548,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
 static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd,
-				   int this_index)
+				   bool skip_self)
 {
 	struct device *dev = notifier_dev(notifier);
 
@@ -560,7 +558,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	switch (asd->match_type) {
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
-		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
+		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
 			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in this or other notifiers\n");
 			return -EEXIST;
 		}
@@ -583,7 +581,7 @@ EXPORT_SYMBOL(v4l2_async_nf_init);
 static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_subdev *asd;
-	int ret, i = 0;
+	int ret;
 
 	INIT_LIST_HEAD(&notifier->waiting);
 	INIT_LIST_HEAD(&notifier->done);
@@ -591,7 +589,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
-		ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
+		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
 		if (ret)
 			goto err_unlock;
 
@@ -725,7 +723,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_asd_valid(notifier, asd, -1);
+	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
 	if (ret)
 		goto unlock;
 
-- 
2.30.2

