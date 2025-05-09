Return-Path: <linux-media+bounces-32076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D8AB0A8C
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 131D73AE700
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 06:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C977626A1D8;
	Fri,  9 May 2025 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJZFAE7J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC4B269CF1
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 06:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771920; cv=none; b=e9UuXp9cOamDWe8U3JUofJHQVaM8wKi2qMLMAyuMu20pWaIrvUXO66fueo5FMJZnP3HkAKhepBU0Px+mWv8j5cCum9YTePgnMxxubZqAJJzbA9wHk9hM7gdUJ8ujhz3ylgNfiNE0JjL7tNeTr6NM/sYhh+7eOU8D7sl6MMeT/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771920; c=relaxed/simple;
	bh=MuE1b2a2yChHGBcXz53MT2Wx9oVDKSMvKPUU2YjbXbo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oj7FJQUAg4RGTPL0cuZSU1X0W+PRQ5dACs/+GeVPVIfr8mT9uJPBUO4bfyomckPmDdAsdxcd3mqycOXnFkdDZGRKie/lydFTYPZ+WVgM0y4w7rNu/Ejs5mJdnolvPc6qrgtRnvVJ+32jiRTvjgwfh1DeY2UDB0AVY4MCvcG1ekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJZFAE7J; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746771918; x=1778307918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MuE1b2a2yChHGBcXz53MT2Wx9oVDKSMvKPUU2YjbXbo=;
  b=dJZFAE7JcsoCrhHCleivkSx5e1YekVjjeLJ37YV8tuf5ygreXEqllMIf
   xg3pybmpaFjVdfkVfs1fU1T0B9CH7XsYHjqt7r9M9zk/xi219CjwrOyvJ
   Tuvie17mVgQzbBiWHy2OJhFlXlK4j2KIbiv9TfNZkiQC9NShEO0HYTaCJ
   kfJypNVWHtldxaHNCXN/efNvnyXGBkzpcZv49TAoL+uRiy4nqtrfflyUV
   NM4R30kmA0f1F8+RsI3mc6q+W2Mr638DwLDvR2l+RG5yC76qvGXbf4Enx
   TPtuZ4XEFiWYfMduwjgEMvIM+5vWs3/M9belFmsENNyB7cKoqb7/FuezJ
   w==;
X-CSE-ConnectionGUID: +1KC+EdBQAS6ujqy4MZkAw==
X-CSE-MsgGUID: 0ogX9x0mTBCM6W1qmQQSUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59584345"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59584345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:25:16 -0700
X-CSE-ConnectionGUID: xVmGokjJQJa6EvUel4T7FA==
X-CSE-MsgGUID: Na17VM2nRUWOWBcp2znzcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141732256"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.95])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:25:14 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D9D7511FAF5;
	Fri,  9 May 2025 09:25:10 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uDHAV-004aD0-2j;
	Fri, 09 May 2025 09:25:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	Hans de Goede <hansg@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>
Subject: [PATCH 1/1] media: ov02c10: Use div_u64 to divide a 64-bit number
Date: Fri,  9 May 2025 09:25:11 +0300
Message-Id: <20250509062511.1092490-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov02c10 driver divides a 64-bit number but reply relies on division
operator to do that. Use div_u64() so this will compile everywhere.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov02c10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 9e3d4a4e12ce..089a4fd9627c 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -497,8 +497,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* MIPI lanes are DDR -> use link-freq * 2 */
-	pixel_rate = link_freq_menu_items[ov02c10->link_freq_index] * 2 *
-		     ov02c10->mipi_lanes / OV02C10_RGB_DEPTH;
+	pixel_rate = div_u64(link_freq_menu_items[ov02c10->link_freq_index] *
+			     2 * ov02c10->mipi_lanes, OV02C10_RGB_DEPTH);
 
 	ov02c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 						V4L2_CID_PIXEL_RATE, 0,
-- 
2.39.5


