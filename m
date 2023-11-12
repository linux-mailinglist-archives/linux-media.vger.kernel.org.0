Return-Path: <linux-media+bounces-160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 494BC7E927A
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 21:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08FCF280AAF
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 20:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA84818640;
	Sun, 12 Nov 2023 20:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JthKXFdj"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6194C182AE
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 20:21:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252D22129
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 12:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699820499; x=1731356499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KzEpdX8/lXNAdYCUZy0mHKkNhiW5pii7oS37OAkH3jw=;
  b=JthKXFdjL6q/zn8/2Orrk3RHxxtK6ThX038eCqNdM2PYwtmO9lh3cNFe
   i9m6P6hMTLtugcnADVk3k6hP0Ssa6EEV+I1efhejVNesCJ0Z2F3lNwie9
   AivITUUQ1t/hEhKtdYupQb6gOuoeUL8dpgOReZX4/KgYNZGIA1bHCo6Wy
   QYR8T+RJ5nfPs70FV4R1gF1mRdW2jeyK+jOxOKDWr5CQMQXPsbgaOXfvN
   ZD7ZANBMPcEF3uzCyKYJ8ilOPm2IepZuFQ10y1QupbiC9rBcxcqVHnrJ1
   2a3ECoZDhlrrLGU8Jol+fGYd57GmxYCrotuMjaqkzH2DxeZJr+af3JlAo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="393217625"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="393217625"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="764177650"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="764177650"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:21:35 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 85B9F120B86;
	Sun, 12 Nov 2023 21:57:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r2GZl-0045dM-0f;
	Sun, 12 Nov 2023 21:56:57 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 8/9] media: v4l: subdev: Remove stream-unaware sub-device state access
Date: Sun, 12 Nov 2023 21:56:46 +0200
Message-Id: <20231112195647.974904-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231112195647.974904-1-sakari.ailus@linux.intel.com>
References: <20231112195647.974904-1-sakari.ailus@linux.intel.com>
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
index a26cb1e454d2..33c8e5c93a3d 100644
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


