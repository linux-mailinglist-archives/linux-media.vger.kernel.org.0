Return-Path: <linux-media+bounces-28077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F31A5D445
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 03:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1B13B7405
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 02:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D7913CA97;
	Wed, 12 Mar 2025 02:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbQRsa66"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40E4C81
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 02:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741745264; cv=none; b=cAyYfKKmKU85zEIeJ4zOTrOXXREZYESsp9M6c1Jnb6QZpJuufxFzpfI5SL99MbP7ELds33DbwvNfd8DVx/bYLEbKNh1R68ZPwtCDZJpkRgYbsQOX2Sl2MP+NgEfHauD2twctS7y5aOQWYiOZkRcqtNxU1RC9wgwG1O+ZHw0oR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741745264; c=relaxed/simple;
	bh=azG0yGcWjueymM1WAQ+Bl1t+prQJQNaqcuW/EMdYvTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awtLrMj6g9HnhNuDLjNm4RS/fJYLWkpPSNkXsZ0LAnU8a49xkCjjSOBewMZHxp2nHSPgCRt5sNM+nLq6wOjYvHwuFB8Q9G6qBvLfzXoA60LgqlVEFlcNNFyZmk3PoxGhNZaWRJx80+4/IqRwg+SRWw97xnLkXET4wusGgeuhTs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbQRsa66; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741745263; x=1773281263;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=azG0yGcWjueymM1WAQ+Bl1t+prQJQNaqcuW/EMdYvTA=;
  b=gbQRsa66g8ZIk3Sn1hToD9gAjFVaIJfksdYl+Oyb0nnJA7NMPBryQaLA
   T+AhtRI2dNbc38TE8vzeI8tOGBRqejzctPPbNrtQ4JmOoMhFgTlW4iG50
   sg81IVYUjqkMrFl3xxzkTiC82CGU979l3IfAoxprDCi4L1yz2/GqDbGGw
   nv9yUoXLRGt+uy7suAJKvUUarL43GslxdMihKwcSToknJSEk34fOWG5b4
   QKPaDWI8e0KnOp9O8Pv6fSQ+kn4Pz16xMGKBwhTWZMKGDInu6IrLS+FcW
   h2GGHcd+7fZKcWXJsuf1V5xQ7AhmKXkgj5cnS45W9awwwg/OlFKEqmUZZ
   w==;
X-CSE-ConnectionGUID: 5z9BQXaFRFOKG8xNXX07Mg==
X-CSE-MsgGUID: zyii2fzOTy2fBQWW2yB0tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46455404"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="46455404"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:07:42 -0700
X-CSE-ConnectionGUID: eNk9BgpCSHuhT6sEL6TqUQ==
X-CSE-MsgGUID: iTp3xhfKTPaltiE+QY8CRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125681012"
Received: from haoyao-desk.bj.intel.com ([10.238.232.12])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:07:39 -0700
From: Hao Yao <hao.yao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 1/3] media: i2c: ov13b10: Fix h_blank calculation
Date: Wed, 12 Mar 2025 10:06:26 +0800
Message-ID: <20250312020713.687778-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pixel per line (PPL) is calculated as pixel_rate / (VTS * FPS), which
is not decided by MIPI CSI-2 link frequency. PPL can vary while link
frequency keeps the same. If PPL is wrong, the h_blank = PPL - width
is also wrong then FPS control is inaccurate.

This patch fix h_blank by:
1. Move PPL from link_freq_config to ov13b10_mode
2. Add PPL value for different modes
3. Use PPL from mode to calculate h_blank

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 73c844aa5697..79c0280e42f3 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -34,9 +34,6 @@
 #define OV13B10_VTS_120FPS		0x0320
 #define OV13B10_VTS_MAX			0x7fff
 
-/* HBLANK control - read only */
-#define OV13B10_PPL_560MHZ		4704
-
 /* Exposure control */
 #define OV13B10_REG_EXPOSURE		0x3500
 #define OV13B10_EXPOSURE_MIN		4
@@ -95,7 +92,7 @@ struct ov13b10_reg_list {
 
 /* Link frequency config */
 struct ov13b10_link_freq_config {
-	u32 pixels_per_line;
+	u64 link_freq;
 
 	/* registers for this link frequency */
 	struct ov13b10_reg_list reg_list;
@@ -114,6 +111,10 @@ struct ov13b10_mode {
 
 	/* Index of Link frequency config to be used */
 	u32 link_freq_index;
+
+	/* Pixels per line in current mode */
+	u32 ppl;
+
 	/* Default register values */
 	struct ov13b10_reg_list reg_list;
 };
@@ -549,7 +550,7 @@ static const s64 link_freq_menu_items[] = {
 static const struct ov13b10_link_freq_config
 			link_freq_configs[] = {
 	{
-		.pixels_per_line = OV13B10_PPL_560MHZ,
+		.link_freq = OV13B10_LINK_FREQ_560MHZ,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_1120mbps),
 			.regs = mipi_data_rate_1120mbps,
@@ -564,6 +565,7 @@ static const struct ov13b10_mode supported_modes[] = {
 		.height = 3120,
 		.vts_def = OV13B10_VTS_30FPS,
 		.vts_min = OV13B10_VTS_30FPS,
+		.ppl = 4704,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_4208x3120_regs),
 			.regs = mode_4208x3120_regs,
@@ -575,6 +577,7 @@ static const struct ov13b10_mode supported_modes[] = {
 		.height = 3120,
 		.vts_def = OV13B10_VTS_30FPS,
 		.vts_min = OV13B10_VTS_30FPS,
+		.ppl = 4704,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_4160x3120_regs),
 			.regs = mode_4160x3120_regs,
@@ -586,6 +589,7 @@ static const struct ov13b10_mode supported_modes[] = {
 		.height = 2340,
 		.vts_def = OV13B10_VTS_30FPS,
 		.vts_min = OV13B10_VTS_30FPS,
+		.ppl = 4704,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_4160x2340_regs),
 			.regs = mode_4160x2340_regs,
@@ -597,6 +601,7 @@ static const struct ov13b10_mode supported_modes[] = {
 		.height = 1560,
 		.vts_def = OV13B10_VTS_60FPS,
 		.vts_min = OV13B10_VTS_60FPS,
+		.ppl = 4704,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_2104x1560_regs),
 			.regs = mode_2104x1560_regs,
@@ -608,6 +613,7 @@ static const struct ov13b10_mode supported_modes[] = {
 		.height = 1170,
 		.vts_def = OV13B10_VTS_60FPS,
 		.vts_min = OV13B10_VTS_60FPS,
+		.ppl = 4704,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_2080x1170_regs),
 			.regs = mode_2080x1170_regs,
@@ -620,6 +626,7 @@ static const struct ov13b10_mode supported_modes[] = {
 		.vts_def = OV13B10_VTS_120FPS,
 		.vts_min = OV13B10_VTS_120FPS,
 		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
+		.ppl = 4664,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1364x768_120fps_regs),
 			.regs = mode_1364x768_120fps_regs,
@@ -1072,9 +1079,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 					 1,
 					 vblank_def);
 		__v4l2_ctrl_s_ctrl(ov13b->vblank, vblank_def);
-		h_blank =
-			link_freq_configs[mode->link_freq_index].pixels_per_line
-			 - ov13b->cur_mode->width;
+		h_blank = mode->ppl - mode->width;
 		__v4l2_ctrl_modify_range(ov13b->hblank, h_blank,
 					 h_blank, 1, h_blank);
 	}
@@ -1328,8 +1333,7 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
 					  OV13B10_VTS_MAX - mode->height, 1,
 					  vblank_def);
 
-	hblank = link_freq_configs[mode->link_freq_index].pixels_per_line -
-		 mode->width;
+	hblank = mode->ppl - mode->width;
 	ov13b->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
 					  V4L2_CID_HBLANK,
 					  hblank, hblank, 1, hblank);
-- 
2.43.0


