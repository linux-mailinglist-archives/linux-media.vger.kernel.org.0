Return-Path: <linux-media+bounces-28000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB1A5BB07
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D525A3AD9AA
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 08:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DC82253B5;
	Tue, 11 Mar 2025 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIb5qAic"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA71DED63
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741682829; cv=none; b=UFMnm7Q6/Z5F0auwgh76LcaOnEMTilGCpP3gl/v6lzh0aijeLgzEihs0HsBW7HGUAURPGmYzqtj+3gjZSUcZeBT8fbxVsB0E4g3Ysqo2WZOBJ6BTVxjoSXqMIyJUxkqIEqyc/rervWPOutnRaS2uTPYlmq/Q9qBD4qD36XIj+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741682829; c=relaxed/simple;
	bh=GspFDeVEsVWwbJUGiIOGqr0rZGNLX+suT8bWT5JwpS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlvdJm7Afjd3J07QvwxdQUm61gPFEFM3kwfC0ZKYI7cv2y7sjbmc3EKsuysr4L7ypxUxr/3Vwx9+i6JGP9gBpLEvioDSdc0axhcasbsnPY13sYGXR7RTZGcD6rY5iKAqL1L4IkDWEX7EoJmD+h2E7Mz/idQOXSvPlIp30hP9DPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIb5qAic; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741682827; x=1773218827;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GspFDeVEsVWwbJUGiIOGqr0rZGNLX+suT8bWT5JwpS8=;
  b=IIb5qAicsBpGFo1z3cWGG7qbEP0BCdKLo011ecYgK+zKIXpyfWF6z/DU
   NXX/nEcIj5xqIxXMZYNRtbscn9ICvZzukJX+u5WUnKE0jR2O55BvvVlHR
   CL89jBmrMqfy+xpM+6y4MCudsKOs8D9IPEMibPdyVHKVedlrMvaLBdFSg
   OcQk8L9Xvc2F4fQilIvBmFcSOCyxRGdlYtM/k7sSHB4eC0XApV7zT61OV
   IB7NdW/uiEpCqTxerLRWJQ0JtnLyUdHvXZHmQdMQqJUevioE+xeBJ6jXN
   7bdigZ/ersOk+2hbOU+NCgckz9m0/Ro9IRCigCwwxCsxOXXYPcPrXumSx
   Q==;
X-CSE-ConnectionGUID: tBVmJ5R4TNilJOTttHN80A==
X-CSE-MsgGUID: MBjmBfv6R+SBq2YFoQAojA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="52915720"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="52915720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 01:47:07 -0700
X-CSE-ConnectionGUID: 7RS/gWOCTx2ExgFzPxnPjA==
X-CSE-MsgGUID: 1DSe/dImQue84+U09Zw+dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="125287907"
Received: from haoyao-desk.bj.intel.com ([10.238.232.12])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 01:47:06 -0700
From: Hao Yao <hao.yao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 1/2] media: i2c: ov13b10: Fix h_blank calculation
Date: Tue, 11 Mar 2025 16:46:06 +0800
Message-ID: <20250311084656.516627-1-hao.yao@intel.com>
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
 drivers/media/i2c/ov13b10.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 73c844aa5697..2e83fc23f321 100644
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
@@ -1062,19 +1069,13 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate, pixel_rate);
 
 		/* Update limits and set FPS to default */
-		vblank_def = ov13b->cur_mode->vts_def -
-			     ov13b->cur_mode->height;
-		vblank_min = ov13b->cur_mode->vts_min -
-			     ov13b->cur_mode->height;
+		vblank_def = mode->vts_def - mode->height;
+		vblank_min = mode->vts_min - mode->height;
 		__v4l2_ctrl_modify_range(ov13b->vblank, vblank_min,
-					 OV13B10_VTS_MAX
-					 - ov13b->cur_mode->height,
-					 1,
-					 vblank_def);
+					 OV13B10_VTS_MAX - mode->height,
+					 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(ov13b->vblank, vblank_def);
-		h_blank =
-			link_freq_configs[mode->link_freq_index].pixels_per_line
-			 - ov13b->cur_mode->width;
+		h_blank = mode->ppl - mode->width;
 		__v4l2_ctrl_modify_range(ov13b->hblank, h_blank,
 					 h_blank, 1, h_blank);
 	}
@@ -1328,8 +1329,7 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
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


