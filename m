Return-Path: <linux-media+bounces-20636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E29B7891
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 11:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A23BD285AE1
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5C31991B9;
	Thu, 31 Oct 2024 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtxaJA36"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43F1990AE
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730370209; cv=none; b=lu67qPtW64M8dnrnioByM+F/8KH5b5bke3G/qkNIgFTR/S2Uph/SpB6uVX3DFcILvd/cuT6TAI3zXhNw52CnV9hA+iyPRWwSsdblq2GdWcQKEh40vJdocFVBspA5VqLvn3K6ah5VGSlUeclkpCWR9X1Qls1W+mGmJDPFPNVG6cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730370209; c=relaxed/simple;
	bh=Nm0sHTKe/Eni7+ITOg7T+fiif8MeD2ggs9H/15aLevQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FxOBVXzUA70Z6cqahpz7888FL7qtPEftLRh33t24GlAgy3oDdfbu8zNZr5/bPjf9o6r4VBVO5klmR5HYwgKWU1w7FFAO++EmA51Y+2OlWTPVXKX0qEFamcY5TDJm8HTn8pbZoRJwj0pVuHj5FbMbrGMhn5XmQGsV3OWxh1SITEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtxaJA36; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730370208; x=1761906208;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nm0sHTKe/Eni7+ITOg7T+fiif8MeD2ggs9H/15aLevQ=;
  b=FtxaJA36+K6dOtPCkjao6Gmm/MJ+jgcv9CP3bsZa27m9RXXRbykXJKNR
   ckhnWgHxMEBj+eYCKajz4K8uZib7B5YD+oGNF4haPR7MS1BC0Ulgzup5/
   hJtWppMGWVYcZP3c7l1XyliRYaV9o9Sjog/vTLOqhO7bfzj3IMrkHC/8n
   REHLfvbthUyAFjPA3MkLU0cpz1q86Jt3F5TDBrfpui7J8dJPLYiaOkfs2
   EL+kgwR/BETiMSMEnrLPegz7TInoLblj0JTuUuxg0meA4EyvwTmKErhBj
   YFh19aP8ZwYyxPqgXtUzpVzKE28ttbdidrnd3vbxEp4Xbmg6Nj1hkwfrv
   Q==;
X-CSE-ConnectionGUID: /JsTzeIwSRanUIlsujK2aA==
X-CSE-MsgGUID: 2wUY81ZtS2yLrGLtesJfvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33891025"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="33891025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:23:25 -0700
X-CSE-ConnectionGUID: l3gyCzR3QcqPyVy3ih9qSw==
X-CSE-MsgGUID: wpzoKl3IRNWyzGGVgVJ1ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82241339"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.36])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:23:24 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media: intel/ipu6: do not handle interrupts when device is disabled
Date: Thu, 31 Oct 2024 11:23:21 +0100
Message-Id: <20241031102321.409454-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some IPU6 devices have shared interrupts. We need to handle properly
case when interrupt is triggered from other device on shared irq line
and IPU6 itself disabled. In such case we get 0xffffffff from
ISR_STATUS register and handle all irq's cases, for what we are not
not prepared and usually hang the whole system.

To avoid the issue use pm_runtime_get_if_active() to check if
the device is enabled and prevent suspending it when we handle irq
until the end of irq. Additionally use synchronize_irq() in suspend

Fixes: ab29a2478e70 ("media: intel/ipu6: add IPU6 buttress interface driver")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 13 +++++++++----
 drivers/media/pci/intel/ipu6/ipu6.c          |  3 +++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index e47f84c30e10..edaa285283a1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -345,12 +345,16 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	u32 disable_irqs = 0;
 	u32 irq_status;
 	u32 i, count = 0;
+	int active;
 
-	pm_runtime_get_noresume(&isp->pdev->dev);
+	active = pm_runtime_get_if_active(&isp->pdev->dev);
+	if (!active)
+		return IRQ_NONE;
 
 	irq_status = readl(isp->base + reg_irq_sts);
-	if (!irq_status) {
-		pm_runtime_put_noidle(&isp->pdev->dev);
+	if (irq_status == 0 || WARN_ON_ONCE(irq_status == 0xffffffffu)) {
+		if (active > 0)
+			pm_runtime_put_noidle(&isp->pdev->dev);
 		return IRQ_NONE;
 	}
 
@@ -426,7 +430,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 		writel(BUTTRESS_IRQS & ~disable_irqs,
 		       isp->base + BUTTRESS_REG_ISR_ENABLE);
 
-	pm_runtime_put(&isp->pdev->dev);
+	if (active > 0)
+		pm_runtime_put(&isp->pdev->dev);
 
 	return ret;
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 7fb707d35309..91718eabd74e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -752,6 +752,9 @@ static void ipu6_pci_reset_done(struct pci_dev *pdev)
  */
 static int ipu6_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	synchronize_irq(pdev->irq);
 	return 0;
 }
 
-- 
2.46.1


