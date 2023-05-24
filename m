Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11F5F70F51C
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbjEXLY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235028AbjEXLYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:24:54 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A3D1B9
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927486; x=1716463486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gb9LEL4Sh5ykJGh0WcOzzxcS0x/0Ihciqe8iiAa3vzc=;
  b=VrN/keg+aTqSSuFnCNoEobq4OM2JBh33DzzwLpmwCHhRdlJPWiT4MqmW
   5hsggqeyM7ByFQXrOXdIwrVaBFkIt7Pb5tWCdMPZF1LtjPbqg8pofMN63
   SPyvr8xkWE0ItWXz20XO/CWtw/nahrFZBdxK1H8WIcn60RSk5nemzcSz9
   UWfvSLtkQEN2AZmYNiaTlpQXtWUJD/XxHvS0at7gsoSGtyncqTaJ+QK10
   fdnVDvzCDULz9IAtRAJBCAZ9mMZOsltIVzd4mcfTGREnkPc5ejM3RA7cP
   YgTx6bPa0H6IoKAA4IDQtLEHdhlTffazFweDp3/7e25aVQSUudcCQOWCO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758314"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758314"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540610"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540610"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id AAFC2122FF4;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb2-008z7C-30; Wed, 24 May 2023 14:24:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 21/32] media: v4l: async: Support fwnode endpoint list matching for subdevs
Date:   Wed, 24 May 2023 14:23:38 +0300
Message-Id: <20230524112349.2141396-22-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
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

Support matching V4L2 async sub-devices based on particular fwnode
endpoint. This makes it possible to instantiate multiple V4L2 sub-devices
based on given fwnode endpoints from a single device, based on driver
needs.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 41 +++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c | 13 +++++++++
 include/media/v4l2-async.h            | 29 +++++++++++++++++++
 include/media/v4l2-subdev.h           |  8 ++++--
 4 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 740f2a0de78ff..12b465a16ec1c 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -134,6 +134,30 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
 		"v4l2-async: matching for notifier %pfw, sd fwnode %pfw\n",
 		dev_fwnode(notifier_dev(notifier)), sd->fwnode);
 
+	if (!list_empty(&sd->async_subdev_endpoint_list)) {
+		struct v4l2_async_subdev_endpoint *ase;
+
+		dev_dbg(sd->dev,
+			"v4l2-async: endpoint fwnode list available, looking for %pfw\n",
+			match->fwnode);
+
+		list_for_each_entry(ase, &sd->async_subdev_endpoint_list,
+				    async_subdev_endpoint_entry) {
+			bool matched = ase->endpoint == match->fwnode;
+
+			dev_dbg(sd->dev,
+				"v4l2-async: endpoint-endpoint match %sfound with %pfw\n",
+				matched ? "" : "not ", ase->endpoint);
+
+			if (matched)
+				return true;
+		}
+
+		dev_dbg(sd->dev, "async: no endpoint matched\n");
+
+		return false;
+	}
+
 	if (match_fwnode_one(notifier, sd, sd->fwnode, match))
 		return true;
 
@@ -745,6 +769,23 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
 
+int v4l2_async_subdev_endpoint_add(struct v4l2_subdev *sd,
+				   struct fwnode_handle *fwnode)
+{
+	struct v4l2_async_subdev_endpoint *ase;
+
+	ase = kmalloc(sizeof(*ase), GFP_KERNEL);
+	if (!ase)
+		return -ENOMEM;
+
+	ase->endpoint = fwnode;
+	list_add(&ase->async_subdev_endpoint_entry,
+		 &sd->async_subdev_endpoint_list);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_async_subdev_endpoint_add);
+
 struct v4l2_async_connection *
 v4l2_async_connection_unique(struct v4l2_subdev *sd)
 {
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2ec179cd12643..217b8019fb9b6 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1467,8 +1467,20 @@ EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
 
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 {
+	struct v4l2_async_subdev_endpoint *ase, *ase_tmp;
+
 	__v4l2_subdev_state_free(sd->active_state);
 	sd->active_state = NULL;
+
+	if (list_empty(&sd->async_subdev_endpoint_list))
+		return;
+
+	list_for_each_entry_safe(ase, ase_tmp, &sd->async_subdev_endpoint_list,
+				 async_subdev_endpoint_entry) {
+		list_del(&ase->async_subdev_endpoint_entry);
+
+		kfree(ase);
+	}
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
 
@@ -2182,6 +2194,7 @@ void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
 	sd->dev_priv = NULL;
 	sd->host_priv = NULL;
 	sd->privacy_led = NULL;
+	INIT_LIST_HEAD(&sd->async_subdev_endpoint_list);
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	sd->entity.name = sd->name;
 	sd->entity.obj_type = MEDIA_ENTITY_TYPE_V4L2_SUBDEV;
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 4c311f9b66bab..d0bef6626e043 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -124,6 +124,17 @@ struct v4l2_async_notifier {
 	struct list_head notifier_entry;
 };
 
+/**
+ * struct v4l2_async_subdev_endpoint - Entry in sub-device's fwnode list
+ *
+ * @entry: An entry in async_subdev_endpoint_list of &struct v4l2_subdev
+ * @endpoint: Endpoint fwnode agains which to match the sub-device
+ */
+struct v4l2_async_subdev_endpoint {
+	struct list_head async_subdev_endpoint_entry;
+	struct fwnode_handle *endpoint;
+};
+
 /**
  * v4l2_async_debug_init - Initialize debugging tools.
  *
@@ -214,6 +225,24 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
 	((type *)__v4l2_async_nf_add_i2c(notifier, adapter, address, \
 					 sizeof(type)))
 
+/**
+ * v4l2_async_subdev_endpoint_add - Add an endpoint fwnode to async sub-device
+ *				    matching list
+ *
+ * @sd: the sub-device
+ * @fwnode: the endpoint fwnode to match
+ *
+ * Add a fwnode to the async sub-device's matching list. This allows registering
+ * multiple async sub-devices from a single device.
+ *
+ * Note that calling v4l2_subdev_cleanup() as part of the sub-device's cleanup
+ * if endpoints have been added to the sub-device's fwnode matching list.
+ *
+ * Returns an error on failure, 0 on success.
+ */
+int v4l2_async_subdev_endpoint_add(struct v4l2_subdev *sd,
+				   struct fwnode_handle *fwnode);
+
 /**
  * v4l2_async_connection_unique - return a unique &struct v4l2_async_connection
  *				  for a sub-device
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index cc22c10540286..9b94847fb6072 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1022,6 +1022,8 @@ struct v4l2_subdev_platform_data {
  *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
  * @async_list: Links this subdev to a global subdev_entry or @notifier->done
  *	list.
+ * @async_subdev_endpoint_entry: List entry in async_ep_list of
+ *				 &struct v4l2_async_subdev_endpoint
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
  * @asc_list: Async connection list, of &struct
@@ -1065,6 +1067,7 @@ struct v4l2_subdev {
 	struct device *dev;
 	struct fwnode_handle *fwnode;
 	struct list_head async_list;
+	struct list_head async_subdev_endpoint_list;
 	struct v4l2_async_notifier *subdev_notifier;
 	struct list_head asc_list;
 	struct v4l2_subdev_platform_data *pdata;
@@ -1381,8 +1384,9 @@ int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
  * v4l2_subdev_cleanup() - Releases the resources allocated by the subdevice
  * @sd: The subdevice
  *
- * This function will release the resources allocated in
- * v4l2_subdev_init_finalize.
+ * Clean up a V4L2 async sub-device. Must be called for a sub-device as part of
+ * its release if resources have been associated with it using
+ * v4l2_async_subdev_endpoint_add() or v4l2_subdev_init_finalize().
  */
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
 
-- 
2.30.2

