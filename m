Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D6C6AF793
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 22:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjCGV2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 16:28:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbjCGV2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 16:28:31 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5AD30DD
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 13:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224509; x=1709760509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6dR1jlCQWzIoZPfG4WK7YYSEF4pY5nuehNJ6x3JAlZI=;
  b=I2So2Ma6v1NrgNDoiou9DZ7oEu8uQ72rWmV2mhVnQKYAjqthZICWhqzO
   jNAWAEpbEVOi0BOCQj9sk/oZP8O4qM9RwGRu23uBLOLS2iHKgRAj2Mn5W
   7zoduYoMkVOCsIP+vuuPMSZ2mvCvmUNFTmbQSPcRVJa6fC1nqSfOl5Mc0
   /FzWakBfHyNQu0E7SIpk8GtGFd1VCTucRzKsyb35ZKHQtS2aULEkwX5bo
   tBnGHwMtThf7mqKJtx1BRpjh+e+Ycw1BZF0aubTk+DI1HhYLDpJlaecMn
   dxlfsDqLA7EqZUhC88tGo/id5qeSg9vBoAirHY03HqsmJH9pYNjwO6OzS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398557145"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="398557145"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676710142"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="676710142"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:28:15 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 022C6122D95;
        Tue,  7 Mar 2023 23:20:42 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: [RFC 04/10] media: v4l: async: Make V4L2 async match information a struct
Date:   Tue,  7 Mar 2023 23:20:32 +0200
Message-Id: <20230307212038.968381-5-sakari.ailus@linux.intel.com>
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

Make V4L2 async match information a struct, making it easier to use it
elsewhere outside the scope of struct v4l2_async_subdev.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 18 ++++++-------
 drivers/media/v4l2-core/v4l2-fwnode.c |  2 +-
 include/media/v4l2-async.h            | 39 ++++++++++++++++-----------
 3 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 13fe0bdc70b6..bb78e3618ab5 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -147,7 +147,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 
 	list_for_each_entry(asd, &notifier->waiting, list) {
 		/* bus_type has been verified valid before */
-		switch (asd->match_type) {
+		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_I2C:
 			match = match_i2c;
 			break;
@@ -172,10 +172,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 static bool asd_equal(struct v4l2_async_subdev *asd_x,
 		      struct v4l2_async_subdev *asd_y)
 {
-	if (asd_x->match_type != asd_y->match_type)
+	if (asd_x->match.type != asd_y->match.type)
 		return false;
 
-	switch (asd_x->match_type) {
+	switch (asd_x->match.type) {
 	case V4L2_ASYNC_MATCH_I2C:
 		return asd_x->match.i2c.adapter_id ==
 			asd_y->match.i2c.adapter_id &&
@@ -494,7 +494,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	if (!asd)
 		return -EINVAL;
 
-	switch (asd->match_type) {
+	switch (asd->match.type) {
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
 		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
@@ -504,7 +504,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 		break;
 	default:
 		dev_err(dev, "Invalid match type %u on %p\n",
-			asd->match_type, asd);
+			asd->match.type, asd);
 		return -EINVAL;
 	}
 
@@ -630,7 +630,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 		return;
 
 	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
-		switch (asd->match_type) {
+		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_FWNODE:
 			fwnode_handle_put(asd->match.fwnode);
 			break;
@@ -685,7 +685,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
+	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
 	ret = __v4l2_async_nf_add_subdev(notifier, asd);
@@ -732,7 +732,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match_type = V4L2_ASYNC_MATCH_I2C;
+	asd->match.type = V4L2_ASYNC_MATCH_I2C;
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
@@ -850,7 +850,7 @@ EXPORT_SYMBOL(v4l2_async_unregister_subdev);
 static void print_waiting_subdev(struct seq_file *s,
 				 struct v4l2_async_subdev *asd)
 {
-	switch (asd->match_type) {
+	switch (asd->match.type) {
 	case V4L2_ASYNC_MATCH_I2C:
 		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
 			   asd->match.i2c.address);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 3d9533c1b202..e6bd63364bed 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -811,7 +811,7 @@ v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
 	if (!asd)
 		return -ENOMEM;
 
-	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
+	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode =
 		fwnode_graph_get_remote_port_parent(endpoint);
 	if (!asd->match.fwnode) {
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 25eb1d138c06..0c4cffd081c9 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -34,23 +34,38 @@ enum v4l2_async_match_type {
 };
 
 /**
- * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
+ * struct v4l2_async_match - async sub-device match information
  *
- * @match_type:	type of match that will be used
- * @match:	union of per-bus type matching data sets
- * @match.fwnode:
+ * @type:	type of match that will be used
+ * @fwnode:
  *		pointer to &struct fwnode_handle to be matched.
  *		Used if @match_type is %V4L2_ASYNC_MATCH_FWNODE.
- * @match.i2c:	embedded struct with I2C parameters to be matched.
+ * @i2c:	embedded struct with I2C parameters to be matched.
  *		Both @match.i2c.adapter_id and @match.i2c.address
  *		should be matched.
  *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
- * @match.i2c.adapter_id:
+ * @i2c.adapter_id:
  *		I2C adapter ID to be matched.
  *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
- * @match.i2c.address:
+ * @i2c.address:
  *		I2C address to be matched.
  *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
+ */
+struct v4l2_async_match {
+	enum v4l2_async_match_type type;
+	union {
+		struct fwnode_handle *fwnode;
+		struct {
+			int adapter_id;
+			unsigned short address;
+		} i2c;
+	};
+};
+
+/**
+ * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
+ *
+ * @match:	struct of match type and per-bus type matching data sets
  * @asd_list:	used to add struct v4l2_async_subdev objects to the
  *		master notifier @asd_list
  * @list:	used to link struct v4l2_async_subdev objects, waiting to be
@@ -61,15 +76,7 @@ enum v4l2_async_match_type {
  * v4l2_async_subdev as its first member.
  */
 struct v4l2_async_subdev {
-	enum v4l2_async_match_type match_type;
-	union {
-		struct fwnode_handle *fwnode;
-		struct {
-			int adapter_id;
-			unsigned short address;
-		} i2c;
-	} match;
-
+	struct v4l2_async_match match;
 	/* v4l2-async core private: not to be used by drivers */
 	struct list_head list;
 	struct list_head asd_list;
-- 
2.30.2

