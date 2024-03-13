Return-Path: <linux-media+bounces-6950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18987A379
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21CC1C21412
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D2A1B97C;
	Wed, 13 Mar 2024 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb4H3uLt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F233E1AAD4
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314758; cv=none; b=Xb6x5ZETdp9f+JV/QIGfYo15KLlLAsP7Yj9M8FuC3dyB5MTuxEceLkjxLXyoXq/SL4eIJ8j0sQGvNuUg81izF+pC716bB0V1MQ6XCLD1/8fq2jSQ8zTg9ViZhCKooQBGtg2p/B+IhmpJMZNOnDL6kDG91pNTpx/amQkXkqGiJyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314758; c=relaxed/simple;
	bh=iNsAlUv5Un60NPxvzeuJJUI3kKLJ6r64g8K+pvY0+wY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FgB4ZRzvQ77w3oc1i4fVu7f25tql7Uev4vDbpJKv9JoCcY3g4RCqpXPle0nD0XmTI9KjJNfvwCTomFIt3LdqEXYyeYEq6pMbgldF6YDMErOTpGTdWew6Y3iS2eE1u+JnpnTGVEeso1rheCVDBJy4eO+D2YF4oVK0NE03tfHEbJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb4H3uLt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314757; x=1741850757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iNsAlUv5Un60NPxvzeuJJUI3kKLJ6r64g8K+pvY0+wY=;
  b=eb4H3uLtyKc0OgzmZslBDVN1VvTOURN2jW5VerwfbycNpIiyZN0P3PzO
   YML7BhdfndVDJvWX2QmiXcGEQX0Pw+oaf9VEsHKBeV8MpHX17kdB/7+Yu
   Ogc4wVMAuj+hsY1WTouaLU5RzpiYaYZtnlR3fFeSoTpoh4buwILUVZOTm
   ZYQIH78Xv9kshNjvsFhUyaDA2ZmmILuRwJ/XupWAoocP2GECO89nhJ7PV
   0Z7nxM5TCsQR///eIDIsU0yHWo3JGDZa3f+PNuG1ookS83itQaEVqKq/i
   +RQ2etGevKBp26GoEWIc23MDedZUosB4ZD/ypGwhaF20OxkNtQHdEkcI6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575593"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575593"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816427"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:42 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1191E11F853;
	Wed, 13 Mar 2024 09:25:38 +0200 (EET)
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
Subject: [PATCH v8 14/38] media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
Date: Wed, 13 Mar 2024 09:24:52 +0200
Message-Id: <20240313072516.241106-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
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

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/vidioc-subdev-g-routing.rst     | 33 ++++++++++++-------
 drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +--
 drivers/media/v4l2-core/v4l2-subdev.c         |  6 +++-
 include/media/v4l2-subdev.h                   |  2 ++
 include/uapi/linux/v4l2-subdev.h              |  9 +++--
 5 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 26b5004bfe6d..8f9aa83275c5 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -46,20 +46,28 @@ with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
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
+the number of routes returned back from both IOCTLs. ``len_routes`` signifies
+the number of routes that can fit into the ``routes`` array. The userspace shall
+set ``len_routes`` for both IOCTLs and ``num_routes`` for
+``VIDIOC_SUBDEV_S_ROUTING``.
 
-On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
-``num_routes`` field to reflect the actual number of routes returned.
+On a ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the ``num_routes``
+field to reflect the actual number of routes known by the driver.
+``num_routes`` larger than ``len_routes`` may be returned by both IOCTLs to
+indicate there are more routes than fits to the ``routes`` array. In this
+case first ``len_routes`` were returned back to the userspace in the
+``routes`` array. This is not considered as an error.
+
+Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
+``num_routes`` field due to e.g. hardware properties.
 
 .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
 
@@ -74,6 +82,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
       - ``which``
       - Routing table to be accessed, from enum
         :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
+    * - __u32
+      - ``len_routes``
+      - The length of the array (as in memory reserved for the array)
     * - struct :c:type:`v4l2_subdev_route`
       - ``routes[]``
       - Array of struct :c:type:`v4l2_subdev_route` entries
@@ -81,7 +92,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
       - ``num_routes``
       - Number of entries of the routes array
     * - __u32
-      - ``reserved``\ [5]
+      - ``reserved``\ [11]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 95bd56145d38..018e7efc21ca 100644
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
index ec8de3f872b9..486a5c3016de 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -925,6 +925,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
 			return -EPERM;
 
+		if (routing->num_routes > routing->len_routes)
+			return -EINVAL;
+
 		memset(routing->reserved, 0, sizeof(routing->reserved));
 
 		for (i = 0; i < routing->num_routes; ++i) {
@@ -951,6 +954,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		}
 
 		krouting.num_routes = routing->num_routes;
+		krouting.len_routes = routing->len_routes;
 		krouting.routes = routes;
 
 		return v4l2_subdev_call(sd, pad, set_routing, state,
@@ -971,7 +975,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 
 		krouting = &state->routing;
 
-		if (routing->num_routes < krouting->num_routes) {
+		if (routing->len_routes < krouting->num_routes) {
 			routing->num_routes = krouting->num_routes;
 			return -ENOSPC;
 		}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 9cce48365975..1df6b963a1c9 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -728,12 +728,14 @@ struct v4l2_subdev_stream_configs {
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
index 7048c51581c6..ca543982460c 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -224,15 +224,18 @@ struct v4l2_subdev_route {
  * struct v4l2_subdev_routing - Subdev routing information
  *
  * @which: configuration type (from enum v4l2_subdev_format_whence)
- * @num_routes: the total number of routes in the routes array
+ * @len_routes: the length of the routes array, in routes
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


