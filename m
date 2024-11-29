Return-Path: <linux-media+bounces-22337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB49DC32F
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22468B211EE
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB45819938D;
	Fri, 29 Nov 2024 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgpYH3QW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD55155A59
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732881627; cv=none; b=kNEAFErUY+LKwQOCqsFKvvvmpliY+yhsioBZx3PVYjhugCfgi44pHCNEgpKeZhorY94eiXs4wXEEjo08l3j5iYO/9T9QLh5bbK9Rx+yukoCxjulXnkvQ1knAuNVhTPlohltXq+KBL5gKmWn9/q1gCa8p/sKlp5tFT0i4QFECUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732881627; c=relaxed/simple;
	bh=iawzq020Ol4J6OvMcFkRXQJT5Rr9jxAUOBLey4eQx8U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VouSXjm1dutCQieDPEopbfrQ7JFEvSnclSYBigPCWa8ezsH5ngKHcXzMrywi7TGBbOst98MIdf9X73TXttQ4jxrFYirGuEOubeQFONWh7KEkt4EG1Q5TSs+/tz6tH4lwdRkU/VNRM9iBaabsmufuS9E+mafM53+VUg/Wk0gISmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgpYH3QW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732881626; x=1764417626;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iawzq020Ol4J6OvMcFkRXQJT5Rr9jxAUOBLey4eQx8U=;
  b=NgpYH3QWh47XwKzSjrIgqtAj73NjYaCkax8m0Ea7B8xgPE+fyCxmxPqf
   CFeCjAen/TRsiA/fcApbepOY0pHN4vILoCxPq7Dzf2ZAgN6nmjOIoTxOj
   VdP3f0VQKlUU4uOs/4Sy6Z808tajkjISCHSah+EkJwx3lH2cZQzSFtlqi
   b8fpZVBYfU2R8NyDfGh2pjNjotBDaVAB3ZBR0nr7EHTk812/Hg30He5Do
   UrV6jsUaIUorXO9phxx1761rfbwJiEJLunDA2SBOiMtfsfDvJFDiIpAKP
   n3Pvhw+OOnuj4sZ/xYRoeT+KiJ8uxShTQ1XXf5THX0BbCoxwvauMqeEIH
   g==;
X-CSE-ConnectionGUID: aFbWzxAFT9q/cqQvbG26dg==
X-CSE-MsgGUID: eZUp0l+BRuG7BpuXxsa/uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33050386"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="33050386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 04:00:25 -0800
X-CSE-ConnectionGUID: 0lX+VikhQo+bl67OLEplkA==
X-CSE-MsgGUID: DmTDRP0IQtelZM/S6TnBfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="123430293"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 04:00:23 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media: intel/ipu6: move some boot messages to debug level
Date: Fri, 29 Nov 2024 13:00:20 +0100
Message-Id: <20241129120020.318903-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ivsc chip fail to initialise properly we can get plenty of ipu6
messages like this:

[   15.454049] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
[   15.456600] intel-ipu6 0000:00:05.0: FW version: 20230925
[   15.458292] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
[   15.461186] intel-ipu6 0000:00:05.0: FW version: 20230925
[   15.463616] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
[   15.466490] intel-ipu6 0000:00:05.0: FW version: 20230925

Print them only when debugging is enabled to do not flood dmesg on
ivsc errors condition.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-cpd.c      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index e47f84c30e10..e02899dda8d0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -852,10 +852,10 @@ int ipu6_buttress_init(struct ipu6_device *isp)
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
index 715b21ab4b8e..3dec9e3329d6 100644
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


