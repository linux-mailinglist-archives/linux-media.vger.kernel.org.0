Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4102F739FE4
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjFVLnC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjFVLnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:43:00 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85C3171C
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434156; x=1718970156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+aaxTxvIi+zgVDClr8PNyAUkD1b7V8B5F+f8DmW1qzg=;
  b=MKtLKXgnRSiZGRBsJ5EuLp63GULUYjJnCLn631XtZiIkCaraZaenhia+
   eu1VOwoSSBGHzdDA4bK3Mb96LD/HgKA6nU3MAXKgL6OwdtsgKxn7PcpJ1
   G2eNTIlkDQa06CSWIrhC0yP5BjXavC3dx2RQxd+DLIp3BzAw0P+fCnD3p
   etrW0J8mbpb7skNmg7fQzycdTJKkd3P56P9Ic0plVG9GFtQqaNfu52feU
   MgB24MnJXjiv1BRIxGMfwkvMHAQMsKjAedlmfOR6zDeRFlu49YEEHRr4v
   IaW/1qSnd+SV5OMNcQKtMxenPRHbs/EvvjOnTrj0ItJSHmCDQ2qwCfRa/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800585"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800585"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013568"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013568"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0D1D7120DDC;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oT9-36;
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
Subject: [PATCH v4 16/38] media: v4l: async: Only pass match information for async subdev validation
Date:   Thu, 22 Jun 2023 14:40:06 +0300
Message-Id: <20230622114028.908825-17-sakari.ailus@linux.intel.com>
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

Pass only information required for sub-device matching to functions
checking whether the async sub-device already exists. Do the same for
debug message printing. This makes further changes to other aspects of
async sub-devices easier.

Accordingly, also perform further renames:

	asd_equal as v4l2_async_match_equal,
	v4l2_async_nf_has_async_subdev as v4l2_async_nf_has_async_match,
	__v4l2_async_nf_has_async_subdev as
		v4l2_async_nf_has_async_subdev_entry and
	v4l2_async_nf_asd_valid as v4l2_async_nf_match_valid.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/v4l2-core/v4l2-async.c | 109 ++++++++++++++-------------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 2c040bc50e6b5..465eb072e7c59 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -64,14 +64,15 @@ static void v4l2_async_nf_call_destroy(struct v4l2_async_notifier *n,
 }
 
 static bool match_i2c(struct v4l2_async_notifier *notifier,
-		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+		      struct v4l2_subdev *sd,
+		      struct v4l2_async_match_desc *match)
 {
 #if IS_ENABLED(CONFIG_I2C)
 	struct i2c_client *client = i2c_verify_client(sd->dev);
 
 	return client &&
-		asd->match.i2c.adapter_id == client->adapter->nr &&
-		asd->match.i2c.address == client->addr;
+		match->i2c.adapter_id == client->adapter->nr &&
+		match->i2c.address == client->addr;
 #else
 	return false;
 #endif
@@ -91,7 +92,7 @@ static struct device *notifier_dev(struct v4l2_async_notifier *notifier)
 static bool
 match_fwnode_one(struct v4l2_async_notifier *notifier,
 		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
-		 struct v4l2_async_subdev *asd)
+		 struct v4l2_async_match_desc *match)
 {
 	struct fwnode_handle *other_fwnode;
 	struct fwnode_handle *dev_fwnode;
@@ -101,14 +102,14 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 
 	dev_dbg(notifier_dev(notifier),
 		"v4l2-async: fwnode match: need %pfw, trying %pfw\n",
-		sd_fwnode, asd->match.fwnode);
+		sd_fwnode, match->fwnode);
 
 	/*
 	 * Both the subdev and the async subdev can provide either an endpoint
 	 * fwnode or a device fwnode. Start with the simple case of direct
 	 * fwnode matching.
 	 */
-	if (sd_fwnode == asd->match.fwnode) {
+	if (sd_fwnode == match->fwnode) {
 		dev_dbg(notifier_dev(notifier),
 			"v4l2-async: direct match found\n");
 		return true;
@@ -123,7 +124,7 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	 * match unconnected endpoints.
 	 */
 	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
-	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
+	asd_fwnode_is_ep = fwnode_graph_is_endpoint(match->fwnode);
 
 	if (sd_fwnode_is_ep == asd_fwnode_is_ep) {
 		dev_dbg(notifier_dev(notifier),
@@ -137,9 +138,9 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 	 */
 	if (sd_fwnode_is_ep) {
 		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
-		other_fwnode = asd->match.fwnode;
+		other_fwnode = match->fwnode;
 	} else {
-		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
+		dev_fwnode = fwnode_graph_get_port_parent(match->fwnode);
 		other_fwnode = sd_fwnode;
 	}
 
@@ -179,13 +180,14 @@ match_fwnode_one(struct v4l2_async_notifier *notifier,
 }
 
 static bool match_fwnode(struct v4l2_async_notifier *notifier,
-			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+			 struct v4l2_subdev *sd,
+			 struct v4l2_async_match_desc *match)
 {
 	dev_dbg(notifier_dev(notifier),
 		"v4l2-async: matching for notifier %pfw, sd fwnode %pfw\n",
 		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
 
-	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
+	if (match_fwnode_one(notifier, sd, sd->fwnode, match))
 		return true;
 
 	/* Also check the secondary fwnode. */
@@ -195,7 +197,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 	dev_dbg(notifier_dev(notifier),
 		"v4l2-async: trying secondary fwnode match\n");
 
-	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
+	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, match);
 }
 
 static LIST_HEAD(subdev_list);
@@ -207,7 +209,8 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		      struct v4l2_subdev *sd)
 {
 	bool (*match)(struct v4l2_async_notifier *notifier,
-		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
+		      struct v4l2_subdev *sd,
+		      struct v4l2_async_match_desc *match);
 	struct v4l2_async_subdev *asd;
 
 	list_for_each_entry(asd, &notifier->waiting, list) {
@@ -226,28 +229,26 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		}
 
 		/* match cannot be NULL here */
-		if (match(notifier, sd, asd))
+		if (match(notifier, sd, &asd->match))
 			return asd;
 	}
 
 	return NULL;
 }
 
-/* Compare two async sub-device descriptors for equivalence */
-static bool asd_equal(struct v4l2_async_subdev *asd_x,
-		      struct v4l2_async_subdev *asd_y)
+/* Compare two async match descriptors for equivalence */
+static bool v4l2_async_match_equal(struct v4l2_async_match_desc *match1,
+				   struct v4l2_async_match_desc *match2)
 {
-	if (asd_x->match.type != asd_y->match.type)
+	if (match1->type != match2->type)
 		return false;
 
-	switch (asd_x->match.type) {
+	switch (match1->type) {
 	case V4L2_ASYNC_MATCH_TYPE_I2C:
-		return asd_x->match.i2c.adapter_id ==
-			asd_y->match.i2c.adapter_id &&
-			asd_x->match.i2c.address ==
-			asd_y->match.i2c.address;
+		return match1->i2c.adapter_id == match2->i2c.adapter_id &&
+			match1->i2c.address == match2->i2c.address;
 	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
-		return asd_x->match.fwnode == asd_y->match.fwnode;
+		return match1->fwnode == match2->fwnode;
 	default:
 		break;
 	}
@@ -497,21 +498,21 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
 
 /* See if an async sub-device can be found in a notifier's lists. */
 static bool
-__v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
-				 struct v4l2_async_subdev *asd)
+v4l2_async_nf_has_async_match_entry(struct v4l2_async_notifier *notifier,
+				    struct v4l2_async_match_desc *match)
 {
-	struct v4l2_async_subdev *asd_y;
+	struct v4l2_async_subdev *asd;
 	struct v4l2_subdev *sd;
 
-	list_for_each_entry(asd_y, &notifier->waiting, list)
-		if (asd_equal(asd, asd_y))
+	list_for_each_entry(asd, &notifier->waiting, list)
+		if (v4l2_async_match_equal(&asd->match, match))
 			return true;
 
 	list_for_each_entry(sd, &notifier->done, async_list) {
 		if (WARN_ON(!sd->asd))
 			continue;
 
-		if (asd_equal(asd, sd->asd))
+		if (v4l2_async_match_equal(&sd->asd->match, match))
 			return true;
 	}
 
@@ -525,46 +526,48 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
  * the notifier.
  */
 static bool
-v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
-			       struct v4l2_async_subdev *asd, bool skip_self)
+v4l2_async_nf_has_async_match(struct v4l2_async_notifier *notifier,
+			      struct v4l2_async_match_desc *match,
+			      bool skip_self)
 {
-	struct v4l2_async_subdev *asd_y;
+	struct v4l2_async_subdev *asd;
 
 	lockdep_assert_held(&list_lock);
 
 	/* Check that an asd is not being added more than once. */
-	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
-		if (skip_self && asd == asd_y)
+	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
+		if (skip_self && &asd->match == match)
 			continue;
-		if (asd_equal(asd, asd_y))
+		if (v4l2_async_match_equal(&asd->match, match))
 			return true;
 	}
 
 	/* Check that an asd does not exist in other notifiers. */
 	list_for_each_entry(notifier, &notifier_list, list)
-		if (__v4l2_async_nf_has_async_subdev(notifier, asd))
+		if (v4l2_async_nf_has_async_match_entry(notifier, match))
 			return true;
 
 	return false;
 }
 
-static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
-				   struct v4l2_async_subdev *asd,
-				   bool skip_self)
+static int v4l2_async_nf_match_valid(struct v4l2_async_notifier *notifier,
+				     struct v4l2_async_match_desc *match,
+				     bool skip_self)
 {
 	struct device *dev = notifier_dev(notifier);
 
-	switch (asd->match.type) {
+	switch (match->type) {
 	case V4L2_ASYNC_MATCH_TYPE_I2C:
 	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
-		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
-			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
+		if (v4l2_async_nf_has_async_match(notifier, match,
+						  skip_self)) {
+			dev_dbg(dev, "v4l2-async: match descriptor already listed in a notifier\n");
 			return -EEXIST;
 		}
 		break;
 	default:
 		dev_err(dev, "v4l2-async: Invalid match type %u on %p\n",
-			asd->match.type, asd);
+			match->type, match);
 		return -EINVAL;
 	}
 
@@ -588,7 +591,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
-		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
+		ret = v4l2_async_nf_match_valid(notifier, &asd->match, true);
 		if (ret)
 			goto err_unlock;
 
@@ -722,7 +725,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
+	ret = v4l2_async_nf_match_valid(notifier, &asd->match, false);
 	if (ret)
 		goto unlock;
 
@@ -902,16 +905,16 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL(v4l2_async_unregister_subdev);
 
-static void print_waiting_subdev(struct seq_file *s,
-				 struct v4l2_async_subdev *asd)
+static void print_waiting_match(struct seq_file *s,
+				struct v4l2_async_match_desc *match)
 {
-	switch (asd->match.type) {
+	switch (match->type) {
 	case V4L2_ASYNC_MATCH_TYPE_I2C:
-		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
-			   asd->match.i2c.address);
+		seq_printf(s, " [i2c] dev=%d-%04x\n", match->i2c.adapter_id,
+			   match->i2c.address);
 		break;
 	case V4L2_ASYNC_MATCH_TYPE_FWNODE: {
-		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
+		struct fwnode_handle *devnode, *fwnode = match->fwnode;
 
 		devnode = fwnode_graph_is_endpoint(fwnode) ?
 			  fwnode_graph_get_port_parent(fwnode) :
@@ -948,7 +951,7 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 	list_for_each_entry(notif, &notifier_list, list) {
 		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
 		list_for_each_entry(asd, &notif->waiting, list)
-			print_waiting_subdev(s, asd);
+			print_waiting_match(s, &asd->match);
 	}
 
 	mutex_unlock(&list_lock);
-- 
2.39.2

