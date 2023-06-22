Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49650739FCD
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjFVLlV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbjFVLlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:16 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93E419A9
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434074; x=1718970074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZBbl5JTZB3VDY1E0qKzkOSgHPpNZsb1MU1O0enQSMQU=;
  b=AmDG/trSayoZVGkLDzdFO6kG7uK5ZuFsflgMn1ORF1xLO1fyI35wwTtH
   /qW+A9BcrxxtA2iNJLuIOA8RxE6c98mR65v8caMroPbpfQgtiE+sualBL
   OVSBJ3GSceheZGqWhCtulnpZ3B8+8hsgIdWNWiVJj0zu8pIaWg6a9cJz0
   y8TA5QPfECsHP8bfXETnel3KX3D52pPb2rC++/5DjSR0LTSdvVo/DYTRw
   Fc8HADmIjPk8siglrxg8Grgboag5rU1tNGBliUEcGMg8Lt0kK3pRDK41X
   jZmJakRwe0IYzy6KbEO9287FiwHzxzs9I5rmLIU7wsvpzh9BzezgexobM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357957659"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357957659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804749896"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="804749896"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:03 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id EED72120BB9;
        Thu, 22 Jun 2023 14:40:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oSp-2s;
        Thu, 22 Jun 2023 14:40:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v4 12/38] media: v4l: async: Clean up testing for duplicate async subdevs
Date:   Thu, 22 Jun 2023 14:40:02 +0300
Message-Id: <20230622114028.908825-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
66beb323e4a0 ("media: v4l2: async: Remove notifier subdevs array").)

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/v4l2-core/v4l2-async.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index c5781124337af..9b79bcc1af82d 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -519,23 +519,23 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 }
 
 /*
- * Find out whether an async sub-device was set up already or
- * whether it exists in a given notifier before @this_index.
- * If @this_index < 0, search the notifier's entire @asd_list.
+ * Find out whether an async sub-device was set up already or whether it exists
+ * in a given notifier. The skip_self argument is used to skip testing the same
+ * sub-device in the notifier in case the sub-device has been already added to
+ * the notifier.
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
-			break;
+		if (skip_self && asd == asd_y)
+			continue;
 		if (asd_equal(asd, asd_y))
 			return true;
 	}
@@ -550,7 +550,7 @@ v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
 
 static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd,
-				   int this_index)
+				   bool skip_self)
 {
 	struct device *dev = notifier_dev(notifier);
 
@@ -560,7 +560,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	switch (asd->match_type) {
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
-		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
+		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
 			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
 			return -EEXIST;
 		}
@@ -583,7 +583,7 @@ EXPORT_SYMBOL(v4l2_async_nf_init);
 static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 {
 	struct v4l2_async_subdev *asd;
-	int ret, i = 0;
+	int ret;
 
 	INIT_LIST_HEAD(&notifier->waiting);
 	INIT_LIST_HEAD(&notifier->done);
@@ -591,7 +591,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
-		ret = v4l2_async_nf_asd_valid(notifier, asd, i++);
+		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
 		if (ret)
 			goto err_unlock;
 
@@ -725,7 +725,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_asd_valid(notifier, asd, -1);
+	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
 	if (ret)
 		goto unlock;
 
-- 
2.39.2

