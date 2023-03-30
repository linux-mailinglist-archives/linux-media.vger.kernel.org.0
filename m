Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081026D0420
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjC3L7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjC3L7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:09 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB8AA27B
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177548; x=1711713548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a24ppUDSDyUEEOHy5wKWJ10R0Z3aTEG4gLka5RKxA1I=;
  b=F0fvwa14yx0eRlvpO9ebL9dV5ASqKHm9BeygtnZz1eSShf7UwDh81kvK
   gd6LSgmXMEYLLcs2SYtxYxz1UnEl2Yc0V/3vdtodjdBfUvzkyhCP9ULFJ
   Gk3IDJwUSW8M69kz2l3oqkSz+7udEpsJMhd7cDRHnR5NPTQSneSeFVzYH
   eZoF9S6LopuktVD2GWb/PYZ7eE8BcWBCanc9sKiS7pV+Ia4WplgeiOZ9e
   ap97JNx0bkUfoFdB5xK5UNrfdWBbnP+kvt0WoykqtYNNta+U/b1JAkadO
   LrHkhwAcQbdW9E2u80+Ov2hotcLB/79GqoOcHEOhxi/NfSUj8sL7XPlmr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111382"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111382"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952913"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952913"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D2B42122457;
        Thu, 30 Mar 2023 14:59:00 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 05/18] media: v4l: async: Clean testing for duplicated async subdevs
Date:   Thu, 30 Mar 2023 14:58:40 +0300
Message-Id: <20230330115853.1628216-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
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
an array that is long gone.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index bb78e3618ab5..fc9ae22e2b47 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -456,21 +456,19 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
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
+		if (asd == asd_y)
 			break;
 		if (asd_equal(asd, asd_y))
 			return true;
@@ -486,7 +484,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
 static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd,
-				   int this_index)
+				   bool skip_self)
 {
 	struct device *dev =
 		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
@@ -497,7 +495,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	switch (asd->match.type) {
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
-		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
+		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
 			dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
 			return -EEXIST;
 		}
@@ -520,7 +518,7 @@ EXPORT_SYMBOL(v4l2_async_nf_init);
 static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_subdev *asd;
-	int ret, i = 0;
+	int ret;
 
 	INIT_LIST_HEAD(&notifier->waiting);
 	INIT_LIST_HEAD(&notifier->done);
@@ -528,7 +526,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
-		ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
+		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
 		if (ret)
 			goto err_unlock;
 
@@ -661,7 +659,7 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_asd_valid(notifier, asd, -1);
+	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
 	if (ret)
 		goto unlock;
 
-- 
2.30.2

