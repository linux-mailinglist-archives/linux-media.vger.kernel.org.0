Return-Path: <linux-media+bounces-1670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08C805550
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA7CF1C20B99
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D23C59B6B;
	Tue,  5 Dec 2023 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1HXAvHB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B7210F
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 05:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701781230; x=1733317230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BPeRYOqtfet3J37GGL6NJokX2fyyPNz4HQMcaNz26G8=;
  b=N1HXAvHBxQMGgCWw4xSjvU/eHh7rZ2mlp7uHGVvjPszX3ZPou8AEa3Nf
   VA19iwiXqWjrXPwggxMwEPwq0N+fVBz5xHb5WH+DWtjklYZJ5H4Zpjzjt
   2vx7qfJmrBwTOu1eoj2or32WWWv5X4wRCNZPPqCcJVK6GXrPdmJsldbx0
   DzNCuVK0LtCYCLScRvOGcag6XCPdK1UV2JSjexh/MfVZt0QU6DgrCegZa
   0L+bRNhoaTzDVRDwxVGi4q3Xt4LnNb/ZPbTMW0ajLhypAesjHQsjd6c7+
   omOEJHsUvuIUNeXwv7Krewh1RcU4+mVKX2rjw5WUk4/02F9i+yNBOSze3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="944957"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="944957"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 05:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914794050"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="914794050"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 05:00:27 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EDB9D11FB50;
	Tue,  5 Dec 2023 15:00:24 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rAV23-003fiN-28;
	Tue, 05 Dec 2023 15:00:11 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hverkuil@xs4all.nl
Subject: [PATCH v2 1/1] media: v4l: Make sub-device state information available to non-MC users
Date: Tue,  5 Dec 2023 15:00:01 +0200
Message-Id: <20231205130001.875327-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sub-device state information access function were only available if
CONFIG_MEDIA_CONTROLLER was defined whereas the functions themselves were
used by non-MC-enabled drivers, too. Fix this by moving the definitions
out of CONFIG_MEDIA_CONTROLLER dependent parts. Also make the MC dependent
features conditional to CONFIG_MEDIA_CONTROLLER.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312051913.e5iif8Qz-lkp@intel.com/
Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Thanks to Laurent for review.

since v1:

- I thought the c file had already this fixed. Also fixed that now and
  changed the commit message accordingly.

 drivers/media/v4l2-core/v4l2-subdev.c | 216 ++++++++++++++------------
 include/media/v4l2-subdev.h           | 158 +++++++++----------
 2 files changed, 193 insertions(+), 181 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4fbefe4cd714..30746a7df259 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1533,108 +1533,6 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
 
-struct v4l2_mbus_framefmt *
-__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
-			       unsigned int pad, u32 stream)
-{
-	struct v4l2_subdev_stream_configs *stream_configs;
-	unsigned int i;
-
-	if (WARN_ON_ONCE(!state))
-		return NULL;
-
-	if (state->pads) {
-		if (stream)
-			return NULL;
-
-		if (pad >= state->sd->entity.num_pads)
-			return NULL;
-
-		return &state->pads[pad].format;
-	}
-
-	lockdep_assert_held(state->lock);
-
-	stream_configs = &state->stream_configs;
-
-	for (i = 0; i < stream_configs->num_configs; ++i) {
-		if (stream_configs->configs[i].pad == pad &&
-		    stream_configs->configs[i].stream == stream)
-			return &stream_configs->configs[i].fmt;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
-
-struct v4l2_rect *
-__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream)
-{
-	struct v4l2_subdev_stream_configs *stream_configs;
-	unsigned int i;
-
-	if (WARN_ON_ONCE(!state))
-		return NULL;
-
-	if (state->pads) {
-		if (stream)
-			return NULL;
-
-		if (pad >= state->sd->entity.num_pads)
-			return NULL;
-
-		return &state->pads[pad].crop;
-	}
-
-	lockdep_assert_held(state->lock);
-
-	stream_configs = &state->stream_configs;
-
-	for (i = 0; i < stream_configs->num_configs; ++i) {
-		if (stream_configs->configs[i].pad == pad &&
-		    stream_configs->configs[i].stream == stream)
-			return &stream_configs->configs[i].crop;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
-
-struct v4l2_rect *
-__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
-				unsigned int pad, u32 stream)
-{
-	struct v4l2_subdev_stream_configs *stream_configs;
-	unsigned int i;
-
-	if (WARN_ON_ONCE(!state))
-		return NULL;
-
-	if (state->pads) {
-		if (stream)
-			return NULL;
-
-		if (pad >= state->sd->entity.num_pads)
-			return NULL;
-
-		return &state->pads[pad].compose;
-	}
-
-	lockdep_assert_held(state->lock);
-
-	stream_configs = &state->stream_configs;
-
-	for (i = 0; i < stream_configs->num_configs; ++i) {
-		if (stream_configs->configs[i].pad == pad &&
-		    stream_configs->configs[i].stream == stream)
-			return &stream_configs->configs[i].compose;
-	}
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
-
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 static int
@@ -2272,6 +2170,120 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_s_stream_helper);
 
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
+struct v4l2_mbus_framefmt *
+__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
+
+		return &state->pads[pad].format;
+	}
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+
+	lockdep_assert_held(state->lock);
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].fmt;
+	}
+
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format);
+
+struct v4l2_rect *
+__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
+
+		return &state->pads[pad].crop;
+	}
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+
+	lockdep_assert_held(state->lock);
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].crop;
+	}
+
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop);
+
+struct v4l2_rect *
+__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
+				unsigned int pad, u32 stream)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+
+	if (WARN_ON_ONCE(!state))
+		return NULL;
+
+	if (state->pads) {
+		if (stream)
+			return NULL;
+
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
+
+		return &state->pads[pad].compose;
+	}
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+
+	lockdep_assert_held(state->lock);
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i) {
+		if (stream_configs->configs[i].pad == pad &&
+		    stream_configs->configs[i].stream == stream)
+			return &stream_configs->configs[i].compose;
+	}
+
+#endif /* CONFIG_MEDIA_CONTROLLER */
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
+
 void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
 {
 	INIT_LIST_HEAD(&sd->list);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8b08f6640dee..0099e177980e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1186,6 +1186,85 @@ static inline void *v4l2_get_subdev_hostdata(const struct v4l2_subdev *sd)
 	return sd->host_priv;
 }
 
+/*
+ * A macro to generate the macro or function name for sub-devices state access
+ * wrapper macros below.
+ */
+#define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
+	__v4l2_subdev_state_get_ ## NAME ## ARG
+
+/**
+ * v4l2_subdev_state_get_format() - Get pointer to a stream format
+ * @state: subdevice state
+ * @pad: pad id
+ * @...: stream id (optional argument)
+ *
+ * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
+ * stream in the subdev state.
+ *
+ * For stream-unaware drivers the format for the corresponding pad is returned.
+ * If the pad does not exist, NULL is returned.
+ */
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
+struct v4l2_mbus_framefmt *
+__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream);
+
+/**
+ * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
+ * @state: subdevice state
+ * @pad: pad id
+ * @...: stream id (optional argument)
+ *
+ * This returns a pointer to crop rectangle for the given pad + stream in the
+ * subdev state.
+ *
+ * For stream-unaware drivers the crop rectangle for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
+ */
+#define v4l2_subdev_state_get_crop(state, pad, ...)			\
+	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
+		(state, pad, ##__VA_ARGS__)
+#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
+	__v4l2_subdev_state_get_crop(state, pad, 0)
+struct v4l2_rect *
+__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
+			     u32 stream);
+
+/**
+ * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
+ * @state: subdevice state
+ * @pad: pad id
+ * @...: stream id (optional argument)
+ *
+ * This returns a pointer to compose rectangle for the given pad + stream in the
+ * subdev state.
+ *
+ * For stream-unaware drivers the compose rectangle for the corresponding pad is
+ * returned. If the pad does not exist, NULL is returned.
+ */
+#define v4l2_subdev_state_get_compose(state, pad, ...)			\
+	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
+		(state, pad, ##__VA_ARGS__)
+#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
+	__v4l2_subdev_state_get_compose(state, pad, 0)
+struct v4l2_rect *
+__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
+				unsigned int pad, u32 stream);
+
 #ifdef CONFIG_MEDIA_CONTROLLER
 
 /**
@@ -1394,85 +1473,6 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
 	return sd->active_state;
 }
 
-/*
- * A macro to generate the macro or function name for sub-devices state access
- * wrapper macros below.
- */
-#define __v4l2_subdev_state_gen_call(NAME, _1, ARG, ...)	\
-	__v4l2_subdev_state_get_ ## NAME ## ARG
-
-/**
- * v4l2_subdev_state_get_format() - Get pointer to a stream format
- * @state: subdevice state
- * @pad: pad id
- * @...: stream id (optional argument)
- *
- * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
- * stream in the subdev state.
- *
- * For stream-unaware drivers the format for the corresponding pad is returned.
- * If the pad does not exist, NULL is returned.
- */
-/*
- * Wrap v4l2_subdev_state_get_format(), allowing the function to be called with
- * two or three arguments. The purpose of the __v4l2_subdev_state_get_format()
- * macro below is to come up with the name of the function or macro to call,
- * using the last two arguments (_stream and _pad). The selected function or
- * macro is then called using the arguments specified by the caller. A similar
- * arrangement is used for v4l2_subdev_state_crop() and
- * v4l2_subdev_state_compose() below.
- */
-#define v4l2_subdev_state_get_format(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(format, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
-#define __v4l2_subdev_state_get_format_pad(state, pad)	\
-	__v4l2_subdev_state_get_format(state, pad, 0)
-struct v4l2_mbus_framefmt *
-__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
-			       unsigned int pad, u32 stream);
-
-/**
- * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
- * @state: subdevice state
- * @pad: pad id
- * @...: stream id (optional argument)
- *
- * This returns a pointer to crop rectangle for the given pad + stream in the
- * subdev state.
- *
- * For stream-unaware drivers the crop rectangle for the corresponding pad is
- * returned. If the pad does not exist, NULL is returned.
- */
-#define v4l2_subdev_state_get_crop(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(crop, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
-#define __v4l2_subdev_state_get_crop_pad(state, pad)	\
-	__v4l2_subdev_state_get_crop(state, pad, 0)
-struct v4l2_rect *
-__v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream);
-
-/**
- * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
- * @state: subdevice state
- * @pad: pad id
- * @...: stream id (optional argument)
- *
- * This returns a pointer to compose rectangle for the given pad + stream in the
- * subdev state.
- *
- * For stream-unaware drivers the compose rectangle for the corresponding pad is
- * returned. If the pad does not exist, NULL is returned.
- */
-#define v4l2_subdev_state_get_compose(state, pad, ...)			\
-	__v4l2_subdev_state_gen_call(compose, ##__VA_ARGS__, , _pad)	\
-		(state, pad, ##__VA_ARGS__)
-#define __v4l2_subdev_state_get_compose_pad(state, pad)	\
-	__v4l2_subdev_state_get_compose(state, pad, 0)
-struct v4l2_rect *
-__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
-				unsigned int pad, u32 stream);
-
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 /**
-- 
2.39.2


