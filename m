Return-Path: <linux-media+bounces-49384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB13CD8349
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E17330341F2
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DC42F6165;
	Tue, 23 Dec 2025 05:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJl+p0np"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC29E234973
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468330; cv=none; b=Cx7mEm44YKebxTpaIJwvJwGmZ/KlQLVj0D3zLDVqXDod8l6tYq5tWO6X8Fp7dUagjYzHhk3GS29rC11muO/IhOOIq7bx3k4i6NELaEOlO/TneTUnPyWm0RDPi+4vDl3CPhoNXA1fh+mH9vrvz8GGNr2OFDR+GPiPA6o9+s+/IUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468330; c=relaxed/simple;
	bh=vLeXhYsMcEJqPH1VPNE8Z7L3NES+AMop8pavANMbNNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MdSHi1BZy9TtkbDrAqc2EufqPTTutMSO1AIUGeaDjrcnNfIRBKB3Q1WRV61hha5kxOerHE6OEJAZAbV/AZ1sRZoZfvk/kdQKhZuMeu0/5x+RJ1eclbeEUdzzdg9035t839NYhmqoZmJPWeTmcfECvaNOVpqeBs9XHslPtSHou6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJl+p0np; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766468328; x=1798004328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vLeXhYsMcEJqPH1VPNE8Z7L3NES+AMop8pavANMbNNU=;
  b=JJl+p0npnxFmZFoeWmqatNO6lc8hVDw3l4Pr36E/TYdPB+7ltw8irsMw
   INmjQnm7llkJ/CrQLYZHfXlPzob4TpLFcs2/1Jg57RXcryYyhptD4coYH
   JbAo65NY/Qp5RVc6LABJsWVtFfENPUcxiQ16r23CQ7Tm4M6o5sSJElACG
   kpMDURZdb/BCKBrufjjnOCFxuJmIrwSJ388MJrytA87i3LTrAPHmrmxh5
   4Li8MnKP8Ep/0YH4ZC8DKiyBHfVcQNzcLQj3QPnauKUvJAL0p4aW2HJmb
   iq7KSEWHrMc1FUitZOywzw56LIJtoqzXivbL39cAurn1ZZV8ITSp7vjPk
   Q==;
X-CSE-ConnectionGUID: K/9IZit4QfKH1qLddtLmgA==
X-CSE-MsgGUID: WIx+y4psSWueQB0RFRADHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68255978"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68255978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:38:47 -0800
X-CSE-ConnectionGUID: hSWB++ccQwiFVFubFIqjRw==
X-CSE-MsgGUID: 8/JxuXSPSFWDXi2b6vPSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199366556"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 21:38:45 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 0/6] IPU6 and IPU7 driver fixes
Date: Tue, 23 Dec 2025 13:38:38 +0800
Message-Id: <20251223053844.3124621-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>


This patchsets contains some fixes for IPU6 and IPU7 driver, and
also cover a code cleanup for IPU6 driver. It also update the CPHY
settings for IPU7 according to the PHY specification update.

Bingbu Cao (6):
  media: ipu6: fix typo and wrong constant in ipu6-mmu.c
  media: ipu6: fix RPM reference leak in probe error paths
  media: staging/ipu7: ignore interrupts when device is suspended
  media: staging/ipu7: call synchronous RPM suspend in probe failure
  media: staging/ipu7: update CDPHY register settings
  media: staging/ipu7: fix the loop number of in l2 table alloc

 drivers/media/pci/intel/ipu6/ipu6-mmu.c        |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6.c            | 10 ++++++----
 drivers/staging/media/ipu7/ipu7-buttress.c     | 12 ++++++++++--
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 13 ++++++++++---
 drivers/staging/media/ipu7/ipu7-mmu.c          |  2 +-
 drivers/staging/media/ipu7/ipu7.c              |  6 +++++-
 6 files changed, 34 insertions(+), 13 deletions(-)

-- 
2.34.1


