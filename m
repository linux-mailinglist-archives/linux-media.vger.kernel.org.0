Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844FD7D7D3E
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 09:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbjJZHDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 03:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234828AbjJZHDq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 03:03:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CC8192
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698303822; x=1729839822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Osxle8q2vUO3lqUdPp/IND/sAhxVn0QyyeX/M5fhu5Y=;
  b=JOrDU1SrvoDqYCEcr2oebZROoNO/2KelvONtpxXo71oDwL9xwejS+8Me
   jCS9L59YpaKd3hsAdlLdoZWu58TTZfgDG0IQcn1f0Dn/ag21vo3cZztDx
   RJV02/yWbM9vLEUWWPy3TsJkuGRc/hADUxVGDnYCd3lRQL7OAiD7oWZVY
   S68RmjPjfQTNAKmJwoUdamPgWdnk/OGgtqeHKbOVMcKsy9/Ob84c4K+Jv
   lBxjzUJERR8hW4oE0FfI5Q12nWrWj1wQG+4XzDSIbmFyDj1wYyCVglKpY
   tLO6ixTy015PXSkUSQQTM8811fnnh1gEXLZnmTpvSntBB36TLVT37s8DQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451711541"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="451711541"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="902795795"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="902795795"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:01:15 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D68321207CA;
        Thu, 26 Oct 2023 10:03:36 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v4 5/9] media: v4l: subdev: Make stream argument optional in state access functions
Date:   Thu, 26 Oct 2023 10:03:25 +0300
Message-Id: <20231026070329.948847-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
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

The sub-device state access functions take three arguments: sub-device
state, pad and stream. The stream is not relevant for the majority of
drivers and having to specify 0 for the stream is considered a nuisance.

Provide a two-argument macros for these state access functions to cover
the needs of stream-unaware users.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 18 +++++-----
 include/media/v4l2-subdev.h           | 48 ++++++++++++++++++++++-----
 2 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 2a615836c1d4..9d4ff9b4fcec 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1671,8 +1671,8 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
 
 struct v4l2_mbus_framefmt *
-v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream)
+__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
+				      unsigned int pad, u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1706,11 +1706,11 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_format);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_format_stream);
 
 struct v4l2_rect *
-v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
-			   u32 stream)
+__v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
+				    unsigned int pad, u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1744,11 +1744,11 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_crop);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_crop_stream);
 
 struct v4l2_rect *
-v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
-			      u32 stream)
+__v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
+				       unsigned int pad, u32 stream)
 {
 	struct v4l2_subdev_stream_configs *stream_configs;
 	unsigned int i;
@@ -1782,7 +1782,7 @@ v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
 
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_compose);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_state_get_compose_stream);
 
 int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
 					  u32 pad, u32 stream, u32 *other_pad,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 71cb35133b4a..ebb3373b431a 100644
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
@@ -1553,15 +1553,31 @@ int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
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
+	__v4l2_subdev_state_get_format(__VA_ARGS__,			\
+				       _stream, _pad)(__VA_ARGS__)
+#define __v4l2_subdev_state_get_format(_1, _2, _3, ARG, ...)	\
+	__v4l2_subdev_state_get_format ## ARG
+#define __v4l2_subdev_state_get_format_pad(state, pad)		\
+	__v4l2_subdev_state_get_format_stream(state, pad, 0)
 struct v4l2_mbus_framefmt *
-v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
-			     u32 stream);
+__v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
+				      unsigned int pad, u32 stream);
 
 /**
  * v4l2_subdev_state_get_crop() - Get pointer to a stream crop rectangle
  * @state: subdevice state
  * @pad: pad id
- * @stream: stream id
+ * @...: stream id (optional argument)
  *
  * This returns a pointer to crop rectangle for the given pad + stream in the
  * subdev state.
@@ -1569,15 +1585,22 @@ v4l2_subdev_state_get_format(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the crop rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_crop(...)					\
+	__v4l2_subdev_state_get_crop(__VA_ARGS__,			\
+				     _stream, _pad)(__VA_ARGS__)
+#define __v4l2_subdev_state_get_crop(_1, _2, _3, ARG, ...)	\
+	__v4l2_subdev_state_get_crop ## ARG
+#define __v4l2_subdev_state_get_crop_pad(state, pad)		\
+	__v4l2_subdev_state_get_crop_stream(state, pad, 0)
 struct v4l2_rect *
-v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
-			   u32 stream);
+__v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
+				    unsigned int pad, u32 stream);
 
 /**
  * v4l2_subdev_state_get_compose() - Get pointer to a stream compose rectangle
  * @state: subdevice state
  * @pad: pad id
- * @stream: stream id
+ * @...: stream id (optional argument)
  *
  * This returns a pointer to compose rectangle for the given pad + stream in the
  * subdev state.
@@ -1585,9 +1608,16 @@ v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
  * For stream-unaware drivers the compose rectangle for the corresponding pad is
  * returned. If the pad does not exist, NULL is returned.
  */
+#define v4l2_subdev_state_get_compose(...)				\
+	__v4l2_subdev_state_get_compose(__VA_ARGS__,		\
+					_stream, _pad)(__VA_ARGS__)
+#define __v4l2_subdev_state_get_compose(_1, _2, _3, ARG, ...)	\
+	__v4l2_subdev_state_get_compose ## ARG
+#define __v4l2_subdev_state_get_compose_pad(state, pad)		\
+	__v4l2_subdev_state_get_compose_stream(state, pad, 0)
 struct v4l2_rect *
-v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state, unsigned int pad,
-			      u32 stream);
+__v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
+				       unsigned int pad, u32 stream);
 
 /**
  * v4l2_subdev_routing_find_opposite_end() - Find the opposite stream
-- 
2.39.2

