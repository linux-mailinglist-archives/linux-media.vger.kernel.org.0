Return-Path: <linux-media+bounces-30404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F901A91461
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91D2F190765B
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7501219A89;
	Thu, 17 Apr 2025 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViiUeOFv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A0E218851
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872857; cv=none; b=kXi8h6xuDGvhaVGIxYcPUpbZfj6h/vvnuLwHgBcREL6J5fpJHTloDMj+taT5Vd9H4ogTHB48jNbUjzUwkpRKFW/+o8TGUk7TqX3z7x/lMpoDaBAo1Xg0+tMXMha9D/gV9ra14JfDiKQpf7s8VMq4+KYutRMLlVl8q10R0J6V3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872857; c=relaxed/simple;
	bh=3E8tBfqMfzEnIygj2peA4R3b5ANRXdThOSa7Tl1OWlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h1iAVbkEdOMtotxbmZT+tosiC7JRu9O/54DygrTuEK7syNlZsRYRDBiVPq+EH7bL4w71tJLWFRcEk8ld0QlfDsWU03xHYRmktf1ZIVldwVU0kvkXEUogTC8KRi0Z1hh6tkbVXLNI4fFAY69Lsrrxmj+ODVI+/FhkowHf2YJVcWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViiUeOFv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744872855; x=1776408855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3E8tBfqMfzEnIygj2peA4R3b5ANRXdThOSa7Tl1OWlQ=;
  b=ViiUeOFvy0j2M5/ZL+wXWYmDe7Bwddt9ZkcrvOQ+46dvPrZ5n33SqSZa
   G2Tn0xWaOFjhL67n/omLCwOIzxjCD08pBxuXCaC+SwGzoq1ADaN3ZyeA7
   3JdZEo56MVIeN8ESL6/poIwm7ub3U1KXtYPEtjWnd+W+MshjgEM/DPQxZ
   ImkBMGoE4WrsC6+SYBu1UWZLc6xh2Tdp2BGT1wTCTp+imfyY7XOr7y9RA
   TiqDDU2rbXTweAdUxTQJPKNmF+wfoYtgt6q6GoH3fUxTNw5zuVzMYYLvV
   QPNmsyFXOLOg9VjkM3AXyxPxZ8r23iAEV0vIEkYcB7xToMOkj7n73Ql+l
   Q==;
X-CSE-ConnectionGUID: rztFJjckQOyzpenRZaG9PA==
X-CSE-MsgGUID: pRL51CCJRmuW6iUAZ9Q6mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71831285"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71831285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:12 -0700
X-CSE-ConnectionGUID: A5wpdSAKTlqsC1jMGxpH0g==
X-CSE-MsgGUID: tEE3MvpZRpS2EaAWCVn9Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131262198"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:54:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 389B41208E5;
	Thu, 17 Apr 2025 09:54:05 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u5J8P-001J5U-0f;
	Thu, 17 Apr 2025 09:54:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	dongcheng.yan@intel.com
Subject: [PATCH v2 11/11] media: ccs-pll: Document the CCS PLL flags
Date: Thu, 17 Apr 2025 09:53:54 +0300
Message-Id: <20250417065354.311617-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/ccs-pll.h | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
index e8297db45460..6e503fe2d591 100644
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
+/* If set, the PLL multipliers are required to be even. */
 #define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(11)
 
 /**
-- 
2.39.5


