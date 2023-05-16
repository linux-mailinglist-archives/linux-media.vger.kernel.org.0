Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6407049C8
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbjEPJ4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjEPJ4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:10 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26919199C
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230968; x=1715766968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UgmeLdnsD1uLI1DTvZHr84j4cEYalZpF17iLrBc17y0=;
  b=LlCT+zZpeVtSD17Sq+3RZ7iw4d67vUYvqC8QFk0kialiTrEZUHi+GyFU
   ScE2l1KeZ5lqt1CsxnKBVEoupJLzbVGHpmGZWFCT6EDWWrT6ycPDD+Dnb
   +UeeiL2Kjb6rYiSlhq4NTgg8/2NPiCs5IZKTJ3mJh4tZfTDM2E44Ka8qM
   0/X4xN0ghBNONSiH3cTkSKZNc4iIqYqM9cG4wV5VnwZbjnFRGc6ctGNA8
   ixZtAt62BMP2w4BnaRH2WOa4dbEsde5Y3hptvTovJd0bXq7dZCAiuv8Fz
   z9XgxNKNu0FJ2fjWkabHJIhj2NW7K0/+g2sV+Au4mwqGEGnY8nz5qnZoJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601401"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601401"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931803"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931803"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 19041122EA9;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZA5-3D; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 10/31] media: v4l: async: Only pass match information for async subdev validation
Date:   Tue, 16 May 2023 12:54:56 +0300
Message-Id: <20230516095517.611711-11-sakari.ailus@linux.intel.com>
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
---
 drivers/media/v4l2-core/v4l2-async.c | 109 ++++++++++++++-------------
 1 file changed, 56 insertions(+), 53 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index f6328d9a65a08..87a34749a8cdc 100644
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
@@ -226,7 +229,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 		}
 
 		/* match cannot be NULL here */
-		if (match(notifier, sd, asd))
+		if (match(notifier, sd, &asd->match))
 			return asd;
 	}
 
@@ -234,20 +237,18 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 }
 
 /* Compare two async sub-device descriptors for equivalence */
-static bool asd_equal(struct v4l2_async_subdev *asd_x,
-		      struct v4l2_async_subdev *asd_y)
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
 
@@ -523,46 +524,48 @@ __v4l2_async_nf_has_async_subdev(struct v4l2_async_notifier *notifier,
  * whether it exists in a given notifier.
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
 			break;
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
-			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in this or other notifiers\n");
+		if (v4l2_async_nf_has_async_match(notifier, match,
+						  skip_self)) {
+			dev_dbg(dev, "v4l2-async: match descriptor already listed in this or other notifiers\n");
 			return -EEXIST;
 		}
 		break;
 	default:
-		dev_err(dev, "v4l2-asymc: Invalid match type %u on %p\n",
-			asd->match.type, asd);
+		dev_err(dev, "v4l2-async: Invalid match type %u on %p\n", match->type,
+			match);
 		return -EINVAL;
 	}
 
@@ -586,7 +589,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
 	mutex_lock(&list_lock);
 
 	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
-		ret = v4l2_async_nf_asd_valid(notifier, asd, true);
+		ret = v4l2_async_nf_match_valid(notifier, &asd->match, true);
 		if (ret)
 			goto err_unlock;
 
@@ -720,7 +723,7 @@ static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&list_lock);
 
-	ret = v4l2_async_nf_asd_valid(notifier, asd, false);
+	ret = v4l2_async_nf_match_valid(notifier, &asd->match, false);
 	if (ret)
 		goto unlock;
 
@@ -898,16 +901,16 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
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
@@ -944,7 +947,7 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 	list_for_each_entry(notif, &notifier_list, list) {
 		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
 		list_for_each_entry(asd, &notif->waiting, list)
-			print_waiting_subdev(s, asd);
+			print_waiting_match(s, &asd->match);
 	}
 
 	mutex_unlock(&list_lock);
-- 
2.30.2

