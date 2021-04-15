Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4E3360A07
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbhDONFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhDONFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:47 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64A051936;
        Thu, 15 Apr 2021 15:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491924;
        bh=i/2DP4a2qOz2J9bg0umPfD1lH+ER6PzqywDEIF4/xus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AX34Vnol4D2bD8JgsbYjbF8XRw1FxD0h0jr3m8PMNZlA4pmYF5R9IBhhd0IcE4ph3
         hGFIzRvY14HludnC8bwbOEQLzrm80qcBCuCfBEkLYDTkf/hEOCeDhNZSfWGOhRcFOl
         lEDyFr9+OHdZujrLdUSUVMj5O2UaB9WsXntaBEMU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Michal Simek <michal.simek@xilinx.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 18/24] v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
Date:   Thu, 15 Apr 2021 16:04:44 +0300
Message-Id: <20210415130450.421168-19-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Add support for subdev internal routing. A route is defined as a single
stream from a sink pad to a source pad.

The userspace can configure the routing via two new ioctls,
VIDIOC_SUBDEV_G_ROUTING and VIDIOC_SUBDEV_S_ROUTING, and subdevs can
implement the functionality with v4l2_subdev_pad_ops.get_routing() and
v4l2_subdev_pad_ops.set_routing().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>

- Add sink and source streams for multiplexed links
- Copy the argument back in case of an error. This is needed to let the
  caller know the number of routes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

- Expand and refine documentation.
- Make the 'routes' pointer a __u64 __user pointer so that a compat32
  version of the ioctl is not required.
- Add struct v4l2_subdev_krouting to be used for subdevice operations.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

- Fix typecasing warnings
- Check sink & source pad types
- Add 'which' field

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c  | 25 ++++++++++++++-
 drivers/media/v4l2-core/v4l2-subdev.c | 45 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 24 ++++++++++++++
 include/uapi/linux/v4l2-subdev.h      | 44 ++++++++++++++++++++++++++
 4 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6a5d1c6d11d6..f5732962753f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/version.h>
 
+#include <linux/v4l2-subdev.h>
 #include <linux/videodev2.h>
 
 #include <media/v4l2-common.h>
@@ -3108,6 +3109,21 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
 		ret = 1;
 		break;
 	}
+
+	case VIDIOC_SUBDEV_G_ROUTING:
+	case VIDIOC_SUBDEV_S_ROUTING: {
+		struct v4l2_subdev_routing *route = parg;
+
+		if (route->num_routes > 256)
+			return -EINVAL;
+
+		*user_ptr = u64_to_user_ptr(route->routes);
+		*kernel_ptr = (void **)&route->routes;
+		*array_size = sizeof(struct v4l2_subdev_route)
+			    * route->num_routes;
+		ret = 1;
+		break;
+	}
 	}
 
 	return ret;
@@ -3369,8 +3385,15 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	/*
 	 * Some ioctls can return an error, but still have valid
 	 * results that must be returned.
+	 *
+	 * FIXME: subdev IOCTLS are partially handled here and partially in
+	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
+	 * defined here as part of the 'v4l2_ioctls' array. As
+	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
+	 * in case of failure, but it is not defined here as part of the
+	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
 	 */
-	if (err < 0 && !always_copy)
+	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
 		goto out;
 
 out_array_args:
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 956dafab43d4..95a4c3091fa6 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -681,6 +681,51 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	case VIDIOC_SUBDEV_QUERYSTD:
 		return v4l2_subdev_call(sd, video, querystd, arg);
 
+	case VIDIOC_SUBDEV_G_ROUTING: {
+		struct v4l2_subdev_routing *routing = arg;
+		struct v4l2_subdev_krouting krouting = {
+			.which = routing->which,
+			.num_routes = routing->num_routes,
+			.routes = (struct v4l2_subdev_route *)(uintptr_t)routing->routes,
+		};
+		int ret;
+
+		ret = v4l2_subdev_call(sd, pad, get_routing, &krouting);
+		if (ret)
+			return ret;
+
+		routing->num_routes = krouting.num_routes;
+
+		return 0;
+	}
+
+	case VIDIOC_SUBDEV_S_ROUTING: {
+		struct v4l2_subdev_routing *routing = arg;
+		struct v4l2_subdev_route *route = (struct v4l2_subdev_route *)(uintptr_t)
+						  routing->routes;
+		struct v4l2_subdev_krouting krouting = {};
+		unsigned int i;
+
+		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
+			return -EPERM;
+
+		for (i = 0; i < routing->num_routes; ++i) {
+			if (route[i].sink_pad >= sd->entity.num_pads ||
+			    route[i].source_pad >= sd->entity.num_pads)
+				return -EINVAL;
+
+			if (!(sd->entity.pads[route[i].sink_pad].flags & MEDIA_PAD_FL_SINK) ||
+			    !(sd->entity.pads[route[i].source_pad].flags & MEDIA_PAD_FL_SOURCE))
+				return -EINVAL;
+		}
+
+		krouting.which = routing->which;
+		krouting.num_routes = routing->num_routes;
+		krouting.routes = route;
+
+		return v4l2_subdev_call(sd, pad, set_routing, &krouting);
+	}
+
 	default:
 		return v4l2_subdev_call(sd, core, ioctl, cmd, arg);
 	}
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 436d0445aafd..3826ab918731 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -650,6 +650,22 @@ struct v4l2_subdev_pad_config {
 	struct v4l2_rect try_compose;
 };
 
+/**
+ * struct v4l2_subdev_krouting - subdev routing table
+ *
+ * @which: format type (from enum v4l2_subdev_format_whence)
+ * @routes: &struct v4l2_subdev_route
+ * @num_routes: number of routes
+ *
+ * This structure is used to translate argument received from
+ * VIDIOC_SUBDEV_G/S_ROUTING() ioctl to sudev device drivers operations.
+ */
+struct v4l2_subdev_krouting {
+	u32 which;
+	struct v4l2_subdev_route *routes;
+	unsigned int num_routes;
+};
+
 /**
  * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
  *
@@ -711,6 +727,10 @@ struct v4l2_subdev_pad_config {
  *		     applied to the hardware. The operation shall fail if the
  *		     pad index it has been called on is not valid or in case of
  *		     unrecoverable failures.
+ *
+ * @get_routing: get the subdevice routing table.
+ * @set_routing: enable or disable data connection routes described in the
+ *		 subdevice routing table.
  */
 struct v4l2_subdev_pad_ops {
 	int (*init_cfg)(struct v4l2_subdev *sd,
@@ -755,6 +775,10 @@ struct v4l2_subdev_pad_ops {
 			       struct v4l2_mbus_config *config);
 	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_mbus_config *config);
+	int (*get_routing)(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_krouting *route);
+	int (*set_routing)(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_krouting *route);
 };
 
 /**
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 658106f5b5dc..f2a17cbd1e9a 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -188,6 +188,48 @@ struct v4l2_subdev_capability {
 /* The v4l2 sub-device video device node is registered in read-only mode. */
 #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
 
+#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		BIT(0)
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		BIT(1)
+
+/**
+ * struct v4l2_subdev_route - A route inside a subdev
+ *
+ * @sink_pad: the sink pad index
+ * @sink_stream: the sink stream identifier
+ * @source_pad: the source pad index
+ * @source_stream: the source stream identifier
+ * @flags: route flags:
+ *
+ *	V4L2_SUBDEV_ROUTE_FL_ACTIVE: Is the route active? An active
+ *	route will start when streaming is enabled on a video node.
+ *	Set by the user.
+ *
+ *	V4L2_SUBDEV_ROUTE_FL_IMMUTABLE: Is the route immutable, i.e.
+ *	can it be activated and inactivated? Set by the driver.
+ */
+struct v4l2_subdev_route {
+	__u32 sink_pad;
+	__u32 sink_stream;
+	__u32 source_pad;
+	__u32 source_stream;
+	__u32 flags;
+	__u32 reserved[5];
+};
+
+/**
+ * struct v4l2_subdev_routing - Subdev routing information
+ *
+ * @which: format type (from enum v4l2_subdev_format_whence)
+ * @routes: pointer to the routes array
+ * @num_routes: the total number of routes in the routes array
+ */
+struct v4l2_subdev_routing {
+	__u32 which;
+	__u64 routes;
+	__u32 num_routes;
+	__u32 reserved[5];
+};
+
 /* Backwards compatibility define --- to be removed */
 #define v4l2_subdev_edid v4l2_edid
 
@@ -215,5 +257,7 @@ struct v4l2_subdev_capability {
 #define VIDIOC_SUBDEV_ENUM_DV_TIMINGS		_IOWR('V', 98, struct v4l2_enum_dv_timings)
 #define VIDIOC_SUBDEV_QUERY_DV_TIMINGS		_IOR('V', 99, struct v4l2_dv_timings)
 #define VIDIOC_SUBDEV_DV_TIMINGS_CAP		_IOWR('V', 100, struct v4l2_dv_timings_cap)
+#define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
+#define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
 
 #endif
-- 
2.25.1

