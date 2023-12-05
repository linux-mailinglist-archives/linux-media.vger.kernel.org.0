Return-Path: <linux-media+bounces-1666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E97AB805400
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BA4C1F214D3
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6FE5B5A9;
	Tue,  5 Dec 2023 12:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyLLxhMW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645ABD7
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701778990; x=1733314990;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r1gB/yfzec73DnjZ8T/bgLOKdT9Ds3QSSRpAf5WwjlY=;
  b=WyLLxhMWPMxIudrmzQWN8IjJNzUtlOFtIpPDmlgSVF9KwJTDjU++G7No
   G1ntfYujwxWNf5fDDF3FPWbi8S0dNFrE6/8ClaZw0me79N8f6lLrHsEDn
   4p4CEv8BGshyE+YH9isnFA09TXX0fV4LEWLXrvogCMp6VP7uxehx6+ew4
   ordcQwi6JSqmGd2dgpg5WxeC7Mm9sOZAFyNdc/4qbqZDheErKWEt2M8C5
   TiG6kt7scpxzdeZEkpKCGFv24rSJvrBGUoihWJFfa27192otzbxvAL61E
   6Llh1R5huZiaNnwezXtUU2vkECXtowzS1m8UEcR23aJ+nMGNAUpmAW8x+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="728991"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="728991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="17349596"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:23:09 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9495E11F995;
	Tue,  5 Dec 2023 14:23:06 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rAURx-003ff9-0w;
	Tue, 05 Dec 2023 14:22:53 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hverkuil.nl@punajuuri.localdomain
Subject: [PATCH 1/1] media: v4l: Move sub-device state information access function prototypes
Date: Tue,  5 Dec 2023 14:22:43 +0200
Message-Id: <20231205122243.875127-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sub-device state information access function prototypes such as
v4l2_subdev_state_get_format() were conditional to CONFIG_MC even though
the actual implementation was not. Drivers may use the functions without
MC. Fix this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312051913.e5iif8Qz-lkp@intel.com/
Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Not compile tested yet but it should work...

 include/media/v4l2-subdev.h | 158 ++++++++++++++++++------------------
 1 file changed, 79 insertions(+), 79 deletions(-)

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


