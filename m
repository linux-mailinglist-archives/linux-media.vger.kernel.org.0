Return-Path: <linux-media+bounces-49282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F2BCD4D68
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25D0030019FB
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 07:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9A92FE598;
	Mon, 22 Dec 2025 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsuQMda8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98B257452
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387196; cv=none; b=A02rlubV5XubOXBWXnHXOVu7LlCs6FoK94iHsRF/Q9qTD8QBU7XXvSwDzQ//Pc3K8X/98matYb96pec6adCLjdHaQpLo5UhEFdjBDH654wrQb9Qgcv59OALu2d7qea9XDpVZswi+bxnUOsT2mJ6BB8Z0ZMQzaYJBd+J0lK1HyCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387196; c=relaxed/simple;
	bh=0PSl3LS2TrNiwEFuWD2y6zEF4qz293YpdedYRZf0NgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rKC9F02MvGSBzSz8UPSAraFFwIjWmUPKuAVy94EGMOXNFOrkILxC48DDLAwh1yX9jVgBsBOBnW+dghU5OTzqdnVPLs0VsiXXZlHsG16i0io2yJNm7KgCFdnI4nGb8ifGIjGYMSEWQVXIh8BLsiQWxHv0Je9NFFu1JK4v/b6ToEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsuQMda8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387195; x=1797923195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0PSl3LS2TrNiwEFuWD2y6zEF4qz293YpdedYRZf0NgE=;
  b=YsuQMda88kPkNf2Idu3HAwnSWRgHpEeZGwIom9wC3ZDUHvuxso2QjhWm
   ljDH2OUYmuAnwShzMDkTSWkVJJpwfJVd/tIrX9dxF0qj3HEZNUTJKEnDH
   gr8BdfwLLGmtQyI/wWDlgm2wf+iIijkgpOG1nn1m6/thzO1ecQYuBTVQD
   JdTTSEq0HNHCh3lfo+IsKj2U+uuaoWtrwtZQ7QmDiKudx8dI9BCB/V9FE
   M8qYc11ACdLuUTjHr1qVZBdEop9mxKQpYja91TmeBzGthZ1BbXhckcdRH
   al7+VDH0MNl0Vv78aO9D6YPpzCfC5Zqpfnvajv5T7P1oERb0GHlR2Z2Pp
   w==;
X-CSE-ConnectionGUID: gnexKSnDQK+BoxiD6QFvFQ==
X-CSE-MsgGUID: HldA8BaEQ5y0QiKCxFY7GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="55815079"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="55815079"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:06:34 -0800
X-CSE-ConnectionGUID: k9lPhy7lRn+5zbMI+7pRxQ==
X-CSE-MsgGUID: L9VAAUH5SeGBczLHODVg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200347394"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2025 23:06:32 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 1/4] media: staging/ipu7: ignore interrupts when device is suspended
Date: Mon, 22 Dec 2025 15:06:26 +0800
Message-Id: <20251222070629.2018807-2-bingbu.cao@intel.com>
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


