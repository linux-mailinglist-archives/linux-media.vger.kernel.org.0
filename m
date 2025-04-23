Return-Path: <linux-media+bounces-30808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA65A989E4
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A97847A7EEC
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 12:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8FE270574;
	Wed, 23 Apr 2025 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOAiSNRc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F7627054A
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411664; cv=none; b=IBMPf/XNxjZMdvVM3ncl4WowxnT1Ur7XNxBM4MFulIAYCupjXE/KvkeBi9WDrRRkEQNZ+1yzfCr3M4NssyhR5oKcMCEa0BfRzxj0HkJRE86wolL671AMQeXlHmfNk7u6rs1ZxKx9Ve6lVTFbFauv7HVoTsi2+kHTf9yuQHk4qDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411664; c=relaxed/simple;
	bh=SxUt9//60mhk7pXOZ2RGarKHwK+XYS5JiyeJMdGsNQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mVhlK+a1GO9NZ3vPNbkYqLBz0tny1foPSpVw9ZhZ114+Tqr0RYzD33My00T6RxIru9SDXS58Lm758DgAWR2+XCOkVRkaTGdttENH85G6SylXROzjkxle68Dud1y+GJZHq170DoZuxhRsltqFfVXTzvfpEkq0kS34Lhyd6A1FLlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOAiSNRc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745411663; x=1776947663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SxUt9//60mhk7pXOZ2RGarKHwK+XYS5JiyeJMdGsNQs=;
  b=AOAiSNRc8ZcDwUPRN5vi95cn/hG1KWv6KA5EpaUpMbdo/jIZrynW3Rhw
   7NDh/bSBcPOZVzGYqdPe9xPbrvaWTw7c6+tRD/XGF8j0Mklp2krUfUffg
   tn2+PUfBOPZ3qpCNQqwPA8sFaR8M9CHAxB4vSHD1c6F/5eh1LkLyzpNme
   JqhD6OPg81mQne/gJP0Sa0yC0tghYlWvBKeONfhDof7VLIIaOQqGZdMy7
   Nj9HTycYEyxvGiUtgRrF0+mxwXoYZ6HVacP2L4SrWxU7TvsjQKjhb86Xl
   w0ZR+2HkaDxIEswZlK78ff/a05WZOXQ3gk7ImN75GDjkJZyHNQrjH5Y9B
   Q==;
X-CSE-ConnectionGUID: 5FDwZaJdQpakNTcIi0+rQA==
X-CSE-MsgGUID: js1TUVnHR82ZHzLS+7HTWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46704403"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46704403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:18 -0700
X-CSE-ConnectionGUID: KkUdaFJDShGqhGpBSJSJrg==
X-CSE-MsgGUID: ldBrwQifSYqU1MEbwJgGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132148623"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:34:16 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DF812122B0B;
	Wed, 23 Apr 2025 15:34:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7ZIn-007YWG-2t;
	Wed, 23 Apr 2025 15:34:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dongcheng.yan@intel.com
Subject: [PATCH v3 11/11] media: ccs-pll: Document the CCS PLL flags
Date: Wed, 23 Apr 2025 15:33:59 +0300
Message-Id: <20250423123359.1800904-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
References: <20250423123359.1800904-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the CCS PLL flags with short comments. The CCS spec has more
information on them while the added documentation helps finding the
relevant information in the CCS spec.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c |  2 +-
 drivers/media/i2c/ccs-pll.h | 27 ++++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 87798616b76d..8f9a695bd9e5 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -129,8 +129,8 @@ static void print_pll_flags(struct device *dev, struct ccs_pll *pll)
 {
 	dev_dbg(dev, "PLL flags%s%s%s%s%s%s%s%s%s%s%s\n",
 		pll->flags & PLL_FL(OP_PIX_CLOCK_PER_LANE) ? " op-pix-clock-per-lane" : "",
-		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
 		pll->flags & PLL_FL(EVEN_PLL_MULTIPLIER) ? " even-pll-multiplier" : "",
+		pll->flags & PLL_FL(NO_OP_CLOCKS) ? " no-op-clocks" : "",
 		pll->flags & PLL_FL(LANE_SPEED_MODEL) ? " lane-speed" : "",
 		pll->flags & PLL_FL(EXT_IP_PLL_DIVIDER) ?
 		" ext-ip-pll-divider" : "",
diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index 754eb5f52cc4..c668ee4d4493 100644
--- a/drivers/media/i2c/ccs-pll.h
+++ b/drivers/media/i2c/ccs-pll.h
@@ -18,19 +18,40 @@
 #define CCS_PLL_BUS_TYPE_CSI2_DPHY				0x00
 #define CCS_PLL_BUS_TYPE_CSI2_CPHY				0x01
 
-/* Old SMIA and implementation specific flags */
-/* op pix clock is for all lanes in total normally */
+/* Old SMIA and implementation specific flags. */
+/* OP PIX clock is for all lanes in total normally. */
 #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
-#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
+/* If set, the PLL multipliers are required to be even. */
 #define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(3)
+
 /* CCS PLL flags */
+
+/* The sensor doesn't have OP clocks at all. */
+#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
+/* System speed model if this flag is unset. */
 #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
+/* If set, the pre-PLL divider may have odd values, too. */
 #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
+/*
+ * If set, the OP PIX clock doesn't have to exactly match with data rate, it may
+ * be higher. See "OP Domain Formulas" in MIPI CCS 1.1 spec.
+ */
 #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
+/* If set, the VT domain may run faster than the OP domain. */
 #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
+/* If set, the VT domain may run slower than the OP domain. */
 #define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
+/* If set, the PLL tree has two PLLs instead of one. */
 #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
+/*
+ * If set, the OP SYS clock is a dual data rate clock, transferring two bits per
+ * cycle instead of one.
+ */
 #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
+/*
+ * If set, the OP PIX clock is a dual data rate clock, transferring two bits per
+ * cycle instead of one.
+ */
 #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
 
 /**
-- 
2.39.5


