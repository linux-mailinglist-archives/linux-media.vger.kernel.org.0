Return-Path: <linux-media+bounces-49396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F915CD85E6
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83EB23010CC1
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED6D2F6184;
	Tue, 23 Dec 2025 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jllWWhli"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C3D10F2
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474591; cv=none; b=q+2HWVEBYPB1Fmt541FqopXaM8UTM2MXqNHIKr24WHPEpipZs5kgPMM489lKng/OEgIgBLZ9QuFYwlQrTiw+PZBJBiTUVJm1/1FLchO1Z9H730sZhRm4G01AlMKJWN4WN+5/hbiAI8wQXkcjpq9WuRogGCQepASPOglg4aOLsIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474591; c=relaxed/simple;
	bh=FYNupHGsQLpVGVkNy1Fw7yoohfUzQXoGHNC5Riw5oCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=e0JYtlCt5qoWa2YdW5+yV+K/y2i4ODl+jqbCEwKcAJ2hqf4H6D1RxfecmpLwOOaSQgZ8ziB99wQPlYvhyQZ5jiXZRvat5l01D20dD1bk9nIMmgyNvWyZBpfroxKsoetI/8UDTGdTk7cbNtQDrrJRX8r29nPDQwevPH7lW/tqR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jllWWhli; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766474589; x=1798010589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FYNupHGsQLpVGVkNy1Fw7yoohfUzQXoGHNC5Riw5oCA=;
  b=jllWWhli4Dpcf949Ya4++jvmx7S1fjjYa7wUFLdCWo72ueNegsw0BnxA
   84/rSbPeo7HsEdegJjKOI6N5YTvpIZAFw03fOepkHXjDfW8V5oW2cldcc
   uiXBGMuGtOndCKH7UwLYWWSxCURAG+O1n1QVdLMTqgaUx3p3MNtadH2I6
   2TnWVgT0RAe4AFNJ193v05bw+MkdtubBQuN9+LQsuq8gJ/r4K9V3SeJHx
   krdIYGMw5IeOZbz1Lm9aVHp+cc43tBlOfUxrsghTv+Malc+9WiEvbTMmC
   CvjL126Il3Ws/VS+1vtWETbO+/E9w1JbVJ+0GrAjyNnpjc7zetKuHwh9R
   A==;
X-CSE-ConnectionGUID: tIBI1YpgTVyJT+hA1fGTwg==
X-CSE-MsgGUID: SWZpwB1eT5GE0TGEeMg8jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79043738"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79043738"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:23:06 -0800
X-CSE-ConnectionGUID: UrgMq3ZJRZudbQV+DDctxg==
X-CSE-MsgGUID: PZ2pG2diR1uWzmsg79Ey2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199747403"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:23:03 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 0/6] IPU6 and IPU7 driver fixes
Date: Tue, 23 Dec 2025 15:22:57 +0800
Message-Id: <20251223072303.4078094-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

This patchsets contains some fixes for IPU6 and IPU7 driver, and
also cover a code cleanup for IPU6 driver. It also update the CPHY
settings for IPU7 according to the PHY specification update.

---
v3 -> v4: replace WARN_ON_ONCE() with dev_warn_once()
v2 -> v3: split patch and add IPU6 RPM put missing patch
v1 -> v2: fix build warning: ‘cap_prog’ may be used uninitialized
---

Bingbu Cao (6):
  media: ipu6: fix typo and wrong constant in ipu6-mmu.c
  media: ipu6: fix RPM reference leak in probe error paths
  media: staging/ipu7: ignore interrupts when device is suspended
  media: staging/ipu7: call synchronous RPM suspend in probe failure
  media: staging/ipu7: update CDPHY register settings
  media: staging/ipu7: fix the loop bound in l2 table alloc

 drivers/media/pci/intel/ipu6/ipu6-mmu.c        |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6.c            | 10 ++++++----
 drivers/staging/media/ipu7/ipu7-buttress.c     | 17 ++++++++++++++++-
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 13 ++++++++++---
 drivers/staging/media/ipu7/ipu7-mmu.c          |  2 +-
 drivers/staging/media/ipu7/ipu7.c              |  6 +++++-
 6 files changed, 40 insertions(+), 12 deletions(-)

-- 
2.34.1


