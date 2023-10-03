Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4F07B6889
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbjJCMId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjJCMIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:08:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B63AC
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696334909; x=1727870909;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rsiwEInmtlzxD+1LZV2zIKl2BC0GdQE2Tr/WKOaHPv4=;
  b=JB2QWTfxIUrtg+QK5iNuF9nk7MyLlDd2Yw8P/q1Q4mmYgxRWWBzyA1aj
   WKvykm4ZXmswYxu6NGDfe+/W4k/44WhJ/0ZRnH+gEr4ntR5DBKp07L3wK
   Md99WhT1QXML7xJ6UGzmVx9zWfkRGA630P7zQLwgF89Al2jTwc+YOQnez
   vA6AXq8jthd+uDyhpG4X3qp0QrTToJDALVE3QzrRMmFQajWfUU9KLLVJO
   z13HxugrdVco37uqJefr0v376l5QIF4u/Q5JbNZiVxwo6YpsiU2M5RsZ4
   xbpS1yijvF1tECFD4B0ocXKP/v78FMe7Ucgul8aXYEukASxaGoC2Lgv9w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385681524"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="385681524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780285917"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="780285917"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:08:26 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E7D68120A2E;
        Tue,  3 Oct 2023 15:08:22 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v6 16/28] media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
Date:   Tue,  3 Oct 2023 15:08:01 +0300
Message-Id: <20231003120813.77726-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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
index 614ff0031831..bd1e8205913c 100644
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
index e49e8af2fb52..baaa81a9497e 100644
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

