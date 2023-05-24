Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F84E70F510
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233349AbjEXLYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbjEXLYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:24:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29BE18E
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927472; x=1716463472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8wHuciLUduEFdEXIOqGTUX77vUs5Q47TbeZaPe9t4p4=;
  b=gmDjpK/IxofNn2H/0hT5LyPtlJk0ns21P5he9aQkq+Aw3iBw7qcRMAfH
   SERC277yNenwLRUMM/SfW4LAgT9Ba+eYayFfjWW5OAC9LcPJcSVuqvA+K
   mA/pA7xKvTFNzBSx43ZOFjhdfVQ2ZyrfotjriJichPjV7EQzWlQUhO0hn
   3vDq8Y0pTdxiEx2+ZfQBlAHe+2mwJBPVo1+S6TPizgmtDSJTbGgKbPf6x
   S2lusNtJOoXVXn6RhHlKeXlg0y0YATEMdByqRc85KvvqNTszK1VTdDGQu
   ia/Dt+nrbbAEx9vGzxUYoREZpZcnzqSt6VA4pj0OIGtNfJzfnV4r7azfH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758154"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540565"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540565"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4619312147F;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb1-008z6E-Lz; Wed, 24 May 2023 14:23:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 06/32] media: v4l: async: Clean up testing for duplicate async subdevs
Date:   Wed, 24 May 2023 14:23:23 +0300
Message-Id: <20230524112349.2141396-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
index c5781124337af..320fe5cbaaf41 100644
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
 			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
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

