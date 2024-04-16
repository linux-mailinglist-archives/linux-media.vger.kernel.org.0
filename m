Return-Path: <linux-media+bounces-9587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D068A74F8
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2B642840E0
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E66139CF6;
	Tue, 16 Apr 2024 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1l8ZGbo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A0713B2B9
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296058; cv=none; b=OYi4OBlHPCYp50KryJ2JbdKxMYmG/xnie8d64uvPy+DZLWND84VJuLYDfIIT/41TuVcLgWQEdjd7WwJ5lL0ySK1iTX+moM3HRo62i2mRTYDmcRewAYGmTdqc80RntWHkrXgwVEWTdveTuN6qVlcdmXMlqX7syYz1Q5eyKD4gIwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296058; c=relaxed/simple;
	bh=KtWTNYs3S1+1R24cPYsU9UGlREtHrZ7YrJ1oxem5NzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GLa2igh5M0y9afx1ia5x9sX9SAt3Sh336G44o+FNBWtk+fXyeqxlAnSMz4oLFVplOKnRxJBLgjItwcnbIpvJa4VkCJdRMgTd+ka16MHdltEThRgr2pxMEK8BTargQsf/a6g+tkwqpGJm40pVwh74pz+BMP2U43mYv/QzMmLSHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1l8ZGbo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296057; x=1744832057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KtWTNYs3S1+1R24cPYsU9UGlREtHrZ7YrJ1oxem5NzI=;
  b=T1l8ZGboyZr3ElkqGfy6NCBTHmOj+hMx0RgedVEKCg8fxzX7NARN1gFm
   hFW7bKEM6y+5I7EjqVdRyYZJ1kz0QSI/jk3cb/K0Q1EMyMzhpQeVNiJaW
   DsnF4JRhyuo8Z1QEYY4NhYC5eekeGWjqSRXTvGX1rYnXSOhpYsVJV+edG
   5OxOI7Fa+kwSa0K9ykWPWg36nEqvsZtkzM26lD/d6GVrHj0Zdm9/aXPaM
   r3+MFoWq85MVVuVUqquwsCa95dMkT1AC0vkt9yOmhqCT2nmJtjZPU1fyW
   8m6Wz32XRbgN3zYzZBMWUFl0p5FtyxJ86wsepyn2wZCFtD4QrUJgSoszP
   A==;
X-CSE-ConnectionGUID: CaZvxtqlRuWgOo3NTohwYw==
X-CSE-MsgGUID: OtKynXl0RCG1sDeuPEhn6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929877"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929877"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:16 -0700
X-CSE-ConnectionGUID: GV9m8k6vRmCaGP69g7jU5w==
X-CSE-MsgGUID: UHvOVpTNS/2EJJlHVN6OkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380255"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:13 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 535941204F6;
	Tue, 16 Apr 2024 22:34:10 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 35/46] media: ccs: Remove which parameter from ccs_propagate
Date: Tue, 16 Apr 2024 22:33:08 +0300
Message-Id: <20240416193319.778192-36-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_propagate() no longer stores information in the driver's context
struct. The which parameter can thus be removed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 541faa7d84a6..0f68e64a4042 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2288,8 +2288,7 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state, int which,
-			  int target)
+			  struct v4l2_subdev_state *sd_state, int target)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
@@ -2498,7 +2497,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->top = 0;
 	crop->width = fmt->format.width;
 	crop->height = fmt->format.height;
-	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -2706,7 +2705,7 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop);
 
 	*comp = sel->r;
-	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_COMPOSE);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ccs_pll_blanking_update(sensor);
@@ -2797,7 +2796,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
-		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
+		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -3316,7 +3315,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		v4l2_subdev_state_get_format(sd_state, pad, CCS_STREAM_PIXEL);
 	struct v4l2_rect *crop =
 		v4l2_subdev_state_get_crop(sd_state, pad, CCS_STREAM_PIXEL);
-	bool is_active = !sd->active_state || sd->active_state == sd_state;
 
 	ccs_get_native_size(ssd, crop);
 
@@ -3334,7 +3332,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
 
-	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
+	ccs_propagate(sd, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
-- 
2.39.2


