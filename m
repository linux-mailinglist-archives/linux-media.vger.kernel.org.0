Return-Path: <linux-media+bounces-49400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E0DCD85FE
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24DEA302CF49
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAD42F6577;
	Tue, 23 Dec 2025 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWM5NMUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5231DF963
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474596; cv=none; b=Wz/2lAbK8pWEBm7X5/EfG84WV1TQYZAX8U6MGS15gs89erQA4pW3SfDNafveel3oCvqfmfj1HtY/5FX+cOazeck/8UmUKPYr13ZNXzJavDkTvyLv/m6o0n2WrPSIrLkSKxMrzRkZfboe0VkcmgICQa6nOKpzCECjQ5+D/khg0dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474596; c=relaxed/simple;
	bh=2xhFMwJNR9TRm071yTmB4kDsnZPxn0e8jQ3sOr/WCUU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YhlAiZbwhjNdYU+JgpmI+tuEsnrtc//tIb9wyvOQTlCKlFDmOZbyyqPYvJCY1eX7Ob6OCcmQzkaGKWicMPZw9J7eHjacNhlJ3I6Ur4XUVpHwJ2kTQJCzrLo8mUo+5fCduciXrk6Aw6XyQOThNXvhLJWzptYZcDD5DiZdBmLoDZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWM5NMUY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766474594; x=1798010594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2xhFMwJNR9TRm071yTmB4kDsnZPxn0e8jQ3sOr/WCUU=;
  b=fWM5NMUYGoKLX84rQtg9X9d5Kkm/O/GSJiHWL8AVitzfv6BzVlxu6Kwk
   l3A+mU0zQEK/gYI4GA9Outzr43pyFV+kIg/EMvAapACLkYy9BZM4Fnnsa
   YM/YrTKiaLHaXcJnmjNmNNBq2tMaowCGAjIMyVvjWkDzMsul213p1rbaE
   WPLRsVRoRfcBHkff6TbsjxkdcgASzdnNQA57pCVERZRihgs/V60mOHFeb
   VUYClfd7I4XwCs0nUOZZxexhKpm8wg4socl6MmdVN2MiL0SlYi1JEsb6t
   EBJWzfccEVlDlYswpQUwtzCV3VNQ0snujxG9SCwwxD7KyqjUnebssfJuw
   Q==;
X-CSE-ConnectionGUID: q1zHC8cvQlyzkpROpqFLuw==
X-CSE-MsgGUID: /N/C5vIZR3+4drehaORfng==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79043756"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79043756"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:23:14 -0800
X-CSE-ConnectionGUID: rQXd5LjjSHCug3XxL/REHg==
X-CSE-MsgGUID: 38YK8KCoSheObipHHHReSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199747433"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:23:11 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 4/6] media: staging/ipu7: call synchronous RPM suspend in probe failure
Date: Tue, 23 Dec 2025 15:23:01 +0800
Message-Id: <20251223072303.4078094-5-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223072303.4078094-1-bingbu.cao@intel.com>
References: <20251223072303.4078094-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

If firmware authentication failed during driver probe, driver call an
asynchronous API to suspend the psys device but the bus device will be
removed soon, thus runtime PM of bus device will be disabled soon, that
will cancel the suspend request, so use synchronous suspend to make
sure the runtime suspend before disabling its RPM.

IPU7 hardware has constraints that the PSYS device must be powered off
before ISYS, otherwise it will cause machine check error.

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


