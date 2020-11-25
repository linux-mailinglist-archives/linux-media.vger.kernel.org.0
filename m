Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C652C459F
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732133AbgKYQpg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:45:36 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:21571 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732124AbgKYQpf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:45:35 -0500
X-Halon-ID: a1833954-2f3d-11eb-a78a-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id a1833954-2f3d-11eb-a78a-0050569116f7;
        Wed, 25 Nov 2020 17:45:32 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/5] v4l2-fwnode: Remove v4l2_async_notifier_parse_fwnode_endpoints_by_port()
Date:   Wed, 25 Nov 2020 17:44:50 +0100
Message-Id: <20201125164450.2056963-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are no users left of this helper and as it implements an
undesirable and too simple behaviour that should instead be implemented
directly by drivers remove it to prevent future uses of it.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 14 -------
 include/media/v4l2-fwnode.h           | 53 ---------------------------
 2 files changed, 67 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 44dd04b05e2970ab..5353e37eb950e813 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -911,20 +911,6 @@ v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints);
 
-int
-v4l2_async_notifier_parse_fwnode_endpoints_by_port(struct device *dev,
-						   struct v4l2_async_notifier *notifier,
-						   size_t asd_struct_size,
-						   unsigned int port,
-						   parse_endpoint_func parse_endpoint)
-{
-	return __v4l2_async_notifier_parse_fwnode_ep(dev, notifier,
-						     asd_struct_size,
-						     port, true,
-						     parse_endpoint);
-}
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints_by_port);
-
 /*
  * v4l2_fwnode_reference_parse - parse references for async sub-devices
  * @dev: the device node the properties of which are parsed for references
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 4e1f6e1d847ec864..4365430eea6f3802 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -484,59 +484,6 @@ v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
 					   size_t asd_struct_size,
 					   parse_endpoint_func parse_endpoint);
 
-/**
- * v4l2_async_notifier_parse_fwnode_endpoints_by_port - Parse V4L2 fwnode
- *							endpoints of a port in a
- *							device node
- * @dev: the device the endpoints of which are to be parsed
- * @notifier: notifier for @dev
- * @asd_struct_size: size of the driver's async sub-device struct, including
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
- * @port: port number where endpoints are to be parsed
- * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
- *		    endpoint. Optional.
- *
- * This function is just like v4l2_async_notifier_parse_fwnode_endpoints() with
- * the exception that it only parses endpoints in a given port. This is useful
- * on devices that have both sinks and sources: the async sub-devices connected
- * to sources have already been configured by another driver (on capture
- * devices). In this case the driver must know which ports to parse.
- *
- * Parse the fwnode endpoints of the @dev device on a given @port and populate
- * the async sub-devices list of the notifier. The @parse_endpoint callback
- * function is called for each endpoint with the corresponding async sub-device
- * pointer to let the caller initialize the driver-specific part of the async
- * sub-device structure.
- *
- * The notifier memory shall be zeroed before this function is called on the
- * notifier the first time.
- *
- * This function may not be called on a registered notifier and may be called on
- * a notifier only once per port.
- *
- * The &struct v4l2_fwnode_endpoint passed to the callback function
- * @parse_endpoint is released once the function is finished. If there is a need
- * to retain that configuration, the user needs to allocate memory for it.
- *
- * Any notifier populated using this function must be released with a call to
- * v4l2_async_notifier_cleanup() after it has been unregistered and the async
- * sub-devices are no longer in use, even if the function returned an error.
- *
- * Return: %0 on success, including when no async sub-devices are found
- *	   %-ENOMEM if memory allocation failed
- *	   %-EINVAL if graph or endpoint parsing failed
- *	   Other error codes as returned by @parse_endpoint
- */
-int
-v4l2_async_notifier_parse_fwnode_endpoints_by_port(struct device *dev,
-						   struct v4l2_async_notifier *notifier,
-						   size_t asd_struct_size,
-						   unsigned int port,
-						   parse_endpoint_func parse_endpoint);
-
 /**
  * v4l2_async_notifier_parse_fwnode_sensor_common - parse common references on
  *					       sensors for async sub-devices
-- 
2.29.2

