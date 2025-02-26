Return-Path: <linux-media+bounces-27044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD17A460CC
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F4137AB38D
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EF521B9D5;
	Wed, 26 Feb 2025 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ufq1fxms"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC0224AEB
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576220; cv=none; b=u3cqyMplNwGRpVZ2PpS37iF+ZBLVBd68vIEjFGxSoSfFzv5M7jbNjYkqO/T1PHeDOYzYQDUzqroCgrrS6JGmOfaP/pYiWGSyKErWI9/Y4WSNpqhbz2bIIr4KrN19chuKQX+8vqoHpIDoYVejDYRSwBA3GDQwVe8daobYcgaW4uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576220; c=relaxed/simple;
	bh=EP1iiWANqvyeBsSafYiii6TYIhPbiVWsYF1udG1/JBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OTuQTBuHZ1tSKx4ogE3J2GDu18JzaV8diOJxvjsdV2BM6cFr9goBQaxJ1iOPJxs4jKdgW6DU627dYSVIaSxPlwjkvEw9GDnrhmdfwybcBxuQm4HO+wYykNFCFWLkFm6bKyjLb/Ihdhm/lVnbSTHuaJu+2uGwmSHIqcqghH9ePJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ufq1fxms; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576219; x=1772112219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EP1iiWANqvyeBsSafYiii6TYIhPbiVWsYF1udG1/JBE=;
  b=Ufq1fxmsqFUp/Diuur0JCeQR7QwOfX8kn+4CjNFRPbIfne0uW4L3MRRH
   MQoG3etWJ0oGqglNrVYiGFXB2bzOATY8QEsEdxEogHVw8P/xZFkbdXyLu
   NaYMBL6PndhN8LVcjL/OW4YJLW7E1MbN5G2COefJw5tL7spFxWYQ9Q7II
   FdMVaFx9EPJP29/CXRJtFoIx8pj9VKBpKcnwweDpfAUQPGAV7/zr5Nv4Y
   tfWOlna8RuBmsxGbNwGW2JDgY7nRCcmW/tVLfGrZY47wCOPYhDMl5NNhi
   ZcQ5L5gGp4tRgN6rz2b8FsSgNxETlSynlfd+aYT3Ic0AvGOVOiXXtNTP1
   A==;
X-CSE-ConnectionGUID: dK1AOBxCRrC/BEcqJd5fkQ==
X-CSE-MsgGUID: UBmc0DW0Spyqj2slbrZN6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41548666"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41548666"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:36 -0800
X-CSE-ConnectionGUID: kgQI6QJ6Qj6ofYMCkeElIQ==
X-CSE-MsgGUID: 9D+yRFt0QNCLO3rRiddyYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="116724121"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:36 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 066CF120867;
	Wed, 26 Feb 2025 15:23:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNq-00AYyA-02;
	Wed, 26 Feb 2025 15:23:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 5/7] media: ccs-pll: Print a debug message on too high VT PLL OP clock
Date: Wed, 26 Feb 2025 15:23:17 +0200
Message-Id: <20250226132319.2517656-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226132319.2517656-1-sakari.ailus@linux.intel.com>
References: <20250226132319.2517656-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In general the CCS PLL calculator prints debugging information on the
process to ease debugging. This case was not annotated, do that now.

Remove an extra multiplication while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 611c9823be85..66281f676707 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -318,12 +318,13 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (pll_fr->pll_multiplier * pll_fr->pll_ip_clk_freq_hz >
-	    lim_fr->max_pll_op_clk_freq_hz)
-		return -EINVAL;
-
 	pll_fr->pll_op_clk_freq_hz =
 		pll_fr->pll_ip_clk_freq_hz * pll_fr->pll_multiplier;
+	if (pll_fr->pll_op_clk_freq_hz > lim_fr->max_pll_op_clk_freq_hz) {
+		dev_dbg(dev, "too high OP clock %u\n",
+			pll_fr->pll_op_clk_freq_hz);
+		return -EINVAL;
+	}
 
 	vt_div = div * more_mul;
 
-- 
2.39.5


