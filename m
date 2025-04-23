Return-Path: <linux-media+bounces-30855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A1A99740
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C78EB1B665BE
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED80928CF7C;
	Wed, 23 Apr 2025 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxZXmqIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B56281363
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430952; cv=none; b=VDnzBGZt0Z0cZQcoe7837t7/sGG8Xk0Qwge1d5VnZYiLcfQyjnNHsTjcxdqTqt7oQLJKfZNICQj0Xz/AenJ6AONYWur4Co6GYvH0jegX0oZsyimiG/me1h9FzHS+7fa/rzpN07uKYEoZQEISWgH9sf5ojMFS1/89wJBo42blxGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430952; c=relaxed/simple;
	bh=NGiRyAURXNjN5sw3Hg5tgXh76+lIlQ3q7/NzpzuqUgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WY2lY6vEUmMl6t8AgxxL76tW33eiIr889CO7GvccicmTxlU4GPulabZiOHRkQoT+XgbzRwsact+Pip5Pp74UoSshBF+xuB3H8r/UxLSe4Yaq8Xkg6/55J5RDdZJwj/g6hhCiML2fgFBiZqQPp43zCXwtZL4yqC+uwVeZPF5R2Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxZXmqIZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745430951; x=1776966951;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NGiRyAURXNjN5sw3Hg5tgXh76+lIlQ3q7/NzpzuqUgI=;
  b=fxZXmqIZrumQAklQXZCi9Drhu4WF0+V3L7zc8h788MdqwtAEQ2IS2r/D
   SNU4k/XjieiNyza263zxi8onslSV1mEKasRioMc/eF7i+VckZtVcfdmX3
   fxvfnCAQO/V5gcR3tLdh1Ne/kgOPOcrGiurzGu0snmod9WNMaQ04iZfkR
   xvbOaLLnC2CAlYdsa5JHDeEHW5SfAamatiR9Hs3LbyaygX+7JgYcTPjYS
   mveipV9EDVtDvHU7FhLEEyjLpgh93puiHUfMme17w7wWz/Eb9EvhYVEQI
   qHXj3ar8sHIf+zObB7W/V0OyzGhIKWbVdkPWuH/Yp5KQY3B8u38rruHAc
   w==;
X-CSE-ConnectionGUID: xzOw3OKlRoGZNbfteFSjTQ==
X-CSE-MsgGUID: CyOGEBckRGGzbhrj0PloVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="69529306"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="69529306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:55:50 -0700
X-CSE-ConnectionGUID: U037Fo1FT6ySVE/hdwdKiA==
X-CSE-MsgGUID: VD8MLz6ATMKgYcpSUurNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137467682"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.225.65.15])
  by fmviesa004.fm.intel.com with ESMTP; 23 Apr 2025 10:55:47 -0700
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
Subject: [PATCH v8 1/6] media: ov08x40: Separate the lane configuration and PLL settings
Date: Thu, 24 Apr 2025 01:56:31 +0800
Message-Id: <20250423175636.1338374-1-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Chen <jason.z.chen@intel.com>

To prepare upcoming support of multiple sensor modes,
this change separates the lane configuration and PLL settings
from the original mode-specific settings.

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 56 ++++++++-----------------------------
 1 file changed, 12 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index b9682264e2f5..11899d4feb06 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -168,17 +168,7 @@ static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
 	{0x5a1f, 0x0e},
 	{0x5a27, 0x0e},
 	{0x6002, 0x2e},
-};
-
-static const struct ov08x40_reg mode_3856x2416_regs[] = {
-	{0x5000, 0x5d},
-	{0x5001, 0x20},
-	{0x5008, 0xb0},
-	{0x50c1, 0x00},
-	{0x53c1, 0x00},
-	{0x5f40, 0x00},
-	{0x5f41, 0x40},
-	{0x0300, 0x3a},
+	{0x0300, 0x3a}, /* PLL CTRL */
 	{0x0301, 0xc8},
 	{0x0302, 0x31},
 	{0x0303, 0x03},
@@ -211,6 +201,17 @@ static const struct ov08x40_reg mode_3856x2416_regs[] = {
 	{0x032f, 0xa0},
 	{0x0350, 0x00},
 	{0x0360, 0x01},
+	{0x3012, 0x41}, /* MIPI SC Lanes */
+};
+
+static const struct ov08x40_reg mode_3856x2416_regs[] = {
+	{0x5000, 0x5d},
+	{0x5001, 0x20},
+	{0x5008, 0xb0},
+	{0x50c1, 0x00},
+	{0x53c1, 0x00},
+	{0x5f40, 0x00},
+	{0x5f41, 0x40},
 	{0x1216, 0x60},
 	{0x1217, 0x5b},
 	{0x1218, 0x00},
@@ -690,39 +691,6 @@ static const struct ov08x40_reg mode_1928x1208_regs[] = {
 	{0x53c1, 0x00},
 	{0x5f40, 0x00},
 	{0x5f41, 0x40},
-	{0x0300, 0x3a},
-	{0x0301, 0xc8},
-	{0x0302, 0x31},
-	{0x0303, 0x03},
-	{0x0304, 0x01},
-	{0x0305, 0xa1},
-	{0x0306, 0x04},
-	{0x0307, 0x01},
-	{0x0308, 0x03},
-	{0x0309, 0x03},
-	{0x0310, 0x0a},
-	{0x0311, 0x02},
-	{0x0312, 0x01},
-	{0x0313, 0x08},
-	{0x0314, 0x66},
-	{0x0315, 0x00},
-	{0x0316, 0x34},
-	{0x0320, 0x02},
-	{0x0321, 0x03},
-	{0x0323, 0x05},
-	{0x0324, 0x01},
-	{0x0325, 0xb8},
-	{0x0326, 0x4a},
-	{0x0327, 0x04},
-	{0x0329, 0x00},
-	{0x032a, 0x05},
-	{0x032b, 0x00},
-	{0x032c, 0x00},
-	{0x032d, 0x00},
-	{0x032e, 0x02},
-	{0x032f, 0xa0},
-	{0x0350, 0x00},
-	{0x0360, 0x01},
 	{0x1216, 0x60},
 	{0x1217, 0x5b},
 	{0x1218, 0x00},
-- 
2.34.1


