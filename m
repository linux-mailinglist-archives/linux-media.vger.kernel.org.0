Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E8E7E2131
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjKFMSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjKFMSY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:18:24 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814461701
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273098; x=1730809098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uv/Kb8/Ps4/8o1z6vJVBnj8m4yf/O3Td1ixzT8vjozE=;
  b=LxmK90YRIuTQ8+JuE/84Ox7qAoFhxEJilJWweTicpA/pmNmH7PHe32Yx
   lVbF0/SXpIonjYhsPBle86sJSUq7FDGCupDkfbJLaMIzHgoSq5chmM2jp
   GBBrsb5gi2da0woXlfmwSUzwjJw5Llt9aVZ2vxD4vfY5TaRifOpZPDUel
   13nNOx73EgrUz3ALaDM2ViKZyl3zrDl78AZotGUHSPvNAvHKgM7RXTxsG
   +plGcKXsYCFymkuKqsjRZ7kH1oMv3x+g93ORoHSCig0KihMpXEIIGr6sW
   UsmIcwjvbJ9oJkwVsInqPO6Sl+OsKM9YEg97WP95osk6paEkoMAwd7db/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420375266"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420375266"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828192174"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="828192174"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:18:14 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8877612061D;
        Mon,  6 Nov 2023 14:18:11 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v6 5/8] media: v4l: subdev: Make stream argument optional in state access functions
Date:   Mon,  6 Nov 2023 14:18:02 +0200
Message-Id: <20231106121805.1266696-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
References: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 +++++------
 include/media/v4l2-subdev.h           | 46 +++++++++++++++++++++------
 2 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 76e1a002fcdd..bae932134cfc 100644
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
index 71cb35133b4a..bd0b97ffb87f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1541,11 +1541,18 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
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
@@ -1553,15 +1560,28 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
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
@@ -1569,15 +1589,19 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
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
@@ -1585,9 +1609,13 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
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

