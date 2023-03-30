Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA8B6D041F
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjC3L7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjC3L7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:07 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C920A255
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177546; x=1711713546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6dR1jlCQWzIoZPfG4WK7YYSEF4pY5nuehNJ6x3JAlZI=;
  b=JOhNOPTv9uBl/jDv3PDFCh193eYuGskyrJZX06t7OcRB+vYGxTEhfz9z
   H+7I2hXEFrZxE97+uqMhqWicoakxq9GWmnD+LfXDxnngZITmQ57i3St0O
   +P/36WNjzwrSdt3uCYQ8QdO9VHvCi7KFfz+p3uLs39HBgEUZAN1RCxRyc
   hCVSGQCeiXVdIMIZRt6nObts7YW59NiZVWrz6vEYVWY88fakWogo/lUoe
   tx4C2wHPuTYB2rIva4B5W5usolVwj/3LtHZ1nSKjXeLYPDjCU4cnZ6Tdc
   ldk/XNleHABeI/9t7mqRP6bPbqSA1S73T3/rSfl2V9LdJ4tGNwR4LkRHt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111371"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111371"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952909"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952909"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:02 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 9FFD612259B;
        Thu, 30 Mar 2023 14:58:59 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 04/18] media: v4l: async: Make V4L2 async match information a struct
Date:   Thu, 30 Mar 2023 14:58:39 +0300
Message-Id: <20230330115853.1628216-5-sakari.ailus@linux.intel.com>
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

