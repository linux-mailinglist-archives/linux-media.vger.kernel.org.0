Return-Path: <linux-media+bounces-49283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4507DCD4D6E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2963300508E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 07:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A7527F005;
	Mon, 22 Dec 2025 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUngaYJF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165B273D77
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387197; cv=none; b=uZhDX/kuNaYdnySPJpu8fjGEJR09IJDk5JZ2DXKbLTbec50mIm9vCpKAB209N6++lSQ5MNJlGJMeIdg7A+mdFUf9rq8aoklT7WNODSwGyHMMHVAjGfRMnqfF2gHRblgHkYuAuAfdC8PDaQYj7YoeIj31E/hF0kjqZPLcct7G/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387197; c=relaxed/simple;
	bh=gKrzQXyh+kg+THyfqJ7ZX91Th+i2jMShR5QS1P7Dlwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U8ryRBWgevsJ6ft5IKi/kYXB9mQoopvZTI/Jx4MJCNdC1wtYhC3RJ332s9GWuBQFDsJKti7YpriR8tWBABboDEAcwF6JT7owGZHVrhjghrf4qFMHFv+uoj+X6HKcxClVSiBqclK+pBbIOrcxx0ibFgQwmXF3cB6opaOBlvOUUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUngaYJF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387196; x=1797923196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gKrzQXyh+kg+THyfqJ7ZX91Th+i2jMShR5QS1P7Dlwk=;
  b=OUngaYJFwL9rEMTmcgmTa5IUN4/lRFqgXpTIkYc5OPCng2YcFCx1qMHx
   /Yl/1pEGalz9m6ME8ET8/xdKHB0PAjvXHKuvnqfrVgRb1Xk1pEypVIBcL
   jhvbyVNdPxFzaH5qOrX5L7xSon8Ts+9wFm41NeYYIQPIC90iLXwcJr6EM
   AIbT884dZlefoz3jy39/tBPzKQLULHp4gdM5qFDxKzOsIEN82uV9C1Pdl
   FSXpjaHccrYOPfatnE7WaWRVhaC7cKwAI65DxV7nz+gcGrYnJzTHq09Za
   2zK8UXjq6oz5SQSQC7oVU5h3ZGjTd4Sk4AqVuKC0+auvx7kh/WkRgNdLK
   Q==;
X-CSE-ConnectionGUID: JwWoNzxLRzG6d/pMrdZY8Q==
X-CSE-MsgGUID: 6hluVIS8R9WdgcdxxC2fLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55815083"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="55815083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:06:36 -0800
X-CSE-ConnectionGUID: E2tmCExyTfCdY3lcVkI6fw==
X-CSE-MsgGUID: 5wqcA5QeSZ2F2tQFdxzrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200347406"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 23:06:34 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 2/4] media: staging/ipu7: call synchronous RPM suspend in probe failure
Date: Mon, 22 Dec 2025 15:06:27 +0800
Message-Id: <20251222070629.2018807-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222070629.2018807-1-bingbu.cao@intel.com>
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
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


