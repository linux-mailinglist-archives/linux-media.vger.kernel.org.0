Return-Path: <linux-media+bounces-49273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD23CD4936
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FE1C300509C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 02:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CE51A2C25;
	Mon, 22 Dec 2025 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoLV0voT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2FBE5E
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 02:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371692; cv=none; b=px/rHQcUjz2QolU2Wjflqi03SDLxSFjImEmpbMHO4W6UOFxCXRlJeCSHmKQCfupFhHsoTsmEp4x0dnDH+gBn7SUauckl35jlgi/TQYvvWAEQsWHoUqamtGXFFdsPYferCdk4UPfno58F10DOVlzQZmjQle2fwpbfoouwgTZiG+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371692; c=relaxed/simple;
	bh=0PSl3LS2TrNiwEFuWD2y6zEF4qz293YpdedYRZf0NgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P27jOPDfiZs7usJz7OxtR/4EQfkgZZBRaXTt3TSjTljedIHioS1BtRwbSeGRSXh3yOlG2NesyZKaPmCzgutDUU81KeLXkyM2+dpSMQ83+kLj6lCmQTak50Vc+JyHwy/7merNNAYo2PsHqdns1GPYhiu4HmEs9ue3te4wYeiWFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoLV0voT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766371691; x=1797907691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0PSl3LS2TrNiwEFuWD2y6zEF4qz293YpdedYRZf0NgE=;
  b=eoLV0voTT980bNQe17CyYpskSJTHzsSikiyox/u7IEPcMdy9JSPkNWHI
   lkZC9KP0cbUvj3XvjrXFnM1VG0NF8XkLrS8ZI+CMcX7fJ8B8bmty94r7n
   /3b67fC9SRfOQadXeR7z/YWWqVdC6qz7CdQN0TTD8WqWZpkXqKozUIYr9
   fuQLBeCyFkjB/eDmCRnmm5vMLAR3vglsW8Ax28HAJWr2gioPWIZNpAvLN
   /C6Irkje2NYHwDSp/D2rJ2RnahnVLGEISYPsKjpncXvOqMfxBEJ1ZYpf+
   AMSTklrt3hOpwq2lGpk+QMJc+tvrTmeNy5ajwP4c+GzNk5Nq/uWIBWyGu
   w==;
X-CSE-ConnectionGUID: 2LpyKXg/TtaqBwkw1U0XJA==
X-CSE-MsgGUID: a8tZJN1uTYmcfywNosMZ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93701891"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="93701891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:48:08 -0800
X-CSE-ConnectionGUID: 8hzCDPUZS8Ok11h9u1m3Og==
X-CSE-MsgGUID: VWPDR62NTyu5qhDYey5y+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203545231"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 18:48:06 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 1/4] media: staging/ipu7: ignore interrupts when device is suspended
Date: Mon, 22 Dec 2025 10:47:59 +0800
Message-Id: <20251222024802.1253754-2-bingbu.cao@intel.com>
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

IPU7 devices have shared interrupts with others. In some case when
IPU7 device is suspended, driver get unexpected interrupt and invalid
irq status 0xffffffff from ISR_STATUS and PB LOCAL_STATUS
registers as interrupt is triggered from other device on shared
irq line.

In order to avoid this issue use pm_runtime_get_if_active() to check
if IPU7 device is resumed, ignore the invalid irq status and use
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


