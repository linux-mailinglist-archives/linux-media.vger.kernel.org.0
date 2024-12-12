Return-Path: <linux-media+bounces-23287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B99EE536
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D963E166D17
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F092210F62;
	Thu, 12 Dec 2024 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZxOQdUk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19CB1F0E57
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003479; cv=none; b=EF24Gb3ReATsNDgXlpxkb0QIBP7xHTWIZSP/93q+CewOM0Z5WPnc+7mqSue5zLoqaiWGQc9XmyGjMxSkiMQQM+sgz3hWN5n4d+HgT9nhRj+/domEltjRE9icokQQEhaultHhGHDifqg7ZS/FpVVmoqpV/yzDMl905Ujmupt82mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003479; c=relaxed/simple;
	bh=34tJBa2MOwz6ODCKQWavjGsLFbCq1TsiQdT8y18ZOzU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zj+HK8XO/WbwKBuA+YISy+55PsT/U/n+Qy/38urPv8+GXky4YG7ne3ni/3hMyBQ/6UkBz1QsVDbqA+DhhWzrxk3pzdyqSqVRwYjrnmWPzniBtU5kshpKmFJpQUuayObJ/7hPk9oPL8RrdiYBEwTZQGwrHGXz98W1Vm8wgimU+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZxOQdUk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734003478; x=1765539478;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=34tJBa2MOwz6ODCKQWavjGsLFbCq1TsiQdT8y18ZOzU=;
  b=GZxOQdUkUp8YNk8Wnig19INSTdKEwXqt9uH/cDIwLpyYSUEOsceJBAFu
   wQfAeloiCrjLVkO0knryKwEpvHnUBOmn7ZBUMqNgmXWwWqfEHdSWTN652
   5C1YOqwB3ekewlmPE0hYjjk5cauVgBZVL8kZQk2jqfXAkPe/BJX0w/Snm
   +HwYUDGuTPodcR4p7WX43k9z0iJC3OKRHXZmaPCJuze01uHcFqOJ10hbv
   wTsPTNHirPWhMKfNiri17o44Ocn8dwZENuk44FHAV1U2zq2ADyruh6U9e
   68Gq/m/P1EUI5FoBf2hl+3YiF1p62GXQsjvt3Hy6ImyTMfWa3X+4xSOH/
   w==;
X-CSE-ConnectionGUID: yXklKSDbQGCxGYLbw9OPnQ==
X-CSE-MsgGUID: LIa9oZ+EQ5CnuRQu75rJLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34461060"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34461060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 03:37:57 -0800
X-CSE-ConnectionGUID: sieSVmVzTwmikA5b8BH3ZA==
X-CSE-MsgGUID: khwUuodBSta4OfmE6fSwkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100369124"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.118.67])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 03:37:55 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] media: intel/ipu6: move some boot messages to debug level
Date: Thu, 12 Dec 2024 12:37:53 +0100
Message-Id: <20241212113753.97426-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ipu6 driver is waiting for the ivsc driver to probe,
which can fail or take long time, we can get plenty of ipu6
messages like this:

[   15.454049] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
[   15.456600] intel-ipu6 0000:00:05.0: FW version: 20230925
[   15.458292] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
[   15.461186] intel-ipu6 0000:00:05.0: FW version: 20230925
[   15.463616] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
[   15.466490] intel-ipu6 0000:00:05.0: FW version: 20230925

Print them only when debugging is enabled to do not flood dmesg.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-cpd.c      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index e898902e83f3..d8db5aa5d528 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -847,10 +847,10 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	INIT_LIST_HEAD(&b->constraints);
 
 	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
-	dev_info(&isp->pdev->dev, "IPU6 in %s mode touch 0x%x mask 0x%x\n",
-		 isp->secure_mode ? "secure" : "non-secure",
-		 readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
-		 readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
+	dev_dbg(&isp->pdev->dev, "IPU6 in %s mode touch 0x%x mask 0x%x\n",
+		isp->secure_mode ? "secure" : "non-secure",
+		readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
+		readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
 
 	b->wdt_cached_value = readl(isp->base + BUTTRESS_REG_WDT);
 	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 8b8142bcb2d5..b7013f6524ec 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -275,7 +275,7 @@ static int ipu6_cpd_validate_moduledata(struct ipu6_device *isp,
 		return -EINVAL;
 	}
 
-	dev_info(&isp->pdev->dev, "FW version: %x\n", mod_hdr->fw_pkg_date);
+	dev_dbg(&isp->pdev->dev, "FW version: %x\n", mod_hdr->fw_pkg_date);
 	ret = ipu6_cpd_validate_cpd(isp, moduledata + mod_hdr->hdr_len,
 				    moduledata_size - mod_hdr->hdr_len,
 				    moduledata_size);
-- 
2.34.1


