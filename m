Return-Path: <linux-media+bounces-9590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6BD8A74FB
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04B96B221C8
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D04013BAFA;
	Tue, 16 Apr 2024 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wf9C/9Dz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC413B7A4
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296062; cv=none; b=Mkk5QSbDq2qJbQUe9/mVie0jXRYLOlkm4ApfGL8IfKWxwKCXpXR6MpI4QKGdBKtbBNSxN1zkPDiWpeOtLLPiqwmcIjt0semLyCg+FnDoZPTV/B7EzuNyMm4s59h2eBLPSzdUBQ0csD9aSvntazzQ9KY14QAzPh7vXFJNLScmj4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296062; c=relaxed/simple;
	bh=acCpd9amcw27N+BAvj5e+qX02/JuIUEeeHqfvajd/1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nk8gnHMa7cQY2ws3pNRki11P2kkA8h2kyBCMyFWcXJXvqc6K/eOMW8irlGcwxsVPHTfN5t9oEtM9azX1x3hE67fAIJjOPetr+p5DT4Ppw+JV8K3mSvHBxLebvoWqRuwwWFVPT3l39uGpiMgI52G5v1CPE+ihTMjoDvG1khdsjzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wf9C/9Dz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296061; x=1744832061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=acCpd9amcw27N+BAvj5e+qX02/JuIUEeeHqfvajd/1E=;
  b=Wf9C/9DzWj1vEmSCrakMV+OmpxOqd3iHu5uqsRwQXV0kESCznmlabvlU
   KhfIofy40cNjHVJEW4SpyHHl7zfjnXSOCvmeby63V7vjyi7SoZ5a3HZzB
   SJpVB4etDBQatUVuCvhqzO7NInbGWVZW4O9AzzpTirPSM7QnGrChxkl8+
   OhnljJMWvBANDZurWgEizJKopgI5SaKmANp4tnkyUl/1LC7JXSXuaBii/
   AFXTVQ8xxtOvS07rPdot9AACQAkC9ge65nUeFXJSo3R6GTkio0RoJDwOk
   H41JCD/BlcUVYpQDRhDDkC+48bKRzRtI6vxyye+BeXE+45zgHHtlQvnU1
   Q==;
X-CSE-ConnectionGUID: XbbBrehxTsO1clpEUEjvUA==
X-CSE-MsgGUID: 95fex9gaT+KKYENzzuCHdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929893"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:21 -0700
X-CSE-ConnectionGUID: 8O/dFcwlSQu4Cn99LkyDSQ==
X-CSE-MsgGUID: JInbr9LWTzGn/6OZRi4uDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380272"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:18 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A6CAB11F879;
	Tue, 16 Apr 2024 22:34:14 +0300 (EEST)
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
Subject: [PATCH v9 38/46] media: ov2740: Remove shorthand variables
Date: Tue, 16 Apr 2024 22:33:11 +0300
Message-Id: <20240416193319.778192-39-sakari.ailus@linux.intel.com>
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

Remove two variables in ov2740_init_control() that are used as a shorthand
for where the information is really located. Make the code more readable
by removing them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 57906df7be4e..196a111516b0 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -754,10 +754,8 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
 static int ov2740_init_controls(struct ov2740 *ov2740)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const struct ov2740_mode *cur_mode;
 	s64 exposure_max, h_blank, pixel_rate;
 	u32 vblank_min, vblank_max, vblank_default;
-	int size;
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
@@ -765,12 +763,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	if (ret)
 		return ret;
 
-	cur_mode = ov2740->cur_mode;
-	size = ARRAY_SIZE(link_freq_menu_items);
-
 	ov2740->link_freq =
 		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
-				       V4L2_CID_LINK_FREQ, size - 1,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(link_freq_menu_items) - 1,
 				       ov2740->supported_modes->link_freq_index,
 				       link_freq_menu_items);
 	if (ov2740->link_freq)
@@ -781,14 +777,14 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 					       V4L2_CID_PIXEL_RATE, 0,
 					       pixel_rate, 1, pixel_rate);
 
-	vblank_min = cur_mode->vts_min - cur_mode->height;
-	vblank_max = cur_mode->vts_max - cur_mode->height;
-	vblank_default = cur_mode->vts_def - cur_mode->height;
+	vblank_min = ov2740->cur_mode->vts_min - ov2740->cur_mode->height;
+	vblank_max = ov2740->cur_mode->vts_max - ov2740->cur_mode->height;
+	vblank_default = ov2740->cur_mode->vts_def - ov2740->cur_mode->height;
 	ov2740->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_VBLANK, vblank_min,
 					   vblank_max, 1, vblank_default);
 
-	h_blank = cur_mode->hts - cur_mode->width;
+	h_blank = ov2740->cur_mode->hts - ov2740->cur_mode->width;
 	ov2740->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_HBLANK, h_blank, h_blank, 1,
 					   h_blank);
@@ -801,7 +797,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
 			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
-	exposure_max = cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
+	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     OV2740_EXPOSURE_MIN, exposure_max,
-- 
2.39.2


