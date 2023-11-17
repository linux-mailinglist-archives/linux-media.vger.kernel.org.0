Return-Path: <linux-media+bounces-481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D627EEFD6
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4777E281292
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAA319447;
	Fri, 17 Nov 2023 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7jVBMvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93725D5
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215946; x=1731751946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/wxe/3cg768JlfDdnKpREAcRq3+8WlsTO32ldl4EHo=;
  b=U7jVBMvjLbjOitEnLjbpWU1IjygbvejcqShXp4pu4EO6oqnxOzCaP3ax
   XGuRTm3gvvTDep0CcOPkjtpCN7po8qiw9u7vurXh5AOqlHX8/gIrwNGGg
   YHZhexzmWviszMySdG47Vf/HHaX9J8ePOwffRvDkcRpNSIh0nBrWbZGZY
   J7hCE+rWt2sjn7jKwnCWmXGlAnhwLzJQgv2TBLxzPqJfgcDrXyqqbqm8y
   ZMq4alxT3Oun/RKhQYaFnTxvfKVtJrALVDQTV49Ed3fI3NMxeHTl6sYB7
   voRSOOI2iqyN3OqsUEePMsV8XIVZr3AJYEYcsVcJFINZcI6HJ/Jy19oN/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457771974"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457771974"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715494863"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715494863"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:21 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 76574120FE0;
	Fri, 17 Nov 2023 12:12:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r3vpG-005cAO-0s;
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
Subject: [PATCH v9 8/9] media: v4l: subdev: Remove stream-unaware sub-device state access
Date: Fri, 17 Nov 2023 12:11:38 +0200
Message-Id: <20231117101140.1338288-9-sakari.ailus@linux.intel.com>
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

Remove stream-unaware sub-device state access functions and macros. These
are no longer used.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[Sakari Ailus: Resolve a minor conflict in removed code.]
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 77 -------------------------------------
 1 file changed, 77 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 80744d87bae4..2a438e516095 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1137,83 +1137,6 @@ struct v4l2_subdev_fh {
 #define to_v4l2_subdev_fh(fh)	\
 	container_of(fh, struct v4l2_subdev_fh, vfh)
 
-#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-
-/**
- * v4l2_subdev_get_pad_format - ancillary routine to get
- *	&struct v4l2_subdev_pad_config->format
- *
- * @sd: pointer to &struct v4l2_subdev
- * @state: pointer to &struct v4l2_subdev_state
- * @pad: index of the pad in the &struct v4l2_subdev_state->pads array
- */
-static inline struct v4l2_mbus_framefmt *
-v4l2_subdev_get_pad_format(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state,
-			   unsigned int pad)
-{
-	if (WARN_ON(!state))
-		return NULL;
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &state->pads[pad].format;
-}
-
-/**
- * v4l2_subdev_get_pad_crop - ancillary routine to get
- *	&struct v4l2_subdev_pad_config->crop
- *
- * @sd: pointer to &struct v4l2_subdev
- * @state: pointer to &struct v4l2_subdev_state.
- * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
- */
-static inline struct v4l2_rect *
-v4l2_subdev_get_pad_crop(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *state,
-			 unsigned int pad)
-{
-	if (WARN_ON(!state))
-		return NULL;
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &state->pads[pad].crop;
-}
-
-/**
- * v4l2_subdev_get_pad_compose - ancillary routine to get
- *	&struct v4l2_subdev_pad_config->compose
- *
- * @sd: pointer to &struct v4l2_subdev
- * @state: pointer to &struct v4l2_subdev_state.
- * @pad: index of the pad in the &struct v4l2_subdev_state->pads array.
- */
-static inline struct v4l2_rect *
-v4l2_subdev_get_pad_compose(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *state,
-			    unsigned int pad)
-{
-	if (WARN_ON(!state))
-		return NULL;
-	if (WARN_ON(pad >= sd->entity.num_pads))
-		pad = 0;
-	return &state->pads[pad].compose;
-}
-
-/*
- * Temprary helpers until uses of v4l2_subdev_get_try_* functions have been
- * renamed
- */
-#define v4l2_subdev_get_try_format(sd, state, pad) \
-	v4l2_subdev_get_pad_format(sd, state, pad)
-
-#define v4l2_subdev_get_try_crop(sd, state, pad) \
-	v4l2_subdev_get_pad_crop(sd, state, pad)
-
-#define v4l2_subdev_get_try_compose(sd, state, pad) \
-	v4l2_subdev_get_pad_compose(sd, state, pad)
-
-#endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
-
 extern const struct v4l2_file_operations v4l2_subdev_fops;
 
 /**
-- 
2.39.2


