Return-Path: <linux-media+bounces-28078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB28A5D446
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 03:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1982D7A9A24
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 02:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2149F14601C;
	Wed, 12 Mar 2025 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUu1qtzR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9C413AD38
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 02:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741745266; cv=none; b=g7joSLfx6wR7U/vGMBIrZL2F8xJHiQC52lHdVLQC8d9eT9u5+J/W7zZa7ZPeFFIQlm4mGT6WP0xwjFZPXjIYtRRKArbKI6LfWA/b36hDYNWrQWOICwW5xBuUqN17od8pPq/ZjnPZPZznT9nmziPSPQLGIfp0gmIKkjumuQEwAiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741745266; c=relaxed/simple;
	bh=kCZ0OgteF4ewt40M1EU/bjn85LBjMkZhO+0MdAehkb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dggsf+EV5M1fkOVoPYJMOt6JSmBoebc6lhHiCu9jNDBXN+EtP+AomMDluRI9sYI2gLbxCRlbuRcczX3AAvH1KY4DfdBPt8+HnyLhEcOlRPe/OWvUtDiB4ASIID+GHMvGcDHuvR6l84fvw8NoTnnYOt0hihKuWh+PIQkekM4TKLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUu1qtzR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741745266; x=1773281266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kCZ0OgteF4ewt40M1EU/bjn85LBjMkZhO+0MdAehkb4=;
  b=DUu1qtzRpwhN+sIM20JttX7twbzYBf1KbjYgnuwI6YIE023j6b/wD31p
   RNn2nLnPZJxJCVr701A9tU93WIvneVbFsZPiQj1ICxbZlY/7EVzI6dy3j
   TwHBMNajRsHhcrgX4mOfE8giTzhVi5h0rfAsnxDhxkOHDZfUG5fdM3wBb
   qA4E/azvCUWsz0VytvAiqw1/z/vDwmyqubangtTVjthtFupeBH4B1Asyv
   1IrxE2UX3dtq8oXS6mHtGUr0ANJ+fhjbadOctbExDF+ByzH4Z9m1x0dHP
   2X3+ZJlpNvXujRU85RM3AXzKLpv9rCz3xjaJUjGrcXgBwvsZ5xGbv98B4
   w==;
X-CSE-ConnectionGUID: cU1BGAIuSoyddOoh3/U/Lw==
X-CSE-MsgGUID: FFxvXkfSS6mintm+1ciBXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46455409"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="46455409"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:07:46 -0700
X-CSE-ConnectionGUID: WBpUjBUvSO+3TZRVWglaCQ==
X-CSE-MsgGUID: qY4Id7D5RjSB6LGwr7k6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125681019"
Received: from haoyao-desk.bj.intel.com ([10.238.232.12])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 19:07:43 -0700
From: Hao Yao <hao.yao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 2/3] media: i2c: ov13b10: Improve code redability
Date: Wed, 12 Mar 2025 10:06:27 +0800
Message-ID: <20250312020713.687778-2-hao.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312020713.687778-1-hao.yao@intel.com>
References: <20250312020713.687778-1-hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use mode instead of ov13b->cur_mode in set_pad_format.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 79c0280e42f3..2e83fc23f321 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1069,15 +1069,11 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
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
 		h_blank = mode->ppl - mode->width;
 		__v4l2_ctrl_modify_range(ov13b->hblank, h_blank,
-- 
2.43.0


