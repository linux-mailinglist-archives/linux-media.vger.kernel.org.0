Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4BD7049CC
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjEPJ4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbjEPJ4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:14 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445B911C
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230970; x=1715766970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5vVK62ZYH4LcOyIG7WU3jGRX0NRRrFBrRK19ISdB7U=;
  b=Bqh/vsrvvcW1HhQX2FtCheYuh6+8RV2vVKdAqFi+q/5M72gG6c8QMVWX
   4f6gfIVTFfOfNdgJ0Wzxih6ZG1yUeOLCVvLPpO9dXnv2Vt92fbnfVXqX9
   cxsoF8Q6GYtm80QHcRt7Z0ldQUkB8bjNru7a2Y7ZrbdpPdZhJBSiGi2Ww
   YuAeyunUNzSC/jA4O38ExFUVXETRRDaoB4zk2QFi9+9QjpoCTb7BwzAjV
   TvdI+fEH0BJcpiiDZPk6VcGZuWoB6huWaUAeMpKhv1R/AR8FAeKS7Gp6P
   3XetdxQ1cn/MFbNyNe9VBjYD5Y098q0WC3IJ6muh3jbVm1i+oAo//cx8H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601419"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601419"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931807"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931807"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:43 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 13270122E78;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZA2-2M; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 09/31] media: v4l: async: Rename V4L2_ASYNC_MATCH_ macros, add TYPE_
Date:   Tue, 16 May 2023 12:54:55 +0300
Message-Id: <20230516095517.611711-10-sakari.ailus@linux.intel.com>
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

The async match type is a struct field now, rename V4L2_ASYNC_MATCH_*
macros as V4L2_ASYNC_MATCH_TYPE_* instead.

This patch has been produced by:

git grep -l V4L2_ASYNC_MATCH_ -- drivers/media/ drivers/staging/media/ \
	include/ Documentation/|xargs perl -i -pe \
	's/V4L2_ASYNC_MATCH_\K/TYPE_/g'

so it must be correct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 22 +++++++++++-----------
 include/media/v4l2-async.h           | 16 ++++++++--------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 3993a48548d6e..f6328d9a65a08 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -213,10 +213,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 	list_for_each_entry(asd, &notifier->waiting, list) {
 		/* bus_type has been verified valid before */
 		switch (asd->match.type) {
-		case V4L2_ASYNC_MATCH_I2C:
+		case V4L2_ASYNC_MATCH_TYPE_I2C:
 			match = match_i2c;
 			break;
-		case V4L2_ASYNC_MATCH_FWNODE:
+		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 			match = match_fwnode;
 			break;
 		default:
@@ -241,12 +241,12 @@ static bool asd_equal(struct v4l2_async_subdev *asd_x,
 		return false;
 
 	switch (asd_x->match.type) {
-	case V4L2_ASYNC_MATCH_I2C:
+	case V4L2_ASYNC_MATCH_TYPE_I2C:
 		return asd_x->match.i2c.adapter_id ==
 			asd_y->match.i2c.adapter_id &&
 			asd_x->match.i2c.address ==
 			asd_y->match.i2c.address;
-	case V4L2_ASYNC_MATCH_FWNODE:
+	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 		return asd_x->match.fwnode == asd_y->match.fwnode;
 	default:
 		break;
@@ -553,8 +553,8 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	struct device *dev = notifier_dev(notifier);
 
 	switch (asd->match.type) {
-	case V4L2_ASYNC_MATCH_I2C:
-	case V4L2_ASYNC_MATCH_FWNODE:
+	case V4L2_ASYNC_MATCH_TYPE_I2C:
+	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
 			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in this or other notifiers\n");
 			return -EEXIST;
@@ -689,7 +689,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 
 	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
 		switch (asd->match.type) {
-		case V4L2_ASYNC_MATCH_FWNODE:
+		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 			fwnode_handle_put(asd->match.fwnode);
 			break;
 		default:
@@ -743,7 +743,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
+	asd->match.type = V4L2_ASYNC_MATCH_TYPE_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
 	ret = __v4l2_async_nf_add_subdev(notifier, asd);
@@ -790,7 +790,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match.type = V4L2_ASYNC_MATCH_I2C;
+	asd->match.type = V4L2_ASYNC_MATCH_TYPE_I2C;
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
@@ -902,11 +902,11 @@ static void print_waiting_subdev(struct seq_file *s,
 				 struct v4l2_async_subdev *asd)
 {
 	switch (asd->match.type) {
-	case V4L2_ASYNC_MATCH_I2C:
+	case V4L2_ASYNC_MATCH_TYPE_I2C:
 		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
 			   asd->match.i2c.address);
 		break;
-	case V4L2_ASYNC_MATCH_FWNODE: {
+	case V4L2_ASYNC_MATCH_TYPE_FWNODE: {
 		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
 
 		devnode = fwnode_graph_is_endpoint(fwnode) ?
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index d347ef32f4ecb..8d1506a9755c3 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -22,15 +22,15 @@ struct v4l2_async_notifier;
  * enum v4l2_async_match_type - type of asynchronous subdevice logic to be used
  *	in order to identify a match
  *
- * @V4L2_ASYNC_MATCH_I2C: Match will check for I2C adapter ID and address
- * @V4L2_ASYNC_MATCH_FWNODE: Match will use firmware node
+ * @V4L2_ASYNC_MATCH_TYPE_I2C: Match will check for I2C adapter ID and address
+ * @V4L2_ASYNC_MATCH_TYPE_FWNODE: Match will use firmware node
  *
  * This enum is used by the asynchronous sub-device logic to define the
  * algorithm that will be used to match an asynchronous device.
  */
 enum v4l2_async_match_type {
-	V4L2_ASYNC_MATCH_I2C,
-	V4L2_ASYNC_MATCH_FWNODE,
+	V4L2_ASYNC_MATCH_TYPE_I2C,
+	V4L2_ASYNC_MATCH_TYPE_FWNODE,
 };
 
 /**
@@ -38,17 +38,17 @@ enum v4l2_async_match_type {
  *
  * @type:	type of match that will be used
  * @fwnode:	pointer to &struct fwnode_handle to be matched.
- *		Used if @match_type is %V4L2_ASYNC_MATCH_FWNODE.
+ *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_FWNODE.
  * @i2c:	embedded struct with I2C parameters to be matched.
  *		Both @match.i2c.adapter_id and @match.i2c.address
  *		should be matched.
- *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
+ *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
  * @i2c.adapter_id:
  *		I2C adapter ID to be matched.
- *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
+ *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
  * @i2c.address:
  *		I2C address to be matched.
- *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
+ *		Used if @match_type is %V4L2_ASYNC_MATCH_TYPE_I2C.
  */
 struct v4l2_async_match_desc {
 	enum v4l2_async_match_type type;
-- 
2.30.2

