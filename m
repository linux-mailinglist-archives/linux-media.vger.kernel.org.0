Return-Path: <linux-media+bounces-10187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2A8B3351
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 268C2B20E2B
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B3A13D89F;
	Fri, 26 Apr 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtQLzJkN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CDC13D28E
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121463; cv=none; b=UJPvK7tQ91talENcVds7Bgz0QsvPxSMIHKmhakkfdVbvHxo//l7RHwalxcQf17ZTZ+gOwSv8Ybt0vLvguAklkMdNJC0ymfCnwqaFB5e6itpOpZFZrencltPXIXr8zGUgeZzd1brqWSu61Zx3Z33EcHJInrFiTLZZUSYy5ItVQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121463; c=relaxed/simple;
	bh=aihSxJbBmO6Y8Fy6lBBe1VwNPvUCi6Uf4Mevvukov8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NL10uMqWaExnwgPr18M4pQueYEhq4sOV+SXKR9oWyONDFQguUSCjGge5+ltR4FqAPFb5f6EeifXcrWZr/zGNfICgkHgLK79GuSxrhgYPEBM0TF2iDgfEureSkk94ntK7aIFI8P1oqGchQQ/IrDOe2KY2XOp2Xv5NgYbPnZwQ7gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtQLzJkN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121462; x=1745657462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aihSxJbBmO6Y8Fy6lBBe1VwNPvUCi6Uf4Mevvukov8w=;
  b=dtQLzJkNosorPanVNuv7Gjl0B+GCyYoEhSJ0igs5ShFksYoBGNkXb9TL
   Pvr0zkauqY1J0Wiyo90N4ngPYMQdQ8utbwDS1Bb/mjEen3TLmtmmlHvgc
   tuh8o7nMirSTnwfyN6hIOpoUeXCb379/vgWetN0674J0VTybiv3UC6BeZ
   n/73O0vVYMudokJbLF87alElFMGiXoCDaiWKNXvObIuBwJo4IbRHEv2Cc
   eeLOgk2VjbKNk32KmB5Tphv8x+OEi3JauuP9rFdgn0NwoNpNM5oQKSzFy
   nwLuqodazQ8CTf/wt/C5ScGdgs5qOTjgDSX7v5LVmwP5IJOr242mujGid
   Q==;
X-CSE-ConnectionGUID: XSWRvGc7SxiRntPROBRsiw==
X-CSE-MsgGUID: E1AjfhPsRc+9D9al3e8LQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683846"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:51:01 -0700
X-CSE-ConnectionGUID: QltIegeTTluabW1Irp+1DQ==
X-CSE-MsgGUID: M74SwB4bSAOvU1249Lf+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598548"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:58 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F2238120358;
	Fri, 26 Apr 2024 11:50:54 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 12/14] media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
Date: Fri, 26 Apr 2024 11:50:36 +0300
Message-Id: <20240426085038.943733-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The len_routes field is used to tell the size of the routes array in
struct v4l2_subdev_routing. This way the number of routes returned from
S_ROUTING IOCTL may be larger than the number of routes provided, in case
there are more routes returned by the driver.

Note that this uAPI is still disabled in the code, so this change can
safely be done. Anyone who manually patched the code to enable this uAPI
must update their code.

The patch also increases the number of reserved fields in struct
v4l2_subdev_routing.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/vidioc-subdev-g-routing.rst     | 46 +++++++++++++------
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 12 ++---
 include/media/v4l2-subdev.h                   |  2 +
 include/uapi/linux/v4l2-subdev.h              | 10 ++--
 5 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 26b5004bfe6d..cbd9370006b6 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -43,23 +43,38 @@ The routing configuration determines the flows of data inside an entity.
 Drivers report their current routing tables using the
 ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
 with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
-setting or clearing flags of the  ``flags`` field of a
-struct :c:type:`v4l2_subdev_route`.
+setting or clearing flags of the ``flags`` field of a struct
+:c:type:`v4l2_subdev_route`.
 
-All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
-means that the userspace must reconfigure all streams after calling the ioctl
-with e.g. ``VIDIOC_SUBDEV_S_FMT``.
+All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called.
+This means that the userspace must reconfigure all stream formats and selections
+after calling the ioctl with e.g. ``VIDIOC_SUBDEV_S_FMT``.
 
 Only subdevices which have both sink and source pads can support routing.
 
-When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
-provided ``num_routes`` is not big enough to contain all the available routes
-the subdevice exposes, drivers return the ENOSPC error code and adjust the
-value of the ``num_routes`` field. Application should then reserve enough memory
-for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
-
-On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
-``num_routes`` field to reflect the actual number of routes returned.
+The ``len_routes`` field indicates the number of routes that can fit in the
+``routes`` array allocated by userspace. It is set by applications for both
+ioctls to indicate how many routes the kernel can return, and is never modified
+by the kernel.
+
+The ``num_routes`` field indicates the number of routes in the routing
+table. For ``VIDIOC_SUBDEV_S_ROUTING``, it is set by userspace to the number of
+routes that the application stored in the ``routes`` array. For both ioctls, it
+is returned by the kernel and indicates how many routes are stored in the
+subdevice routing table. This may be smaller or larger than the value of
+``num_routes`` set by the application for ``VIDIOC_SUBDEV_S_ROUTING``, as
+drivers may adjust the requested routing table.
+
+The kernel can return a ``num_routes`` value larger than ``len_routes`` from
+both ioctls. This indicates thare are more routes in the routing table than fits
+the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
+with the first ``len_routes`` entries of the subdevice routing table. This is
+not considered to be an error, and the ioctl call succeeds. If the applications
+wants to retrieve the missing routes, it can issue a new
+``VIDIOC_SUBDEV_G_ROUTING`` call with a large enough ``routes`` array.
+
+``VIDIOC_SUBDEV_S_ROUTING`` may return more routes than the user provided in
+``num_routes`` field due to e.g. hardware properties.
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
@@ -74,6 +89,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
       - ``which``
       - Routing table to be accessed, from enum
         :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
+    * - __u32
+      - ``len_routes``
+      - The length of the array (as in memory reserved for the array)
     * - struct :c:type:`v4l2_subdev_route`
       - ``routes[]``
       - Array of struct :c:type:`v4l2_subdev_route` entries
@@ -81,7 +99,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
       - ``num_routes``
       - Number of entries of the routes array
     * - __u32
-      - ``reserved``\ [5]
+      - ``reserved``\ [11]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0260acef97d2..aab671fae45b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3201,13 +3201,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
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
index 779583447eac..b565f202df67 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -960,14 +960,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		krouting = &state->routing;
 
-		if (routing->num_routes < krouting->num_routes) {
-			routing->num_routes = krouting->num_routes;
-			return -ENOSPC;
-		}
-
 		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
 		       krouting->routes,
-		       krouting->num_routes * sizeof(*krouting->routes));
+		       min(krouting->num_routes, routing->len_routes) *
+		       sizeof(*krouting->routes));
 		routing->num_routes = krouting->num_routes;
 
 		return 0;
@@ -989,6 +985,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
+		if (routing->num_routes > routing->len_routes)
+			return -EINVAL;
+
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
 		for (i = 0; i < routing->num_routes; ++i) {
@@ -1015,6 +1014,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		}
 
 		krouting.num_routes = routing->num_routes;
+		krouting.len_routes = routing->len_routes;
 		krouting.routes = routes;
 
 		return v4l2_subdev_call(sd, pad, set_routing, state,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e22c50ce7e05..e30c463d90e5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -714,12 +714,14 @@ struct v4l2_subdev_stream_configs {
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
index 81a24bd38003..2347e266cf75 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -228,15 +228,19 @@ struct v4l2_subdev_route {
  * struct v4l2_subdev_routing - Subdev routing information
  *
  * @which: configuration type (from enum v4l2_subdev_format_whence)
- * @num_routes: the total number of routes in the routes array
+ * @len_routes: the length of the routes array, in routes; set by the user, not
+ *		modified by the kernel
  * @routes: pointer to the routes array
+ * @num_routes: the total number of routes, possibly more than fits in the
+ *		routes array
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


