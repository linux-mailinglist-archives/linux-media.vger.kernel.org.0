Return-Path: <linux-media+bounces-49281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F8CD4D69
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 176773008F81
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 07:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E3B27F005;
	Mon, 22 Dec 2025 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXBgBNr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D1A24677A
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387195; cv=none; b=KVc3QF25uT0LdppdxD1LOOfkhs+SbLlmgULVR5ybQoYQe0qgRiFfW9Ao2WQ/DKeVly2E1ZQ19elHb+0jxP5Ht5/7XxXISgX2pYEAfTtzDlPVOLmRXsBhG5KqZKdaUiN2zeGhbax2m75wq26lwvCBBAw8DYkTij3Mfc+lRWGZwgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387195; c=relaxed/simple;
	bh=aI0q+jCRGhbNFBquaYdh8ENIm5FmLpw5IOaCfLCzmqs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TItaxTPymzk4BNiQds3iFY9Q+pFriImX7J5BiTdWjq14up/8wKroaQuGiAcJU7KYIxuX10afLAp+yZIGUT3ndvPQ00h9sVuPL6kKbTb8Lep7dP4STVcv7nLDYzEXWTGtnRyPnMOdGCnFUaJrnz/D3PVvhZ3l1q8lz1Ruv7onRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXBgBNr9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387194; x=1797923194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aI0q+jCRGhbNFBquaYdh8ENIm5FmLpw5IOaCfLCzmqs=;
  b=hXBgBNr9aVh0qL0IAnEjmLgbuZVfbmuzJ/WmCVOi6hsvFTJdAUbZh/ie
   hbvBp+bsLxtJN2AEqNAMdS3+sODQiDlqfxgnV1G4clgz6wL8oP8SUlcHA
   eZ+iTqpmhgFIAgzqx+DNNAxpLW3PGkkHMhDSMP6cejTjeJP3eNB+w4tEj
   WxO0pGiUeIgKLCDmFAw+stUIXn4hAGDcHfFZXW8/GgfxwIV6tYVogoAFR
   Lr8F4xwJIoyw+o2UcTKCdqabhjPbxD3ftwBAb9/9+ifoHKoo0VIML0U8y
   DmDxxQw2am2K5104JRJG8PcOt23pqhX7fV1EmKS8dawXCFzUIWYRVrLLH
   g==;
X-CSE-ConnectionGUID: /3dK5J1qRlat+fSTWyo/jQ==
X-CSE-MsgGUID: ITzHX/rPTXWj83UfmQkXpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55815074"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="55815074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:06:32 -0800
X-CSE-ConnectionGUID: XixMxRrwT12EhvWqNpyxXA==
X-CSE-MsgGUID: iA78MFxGQiGNeLf/wSv9dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200347383"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 23:06:31 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 0/4] IPU6 and IPU7 driver fixes
Date: Mon, 22 Dec 2025 15:06:25 +0800
Message-Id: <20251222070629.2018807-1-bingbu.cao@intel.com>
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

This patchsets contains some fixes for IPU7 driver, and
also cover a code cleanup for IPU6 driver. It also update
the CPHY settings for IPU7 according to the PHY specification
update.

---
v2: fix build warning: ‘cap_prog’ may be used uninitialized
---
Bingbu Cao (4):
  media: staging/ipu7: ignore interrupts when device is suspended
  media: staging/ipu7: call synchronous RPM suspend in probe failure
  media: ipu7: update CDPHY register settings
  media: ipu6/7: fix typo and coding errors in IPU mmu driver

 drivers/media/pci/intel/ipu6/ipu6-mmu.c        |  4 ++--
 drivers/staging/media/ipu7/ipu7-buttress.c     | 12 ++++++++++--
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 13 ++++++++++---
 drivers/staging/media/ipu7/ipu7-mmu.c          |  2 +-
 drivers/staging/media/ipu7/ipu7.c              |  6 +++++-
 5 files changed, 28 insertions(+), 9 deletions(-)

-- 
2.34.1


