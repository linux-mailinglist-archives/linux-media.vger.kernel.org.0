Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5B9710896
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240605AbjEYJRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240210AbjEYJRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:23 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2416B195
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006242; x=1716542242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CT3qkHQFn1isd83r1CHe3VmFBB4yoqvfy+LNLXqrF4Y=;
  b=dNF0YieLMw4dQfLUwqn9+UmfL+ZcZQgN/2N9hz6ksuCyOJCXQCDTMBLi
   /7ITAWOyAE/xknuEvAWYSNJMQb2E5MojMWYZxLuvXdOsQ7RCyVqRCDIrE
   U6ZE9ZM1IiMYW28sazTmdGmwkFJO3+lprHJZIbowdHbS8grttN98Z1qxW
   roxx9rrdN6rkELStO2xb1bk5DUXujQrG9xrJFTVklnHiOcVNSlbt9PHMb
   kT5j151xaIGqHO/0w/1VZ+kBvU+ugX6EfgDVaIotbSRY7zVeq65yBwu2J
   31pYy7IxUt6E3GPmZprjYkxyQhor6XaBxqeLKYXnVzklNJX7aqpX0LCuN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333455973"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333455973"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029148"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029148"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 71734122FF2;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kpM-AT; Thu, 25 May 2023 12:16:26 +0300
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
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [RESEND PATCH v3 16/32] media: v4l: async: Drop duplicate handling when adding connections
Date:   Thu, 25 May 2023 12:15:59 +0300
Message-Id: <20230525091615.2324824-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
---
 drivers/media/v4l2-core/v4l2-async.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index f51f0c37210c9..5dfc6d5f6a7c3 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -475,8 +475,7 @@ v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
  */
 static bool
 v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
-			      struct v4l2_async_match_desc *match,
-			      bool skip_self)
+			      struct v4l2_async_match_desc *match)
 {
 	struct v4l2_async_connection *asc;
 
@@ -484,7 +483,7 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
 
 	/* Check that an asd is not being added more than once. */
 	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
-		if (skip_self && &asc->match == match)
+		if (&asc->match == match)
 			break;
 		if (v4l2_async_match_equal(&asc->match, match))
 			return true;
@@ -499,16 +498,14 @@ v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
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
@@ -539,7 +536,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asc, &notifier->asc_list, asc_entry) {
-		ret = v4l2_async_nf_match_valid(notifier, &asc->match, true);
+		ret = v4l2_async_nf_match_valid(notifier, &asc->match);
 		if (ret)
 			goto err_unlock;
 
@@ -668,19 +665,13 @@ EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
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
2.30.2

