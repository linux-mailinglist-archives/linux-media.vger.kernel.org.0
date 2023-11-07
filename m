Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56C27E46FA
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 18:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343723AbjKGR3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 12:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343668AbjKGR3W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 12:29:22 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C43101
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 09:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699378160; x=1730914160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O6xPw/kA5PguouJkj7cYwbeI5QVxTeFOqfbXMHKncc8=;
  b=R7AEoRYdHjp+HM9OqJ3ChY+kEeOO2mAqtKdPZHCNJeB+6TUuIRmAR25S
   xxpijhJdjQlP7R3ceUCDTr4gE/94IozB7rFtuikW1al8dyjnliva35C/Y
   g6QVhXm88tfxjghnWGF+G7TPJy/dgCokn/PGTWQTB1EFoVOYq1yr+ZiG+
   H3Rr18vq1OYNb0iFtY9rERsK8+fsjJ9LMJjaotgBjmmKhprx8iD5UqSWf
   JDHWizTV6Sp68ogAw4D75YehIrqA4jKh6Pj0Wc9qCTNG4BWR8yAhfforq
   yOlhZgkZoLzYScJJglrXcnOisBuunL9ET/Mt1JQORGGdzBjmdebM+olGk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389368920"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="389368920"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853441154"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="853441154"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:15 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7E7181202B6;
        Tue,  7 Nov 2023 19:29:12 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 5/8] media: v4l: subdev: Make stream argument optional in state access functions
Date:   Tue,  7 Nov 2023 19:28:58 +0200
Message-Id: <20231107172901.1302019-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107172901.1302019-1-sakari.ailus@linux.intel.com>
References: <20231107172901.1302019-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sub-device state access functions take three arguments: sub-device
state, pad and stream. The stream is not relevant for the majority of
drivers and having to specify 0 for the stream is considered a nuisance.

Provide a two-argument macros for these state access functions to cover
the needs of stream-unaware users.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 +++++------
 include/media/v4l2-subdev.h           | 46 +++++++++++++++++++++------
 2 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 44341f0a8aa2..5298226b6a4d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1671,8 +1671,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
 
 struct v4l2_mbus_framefmt *
-v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream)
+__v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
+			       unsigned int pad, u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1710,11 +1710,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
 
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
@@ -1752,11 +1752,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 
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
@@ -1794,7 +1794,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
 
 int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
 					  u32 pad, u32 stream, u32 *other_pad,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f144d49a825c..6b34a4afba77 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1534,11 +1534,18 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 				     const struct v4l2_subdev_krouting *routing,
 				     const struct v4l2_mbus_framefmt *fmt);
 
+/*
+ * A macro to generate the macro or function name for sub-devices state access
+ * wrapper macros below.
+ */
+#define __v4l2_subdev_state_gen_call(NAME, _1, _2, _3, ARG, ...)	\
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
@@ -1546,15 +1553,28 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
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
+#define v4l2_subdev_state_get_format(...)				\
+	__v4l2_subdev_state_gen_call(format, __VA_ARGS__, , _pad)(__VA_ARGS__)
+#define __v4l2_subdev_state_get_format_pad(state, pad)		\
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
@@ -1562,15 +1582,19 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the crop rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_crop(...)					\
+	__v4l2_subdev_state_gen_call(crop, __VA_ARGS__, , _pad)(__VA_ARGS__)
+#define __v4l2_subdev_state_get_crop_pad(state, pad)		\
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
@@ -1578,9 +1602,13 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the compose rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_compose(...)				\
+	__v4l2_subdev_state_gen_call(compose, __VA_ARGS__, , _pad)(__VA_ARGS__)
+#define __v4l2_subdev_state_get_compose_pad(state, pad)		\
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

