Return-Path: <linux-media+bounces-49271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A0CD4937
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E38B3006F47
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 02:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73E0231829;
	Mon, 22 Dec 2025 02:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGX6HMAD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D0EBE5E
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 02:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371689; cv=none; b=Rmbhr8F3xReHojUy5s0T8KRefmB3dCNxV92Wg/uupNWFWMdGL2yrzt5WZ47mVKqc0kS11RLfXHYZq4AYtR+7ZbFi9p06bXO/Jny95F3GMMP7wd9/nmq3NvVsLjOM+xMp6JQ8Az8t7AAnUbZp4icm9HFaM7EXZzBufJ7Lt3Fmdfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371689; c=relaxed/simple;
	bh=QYgR4JwzosEiKC45+ASh46/x/vTwUr+rv2pclvPX73w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SjnEkAAQTQD7lFoYQMvVtpkFhS9Pt4gmMHJd+tBLdwszZGbsBSL89T6mDyAhh5Fkudw1JJfvmwVQxlZjIpDdU7brTS4pS8Q0w+HxJ0/n9LpdSpfovwG3o5Chz4v5oMUuuYJGWJhXafCiDzIAIzUM/9U0QPZSY/nGFGPVy21JhIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGX6HMAD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766371688; x=1797907688;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QYgR4JwzosEiKC45+ASh46/x/vTwUr+rv2pclvPX73w=;
  b=TGX6HMADgfT6TDJtnq+wh6L5CHlxmw2B04HH0p6KOzMMV+Wxv2zUDHOC
   CH6IdwqRFlVDn5c7tQ/ukppd5whnRJLquHk1JhcWmb1A0MRxjNQTUxR4P
   e42pwWB2NJ74demosals7det8IW3GiAe21S41BqmlWPtzR57dz4aVDMzq
   9wPPV2kQ9Bg2tECW5mszyir11FKsAG2ne78KRGSppbAydgfZM7o5IbWHt
   7q2TOTRrnKFvSjFg1LnJp33QBoNMdccDTEC6eOh3lauT+KurZ6XBZFN/Q
   4KQ1peM7jqhCe+amNNSsw1C09sqzHMujnSQjQqZ0Q6aeTCS0wHK/cwFvV
   A==;
X-CSE-ConnectionGUID: BT2lht2xQCil0oJdSfgx2w==
X-CSE-MsgGUID: qvfCURMKSUu/pKA+P7kvkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93701890"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="93701890"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:48:06 -0800
X-CSE-ConnectionGUID: PeR5MWDeQ1mEH+gv/Z8YJg==
X-CSE-MsgGUID: pmL2Q0aPQqePIHi8ZWGHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203545224"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 18:48:04 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 0/4] IPU6 and IPU7 driver fixes
Date: Mon, 22 Dec 2025 10:47:58 +0800
Message-Id: <20251222024802.1253754-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

This patchsets contains some fixes for IPU7 driver, and
also cover a code cleanup for IPU6 driver. It also update
the CPHY settings for IPU7 according to the PHY specification
update.

Bingbu Cao (4):
  media: staging/ipu7: ignore interrupts when device is suspended
  media: staging/ipu7: call synchronous RPM suspend in probe failure
  media: ipu7: update CDPHY register settings
  media: ipu6/7: fix typo and coding errors in IPU mmu driver

 drivers/media/pci/intel/ipu6/ipu6-mmu.c        |  4 ++--
 drivers/staging/media/ipu7/ipu7-buttress.c     | 12 ++++++++++--
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 15 +++++++++++----
 drivers/staging/media/ipu7/ipu7-mmu.c          |  2 +-
 drivers/staging/media/ipu7/ipu7.c              |  6 +++++-
 5 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.34.1


