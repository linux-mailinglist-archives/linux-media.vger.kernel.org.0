Return-Path: <linux-media+bounces-49272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE01CD4941
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AAE13005EA9
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 02:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6346927F759;
	Mon, 22 Dec 2025 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5WMJa2Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1565259C92
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 02:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371691; cv=none; b=Fq3UAkREOetfF+3P7+CNpW+B8muY9WiqRs+/K6370Pe2IlnLi6GrQJJKnq1FmnV5cRdGCBU9mUf1KrHAaE9VjbAll7fdZSVQzbBF3+yIYzqi5rEBVIBnkNekyVPxM9RUa+/Fi8bC3thZ5YJPlvREyxZKy8MNxyNwKs7Fei+CBAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371691; c=relaxed/simple;
	bh=gKrzQXyh+kg+THyfqJ7ZX91Th+i2jMShR5QS1P7Dlwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RhsjgoFfkJvT0AkWWqe+2QOIaDm2dBwXuiJT8WMSxi4wR0dTdAemZC126UNyRX+y82q3X9OfJXZ+rV15WGRW7LLi30IEmaQBhxjrfC11LKHa17ik1VJQQ/ERVJ3krpmJlskX2mBorRga+DARURw/ZItQw9LhwHd5VuBQCgR1/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5WMJa2Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766371690; x=1797907690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gKrzQXyh+kg+THyfqJ7ZX91Th+i2jMShR5QS1P7Dlwk=;
  b=F5WMJa2QFXWKaI0wtuwsN9cMucB1JfGCeXiWbVGm2gxqdfo/R9Slqyju
   JTrv6hzY0PSi2Qv0ze7IC0uy3vSc45jZDvjrIyWVLGH4sEga84YybbAqo
   pZ5tnKgJv5Is/9nZEmp+sjoi9nOBaI5hNnTcS8acnLfdPuXtPhlQ4mKlo
   RsVKD6EdIcYga6sbQWxXCOZTMf2iQ3EyGCkpL/zcE5ZwBtMWm8mFD/tc+
   4lP3sqBdHzREhL6lYjB1DAlLrKbTfjKsMT8rpPv/q6RsGg4QJkRMey3PR
   RMC9iTnCiKnqowYt5TIRLtVKd8NxacTzVP6mG3oS891uLDUXkZo4bUcZ8
   w==;
X-CSE-ConnectionGUID: 5mIIGvu6S46O5zRNDUu8lA==
X-CSE-MsgGUID: /M7IyAcpTfaVEFNIK46cmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93701895"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="93701895"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:48:10 -0800
X-CSE-ConnectionGUID: 8bmN/w3wSe+GsggQyU6dbg==
X-CSE-MsgGUID: n5uFCxqiQXairYa92KTtiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203545238"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 18:48:08 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 2/4] media: staging/ipu7: call synchronous RPM suspend in probe failure
Date: Mon, 22 Dec 2025 10:48:00 +0800
Message-Id: <20251222024802.1253754-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222024802.1253754-1-bingbu.cao@intel.com>
References: <20251222024802.1253754-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

If firmware authentication failed during driver probe, driver call
an asynchronous API to suspend the psys device but the bus device
will be removed soon, thus runtime PM of bus device will be disabled
soon, that will cancel the suspend request, so use synchronous
suspend to make sure the runtime suspend before disabling its RPM.

IPU7 hardware has constraints that the PSYS device must be powered
off before ISYS, otherwise it will cause machine check error.

Cc: Stable@vger.kernel.org
Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 6c8c3eea44ac..fa5a1867626f 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2620,7 +2620,7 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
 		ipu7_mmu_cleanup(isp->isys->mmu);
 	if (!IS_ERR_OR_NULL(isp->psys))
-		pm_runtime_put(&isp->psys->auxdev.dev);
+		pm_runtime_put_sync(&isp->psys->auxdev.dev);
 	ipu7_bus_del_devices(pdev);
 	release_firmware(isp->cpd_fw);
 buttress_exit:
-- 
2.34.1


