Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECCC7D3E20
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbjJWRoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233936AbjJWRo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:44:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19DBD7B
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698083066; x=1729619066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TNh4U/gNgQ7CepcIjVgXGVfTE20YSdp9IFLP6IGVS4E=;
  b=Y6LzlOrO4g+53qH+q1oRx8cJBDG9d7VOi8gw5+lSHUlx28Ih0g61/8MP
   r7z50ZQSrZfGgZKZ5RLQ8DbhwQ6u90/j0DVqYrlIWqvRBBB8xNkYwcC9I
   YMwglBf5XKzGUkBPHjkWbZmIdwlSfno4HSZhtGg6zhx9H9CvwfhZGlR9m
   ZPJEXM7sMYqxhplBc7r+GSMQhB0yTpdAv589tstLtaapwtjcZzEofIrve
   WZ7OBPEuMf4dufgYavJexdgfcrvnoXfTdIjh1sXB0IF6HFcTtVAVLcYXY
   ZLHeCeTeSqt5l7fDpooU3Sj2yWyjrRXqPxran3artOy3U/H8cNk98H2FM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366238834"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366238834"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751702628"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="751702628"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:44:20 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BDD7411F82E;
        Mon, 23 Oct 2023 20:44:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: [PATCH v3 5/8] media: v4l: subdev: Make stream argument optional in state access functions
Date:   Mon, 23 Oct 2023 20:44:05 +0300
Message-Id: <20231023174408.803874-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sub-device state access functions take three arguments: sub-device
state, pad and stream. The stream is not relevant for the majority of
drivers and having to specify 0 for the stream is considered a nuisance.

Provide a two-argument macros for these state access functions to cover
the needs of stream-unaware users.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 ++++++-------
 include/media/v4l2-subdev.h           | 39 ++++++++++++++++++++-------
 2 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f0f0af48730f..e35226587244 100644
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
@@ -1702,11 +1702,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
 
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
@@ -1736,11 +1736,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 
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
@@ -1770,7 +1770,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose);
 
 int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
 					  u32 pad, u32 stream, u32 *other_pad,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 71cb35133b4a..12eb0fe746d7 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1545,7 +1545,7 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  * v4l2_subdev_state_get_format() - Get pointer to a stream format
  * @state: subdevice state
  * @pad: pad id
- * @stream: stream id
+ * @...: stream id (optional argument)
  *
  * This returns a pointer to &struct v4l2_mbus_framefmt for the given pad +
  * stream in the subdev state.
@@ -1553,15 +1553,22 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
  * For stream-unaware drivers the format for the corresponding pad is returned.
  * If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_format(state, pad, ...)         \
+        __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
+        (state, pad __VA_OPT__(,) __VA_ARGS__)
+#define __v4l2_subdev_state_get_format_(state, pad)     \
+        __v4l2_subdev_state_get_format(state, pad, 0)
+#define __v4l2_subdev_state_get_format_stream(state, pad, stream)	\
+        __v4l2_subdev_state_get_format(state, pad, stream)
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
@@ -1569,15 +1576,22 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the crop rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_crop(state, pad, ...)         \
+        __v4l2_subdev_state_get_crop_ ## __VA_OPT__(stream) \
+        (state, pad __VA_OPT__(,) __VA_ARGS__)
+#define __v4l2_subdev_state_get_crop_(state, pad)	\
+        __v4l2_subdev_state_get_crop(state, pad, 0)
+#define __v4l2_subdev_state_get_crop_stream(state, pad, stream)	\
+        __v4l2_subdev_state_get_crop(state, pad, stream)
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
@@ -1585,9 +1599,16 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the compose rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_compose(state, pad, ...)         \
+        __v4l2_subdev_state_get_compose_ ## __VA_OPT__(stream) \
+        (state, pad __VA_OPT__(,) __VA_ARGS__)
+#define __v4l2_subdev_state_get_compose_(state, pad)	\
+        __v4l2_subdev_state_get_compose(state, pad, 0)
+#define __v4l2_subdev_state_get_compose_stream(state, pad, stream)	\
+        __v4l2_subdev_state_get_compose(state, pad, stream)
 struct v4l2_rect *
-v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
-			      u32 stream);
+__v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
+				unsigned int pad, u32 stream);
 
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
-- 
2.39.2

