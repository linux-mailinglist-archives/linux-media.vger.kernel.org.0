Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B17739FC5
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjFVLlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjFVLlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:05 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F6D319A9
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434064; x=1718970064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XpZJflC+stj6iJExqd1kPeOpPHrrDsWMCwhygeviQUs=;
  b=j4kZL2Z8ja9U+R/2FFZpffEZV3FWrtlM/XYUDBoYVCRIyDyuk6Jz8kCV
   ZJIJci0lZhorp+1ZoC8N5RqLCt+rIrOE9ndxDZXta2DvCKnY5Naq7NBjI
   fLC77P+OC41Eh7qI6h9YhlhJRbJ43VaCDFCT/vHU2khc5XuF6pLZ72r1T
   RYVKUfbjf1LzIybPaT4WzGLZ0out9CnklzJCAR4UACRKDD3wcbpOZxrNV
   WKUwUbyHj+6Yzn8YXQ9e6SEKSCyo+PtpsH0iFdN+qyNfxunLDwihp4vgV
   Wc484Esezt+Q8CzLWop2M3St4hI57hngZ4ITeeN8OJ+9iTMQkNCjZ9E4c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="357957507"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="357957507"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804749830"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="804749830"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:40:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B9E7C1203D5;
        Thu, 22 Jun 2023 14:40:50 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg2-003oRw-2B;
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
Subject: [PATCH v4 01/38] media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()
Date:   Thu, 22 Jun 2023 14:39:51 +0300
Message-Id: <20230622114028.908825-2-sakari.ailus@linux.intel.com>
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
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/v4l2-core/v4l2-async.c  |  6 +-
 drivers/media/v4l2-core/v4l2-fwnode.c | 97 ---------------------------
 include/media/v4l2-async.h            | 34 ++--------
 include/media/v4l2-fwnode.h           | 68 -------------------
 4 files changed, 7 insertions(+), 198 deletions(-)

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
index 394d798f3dfa4..a9a89035e282d 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -22,8 +22,6 @@
 #include <media/v4l2-mediabus.h>
 
 struct fwnode_handle;
-struct v4l2_async_notifier;
-struct v4l2_async_subdev;
 
 /**
  * struct v4l2_fwnode_endpoint - the endpoint data structure
@@ -393,72 +391,6 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
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
2.39.2

