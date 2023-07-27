Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB56E764612
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjG0Fru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbjG0Fr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:47:28 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41572FC
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436803; x=1721972803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eTV+2YEOnm9cdTQHWiyxLJHrVzqYUKnlFEo0De6KsFc=;
  b=Mg33TYzFeQ6ER1KpyqUjB5U+EITOtkJ57S4hqp51z69bg0yF3B7BHV3k
   ZeotoCNgDQvLOPS7xla1x/iXbI3KBr5SXBjyK5L0vuOGPC+4aPXCPKVPk
   rf9CnBNMa5s9lieW0ik6ebMfz+1pP8nnCz1mzG8x4iSTWbBuOojeR1B3D
   BAbFTzkjJJNsP0cSXBAygnThotOAiT8YscHVhna80TzgajyaZXiKrPvdb
   jYJdBC2Pev1pkkgFNBI1CKbhCRqBPtUhZG46gJ5vq2aWCK00SXUcrRSpc
   uRmII5jXL3jg7tWXeUZIUrFzWK2K8aEDVP6jyaM2L1ljdKJRM8xm7doqH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399150721"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399150721"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840584096"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840584096"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:39 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DA72E120C46;
        Thu, 27 Jul 2023 08:44:18 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmE-004xrq-0M;
        Thu, 27 Jul 2023 08:43:06 +0300
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
Subject: [PATCH v6 21/38] media: v4l: async: Drop duplicate handling when adding connections
Date:   Thu, 27 Jul 2023 08:42:38 +0300
Message-Id: <20230727054255.1183255-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
References: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/v4l2-core/v4l2-async.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 0a9c9fb2a42c..0cd4e18e628c 100644
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

