Return-Path: <linux-media+bounces-50788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9132D24991
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1E613061DFC
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B9339B4BE;
	Thu, 15 Jan 2026 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0olpLwN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E100239900F
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481186; cv=none; b=p0IZb1NMZ7AXFB8Kyx/TG2YZTaYchEmBS5FRNv0JL0gT+Z78MXhbUUvd75weuaTAyzkxSCV+AbqQIgH2Lki5lDm+OEGVSXwQcU7oWRgfpnRwGBiKdwJB7pnMpKuHQOG4c/XWZsHrAZNqZZLPozCztCFGnMISeecIGkDuW1ykK7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481186; c=relaxed/simple;
	bh=k0D1PJ1/Qxkx5IJBO8v/M3eFInUXN8d9UUnE7yhJqBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0IbtgXqqvXx7zG9Y6UyNzh7ZgbNjMNHIbC+JAR31fNS2/phMqpmLwt3hsm3t2BGTDID2PSIH3o1o5GxaSmHLoaaqi2mtPmzakiHO9MLYtrWdKhiyWvqzXSg6mI7UvfONzZ89qUGHYLn0A0bMCmDo5UpjI5De+0nfwmToJQ/Xyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0olpLwN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481184; x=1800017184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k0D1PJ1/Qxkx5IJBO8v/M3eFInUXN8d9UUnE7yhJqBI=;
  b=I0olpLwNSt0bLIVPVNIp9BRztt2u7wiMgNc3BnXugsubF4k1XvfLNocP
   HyM+tT+Lc2864KatNdG6KLD3LDAb6eXPBIVKEJ0WfPNuh+lC/zzY9mMmc
   db52VG3HgMmUgEP9OSM4q1n0aAa0TPjrXU4VJJSHo5T/de0YPlHbCbMrb
   bOGKq/tR6U556cqchLaw8zvLZVGbCmSSgTsVQjYJRiz0wjxG4b3zVTe5s
   JU+fpB8yuaggANDOn76K05s3Ld3TbQCMqwYMw5yeVrN2PLclewMo+gPJF
   Uxk4ZBLTcOZuEgvXt3fbQNQ2hvYegykIbkqAeHotsJ6XP6Bx+4zltb4Ww
   Q==;
X-CSE-ConnectionGUID: osySfm8GQJKdNHVKVKhE+g==
X-CSE-MsgGUID: kKGYApCtSE2VbYY/ScY46A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80428317"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80428317"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:20 -0800
X-CSE-ConnectionGUID: jhhZHfLFTKW8yo+N6WKpgg==
X-CSE-MsgGUID: N3TYkNxCR/qX1xBULHwteA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204980459"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.213])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:18 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 01BE1121D87;
	Thu, 15 Jan 2026 14:46:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgMjs-00000000UMO-3aYP;
	Thu, 15 Jan 2026 14:46:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH 5/7] media: ccs: Remove which parameter from ccs_propagate
Date: Thu, 15 Jan 2026 14:46:10 +0200
Message-ID: <20260115124612.116663-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
References: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
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
index e60a8aff5454..a3f04b87cf7c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2157,8 +2157,7 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state, int which,
-			  int target)
+			  struct v4l2_subdev_state *sd_state, int target)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
@@ -2279,7 +2278,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->top = 0;
 	crop->width = fmt->format.width;
 	crop->height = fmt->format.height;
-	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -2488,7 +2487,7 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop);
 
 	*comp = sel->r;
-	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_COMPOSE);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ccs_pll_blanking_update(sensor);
@@ -2572,7 +2571,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
-		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
+		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -3078,7 +3077,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		v4l2_subdev_state_get_format(sd_state, pad);
 	struct v4l2_rect *crop =
 		v4l2_subdev_state_get_crop(sd_state, pad);
-	bool is_active = !sd->active_state || sd->active_state == sd_state;
 
 	mutex_lock(&sensor->mutex);
 
@@ -3097,7 +3095,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
 
-	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
+	ccs_propagate(sd, sd_state, V4L2_SEL_TGT_CROP);
 
 	mutex_unlock(&sensor->mutex);
 
-- 
2.47.3


