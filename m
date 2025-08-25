Return-Path: <linux-media+bounces-40961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701BB33BEF
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2440918856C9
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6333F2D7DDE;
	Mon, 25 Aug 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxITD+wg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB92DAFB1
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115507; cv=none; b=cK5jbzV9D0OnR1jvzf7FMEYysvvO+nAkgXy0QI0MQIEBCoE0MaT7jdAvsoRZCZTvg2SAMJ07In0xoDxN4SXfdrI20ggQGV86l/rEFzW0VxWrX8hMLjRNsp0VR5sEegszU/v8Jdz5Chd6mCQLM8buMtcNS4X9CN0nr7ysG6s9lHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115507; c=relaxed/simple;
	bh=RCZufXhFmPfJorwlGTRfEPT5snAy32ipnEbANrmDMRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkgx7zc3MS0Giz7rrf37ANCTZaeuJj1MKt2hj1jMpFBVgKaIPJOIJeahCcuxRlxwN+H7n66VPXcvjncKitPBu8+c7/7KPKWWyM6fB3RL7KDXLujEjmOPi2InYfv9iqLcZYEtLNf9Iec3jBf1fcaca5RLf7g5TGVnLaU6PZC40go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxITD+wg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115507; x=1787651507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RCZufXhFmPfJorwlGTRfEPT5snAy32ipnEbANrmDMRo=;
  b=HxITD+wgxjCRsYmXX1DPk0ZGxouH5/kpwj6deLpZL3Uyjsk/91M4LIPS
   4ah6HAypIkWZsJr6GSCIcSOSvJyIU57V8MTbQvwoQ7qxZ2YJTquXBoFVG
   72DgO7/38TpUqvbCye9e25o+0eakT0OZjuWYF0iepxV3Zgz426ISzy3mz
   LWeWNapy84KHsW9umr3Z6a/x4D8XK7p32+bd+nyrYv63oAE/1t1VCcy4q
   sir9QllOWqCdVFkCs8LoSkAdnJcDC6t/hjLHaU3lNXlb/9ebBfvS0bLmz
   /LRsDxb+63PWgF9gxbufc50ilrCuWaPmd6545HDx1QKMloBpQEtkYk4U8
   A==;
X-CSE-ConnectionGUID: EsmuzY4TTE6iRDSYxEvUgQ==
X-CSE-MsgGUID: Hvpq2i6+Sl2K6JPzKAfJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032153"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:44 -0700
X-CSE-ConnectionGUID: 29lgotFYQmCcbw1Xae66cA==
X-CSE-MsgGUID: 3kpCSrUFRJ2I83jyEJgeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431060"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 94591121FEA;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ag1-2N6A;
	Mon, 25 Aug 2025 12:51:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 35/66] media: ccs: Remove which parameter from ccs_propagate
Date: Mon, 25 Aug 2025 12:50:36 +0300
Message-ID: <20250825095107.1332313-36-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
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
index 7b451684e1ed..1193cde1c98c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2294,8 +2294,7 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state, int which,
-			  int target)
+			  struct v4l2_subdev_state *sd_state, int target)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
@@ -2510,7 +2509,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->top = 0;
 	crop->width = fmt->format.width;
 	crop->height = fmt->format.height;
-	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -2718,7 +2717,7 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop);
 
 	*comp = sel->r;
-	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_COMPOSE);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ccs_pll_blanking_update(sensor);
@@ -2809,7 +2808,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
-		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
+		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -3335,7 +3334,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		v4l2_subdev_state_get_format(sd_state, pad, CCS_STREAM_PIXEL);
 	struct v4l2_rect *crop =
 		v4l2_subdev_state_get_crop(sd_state, pad, CCS_STREAM_PIXEL);
-	bool is_active = !sd->active_state || sd->active_state == sd_state;
 
 	ccs_get_native_size(ssd, crop);
 
@@ -3353,7 +3351,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
 
-	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
+	ccs_propagate(sd, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
-- 
2.47.2


