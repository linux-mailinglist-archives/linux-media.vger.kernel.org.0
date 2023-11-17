Return-Path: <linux-media+bounces-482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A20537EEFD7
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16797B20D31
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18DE19451;
	Fri, 17 Nov 2023 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axfY51ok"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123A6C5
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215945; x=1731751945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wESP/a8m44IkwZoJBB56YB5O56UQ2BQYZ0BO0tCVhQs=;
  b=axfY51okCs4RU9Eq9msHy9qp3A9Qz+8z9Hczd/e2x8S5gOuWXQpgKQlI
   g1P1um66s1yJHrcLRmGQM8SXKZaoLxl6vnhBvXDAEtCqYKnTD8daN13qz
   SlAHNpfSmc/5tHBqumn3sY7SLSYcTPl+Rkjbj144HAR7jfUDbT8KO+jO4
   lP0qVkLonphbgZcN0Gi5LHNeyGPoYh1ZL97wTcCNVC0FL+Z98YOPPmQxD
   kHrdeGeziF+rUCJmQp1H1Wh8cD/8kIQSoOtwZjyuTlaLYzrz+Slyv+9p5
   0jJVPnnOHkL+gi1VroZODvgvIVfx2aogdJpG3oZsr+4iowHLk6tNeWAxg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457771963"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457771963"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715494852"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715494852"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:21 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 68944120F2C;
	Fri, 17 Nov 2023 12:12:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r3vpG-005cA9-0h;
	Fri, 17 Nov 2023 12:11:50 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 5/9] media: v4l: subdev: Make stream argument optional in state access functions
Date: Fri, 17 Nov 2023 12:11:35 +0200
Message-Id: <20231117101140.1338288-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
References: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sub-device state access functions take three arguments: sub-device
state, pad and stream. The stream is not relevant for the majority of
drivers and having to specify 0 for the stream is considered a nuisance.

Provide a two-argument macros for these state access functions to cover
the needs of stream-unaware users.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 +++++-----
 include/media/v4l2-subdev.h           | 49 ++++++++++++++++++++++-----
 2 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9eef170934c5..06988e3a6f10 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1678,8 +1678,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
 
 struct v4l2_mbus_framefmt *
-v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream)
+__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1717,11 +1717,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_format);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
 
 struct v4l2_rect *
-v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
-			   u32 stream)
+__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1759,11 +1759,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_crop);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
 
 struct v4l2_rect *
-v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
-			      u32 stream)
+__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
+				unsigned int pad, u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1801,7 +1801,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
 
 int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
 					  u32 pad, u32 stream, u32 *other_pad,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f144d49a825c..c8ac91a2cdb8 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1534,11 +1534,18 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 				     const struct v4l2_subdev_krouting *routing,
 				     const struct v4l2_mbus_framefmt *fmt);
 
+/*
+ * A macro to generate the macro or function name for sub-devices state access
+ * wrapper macros below.
+ */
+#define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
+	__v4l2_subdev_state_get_ ## NAME ## ARG
+
 /**
  * v4l2_subdev_state_get_format() - Get pointer to a stream format
  * @state: subdevice state
  * @pad: pad id
- * @stream: stream id
+ * @...: stream id (optional argument)
  *
  * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
  * stream in the subdev state.
@@ -1546,15 +1553,29 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  * For stream-unaware drivers the format for the corresponding pad is returned.
  * If the pad does not exist, NULL is returned.
  */
+/*
+ * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
+ * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
+ * macro below is to come up with the name of the function or macro to call,
+ * using the last two arguments (_stream and _pad). The selected function or
+ * macro is then called using the arguments specified by the caller. A similar
+ * arrangement is used for v4l2_subdev_state_crop() and
+ * v4l2_subdev_state_compose() below.
+ */
+#define v4l2_subdev_state_get_format(state, pad, ...)			\
+	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
+		(state, pad, ##__VA_ARGS__)
+#define __v4l2_subdev_state_get_format_pad(state, pad)	\
+	__v4l2_subdev_state_get_format(state, pad, 0)
 struct v4l2_mbus_framefmt *
-v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream);
+__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream);
 
 /**
  * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
  * @state: subdevice state
  * @pad: pad id
- * @stream: stream id
+ * @...: stream id (optional argument)
  *
  * This returns a pointer to crop rectangle for the given pad + stream in the
  * subdev state.
@@ -1562,15 +1583,20 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the crop rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_crop(state, pad, ...)			\
+	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
+		(state, pad, ##__VA_ARGS__)
+#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
+	__v4l2_subdev_state_get_crop(state, pad, 0)
 struct v4l2_rect *
-v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
-			   u32 stream);
+__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream);
 
 /**
  * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
  * @state: subdevice state
  * @pad: pad id
- * @stream: stream id
+ * @...: stream id (optional argument)
  *
  * This returns a pointer to compose rectangle for the given pad + stream in the
  * subdev state.
@@ -1578,9 +1604,14 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the compose rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_compose(state, pad, ...)			\
+	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
+		(state, pad, ##__VA_ARGS__)
+#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
+	__v4l2_subdev_state_get_compose(state, pad, 0)
 struct v4l2_rect *
-v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
-			      u32 stream);
+__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
+				unsigned int pad, u32 stream);
 
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
-- 
2.39.2


