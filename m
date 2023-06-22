Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9B2739FCB
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjFVLlT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjFVLlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:15 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C781BFA
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434074; x=1718970074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R2FNkjx4T3KNkjouUEJN8Bwxx1yTC+kK1Zh4mi578QI=;
  b=fj/ScAGb4fIBispdfqMv+lEFqEBWZ/YKiBgxKl1NsMgQXBk///2fH58m
   tZmCC0Ugdg6nwAAgsoaMyotsRO0Bh/OXzzZ45/eCXSraywPFdHb/aV2Zt
   5OXrA38vAMzKAyatTmTTBB0MQsAYs9ka4suenkJfNC1HKOXSZLNmkCmNQ
   KqHLw51VVJynEoWtguSIGgwnRFHFFi+tQ9abVj9FFWfLEyE4xjXDSCWI8
   jkhgBNlVY5zU2MvtUECrkK66WfX0HttKulnMH0T/G2aGV6q8MerAV8Wv4
   0eemJ9UXWjPhTnqw50seIuPIB6V6TFoL9TtZebrH3J/FwDN7P6gYJ1nl+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357957685"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357957685"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804749898"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="804749898"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:03 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 0312D120BBB;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oSz-2y;
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
Subject: [PATCH v4 14/38] media: v4l: async: Make V4L2 async match information a struct
Date:   Thu, 22 Jun 2023 14:40:04 +0300
Message-Id: <20230622114028.908825-15-sakari.ailus@linux.intel.com>
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

Make V4L2 async match information a struct, making it easier to use it
elsewhere outside the scope of struct v4l2_async_subdev.

Also remove an obsolete comment --- none of these fields are supposed to
be touched by drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/v4l2-core/v4l2-async.c | 18 ++++++------
 include/media/v4l2-async.h           | 41 ++++++++++++++++------------
 2 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 925ab5571cd48..5aa8ab83eb8da 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -212,7 +212,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
 
 	list_for_each_entry(asd, &notifier->waiting, list) {
 		/* bus_type has been verified valid before */
-		switch (asd->match_type) {
+		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_I2C:
 			match = match_i2c;
 			break;
@@ -237,10 +237,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
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
@@ -554,7 +554,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 {
 	struct device *dev = notifier_dev(notifier);
 
-	switch (asd->match_type) {
+	switch (asd->match.type) {
 	case V4L2_ASYNC_MATCH_I2C:
 	case V4L2_ASYNC_MATCH_FWNODE:
 		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
@@ -564,7 +564,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 		break;
 	default:
 		dev_err(dev, "v4l2-async: Invalid match type %u on %p\n",
-			asd->match_type, asd);
+			asd->match.type, asd);
 		return -EINVAL;
 	}
 
@@ -690,7 +690,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 		return;
 
 	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
-		switch (asd->match_type) {
+		switch (asd->match.type) {
 		case V4L2_ASYNC_MATCH_FWNODE:
 			fwnode_handle_put(asd->match.fwnode);
 			break;
@@ -745,7 +745,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
+	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
 	ret = __v4l2_async_nf_add_subdev(notifier, asd);
@@ -792,7 +792,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match_type = V4L2_ASYNC_MATCH_I2C;
+	asd->match.type = V4L2_ASYNC_MATCH_I2C;
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
@@ -905,7 +905,7 @@ EXPORT_SYMBOL(v4l2_async_unregister_subdev);
 static void print_waiting_subdev(struct seq_file *s,
 				 struct v4l2_async_subdev *asd)
 {
-	switch (asd->match_type) {
+	switch (asd->match.type) {
 	case V4L2_ASYNC_MATCH_I2C:
 		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
 			   asd->match.i2c.address);
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 2c9baa3c9266a..d347ef32f4ecb 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -34,23 +34,37 @@ enum v4l2_async_match_type {
 };
 
 /**
- * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
+ * struct v4l2_async_match_desc - async sub-device match information
  *
- * @match_type:	type of match that will be used
- * @match:	union of per-bus type matching data sets
- * @match.fwnode:
- *		pointer to &struct fwnode_handle to be matched.
+ * @type:	type of match that will be used
+ * @fwnode:	pointer to &struct fwnode_handle to be matched.
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
+struct v4l2_async_match_desc {
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
@@ -61,16 +75,7 @@ enum v4l2_async_match_type {
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
-	/* v4l2-async core private: not to be used by drivers */
+	struct v4l2_async_match_desc match;
 	struct list_head list;
 	struct list_head asd_list;
 };
-- 
2.39.2

