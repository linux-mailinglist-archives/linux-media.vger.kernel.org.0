Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB5F7049C6
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbjEPJ4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbjEPJ4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:09 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9261713
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230967; x=1715766967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FxRb16v3XUpwV0GLek5lbrrXvsFnh8Dq4KeBJUE6x4s=;
  b=gBdcyuyBiRV43ax8ZxpmkmplpMR0aSIwyByVFOGy5sn/EkAOhvN9XGdu
   WzfSDGcK18vSJsGxyhGvr4ld9sslaGN46oKsVkbbwO1ND1e662zpvfOum
   meWp2cuT6B3ab35omihJMIAsKJApNLmqZLg+NYesys5NN89HUM80etYXW
   9+uBbigpJLCDeSZBRsyGC4YO0d3I1GL7k9ZQ+ovmClIRLydyglHgKn8Ox
   BCnhf2tEXZaUSwXeGktWjmVn26r4r+RPZGrqKQHN1UoUu+XFBLRUMUwHg
   27PHtiX3Vd9r++CfUUxYyjmek9j3fwanobV62qrhpYhTbRXF12MXuUf3t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353715239"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="353715239"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="678791321"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="678791321"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:38 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D6348120CAC;
        Tue, 16 May 2023 12:55:35 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOx-002Z9d-S0; Tue, 16 May 2023 12:55:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 01/31] media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()
Date:   Tue, 16 May 2023 12:54:47 +0300
Message-Id: <20230516095517.611711-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_async_nf_parse_fwnode_endpoints() function, part of
v4l2-fwnode.c, was a helper meant to register one async sub-dev for each
fwnode endpoint of a device.

The function is marked as deprecated in the documentation and is actually
not used anywhere anymore. Drop it and remove the helper function
v4l2_async_nf_fwnode_parse_endpoint() from v4l2-fwnode.c.

This change allows to make the helper function
__v4l2_async_nf_add_connection() visibility private to v4l2-async.c so
that there is no risk drivers can mistakenly use it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
[Sakari Ailus: Small fixups on top.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c  |  6 +-
 drivers/media/v4l2-core/v4l2-fwnode.c | 97 ---------------------------
 include/media/v4l2-async.h            | 34 ++--------
 include/media/v4l2-fwnode.h           | 66 ------------------
 4 files changed, 7 insertions(+), 196 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index b16b5f4cb91e2..7831bc8792904 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -662,8 +662,9 @@ void v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_nf_cleanup);
 
-int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
-			       struct v4l2_async_subdev *asd)
+
+static int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
+				      struct v4l2_async_subdev *asd)
 {
 	int ret;
 
@@ -679,7 +680,6 @@ int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
 	mutex_unlock(&list_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_subdev);
 
 struct v4l2_async_subdev *
 __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 049c2f2001eaa..b71561957b9fb 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -798,103 +798,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
 
-static int
-v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
-				    struct v4l2_async_notifier *notifier,
-				    struct fwnode_handle *endpoint,
-				    unsigned int asd_struct_size,
-				    parse_endpoint_func parse_endpoint)
-{
-	struct v4l2_fwnode_endpoint vep = { .bus_type = 0 };
-	struct v4l2_async_subdev *asd;
-	int ret;
-
-	asd = kzalloc(asd_struct_size, GFP_KERNEL);
-	if (!asd)
-		return -ENOMEM;
-
-	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
-	asd->match.fwnode =
-		fwnode_graph_get_remote_port_parent(endpoint);
-	if (!asd->match.fwnode) {
-		dev_dbg(dev, "no remote endpoint found\n");
-		ret = -ENOTCONN;
-		goto out_err;
-	}
-
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &vep);
-	if (ret) {
-		dev_warn(dev, "unable to parse V4L2 fwnode endpoint (%d)\n",
-			 ret);
-		goto out_err;
-	}
-
-	ret = parse_endpoint ? parse_endpoint(dev, &vep, asd) : 0;
-	if (ret == -ENOTCONN)
-		dev_dbg(dev, "ignoring port@%u/endpoint@%u\n", vep.base.port,
-			vep.base.id);
-	else if (ret < 0)
-		dev_warn(dev,
-			 "driver could not parse port@%u/endpoint@%u (%d)\n",
-			 vep.base.port, vep.base.id, ret);
-	v4l2_fwnode_endpoint_free(&vep);
-	if (ret < 0)
-		goto out_err;
-
-	ret = __v4l2_async_nf_add_subdev(notifier, asd);
-	if (ret < 0) {
-		/* not an error if asd already exists */
-		if (ret == -EEXIST)
-			ret = 0;
-		goto out_err;
-	}
-
-	return 0;
-
-out_err:
-	fwnode_handle_put(asd->match.fwnode);
-	kfree(asd);
-
-	return ret == -ENOTCONN ? 0 : ret;
-}
-
-int
-v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
-				     struct v4l2_async_notifier *notifier,
-				     size_t asd_struct_size,
-				     parse_endpoint_func parse_endpoint)
-{
-	struct fwnode_handle *fwnode;
-	int ret = 0;
-
-	if (WARN_ON(asd_struct_size < sizeof(struct v4l2_async_subdev)))
-		return -EINVAL;
-
-	fwnode_graph_for_each_endpoint(dev_fwnode(dev), fwnode) {
-		struct fwnode_handle *dev_fwnode;
-		bool is_available;
-
-		dev_fwnode = fwnode_graph_get_port_parent(fwnode);
-		is_available = fwnode_device_is_available(dev_fwnode);
-		fwnode_handle_put(dev_fwnode);
-		if (!is_available)
-			continue;
-
-
-		ret = v4l2_async_nf_fwnode_parse_endpoint(dev, notifier,
-							  fwnode,
-							  asd_struct_size,
-							  parse_endpoint);
-		if (ret < 0)
-			break;
-	}
-
-	fwnode_handle_put(fwnode);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(v4l2_async_nf_parse_fwnode_endpoints);
-
 /*
  * v4l2_fwnode_reference_parse - parse references for async sub-devices
  * @dev: the device node the properties of which are parsed for references
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 25eb1d138c069..2c9baa3c9266a 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -131,32 +131,10 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  *
  * This function initializes the notifier @asd_list. It must be called
  * before adding a subdevice to a notifier, using one of:
- * v4l2_async_nf_add_fwnode_remote(),
- * v4l2_async_nf_add_fwnode(),
- * v4l2_async_nf_add_i2c(),
- * __v4l2_async_nf_add_subdev() or
- * v4l2_async_nf_parse_fwnode_endpoints().
- */
-void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
-
-/**
- * __v4l2_async_nf_add_subdev - Add an async subdev to the
- *				notifier's master asd list.
- *
- * @notifier: pointer to &struct v4l2_async_notifier
- * @asd: pointer to &struct v4l2_async_subdev
- *
- * \warning: Drivers should avoid using this function and instead use one of:
- * v4l2_async_nf_add_fwnode(),
- * v4l2_async_nf_add_fwnode_remote() or
+ * v4l2_async_nf_add_fwnode_remote(), v4l2_async_nf_add_fwnode() or
  * v4l2_async_nf_add_i2c().
- *
- * Call this function before registering a notifier to link the provided @asd to
- * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
- * it will be freed by the framework when the notifier is destroyed.
  */
-int __v4l2_async_nf_add_subdev(struct v4l2_async_notifier *notifier,
-			       struct v4l2_async_subdev *asd);
+void v4l2_async_nf_init(struct v4l2_async_notifier *notifier);
 
 struct v4l2_async_subdev *
 __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
@@ -263,12 +241,8 @@ void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier);
  * Release memory resources related to a notifier, including the async
  * sub-devices allocated for the purposes of the notifier but not the notifier
  * itself. The user is responsible for calling this function to clean up the
- * notifier after calling
- * v4l2_async_nf_add_fwnode_remote(),
- * v4l2_async_nf_add_fwnode(),
- * v4l2_async_nf_add_i2c(),
- * __v4l2_async_nf_add_subdev() or
- * v4l2_async_nf_parse_fwnode_endpoints().
+ * notifier after calling v4l2_async_nf_add_fwnode_remote(),
+ * v4l2_async_nf_add_fwnode() or v4l2_async_nf_add_i2c().
  *
  * There is no harm from calling v4l2_async_nf_cleanup() in other
  * cases as long as its memory has been zeroed after it has been
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 394d798f3dfa4..855dae84b751d 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -393,72 +393,6 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
 int v4l2_fwnode_device_parse(struct device *dev,
 			     struct v4l2_fwnode_device_properties *props);
 
-/**
- * typedef parse_endpoint_func - Driver's callback function to be called on
- *	each V4L2 fwnode endpoint.
- *
- * @dev: pointer to &struct device
- * @vep: pointer to &struct v4l2_fwnode_endpoint
- * @asd: pointer to &struct v4l2_async_subdev
- *
- * Return:
- * * %0 on success
- * * %-ENOTCONN if the endpoint is to be skipped but this
- *   should not be considered as an error
- * * %-EINVAL if the endpoint configuration is invalid
- */
-typedef int (*parse_endpoint_func)(struct device *dev,
-				  struct v4l2_fwnode_endpoint *vep,
-				  struct v4l2_async_subdev *asd);
-
-/**
- * v4l2_async_nf_parse_fwnode_endpoints - Parse V4L2 fwnode endpoints in a
- *						device node
- * @dev: the device the endpoints of which are to be parsed
- * @notifier: notifier for @dev
- * @asd_struct_size: size of the driver's async sub-device struct, including
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
- * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
- *		    endpoint. Optional.
- *
- * DEPRECATED! This function is deprecated. Don't use it in new drivers.
- * Instead see an example in cio2_parse_firmware() function in
- * drivers/media/pci/intel/ipu3/ipu3-cio2.c .
- *
- * Parse the fwnode endpoints of the @dev device and populate the async sub-
- * devices list in the notifier. The @parse_endpoint callback function is
- * called for each endpoint with the corresponding async sub-device pointer to
- * let the caller initialize the driver-specific part of the async sub-device
- * structure.
- *
- * The notifier memory shall be zeroed before this function is called on the
- * notifier.
- *
- * This function may not be called on a registered notifier and may be called on
- * a notifier only once.
- *
- * The &struct v4l2_fwnode_endpoint passed to the callback function
- * @parse_endpoint is released once the function is finished. If there is a need
- * to retain that configuration, the user needs to allocate memory for it.
- *
- * Any notifier populated using this function must be released with a call to
- * v4l2_async_nf_cleanup() after it has been unregistered and the async
- * sub-devices are no longer in use, even if the function returned an error.
- *
- * Return: %0 on success, including when no async sub-devices are found
- *	   %-ENOMEM if memory allocation failed
- *	   %-EINVAL if graph or endpoint parsing failed
- *	   Other error codes as returned by @parse_endpoint
- */
-int
-v4l2_async_nf_parse_fwnode_endpoints(struct device *dev,
-				     struct v4l2_async_notifier *notifier,
-				     size_t asd_struct_size,
-				     parse_endpoint_func parse_endpoint);
-
 /* Helper macros to access the connector links. */
 
 /** v4l2_connector_last_link - Helper macro to get the first
-- 
2.30.2

