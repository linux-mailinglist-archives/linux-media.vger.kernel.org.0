Return-Path: <linux-media+bounces-30823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A83A99318
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE2747B10A0
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A855228CF68;
	Wed, 23 Apr 2025 15:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBcTru/4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55709266B4B
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422657; cv=none; b=eXXxk1wB9aRKTNMkKQwuT/NuYhc2MDfS5itgu91PksEXopYM262X+DLIaeE0f7EWfPX85EpaL3JrfIcXXX8tO7lclcsQewr3jnmvjZUBkUfM+U7TLFOPUY13PDYNh5DtUPAEXn1sxucyJ87sWUiv7bG3QB/saYjW//mQF+MPYVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422657; c=relaxed/simple;
	bh=Svosz4NnOiIhFI7TIYQZwkh6byl+aQPvoge4oeKzX4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MtBdC4bpmrbB73e0PApAUzKEVyT0xks5bnxMdQwjM6LwkUDN3c8FEU+oAkQ8MVVB5zEQh41MAPDKvaE1KcwnQAh0yAAqR+jJwCJNG9LEQOf084mvLQQuBo2mX7omMvjkK2MGg+Xr5TuZjSPcZZ2XxOvYoPIu0jRzqmly/4ZNURg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBcTru/4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745422655; x=1776958655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Svosz4NnOiIhFI7TIYQZwkh6byl+aQPvoge4oeKzX4I=;
  b=MBcTru/4tjOrs+f7hj1151sxchTIM0xHi3N2AqrmCedyToZIpuI17eKp
   HdpG7tWkXfkw4kPVtWzH6uwMd878UlqnJHQ6JWTbo96eMZpWWceEIzjPR
   2AYpHlMXB5iwgMAejuvHuzLRDBZUMYAlUVhfH9dCts3+um3I4ZQsGfX88
   5juh9uUFTMZriniaOjLnXgsbRrLcNFFLRL3anm7QjbGGfySIBuGD157RF
   pjbfjqvqCjbiaiwyAcpLF/1sZiiUrT4HvXqiI/PPQsZX3FDahNpXK32AZ
   5lml5JWyxsz7+AklD/VWQZBnREUeEAmyxU1KheAI5/Ny/fOtw6+Gk4gtm
   Q==;
X-CSE-ConnectionGUID: kEn01bCtSyu8i1Gs0VA9/Q==
X-CSE-MsgGUID: 5mvDuJ9dShW54O7JlzNLng==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="72408743"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="72408743"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:37:34 -0700
X-CSE-ConnectionGUID: eNbzLIKJSK+kRLpoboAGEQ==
X-CSE-MsgGUID: vVBjaDcrThOI9YVemfLxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132266685"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 08:37:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0270A11F9FE;
	Wed, 23 Apr 2025 18:37:29 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u7cAD-007Ym0-2y;
	Wed, 23 Apr 2025 18:37:29 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dongcheng.yan@intel.com
Subject: [PATCH v4 11/11] media: ccs-pll: Document the CCS PLL flags
Date: Wed, 23 Apr 2025 18:37:19 +0300
Message-Id: <20250423153719.1801956-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423124322.GG17813@pendragon.ideasonboard.com>
References: <20250423124322.GG17813@pendragon.ideasonboard.com>
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
since v3:

- Refer to pixels in CCS_PLL_FLAG_OP_PIX_DDR comment.

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
index 754eb5f52cc4..e22903931e72 100644
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
+ * If set, the OP PIX clock is a dual data rate clock, transferring two pixels
+ * per cycle instead of one.
+ */
 #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
 
 /**
-- 
2.39.5


