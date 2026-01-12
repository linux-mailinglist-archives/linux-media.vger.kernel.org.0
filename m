Return-Path: <linux-media+bounces-50407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCC6D11B2C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 549A8307767F
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A1E27C84E;
	Mon, 12 Jan 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCfY28Rt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ACA26ED56
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211998; cv=none; b=dEypLYo+mp4tZcnLgxEm7TEPv1rmUMW2ea8j1JW/hf0VYE0JOcnjBUl4y63x2vF2UGFROjB8SnhtdcSKB2v3zWlhYw824bJ0RQ0qiJgQyl2h5CRtCeNnsEp4bN8bcJbnUZT/mZJcI0qo2FzaistvT4g7pHj/4llwnh/14DjLB10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211998; c=relaxed/simple;
	bh=PQ15caQ05KvKv0IndrU51S3aieqepP8O0sHiNtXFhLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2LKH/yGlzhMHW/acaMK79d/mHr7GiIRzdA9EEvXItG+KcMMIGhj0scyCULSRpgiJTFDow3UOAL2LA4gDRzQ+IRDFX59EhOVsxqOIuD+tOll+x0tTT7hOeuCwffsbYxcNRkKlrOFmb/m2he+S3Pcsco5ll31Oe9CCyHPhizE508=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCfY28Rt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768211997; x=1799747997;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PQ15caQ05KvKv0IndrU51S3aieqepP8O0sHiNtXFhLA=;
  b=HCfY28RtfXJi0NtfqPkqStl87sKWbuNyLcaAhx8BXQJf8tBp2Lu3BIgR
   VwpX8TFccPy8YQTbEwPzteCtH8y/EX+F6EvB+NFQqpkgNEcCFIoyA7Lhe
   y4l9j60RYI3+JPqSC0/aRH6cINYL/BA+hpHVFryYoqQJecfDfr7ug7YEf
   bbim3cLxSc/nYETtMJtoti8vG1LKryuN1B4cZiBfawI0UUchjX9z8cnfh
   QOI8A/IGeVqdVYXO+zmj6r8T5AgoI0yZO+OWWbgOqFDCN0DDY2Kyf0L+h
   PjfQWBsK+qAHTr3KPtXpcYGQlXA/rfm/BwU0eFbJvx4v72TA/5oUfM20R
   Q==;
X-CSE-ConnectionGUID: hknDZ7e0SImFgI8e4yspVQ==
X-CSE-MsgGUID: F+oU0fVcQ+S4xD1uFA51VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218779"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:54 -0800
X-CSE-ConnectionGUID: ZASj8Wq/Q0iacoHLidhfdg==
X-CSE-MsgGUID: aCsFsdSLQV6t6Jc7RdqUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743093"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:53 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 24310121EA8;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiD-00000000113-3v8V;
	Mon, 12 Jan 2026 11:59:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 00/23] media: i2c: ov01a10: Add crop, ov01a1b support
Date: Mon, 12 Jan 2026 11:59:26 +0200
Message-ID: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

I've squashed fixups from Hans on v1 plus addressed some trivial issues
brought up by Mehdi. Also I've kept ov01a1s support out for now as it only
supports an IR pattern.

v1 is <20251014174033.20534-1-hansg@kernel.org> on LMML.

Hans de Goede (23):
  media: i2c: ov01a10: Fix the horizontal flip control
  media: i2c: ov01a10: Fix reported pixel-rate value
  media: i2c: ov01a10: Fix analogue gain range
  media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
  media: i2c: ov01a10: Fix passing stream instead of pad to
    v4l2_subdev_state_get_format()
  media: i2c: ov01a10: Fix test-pattern disabling
  media: i2c: ov01a10: Change default vblank value to a vblank resulting
    in 30 fps
  media: i2c: ov01a10: Convert to new CCI register access helpers
  media: i2c: ov01a10: Remove overly verbose probe() error reporting
  media: i2c: ov01a10: Store dev pointer in struct ov01a10
  media: i2c: ov01a10: Add ov01a10_check_hwcfg() function
  media: i2c: ov01a10: Add power on/off sequencing support
  media: i2c: ov01a10: Don't update pixel_rate and link_freq from
    set_fmt
  media: i2c: ov01a10: Move setting of ctrl->flags to after checking
    ctrl_hdlr->error
  media: i2c: ov01a10: Use native and default for pixel-array size names
  media: i2c: ov01a10: Add cropping support / allow arbitrary sizes
  media: i2c: ov01a10: Remove struct ov01a10_reg_list
  media: i2c: ov01a10: Replace exposure->min/step with direct define use
  media: i2c: ov01a10: Only set register 0x0305 once
  media: i2c: ov01a10: Remove values set by controls from
    global_setting[]
  media: i2c: ov01a10: Add ov01a10_sensor_cfg struct
  media: i2c: ov01a10: Optimize setting h/vflip values
  media: i2c: ov01a10: Add ov01a1b support

 drivers/media/i2c/Kconfig   |   1 +
 drivers/media/i2c/ov01a10.c | 918 +++++++++++++++++++++---------------
 2 files changed, 548 insertions(+), 371 deletions(-)

-- 
2.47.3


