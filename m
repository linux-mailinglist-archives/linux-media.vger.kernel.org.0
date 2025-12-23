Return-Path: <linux-media+bounces-49387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89276CD832B
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 255BE301FBCC
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34C12F5319;
	Tue, 23 Dec 2025 05:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAJlapQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDBA2F616E
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468335; cv=none; b=rpmgoxGcf18Ik4N96N4Hrt0hoO4zgQ69yg3qIWHua5aKx7WCaMNbsTCnnzl/JKr84tHsiuwcbL3booqClbKwRUOWQ/fVqMz+JUO6EXnEkWznR9DYqTZhcMQuFDAxXOrjaIsexS+3X0gRgGcYVNuu1BqPS7SlyUX+Xh3+g8MamjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468335; c=relaxed/simple;
	bh=OXqXiIgVV505sFQP2/bOe/4bDZcTXW8+cy6dmrpQl2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qe7Nq+QWzj0EboVWJDhZrzdDKqtF1DqaTejERehQ30BzVosMdehfhm6ujTan9s/f8s6HCILFMYW8qcY6iK4RH7ZbSW5vip2FktYDkk0LG/MTrNjwSoZ0m0BSP2Q47ahSpUgN5hlrf+KRCnwcyxNw4AoOxyYyviyGGymeS6a2AxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAJlapQo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766468333; x=1798004333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OXqXiIgVV505sFQP2/bOe/4bDZcTXW8+cy6dmrpQl2I=;
  b=SAJlapQoU40pxpse/nQL/XkNLxw3Tb9qTmXg9YfmI9OA0fzH5RCXQ59+
   G+b0cujTx2jW4It766iXYp8NDumifzdW1ktJeMvI7aVtFC7crxStD2PGv
   IGnJzgyd4bRFzWT9jBMbwTSEXiPG71t0aCenMAoS3NWvXgAayddBtb4XY
   rQfo98QhMRIrR+M2ET8lRehTWuikQZ+97IeIcOm2euJxiNOoJEibL4n60
   eclPnqbfambFPrgNM4b9TgsF9/IYn+AhK9aJzueWQGv8sJbP2Ea2P+cw0
   q5SS6K0Mer4o8d34g4G5xLiedUtqDPhRk6FeHXNvzo8ip/D0Ik3XmrkNb
   g==;
X-CSE-ConnectionGUID: yFy6wKHYTxuKrqBefrbB8Q==
X-CSE-MsgGUID: jRCDbh0QRk+i1+ADDPKpjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68255987"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68255987"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:38:52 -0800
X-CSE-ConnectionGUID: 4hyq442xRTmkkEnEcsqKDQ==
X-CSE-MsgGUID: RB3W+Qm3SxyQjZxIdV8HHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199366575"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 21:38:50 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 3/6] media: staging/ipu7: ignore interrupts when device is suspended
Date: Tue, 23 Dec 2025 13:38:41 +0800
Message-Id: <20251223053844.3124621-4-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223053844.3124621-1-bingbu.cao@intel.com>
References: <20251223053844.3124621-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU7 devices have shared interrupts with others. In some case when IPU7
device is suspended, driver get unexpected interrupt and invalid irq
status 0xffffffff from ISR_STATUS and PB LOCAL_STATUS registers as
interrupt is triggered from other device on shared irq line.

In order to avoid this issue use pm_runtime_get_if_active() to check if
IPU7 device is resumed, ignore the invalid irq status and use
synchronize_irq() in suspend.

Cc: Stable@vger.kernel.org
Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-buttress.c | 12 ++++++++++--
 drivers/staging/media/ipu7/ipu7.c          |  4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index e5707f5e300b..e4328cafe91d 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -342,14 +342,22 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
 	u32 disable_irqs = 0;
 	u32 irq_status;
 	unsigned int i;
+	int active;
 
-	pm_runtime_get_noresume(dev);
+	active = pm_runtime_get_if_active(dev);
+	if (active <= 0)
+		return IRQ_NONE;
 
 	pb_irq = readl(isp->pb_base + INTERRUPT_STATUS);
 	writel(pb_irq, isp->pb_base + INTERRUPT_STATUS);
 
 	/* check btrs ATS, CFI and IMR errors, BIT(0) is unused for IPU */
 	pb_local_irq = readl(isp->pb_base + BTRS_LOCAL_INTERRUPT_MASK);
+	if (WARN_ON_ONCE(pb_local_irq == 0xffffffff)) {
+		pm_runtime_put_noidle(dev);
+		return IRQ_NONE;
+	}
+
 	if (pb_local_irq & ~BIT(0)) {
 		dev_warn(dev, "PB interrupt status 0x%x local 0x%x\n", pb_irq,
 			 pb_local_irq);
@@ -365,7 +373,7 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
 	}
 
 	irq_status = readl(isp->base + BUTTRESS_REG_IRQ_STATUS);
-	if (!irq_status) {
+	if (!irq_status || WARN_ON_ONCE(irq_status == 0xffffffff)) {
 		pm_runtime_put_noidle(dev);
 		return IRQ_NONE;
 	}
diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 5cddc09c72bf..6c8c3eea44ac 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2684,6 +2684,10 @@ static void ipu7_pci_reset_done(struct pci_dev *pdev)
  */
 static int ipu7_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	synchronize_irq(pdev->irq);
+
 	return 0;
 }
 
-- 
2.34.1


