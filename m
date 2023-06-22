Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E8F739FE5
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjFVLnF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjFVLnD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:43:03 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064E71BF4
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434166; x=1718970166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ygZtCOr9qpEtFU8M49FXLGDF9D/6wESRYR7Ie7M8YYA=;
  b=Le745jvUuHzG21GglJpHkIKmiHW5a0DwUC3ltyFy4OeSssDrx0+OATIe
   w0DrZx/U9B5zd0MaR76sYdFZTreASoe+YuZLbq2NC52EhWuWl8ajYlQx7
   6YqR6ku0T21tncjjiMDEAGGAMLh9egzdIIE08pouCdq5026CnU56kJEom
   8N7bBjEe7Y8Ur4HabYAFVImqxN0CWAvkixT5uD8mzhIhl5mQR8dqS/JU/
   P59OWjnTIr6jWbKrzd298ZP4mxHmPP7iSSOgqWV41UOK5KaedZN8CZved
   IapignFBPqYAJ71gZADR3dpglxz46qPRiZRGcudWZnLZD6JlrvVkWgd0F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800531"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800531"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013562"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013562"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 26FF0120E95;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg3-003oTY-0E;
        Thu, 22 Jun 2023 14:40:39 +0300
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
Subject: [PATCH v4 21/38] media: v4l: async: Drop duplicate handling when adding connections
Date:   Thu, 22 Jun 2023 14:40:11 +0300
Message-Id: <20230622114028.908825-22-sakari.ailus@linux.intel.com>
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

The connections are checked for duplicates already when the notifier is
registered. This is effectively a sanity check for driver (and possibly
obscure firmware) bugs. Don't do this when adding the connection.

Retain the int return type for now. It'll be needed very soon again.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/v4l2-core/v4l2-async.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0a9c9fb2a42c3..0cd4e18e628c9 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -471,14 +471,11 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
 
 /*
  * Find out whether an async sub-device was set up already or whether it exists
- * in a given notifier. The skip_self argument is used to skip testing the same
- * sub-device in the notifier in case the sub-device has been already added to
- * the notifier.
+ * in a given notifier.
  */
 static bool
 v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
-			      struct v4l2_async_match_desc *match,
-			      bool skip_self)
+			      struct v4l2_async_match_desc *match)
 {
 	struct v4l2_async_connection *asc;
 
@@ -486,7 +483,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 
 	/* Check that an asd is not being added more than once. */
 	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
-		if (skip_self && &asc->match == match)
+		if (&asc->match == match)
 			continue;
 		if (v4l2_async_match_equal(&asc->match, match))
 			return true;
@@ -501,16 +498,14 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 }
 
 static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
-				     struct v4l2_async_match_desc *match,
-				     bool skip_self)
+				     struct v4l2_async_match_desc *match)
 {
 	struct device *dev = notifier_dev(notifier);
 
 	switch (match->type) {
 	case V4L2_ASYNC_MATCH_TYPE_I2C:
 	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
-		if (v4l2_async_nf_has_async_match(notifier, match,
-						  skip_self)) {
+		if (v4l2_async_nf_has_async_match(notifier, match)) {
 			dev_dbg(dev, "v4l2-async: match descriptor already listed in a notifier\n");
 			return -EEXIST;
 		}
@@ -541,7 +536,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
-		ret = v4l2_async_nf_match_valid(notifier, &asc->match, true);
+		ret = v4l2_async_nf_match_valid(notifier, &asc->match);
 		if (ret)
 			goto err_unlock;
 
@@ -670,19 +665,13 @@ EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
 static int __v4l2_async_nf_add_connection(struct v4l2_async_notifier *notifier,
 					  struct v4l2_async_connection *asc)
 {
-	int ret;
-
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_match_valid(notifier, &asc->match, false);
-	if (ret)
-		goto unlock;
-
 	list_add_tail(&asc->asc_entry, &notifier->asc_list);
 
-unlock:
 	mutex_unlock(&list_lock);
-	return ret;
+
+	return 0;
 }
 
 struct v4l2_async_connection *
-- 
2.39.2

