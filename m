Return-Path: <linux-media+bounces-27038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C64A460B9
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED481898A59
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 13:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9F4222576;
	Wed, 26 Feb 2025 13:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ7DklUj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B48F21D3E6
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576215; cv=none; b=UiGYryPsTMBT+DWnNWPK6makwcVRhbvcSIOK9Yd2ilutY7zfigIzvqdRzvpeMe3p2zloDNIBNMBdFEu/HI85H5fKhwFMbJoSdP0/q1IsB/9XUrNs8Qu45wX9EbiKau9+Fl/9PvaoK11H8nWVHK48RjRqZi1o4P6C/ng5DudFr+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576215; c=relaxed/simple;
	bh=lv3A724qG+vJd0CId4qPJp5swfj6Xu4ZRzdySwIVDn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=quJP0IEQA0/XiXS/Ei/OC30IJERclnmybGzQnUJlFBmxmQqk4OBWnAV0hzI+Oa0fUzVScqc1bh5bZ7BuYgxr1gshzAvL6hTT7saRCjqQT8uXyuR1H/+1jpt5rf3W18ivJNgPNDehLa2lcAJABD73/4zFxgv0SWho64fKvak1n3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQ7DklUj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740576214; x=1772112214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lv3A724qG+vJd0CId4qPJp5swfj6Xu4ZRzdySwIVDn0=;
  b=fQ7DklUjF3NmvP6RDzqL26Q0L1IIRbqnrekH3y4A16wDK49w2c6WdoDh
   2+P8JuT7WuZ8SB1AHhIDKW2AOjD5o0pzeQ2gElR+frBB19NS3cDf5amfe
   fU6nsrndazc/6p6KG3e911dnPaD4M9fH/zexZ2Cey1ZMjvuIQfT9Ep0JR
   dvCDV3WzzQ8whqZ5BxPyL+CF2i+XHpF3FUSSoR8cNqtvG/HRUKEox+ZzT
   V07/IuxeZt1WzKvjXW58qA1nNhRmQxiLA9oRFFpi6u1lqAj96QWql4mgL
   5pvxM7UnNYvpsm0OQqLjBXr5L0BzbyoH+GLnBXFc/gftCh2kMwCCQTqkG
   Q==;
X-CSE-ConnectionGUID: xideVHjYRvW8ONTBtZWijA==
X-CSE-MsgGUID: PQytnQAmQAWuY4YuuyBFPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45331987"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="45331987"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
X-CSE-ConnectionGUID: AlC8CUXmQl+8JxyRYWMElw==
X-CSE-MsgGUID: AlbUra8iQuyUHVqBZsOXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117622416"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:23:33 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 029BF1207D4;
	Wed, 26 Feb 2025 15:23:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tnHNp-00AYy5-3C;
	Wed, 26 Feb 2025 15:23:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: dongcheng.yan@linux.intel.com
Subject: [PATCH 4/7] media: ccs-pll: Correctly the upper limit of maximum op_pre_pll_clk_div
Date: Wed, 26 Feb 2025 15:23:16 +0200
Message-Id: <20250226132319.2517656-5-sakari.ailus@linux.intel.com>
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

The PLL calculator does a search of the PLL configuration space for all
valid OP pre-PLL clock dividers. The maximum did not take into account CCS
PLL flag CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER in which case also odd PLL
dividers (other than 1) are valid. Do that now.

Fixes: 4e1e8d240dff ("media: ccs-pll: Add support for extended input PLL clock divider")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 9041c020e34b..611c9823be85 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -799,7 +799,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 		op_lim_fr->min_pre_pll_clk_div, op_lim_fr->max_pre_pll_clk_div);
 	max_op_pre_pll_clk_div =
 		min_t(u16, op_lim_fr->max_pre_pll_clk_div,
-		      clk_div_even(pll->ext_clk_freq_hz /
+		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
 				   op_lim_fr->min_pll_ip_clk_freq_hz));
 	min_op_pre_pll_clk_div =
 		max_t(u16, op_lim_fr->min_pre_pll_clk_div,
-- 
2.39.5


