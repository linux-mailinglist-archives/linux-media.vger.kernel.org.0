Return-Path: <linux-media+bounces-50426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4AD11AE7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 071AB305DE5A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3C5296BCC;
	Mon, 12 Jan 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuY+uXI1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C592868B4
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212018; cv=none; b=QomnXGl7p5h6gEVjft9zB7hidWw0lIxj9+EI4+PzJc68I4qWzsm93FMyNiu/0Set6w2lISR2TUK/lahV4+DfNVINdOH1q7YvmMWUeAGsSx3GW8epVlcN6zu3inPPGjuKFj7zzXTGgiOdLhFCZfS3xfHyh7Q3EPw5ZFA4Pt93cAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212018; c=relaxed/simple;
	bh=lu5mPUJjfYtot725XIfqOpMy/H0kdOEvOXS4cernFMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7uvJHYfQKFjV/TeEckScNBRjF+qnInosWmdxtyHCLSZkjT1Cbd2rKW6jurkA6tDPTCt91Si6sNrEpgQmXYYO/VSe8/XSHUTusx44801fBC7Trn3wF0TB9IyIvebz4I6gl5hwWa7qa/Y3tf4+uz433t6mNgfULZwZa5HiTL1pMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuY+uXI1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212016; x=1799748016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lu5mPUJjfYtot725XIfqOpMy/H0kdOEvOXS4cernFMw=;
  b=PuY+uXI1A6S/kYgu/D1Oj4yzRAoZ3rj3AaKF7FVK+9uopJcmX9IgYR0G
   OYdnKe3EZakMQLiD8/57E8N4r0UzL5qyUeh9FvXH0Wclb2v01/WX2sAGI
   /ZYjes3P/tecVt6Pw2W8cY12xi085BNsKXDA1VCdIHiyGSdwMtJ7PEik8
   dOVdR4dwFPqouboXRlHyf1WKb4ix1EyTQWECaF5y94qqsNm4564kjystG
   yQbLpP8vZH+alIapgATaPC02TMcUhtnoIdmR/sfztPzPnUtDICgQVj+bU
   Tp8nWLGUv7YALnSy7OnlK+gSmUaLYZLS6NSk/zSHm0Mg7U0jS06xkaPWs
   g==;
X-CSE-ConnectionGUID: EjP3dqsjSVK/NGtbOBEMMg==
X-CSE-MsgGUID: a+CZnQS1TGGIa8ROyak8Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218819"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: MielkkobRnaENf5fR3HYhw==
X-CSE-MsgGUID: TTX72zbcTXCyQoi99Qoj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743175"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5F2B3122023;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012l-13ve;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 22/23] media: i2c: ov01a10: Optimize setting h/vflip values
Date: Mon, 12 Jan 2026 11:59:48 +0200
Message-ID: <20260112095949.3851-23-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Since ov01a10_global_setting[] sets the initial format1 register value,
there is no need to do a read-write-modify when setting the flip controls.

Only write format1 when setting the flip-controls and remove the now
unnecessary format1 register init from ov01a10_global_setting[].

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 41 +++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index a909f1ff8a76..6d245b638b2d 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -161,7 +161,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x3815, 0x01},
 	{0x3816, 0x01},
 	{0x3817, 0x01},
-	{0x3820, 0xa8},
 	{0x3822, 0x13},
 	{0x3832, 0x28},
 	{0x3833, 0x10},
@@ -240,6 +239,7 @@ struct ov01a10_sensor_cfg {
 	u32 bus_fmt;
 	int pattern_size;
 	int border_size;
+	u8 format1_base_val;
 	bool invert_hflip_shift;
 	bool invert_vflip_shift;
 };
@@ -258,6 +258,8 @@ struct ov01a10 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vflip;
 
 	u32 link_freq_index;
 
@@ -310,22 +312,33 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 			 NULL);
 }
 
+static void ov01a10_set_format1(struct ov01a10 *ov01a10, int *ret)
+{
+	u8 val = ov01a10->cfg->format1_base_val;
+
+	/* hflip register bit is inverted */
+	if (!ov01a10->hflip->val)
+		val |= FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
+
+	if (ov01a10->vflip->val)
+		val |= FIELD_PREP(OV01A10_VFLIP_MASK, 0x1);
+
+	cci_write(ov01a10->regmap, OV01A10_REG_FORMAT1, val, ret);
+}
+
 static int ov01a10_set_hflip(struct ov01a10 *ov01a10, bool hflip)
 {
 	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
 	const struct ov01a10_sensor_cfg *cfg = ov01a10->cfg;
-	u32 val, offset;
+	u32 offset;
 	int ret = 0;
 
 	offset = crop->left;
 	if ((hflip ^ cfg->invert_hflip_shift) && cfg->border_size)
 		offset++;
 
-	val = hflip ? 0 : FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
-
 	cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);
-	cci_update_bits(ov01a10->regmap, OV01A10_REG_FORMAT1,
-			OV01A10_HFLIP_MASK, val, &ret);
+	ov01a10_set_format1(ov01a10, &ret);
 
 	return ret;
 }
@@ -334,18 +347,15 @@ static int ov01a10_set_vflip(struct ov01a10 *ov01a10, bool vflip)
 {
 	struct v4l2_rect *crop = ov01a10_get_active_crop(ov01a10);
 	const struct ov01a10_sensor_cfg *cfg = ov01a10->cfg;
-	u32 val, offset;
+	u32 offset;
 	int ret = 0;
 
 	offset = crop->top;
 	if ((vflip ^ cfg->invert_vflip_shift) && cfg->border_size)
 		offset++;
 
-	val = vflip ? FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) : 0;
-
 	cci_write(ov01a10->regmap, OV01A10_REG_Y_WIN, offset, &ret);
-	cci_update_bits(ov01a10->regmap, OV01A10_REG_FORMAT1,
-			OV01A10_VFLIP_MASK, val, &ret);
+	ov01a10_set_format1(ov01a10, &ret);
 
 	return ret;
 }
@@ -474,10 +484,10 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 				     ARRAY_SIZE(ov01a10_test_pattern_menu) - 1,
 				     0, 0, ov01a10_test_pattern_menu);
 
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_HFLIP,
-			  0, 1, 1, 0);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_VFLIP,
-			  0, 1, 1, 0);
+	ov01a10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	ov01a10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
 
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov01a10_ctrl_ops,
 					      &props);
@@ -1087,6 +1097,7 @@ static const struct ov01a10_sensor_cfg ov01a10_cfg = {
 	.bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
 	.pattern_size = 2, /* 2x2 */
 	.border_size = 2,
+	.format1_base_val = 0xa0,
 	.invert_hflip_shift = true,
 	.invert_vflip_shift = false,
 };
-- 
2.47.3


