Return-Path: <linux-media+bounces-30856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD79A99747
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B049E3A961F
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537D428D829;
	Wed, 23 Apr 2025 17:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lD8yrN+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899428D828
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430955; cv=none; b=EEJPYekSnTD6AvXeXwA+FYB6PvaDwPiLUIpp9tcqyLsADh2Utu72gM3+WWwwkr2o2ok4HVBnGGfNWLykJuCUgtGbH4KhEo3/8fQBkgw2PdZA0QYNbmRY8vbZ5PYV6/HsCniKWSOySv01SrIjfPDNqaMJemkr0pSyX9xjtm+ZuA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430955; c=relaxed/simple;
	bh=7IqQAVaSeB36pIstX9mATxe+IER3DHeXpAOW3Ixc2YI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=px4EyeXqhYogoMsQos337MQ2BJpoLlY34mW3hVtk2W/gbW5//PTWa6L/bBY+XJGgetYXqH3kFv+997NbzJVmN74FEj306eHrTk9tyFhbSw41LQq2dB92NrANo4EpBwV34x3JvYriO5IFKAHaIhuHUzfAFDj+nyUCwTKJLW3f5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lD8yrN+g; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745430954; x=1776966954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7IqQAVaSeB36pIstX9mATxe+IER3DHeXpAOW3Ixc2YI=;
  b=lD8yrN+gzK6VvPK7v+oyNHXQ/tmP/2ehWN3FJG8fniqwAlWzChwRmZ6p
   Y2MRZS66ZJ7p8tSAgBbU4nQ1ylaMqAlSSJza5IJna/ikpnlbx6+eo633B
   6eTpkc1qGqIuXctfUtWsQ2OEKe71tN2MEPW6RRqEJ8JY/KPnCoQNpe/NJ
   K2BPZYaYPGSFjk5C3ybk/Dm4KlIyFj+YlWpgF/D3V5gAaHTCfB4WXqt4P
   PG+rF6lhT8fZuXvH81ydntji6Rx9EewCDfzmLoV06uwg2Yja2nQkEsDpL
   2Az3LgSKHkHQTYfqT0Gq2pil21l5oSO7Yr6l4DUT4/EsT+zNbdb/pFTh0
   w==;
X-CSE-ConnectionGUID: xax86TjGRzK4M7nVzdfJ7w==
X-CSE-MsgGUID: aegf26q/SPeqjkT/1+q5+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="69529322"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="69529322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:55:54 -0700
X-CSE-ConnectionGUID: bqwyHzu1RjWtBV4CUjtNnQ==
X-CSE-MsgGUID: ZSsf4X56QlW3D+V8OR7QFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137467689"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.225.65.15])
  by fmviesa004.fm.intel.com with ESMTP; 23 Apr 2025 10:55:50 -0700
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@linux.intel.com,
	jimmy.su@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	qingwu.zhang@intel.com,
	arun.t@intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v8 2/6] media: ov08x40: Add support for 2/4 lanes at 1500 Mbps
Date: Thu, 24 Apr 2025 01:56:32 +0800
Message-Id: <20250423175636.1338374-2-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423175636.1338374-1-jason.z.chen@intel.com>
References: <20250423175636.1338374-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Chen <jason.z.chen@intel.com>

Add register settings for 1500Mbps to support both 2-lane
and 4-lane configurations

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 441 ++++++++++++++++++++++++++++++++++++
 1 file changed, 441 insertions(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 11899d4feb06..56d330bca2de 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -107,6 +107,7 @@
 
 enum {
 	OV08X40_LINK_FREQ_400MHZ_INDEX,
+	OV08X40_LINK_FREQ_749MHZ_INDEX,
 };
 
 struct ov08x40_reg {
@@ -204,6 +205,392 @@ static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
 	{0x3012, 0x41}, /* MIPI SC Lanes */
 };
 
+static const struct ov08x40_reg mipi_data_rate_1500mbps[] = {
+	{0x0103, 0x01},
+	{0x1000, 0x00},
+	{0x1601, 0xd0},
+	{0x1001, 0x04},
+	{0x5004, 0x53},
+	{0x5110, 0x00},
+	{0x5111, 0x14},
+	{0x5112, 0x01},
+	{0x5113, 0x7b},
+	{0x5114, 0x00},
+	{0x5152, 0xa3},
+	{0x5a52, 0x1f},
+	{0x5a1a, 0x0e},
+	{0x5a1b, 0x10},
+	{0x5a1f, 0x0e},
+	{0x5a27, 0x0e},
+	{0x6002, 0x2e},
+	{0x0300, 0x3a}, /* PLL */
+	{0x0301, 0x88},
+	{0x0302, 0x31},
+	{0x0303, 0x05},
+	{0x0304, 0x01},
+	{0x0305, 0x38},
+	{0x0306, 0x04},
+	{0x0307, 0x00},
+	{0x0308, 0x03},
+	{0x0309, 0x02},
+	{0x0310, 0x0a},
+	{0x0311, 0x02},
+	{0x0312, 0x01},
+	{0x0313, 0x08},
+	{0x0314, 0x00},
+	{0x0315, 0x00},
+	{0x0316, 0x2c},
+	{0x0320, 0x02},
+	{0x0321, 0x03},
+	{0x0323, 0x05},
+	{0x0324, 0x01},
+	{0x0325, 0xb8},
+	{0x0326, 0x4a},
+	{0x0327, 0x04},
+	{0x0329, 0x00},
+	{0x032a, 0x05},
+	{0x032b, 0x00},
+	{0x032c, 0x00},
+	{0x032d, 0x00},
+	{0x032e, 0x02},
+	{0x032f, 0xa0},
+	{0x0350, 0x00},
+	{0x0360, 0x01},
+	{0x3012, 0x21}, /* MIPI SC Lanes */
+};
+
+static const struct ov08x40_reg mode_3856x2176_regs_800mbps[] = {
+	{0x5000, 0x5d},
+	{0x5001, 0x20},
+	{0x3012, 0x41},
+	{0x3400, 0x1c},
+	{0x3419, 0x13},
+	{0x341a, 0x89},
+	{0x3426, 0x00},
+	{0x3501, 0x02},
+	{0x3502, 0x00},
+	{0x3508, 0x01},
+	{0x3509, 0x00},
+	{0x3541, 0x01},
+	{0x3542, 0x00},
+	{0x3548, 0x01},
+	{0x3712, 0x51},
+	{0x3714, 0x24},
+	{0x3761, 0x17},
+	{0x376e, 0x03},
+	{0x37b0, 0x00},
+	{0x37b1, 0xab},
+	{0x37b3, 0x82},
+	{0x37b4, 0x00},
+	{0x37b5, 0xe4},
+	{0x37b6, 0x01},
+	{0x37b7, 0xee},
+	{0x3820, 0x00},
+	{0x3821, 0x04},
+	{0x3823, 0x04},
+	{0x384d, 0x80},
+	{0x3894, 0x00},
+	{0x400b, 0x08},
+	{0x400d, 0x08},
+	{0x4016, 0x2d},
+	{0x4501, 0x00},
+	{0x4542, 0x00},
+	{0x4837, 0x14},
+	{0x4850, 0x42},
+	{0x3a20, 0x00},
+	{0x3939, 0x9d},
+	{0x3902, 0x0e},
+	{0x3903, 0x0e},
+	{0x3904, 0x0e},
+	{0x3905, 0x0e},
+	{0x3906, 0x07},
+	{0x3907, 0x0d},
+	{0x3908, 0x11},
+	{0x3909, 0x12},
+	{0x390c, 0x33},
+	{0x390d, 0x66},
+	{0x390e, 0xaa},
+	{0x3915, 0x90},
+	{0x3917, 0x90},
+	{0x3440, 0xa4},
+	{0x3a26, 0x1d},
+	{0x3a2c, 0x4a},
+	{0x3a32, 0x55},
+	{0x392d, 0x02},
+	{0x3930, 0x08},
+	{0x3933, 0x0c},
+	{0x392a, 0x54},
+	{0x392b, 0xa8},
+	{0x380d, 0x80},
+	{0x380e, 0x13},
+	{0x380f, 0x88},
+	{0x3803, 0x70},
+	{0x3807, 0x0f},
+	{0x3808, 0x0f},
+	{0x3809, 0x10},
+	{0x380a, 0x08},
+	{0x380b, 0x80},
+	{0x3811, 0x08},
+	{0x3813, 0x10},
+	{0x3501, 0x10},
+	{0x3508, 0x0f},
+	{0x3509, 0x80},
+	{0x3813, 0x0f},
+};
+
+/* OV08X 1C 3856x2176_DPHY1500M-2L */
+static const struct ov08x40_reg mode_3856x2176_regs_1500mbps[] = {
+	{0x5000, 0x5d},
+	{0x5001, 0x20},
+	{0x3012, 0x21},
+	{0x3400, 0x1c},
+	{0x3419, 0x12},
+	{0x341a, 0x99},
+	{0x3426, 0x00},
+	{0x3501, 0x02},
+	{0x3502, 0x00},
+	{0x3508, 0x01},
+	{0x3509, 0x00},
+	{0x3541, 0x01},
+	{0x3542, 0x00},
+	{0x3548, 0x01},
+	{0x3712, 0x51},
+	{0x3714, 0x24},
+	{0x3761, 0x17},
+	{0x376e, 0x03},
+	{0x37b0, 0x00},
+	{0x37b1, 0xab},
+	{0x37b3, 0x82},
+	{0x37b4, 0x00},
+	{0x37b5, 0xe4},
+	{0x37b6, 0x01},
+	{0x37b7, 0xee},
+	{0x3803, 0x70},
+	{0x3807, 0x0f},
+	{0x3808, 0x0f},
+	{0x3809, 0x10},
+	{0x380a, 0x08},
+	{0x380b, 0x80},
+	{0x380d, 0xa0},
+	{0x380e, 0x12},
+	{0x380f, 0x98},
+	{0x3811, 0x08},
+	{0x3813, 0x10},
+	{0x3820, 0x00},
+	{0x3821, 0x04},
+	{0x3823, 0x04},
+	{0x384d, 0xa0},
+	{0x3894, 0x00},
+	{0x400b, 0x08},
+	{0x400d, 0x08},
+	{0x4016, 0x2d},
+	{0x4501, 0x00},
+	{0x4542, 0x00},
+	{0x4837, 0x0a},
+	{0x4850, 0x47},
+	{0x3a20, 0x00},
+	{0x3939, 0x9d},
+	{0x3902, 0x0e},
+	{0x3903, 0x0e},
+	{0x3904, 0x0e},
+	{0x3905, 0x0e},
+	{0x3906, 0x07},
+	{0x3907, 0x0d},
+	{0x3908, 0x11},
+	{0x3909, 0x12},
+	{0x390c, 0x33},
+	{0x390d, 0x66},
+	{0x390e, 0xaa},
+	{0x3915, 0x90},
+	{0x3917, 0x90},
+	{0x3440, 0xa4},
+	{0x3a26, 0x1d},
+	{0x3a2c, 0x4a},
+	{0x3a32, 0x55},
+	{0x392d, 0x02},
+	{0x3930, 0x08},
+	{0x3933, 0x0c},
+	{0x392a, 0x54},
+	{0x392b, 0xa8},
+	{0x3501, 0x10},
+	{0x3508, 0x0f},
+	{0x3509, 0x80},
+	{0x3813, 0x0f},
+};
+
+/* OV08X 4C1stg 1928x1088_DPHY1500M-2L 30fps */
+static const struct ov08x40_reg mode_1928x1088_regs_1500mbps[] = {
+	{0x5000, 0x55},
+	{0x5001, 0x00},
+	{0x3012, 0x21},
+	{0x3400, 0x30},
+	{0x3419, 0x08},
+	{0x341a, 0x4f},
+	{0x3426, 0x00},
+	{0x3501, 0x02},
+	{0x3502, 0x00},
+	{0x3508, 0x01},
+	{0x3509, 0x00},
+	{0x3541, 0x01},
+	{0x3542, 0x00},
+	{0x3548, 0x01},
+	{0x3712, 0x50},
+	{0x3714, 0x21},
+	{0x3761, 0x28},
+	{0x376e, 0x07},
+	{0x37b0, 0x01},
+	{0x37b1, 0x0f},
+	{0x37b3, 0xd6},
+	{0x37b4, 0x01},
+	{0x37b5, 0x48},
+	{0x37b6, 0x02},
+	{0x37b7, 0x40},
+	{0x3803, 0x78},
+	{0x3807, 0x07},
+	{0x3808, 0x07},
+	{0x3809, 0x88},
+	{0x380a, 0x04},
+	{0x380b, 0x40},
+	{0x380d, 0xf0},
+	{0x380e, 0x08},
+	{0x380f, 0x4e},
+	{0x3811, 0x04},
+	{0x3813, 0x03},
+	{0x3820, 0x02},
+	{0x3821, 0x14},
+	{0x3823, 0x84},
+	{0x384d, 0xf0},
+	{0x3894, 0x03},
+	{0x400b, 0x04},
+	{0x400d, 0x04},
+	{0x4016, 0x27},
+	{0x4501, 0x10},
+	{0x4542, 0x01},
+	{0x4837, 0x0a},
+	{0x4850, 0x47},
+	{0x4911, 0x00},
+	{0x4919, 0x00},
+	{0x491a, 0x40},
+	{0x4920, 0x04},
+	{0x4921, 0x00},
+	{0x4922, 0x04},
+	{0x4923, 0x00},
+	{0x4924, 0x04},
+	{0x4925, 0x00},
+	{0x4926, 0x04},
+	{0x4927, 0x00},
+	{0x4930, 0x00},
+	{0x4931, 0x00},
+	{0x4932, 0x00},
+	{0x4933, 0x00},
+	{0x4934, 0x00},
+	{0x4935, 0x00},
+	{0x4936, 0x00},
+	{0x4937, 0x00},
+	{0x4940, 0x00},
+	{0x4941, 0x80},
+	{0x4942, 0x00},
+	{0x4943, 0x80},
+	{0x4944, 0x00},
+	{0x4945, 0x80},
+	{0x4946, 0x00},
+	{0x4947, 0x80},
+	{0x4960, 0x00},
+	{0x4961, 0x00},
+	{0x4962, 0x00},
+	{0x4963, 0x00},
+	{0x4964, 0x00},
+	{0x4965, 0x00},
+	{0x4966, 0x00},
+	{0x4967, 0x00},
+	{0x4968, 0x00},
+	{0x4969, 0x00},
+	{0x496a, 0x00},
+	{0x496b, 0x00},
+	{0x496c, 0x00},
+	{0x496d, 0x00},
+	{0x496e, 0x00},
+	{0x496f, 0x00},
+	{0x4970, 0x00},
+	{0x4971, 0x00},
+	{0x4972, 0x00},
+	{0x4973, 0x00},
+	{0x4974, 0x00},
+	{0x4975, 0x00},
+	{0x4976, 0x00},
+	{0x4977, 0x00},
+	{0x4978, 0x00},
+	{0x4979, 0x00},
+	{0x497a, 0x00},
+	{0x497b, 0x00},
+	{0x497c, 0x00},
+	{0x497d, 0x00},
+	{0x497e, 0x00},
+	{0x497f, 0x00},
+	{0x49e0, 0x00},
+	{0x49e1, 0x00},
+	{0x49e2, 0x00},
+	{0x49e3, 0x00},
+	{0x49e4, 0x00},
+	{0x49e5, 0x00},
+	{0x49e6, 0x00},
+	{0x49e7, 0x00},
+	{0x49e8, 0x00},
+	{0x49e9, 0x80},
+	{0x49ea, 0x00},
+	{0x49eb, 0x80},
+	{0x49ec, 0x00},
+	{0x49ed, 0x80},
+	{0x49ee, 0x00},
+	{0x49ef, 0x80},
+	{0x49f0, 0x02},
+	{0x49f1, 0x04},
+	{0x3a20, 0x05},
+	{0x3939, 0x6b},
+	{0x3902, 0x10},
+	{0x3903, 0x10},
+	{0x3904, 0x10},
+	{0x3905, 0x10},
+	{0x3906, 0x01},
+	{0x3907, 0x0b},
+	{0x3908, 0x10},
+	{0x3909, 0x13},
+	{0x390b, 0x11},
+	{0x390c, 0x21},
+	{0x390d, 0x32},
+	{0x390e, 0x76},
+	{0x3a1a, 0x1c},
+	{0x3a26, 0x17},
+	{0x3a2c, 0x50},
+	{0x3a32, 0x4f},
+	{0x3ace, 0x01},
+	{0x3ad2, 0x01},
+	{0x3ad6, 0x01},
+	{0x3ada, 0x01},
+	{0x3ade, 0x01},
+	{0x3ae2, 0x01},
+	{0x3aee, 0x01},
+	{0x3af2, 0x01},
+	{0x3af6, 0x01},
+	{0x3afa, 0x01},
+	{0x3afe, 0x01},
+	{0x3b02, 0x01},
+	{0x3b06, 0x01},
+	{0x392d, 0x01},
+	{0x3930, 0x09},
+	{0x3933, 0x0d},
+	{0x392a, 0x52},
+	{0x392b, 0xa3},
+	{0x340b, 0x1b},
+	{0x3501, 0x01},
+	{0x3508, 0x0f},
+	{0x3509, 0x00},
+	{0x3541, 0x00},
+	{0x3542, 0x80},
+	{0x3548, 0x0f},
+	{0x3813, 0x03},
+};
+
 static const struct ov08x40_reg mode_3856x2416_regs[] = {
 	{0x5000, 0x5d},
 	{0x5001, 0x20},
@@ -1185,6 +1572,7 @@ static const char * const ov08x40_test_pattern_menu[] = {
 
 /* Configurations for supported link frequencies */
 #define OV08X40_LINK_FREQ_400MHZ	400000000ULL
+#define OV08X40_LINK_FREQ_749MHZ	749000000ULL
 #define OV08X40_SCLK_96MHZ		96000000ULL
 #define OV08X40_XVCLK			19200000
 #define OV08X40_DATA_LANES		4
@@ -1204,6 +1592,7 @@ static u64 link_freq_to_pixel_rate(u64 f)
 /* Menu items for LINK_FREQ V4L2 control */
 static const s64 link_freq_menu_items[] = {
 	OV08X40_LINK_FREQ_400MHZ,
+	OV08X40_LINK_FREQ_749MHZ,
 };
 
 /* Link frequency configs */
@@ -1214,6 +1603,12 @@ static const struct ov08x40_link_freq_config link_freq_configs[] = {
 			.regs = mipi_data_rate_800mbps,
 		}
 	},
+	[OV08X40_LINK_FREQ_749MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_1500mbps),
+			.regs = mipi_data_rate_1500mbps,
+		}
+	},
 };
 
 /* Mode configs */
@@ -1233,6 +1628,22 @@ static const struct ov08x40_mode supported_modes[] = {
 		.exposure_shift = 1,
 		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
 	},
+	{
+		.width = 3856,
+		.height = 2176,
+		.vts_def = OV08X40_VTS_30FPS,
+		.vts_min = OV08X40_VTS_30FPS,
+		.llp = 0x10aa, /* in normal mode, tline time = 2 * HTS / SCLK */
+		.lanes = 4,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_3856x2176_regs_800mbps),
+			.regs = mode_3856x2176_regs_800mbps,
+		},
+		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.exposure_shift = 1,
+		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
+	},
+
 	{
 		.width = 1928,
 		.height = 1208,
@@ -1248,6 +1659,36 @@ static const struct ov08x40_mode supported_modes[] = {
 		.exposure_shift = 0,
 		.exposure_margin = OV08X40_EXPOSURE_BIN_MAX_MARGIN,
 	},
+	{
+		.width = 3856,
+		.height = 2176,
+		.vts_def = OV08X40_VTS_30FPS,
+		.vts_min = OV08X40_VTS_30FPS,
+		.llp = 0x10aa, /* in normal mode, tline time = 2 * HTS / SCLK */
+		.lanes = 2,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_3856x2176_regs_1500mbps),
+			.regs = mode_3856x2176_regs_1500mbps,
+		},
+		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
+		.exposure_shift = 1,
+		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
+	},
+	{
+		.width = 1928,
+		.height = 1088,
+		.vts_def = OV08X40_VTS_BIN_30FPS,
+		.vts_min = OV08X40_VTS_BIN_30FPS,
+		.llp = 0x960,
+		.lanes = 2,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1928x1088_regs_1500mbps),
+			.regs = mode_1928x1088_regs_1500mbps,
+		},
+		.link_freq_index = OV08X40_LINK_FREQ_749MHZ_INDEX,
+		.exposure_shift = 0,
+		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
+	},
 };
 
 static const char * const ov08x40_supply_names[] = {
-- 
2.34.1


