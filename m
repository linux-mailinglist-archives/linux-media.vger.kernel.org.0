Return-Path: <linux-media+bounces-49399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD5FCD85F2
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1269E3026B10
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE4430AAA6;
	Tue, 23 Dec 2025 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pp/nO7Ri"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700C8309EF4
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474594; cv=none; b=ORWFlXxskxychQUv6ej/4otbvUIXuDvgD7w77iROOtP5lNuNtc3pJH2VPYmjTKgLpyfflxDO/Jh0TghSS5x2bh65zzaoghxzflqfPdqWRrpLXT3ktgKlY6UW46EdH7L9kWlmcKKcfNzhvt85zUEGKC4QwnqkSaqwY5dBF31kZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474594; c=relaxed/simple;
	bh=GE8Uq2CGQEq4AA8YslNYzhtMe4SyHP7/FkVcuMyQNqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YS94CO8qIoon8+RymY4UCtCEtpV6RMcXCAKN+azXwA3pVIOcZfUQ8mhiLiNIWTXyROPM6eolOY23rkTVF3Ht5THRtPGE7lRx2kCyZ8sqIfDk6CjaZp/R92XbxfMWWQVdUo0uLUCGr9De9CkppMQ2ZIWXFQX/us5OJ0KcoNPpIKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pp/nO7Ri; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766474593; x=1798010593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GE8Uq2CGQEq4AA8YslNYzhtMe4SyHP7/FkVcuMyQNqo=;
  b=Pp/nO7RiUEIKu1bRSjYXIMyJ47Jm1Xjv9esAuJPmK9TBemsGZKQPaivF
   i3TRkz1ZyEibEXKPNSMyReVYo8YlBdG+3I7fKwAzSfkmjk0BQ8B8uRc0w
   10iu3gUFgLPqSxXc6UnfAKmzh3ZovDIfRho1E3OElmJwyWF0ZBWNvbTTh
   6e0xbGXCx6cQLh0AGKchkx4WwwWZz0NsRVSU7bgdCJU3KeO4saqcWz7YY
   eprgy2BVehEaN2BBavTS1QjUo6+SWnENfEoo4R2oqiUEUKaZ2HQIkFePl
   87MhamiRbnJRmoJOB3JB4hwk4AbW3vmQMUNXbcgsB4zX0F+0aB9UncQjK
   Q==;
X-CSE-ConnectionGUID: bqDRg0QFQRyAenxsHpu3hA==
X-CSE-MsgGUID: 1WT9mOAhSjiy3YEXM2yInQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79043751"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79043751"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:23:12 -0800
X-CSE-ConnectionGUID: YFpd85wrQ+mjaJjYgdxDAg==
X-CSE-MsgGUID: 2pydD10FR6qK7wGsDzwkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199747430"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:23:09 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 3/6] media: staging/ipu7: ignore interrupts when device is suspended
Date: Tue, 23 Dec 2025 15:23:00 +0800
Message-Id: <20251223072303.4078094-4-bingbu.cao@intel.com>
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
 drivers/staging/media/ipu7/ipu7-buttress.c | 17 ++++++++++++++++-
 drivers/staging/media/ipu7/ipu7.c          |  4 ++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index e5707f5e300b..40c6c8473357 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -342,14 +342,23 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
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
+	if (pb_local_irq == 0xffffffff) {
+		dev_warn_once(dev, "invalid PB irq status\n");
+		pm_runtime_put_noidle(dev);
+		return IRQ_NONE;
+	}
+
 	if (pb_local_irq & ~BIT(0)) {
 		dev_warn(dev, "PB interrupt status 0x%x local 0x%x\n", pb_irq,
 			 pb_local_irq);
@@ -370,6 +379,12 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
 		return IRQ_NONE;
 	}
 
+	if (irq_status == 0xffffffff) {
+		dev_warn_once(dev, "invalid irq status 0x%08x\n", irq_status);
+		pm_runtime_put_noidle(dev);
+		return IRQ_NONE;
+	}
+
 	do {
 		writel(irq_status, isp->base + BUTTRESS_REG_IRQ_CLEAR);
 
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


