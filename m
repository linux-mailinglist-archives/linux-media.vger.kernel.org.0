Return-Path: <linux-media+bounces-6965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383787A388
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B24A11F22177
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CAC17575;
	Wed, 13 Mar 2024 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0rnm8kF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5C224E4
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314767; cv=none; b=EM8c6l4nrzZfRJHYOwqIuQg82bxoyXfHVTdVikOUrOyFPv9EIHePwCRslw3vkcSxeqaGgrIhW1Qx2OQtOlFwq5kS0e5P49wXOHtcPcyhblIDiQegmT3gsYYUo47XpR99UCneigVzactYUe3rJpmynRnvpsHifk+193DILLRhTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314767; c=relaxed/simple;
	bh=pYTWO24s6cCPeQPcqd7ftIku8DtYThGXx0bzZrDWyB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M31KJ4cTvzHp+G71f+/Cv7enE+REuuIeGKhFm2oFtaY9cvvpUq5KCn4+V62GeGB8utItrO+Gy2wI7cG0+sJe+lE3Z7XoiGai4I0W0c/GtCIqho1+BvpWaYbj3Q3QFb9LitOs8D7fkNnHr51eh+lmXo9wHfzQ8IWnC/y/Rz2qIvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0rnm8kF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314766; x=1741850766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pYTWO24s6cCPeQPcqd7ftIku8DtYThGXx0bzZrDWyB8=;
  b=V0rnm8kF2D4qxXfUxoTlxu0T2hkX3TV8vzhwXhxXxvw3yhOIAZIDkd0p
   m+f20FTCVMH0bN2hgtONz40rf+jQWcvtCb8Oi5sCY78pw3bR1EoLU5XyZ
   tuH1XcuayN9zonwTMEp96fFHdqcz7BHR/e7XwY0I1iV3oO1TwNp2q9XRQ
   DUK+BbKfAYXw6E5crcvoC7QHUwym921XfF+HAWDvam1xEM1+YAQmFhw5w
   0WMCWVTgaAW04CP0PnBHf3ZStPAUp73D2atH6p9Ciy7okht0HgumfCVq8
   b1XW3QOUnwhnvZZnXNYicMumdLDxmOdPW0Q/yWEvS/3TOpsjFUgrvi+4a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909298"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542337"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5B1A711F853;
	Wed, 13 Mar 2024 09:26:00 +0200 (EET)
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
Subject: [PATCH v8 29/38] media: ccs: Remove which parameter from ccs_propagate
Date: Wed, 13 Mar 2024 09:25:07 +0200
Message-Id: <20240313072516.241106-30-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
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
---
 drivers/media/i2c/ccs/ccs-core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a147dbb9f362..838daab212f2 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2304,8 +2304,7 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state, int which,
-			  int target)
+			  struct v4l2_subdev_state *sd_state, int target)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
@@ -2512,7 +2511,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->top = 0;
 	crop->width = fmt->format.width;
 	crop->height = fmt->format.height;
-	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -2727,7 +2726,7 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop, comp);
 
 	*comp = sel->r;
-	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_COMPOSE);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ccs_pll_blanking_update(sensor);
@@ -2817,7 +2816,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
-		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
+		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -3339,7 +3338,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		v4l2_subdev_state_get_format(sd_state, pad, CCS_STREAM_PIXEL);
 	struct v4l2_rect *crop =
 		v4l2_subdev_state_get_crop(sd_state, pad, CCS_STREAM_PIXEL);
-	bool is_active = !sd->active_state || sd->active_state == sd_state;
 
 	ccs_get_native_size(ssd, crop);
 
@@ -3357,7 +3355,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
 
-	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
+	ccs_propagate(sd, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
-- 
2.39.2


