Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DCB7AB389
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 16:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbjIVOX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 10:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234291AbjIVOXZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 10:23:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16140100
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695392599; x=1726928599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8mwQE+0mggsEFu8Cjr5z33UI2UZa4qNK5N7Rgv86ABU=;
  b=Ttr+erlY9u+3HuCWHNoayG9YidNcUSab2kuLh0q4WGNYSeSUqgkdEV+S
   itN/CTdJEOtVEMecYAypTo4zs0N0wjXXBa+osdlcxRcCKFP0mF32W92tS
   zIfslZyoDaf8i4kLECh9Z3DXincg1u81kp8sYTF6o/7abJ843A7EjuAFr
   dsK2t3SSMjcEr5wdBFDUbRkX//g1LFLmpgC6t9h43pO0iQPlI8ZaG4ovj
   jkl6EjH0kmNX6uXbXNVJUsQo/9Sp9vO3HvXvn52kl2cby+IkZJGtI7ceH
   ncJD9P74MpJMogiSTUGxlyqumrkHfGTrxQGuaAk41nl0m5jEBgSC5zfzT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360219010"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360219010"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750862618"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750862618"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:23:15 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5E279120810;
        Fri, 22 Sep 2023 17:23:11 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v4 19/23] media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
Date:   Fri, 22 Sep 2023 17:22:35 +0300
Message-Id: <20230922142239.259425-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The len_routes field is used to tell the size of the routes array in
struct v4l2_subdev_routing. This way the number of routes returned from
S_ROUTING IOCTL may be larger than the number of routes provided, in case
there are more routes returned by the driver.

Note that this changes the (now-disabled) UAPI, users must be updated.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/vidioc-subdev-g-routing.rst     | 31 ++++++++++++-------
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +--
 drivers/media/v4l2-core/v4l2-subdev.c         |  6 +++-
 include/media/v4l2-subdev.h                   |  2 ++
 include/uapi/linux/v4l2-subdev.h              |  8 +++--
 5 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 72677a280cd6..9a9765ddc316 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -46,20 +46,26 @@ with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
 setting or clearing flags of the  ``flags`` field of a
 struct :c:type:`v4l2_subdev_route`.
 
-All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
-means that the userspace must reconfigure all streams after calling the ioctl
-with e.g. ``VIDIOC_SUBDEV_S_FMT``.
+All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
+called. This means that the userspace must reconfigure all streams after calling
+the ioctl with e.g. ``VIDIOC_SUBDEV_S_FMT``.
 
 Only subdevices which have both sink and source pads can support routing.
 
-When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
-provided ``num_routes`` is not big enough to contain all the available routes
-the subdevice exposes, drivers return the ENOSPC error code and adjust the
-value of the ``num_routes`` field. Application should then reserve enough memory
-for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
+The ``num_routes`` field is used to denote the number of routes set (set by user
+space on ``VIDIOC_SUBDEV_S_ROUTING`` argument) on the routing table as well as
+the number of routes returned back from both IOCTLs. The ``len_routes``
+signifies the number of routes that can fit into the ``routes`` array. The
+userspace shall set ``len_routes`` for both IOCTLs and ``num_routes`` for
+``VIDIOC_SUBDEV_S_ROUTING``.
 
-On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
-``num_routes`` field to reflect the actual number of routes returned.
+On a ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the ``num_routes``
+field to reflect the actual number of routes known by the driver. ``num_routes``
+larger than ``len_routes`` in both IOCTLs. In this ``len_routes`` were returned
+back to the userspace. This is not an error.
+
+Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
+``num_routes`` field due to e.g. hardware properties.
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
@@ -74,6 +80,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
       - ``which``
       - Format to modified, from enum
         :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
+    * - __u32
+      - ``len_routes``
+      - The length of the array (as in memory reserved for the array)
     * - struct :c:type:`v4l2_subdev_route`
       - ``routes[]``
       - Array of struct :c:type:`v4l2_subdev_route` entries
@@ -81,7 +90,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
       - ``num_routes``
       - Number of entries of the routes array
     * - __u32
-      - ``reserved``\ [5]
+      - ``reserved``\ [11]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6921a72566df..1e3da9d64958 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3155,13 +3155,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 	case VIDIOC_SUBDEV_S_ROUTING: {
 		struct v4l2_subdev_routing *routing = parg;
 
-		if (routing->num_routes > 256)
+		if (routing->len_routes > 256)
 			return -E2BIG;
 
 		*user_ptr = u64_to_user_ptr(routing->routes);
 		*kernel_ptr = (void **)&routing->routes;
 		*array_size = sizeof(struct v4l2_subdev_route)
-			    * routing->num_routes;
+			    * routing->len_routes;
 		ret = 1;
 		break;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index cb9ca08bf11c..2042ad4ef5f1 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -903,6 +903,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
+		if (routing->num_routes > routing->len_routes)
+			return -EINVAL;
+
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
 		for (i = 0; i < routing->num_routes; ++i) {
@@ -929,6 +932,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		}
 
 		krouting.num_routes = routing->num_routes;
+		krouting.len_routes = routing->len_routes;
 		krouting.routes = routes;
 
 		return v4l2_subdev_call(sd, pad, set_routing, state,
@@ -949,7 +953,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		krouting = &state->routing;
 
-		if (routing->num_routes < krouting->num_routes) {
+		if (routing->len_routes < krouting->num_routes) {
 			routing->num_routes = krouting->num_routes;
 			return -ENOSPC;
 		}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 7c34243ffed9..04597dd3a6e2 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -741,12 +741,14 @@ struct v4l2_subdev_stream_configs {
 /**
  * struct v4l2_subdev_krouting - subdev routing table
  *
+ * @len_routes: length of routes array, in routes
  * @num_routes: number of routes
  * @routes: &struct v4l2_subdev_route
  *
  * This structure contains the routing table for a subdev.
  */
 struct v4l2_subdev_krouting {
+	unsigned int len_routes;
 	unsigned int num_routes;
 	struct v4l2_subdev_route *routes;
 };
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 4a195b68f28f..b57fb89caa9e 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -222,15 +222,17 @@ struct v4l2_subdev_route {
  * struct v4l2_subdev_routing - Subdev routing information
  *
  * @which: configuration type (from enum v4l2_subdev_format_whence)
- * @num_routes: the total number of routes in the routes array
+ * @len_routes: the length of the routes array, in routes
  * @routes: pointer to the routes array
+ * @num_routes: the total number of routes in the routes array
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_routing {
 	__u32 which;
-	__u32 num_routes;
+	__u32 len_routes;
 	__u64 routes;
-	__u32 reserved[6];
+	__u32 num_routes;
+	__u32 reserved[11];
 };
 
 /*
-- 
2.39.2

