Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18BC276460F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbjG0Fri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjG0FrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:47:14 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B633330F0
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436796; x=1721972796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H5T8pmfnnyA9pHPW2xjhc32SFf/63Tl5QWx7NbNYzcY=;
  b=Qiu/f/qmUMCaIYFCNiRkUxAOhXkFQzlsCQGW4DbXvvsT4lCeRy1ArsMs
   fXP783WGnwklvB3XH1vXIXLHxaoDXo8rzyxeSCajtNzNj79jhlBnnPtrX
   U/xRVMg0DdV4r/vE/nUiOR2UiG3NFnBdqv+qr3cSiyJ/CdgjqAqiS1VxW
   IpiYcELi16pWoGnzij2Xr4qcmC7AhuRmJnxf7R6XJP+XFp3UkEt1J6s33
   DvCniydWUvfzUj18YUontNJI6eKw07q1eukwY5XNT7ngDRK5VhUjxPQQ1
   JkKn0+PISfSBeJlZKLEMO+aS5Ww2RMu/ct6seWVAlt4x/rcJ/zyCPafDl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399150641"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399150641"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840584088"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840584088"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:39 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BB419120B8A;
        Thu, 27 Jul 2023 08:44:18 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmD-004xrM-3A;
        Thu, 27 Jul 2023 08:43:05 +0300
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
Subject: [PATCH v6 15/38] media: v4l: async: Rename V4L2_ASYNC_MATCH_ macros, add TYPE_
Date:   Thu, 27 Jul 2023 08:42:32 +0300
Message-Id: <20230727054255.1183255-16-sakari.ailus@linux.intel.com>
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

The async match type is a struct field now, rename V4L2_ASYNC_MATCH_*
macros as V4L2_ASYNC_MATCH_TYPE_* instead.

This patch has been produced by:

git grep -l V4L2_ASYNC_MATCH_ -- drivers/media/ drivers/staging/media/ \
	include/ Documentation/|xargs perl -i -pe \
	's/V4L2_ASYNC_MATCH_\K/TYPE_/g'

so it must be correct.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/v4l2-core/v4l2-async.c | 22 +++++++++++-----------
 include/media/v4l2-async.h           | 16 ++++++++--------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 5aa8ab83eb8d..2c040bc50e6b 100644
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
@@ -555,8 +555,8 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
 	struct device *dev = notifier_dev(notifier);
 
 	switch (asd->match.type) {
-	case V4L2_ASYNC_MATCH_I2C:
-	case V4L2_ASYNC_MATCH_FWNODE:
+	case V4L2_ASYNC_MATCH_TYPE_I2C:
+	case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
 			dev_dbg(dev, "v4l2-async: subdev descriptor already listed in a notifier\n");
 			return -EEXIST;
@@ -691,7 +691,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 
 	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
 		switch (asd->match.type) {
-		case V4L2_ASYNC_MATCH_FWNODE:
+		case V4L2_ASYNC_MATCH_TYPE_FWNODE:
 			fwnode_handle_put(asd->match.fwnode);
 			break;
 		default:
@@ -745,7 +745,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
+	asd->match.type = V4L2_ASYNC_MATCH_TYPE_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
 	ret = __v4l2_async_nf_add_subdev(notifier, asd);
@@ -792,7 +792,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 	if (!asd)
 		return ERR_PTR(-ENOMEM);
 
-	asd->match.type = V4L2_ASYNC_MATCH_I2C;
+	asd->match.type = V4L2_ASYNC_MATCH_TYPE_I2C;
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
@@ -906,11 +906,11 @@ static void print_waiting_subdev(struct seq_file *s,
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
index d347ef32f4ec..8d1506a9755c 100644
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
2.39.2

