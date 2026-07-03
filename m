Return-Path: <linux-media+bounces-66476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pQgZO3TUR2qSfwAAu9opvQ
	(envelope-from <linux-media+bounces-66476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F580703D2A
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=OX38UHnE;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66476-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66476-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EF4E301303D
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5B8414DF2;
	Fri,  3 Jul 2026 15:25:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06403414DEE
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092335; cv=none; b=jbUAH/9SwFigjCDoNsN4REKDW16y38heeE3mzC73ca/1AwChAQsHjpFSGwi8muakNMJTVzWo5C1voZQoNIpvVGyFovzIgshSr49HwFBdBJK0rtFz40OtvxDP2SbjOmEoFAuDEqCXrZA2xHPVKe4v/25GAY+Eg6jrEfPyUsxXAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092335; c=relaxed/simple;
	bh=OLqRalSi7t1PPdLvubeJGbViLwjsKtp9koX1VPskyBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uS4baMo9MiSzLlHPnolQq0tPFQfYTW3VwcOZqTCsbBfWHFx0EyO7mN3+vYPrhndTEt5coPbk9+toofMhBeWVhFSAwAAelhr18gNx1QaogOhHVDSl2zLMgqrTRd4/xORc6goGO+bekA8LAfAKvu/d0fbxeuWwTlFfPB1oWg26A70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OX38UHnE; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092334; x=1814628334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OLqRalSi7t1PPdLvubeJGbViLwjsKtp9koX1VPskyBk=;
  b=OX38UHnEU6p4YufdULsC5iRm+EprnU9YM9yMsgBUsHMzlG0sBVdISUI0
   xE++XQDpabDR9qH2XHFYebj6jW/fk4ih9lU9f3Xk25cx0ze7JrETiqd6s
   2htYa+Aq/uCqasPAekIPzPfm1Z6ACUIZw0uECBJDZcbVeItPuVEGv0wnu
   VjbS121KBuA9tF/humQJdOdGsuBSAWm2V7iAk816FFp7//TrjyEc/WlrH
   EjoH8I38dHho9o7Z7IAqvh5TXWtKgKuFjnvmg5cnqPNwMXDZ+71lkqkEw
   HCtUl2aMZ5AYDg+UAoRlvnKJrcDx6dJ+Fb/mdX8vFNGJjpB/qAS0iIw/r
   A==;
X-CSE-ConnectionGUID: 7CCM2KRyQ5K+tlUppC7/eQ==
X-CSE-MsgGUID: 9iupNtxXQayluiwJre85yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396147"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:34 -0700
X-CSE-ConnectionGUID: ownSaIPxQkuHPqG/9rvmCg==
X-CSE-MsgGUID: Fd/hAhpsQ4C6DDNs9VYLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799496"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:32 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 10/41] media: ipu6: Prepare buttress for ipu7 support
Date: Fri,  3 Jul 2026 18:24:20 +0300
Message-ID: <20260703152451.1743132-11-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66476-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F580703D2A

A subset of buttress registers and bitmasks are different for hardware
versions beyond ipu6. Add such registers to a struct to make it
easier to add support for new hardware versions.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 118 ++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h |  26 ++++
 2 files changed, 99 insertions(+), 45 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index cbe356589a9d..4ce1e941b410 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -55,9 +55,29 @@
 
 #define BUTTRESS_MAX_CONSECUTIVE_IRQS	100
 
-static const u32 ipu6_adev_irq_mask[2] = {
-	BUTTRESS_ISR_IS_IRQ,
-	BUTTRESS_ISR_PS_IRQ
+static const struct ipu6_buttress_registers ipu6_buttress_regs = {
+	/* Registers */
+	.irq_status	= BUTTRESS_REG_ISR_STATUS,
+	.irq_clear	= BUTTRESS_REG_ISR_CLEAR,
+	.irq_enable	= BUTTRESS_REG_ISR_ENABLE,
+	.pwr_status	= BUTTRESS_REG_PWR_STATE,
+	.security_ctl	= BUTTRESS_REG_SECURITY_CTL,
+	.fw_reset_ctl	= BUTTRESS_REG_FW_RESET_CTL,
+	.fabric_cmd	= BUTTRESS_REG_FABRIC_CMD,
+	.tsw_ctl	= BUTTRESS_REG_TSW_CTL,
+	.tsc_hi		= BUTTRESS_REG_TSC_HI,
+	.tsc_lo		= BUTTRESS_REG_TSC_LO,
+	.wdt		= BUTTRESS_REG_WDT,
+	.btrs_ctrl	= BUTTRESS_REG_BTRS_CTRL,
+
+	/* Bitmasks */
+	.irq_is		= BUTTRESS_ISR_IS_IRQ,
+	.irq_ps		= BUTTRESS_ISR_PS_IRQ,
+	.irq_all	= BUTTRESS_IRQS,
+	.irq_events	= BUTTRESS_EVENT,
+	.irq_cse_ipc	= BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING,
+	.irq_exec_done	= BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE,
+	.irq_sai	= BUTTRESS_ISR_SAI_VIOLATION,
 };
 
 int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
@@ -337,7 +357,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	struct ipu6_device *isp = isp_ptr;
 	struct ipu6_bus_device *adev[] = { isp->isys, isp->psys };
 	struct ipu6_buttress *b = &isp->buttress;
-	u32 reg_irq_sts = BUTTRESS_REG_ISR_STATUS;
+	const struct ipu6_buttress_registers *regs = b->regs;
+	const u32 adev_irq_mask[] = { regs->irq_is, regs->irq_ps };
 	irqreturn_t ret = IRQ_NONE;
 	u32 disable_irqs = 0;
 	u32 irq_status;
@@ -348,7 +369,7 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	if (!active)
 		return IRQ_NONE;
 
-	irq_status = readl(isp->base + reg_irq_sts);
+	irq_status = readl(isp->base + regs->irq_status);
 	if (irq_status == 0 || WARN_ON_ONCE(irq_status == 0xffffffffu)) {
 		if (active > 0)
 			pm_runtime_put_noidle(&isp->pdev->dev);
@@ -356,26 +377,26 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	}
 
 	do {
-		writel(irq_status, isp->base + BUTTRESS_REG_ISR_CLEAR);
+		writel(irq_status, isp->base + regs->irq_clear);
 
-		for (i = 0; i < ARRAY_SIZE(ipu6_adev_irq_mask); i++) {
+		for (i = 0; i < ARRAY_SIZE(adev_irq_mask); i++) {
 			irqreturn_t r = ipu6_buttress_call_isr(adev[i]);
 
-			if (!(irq_status & ipu6_adev_irq_mask[i]))
+			if (!(irq_status & adev_irq_mask[i]))
 				continue;
 
 			if (r == IRQ_WAKE_THREAD) {
 				ret = IRQ_WAKE_THREAD;
-				disable_irqs |= ipu6_adev_irq_mask[i];
+				disable_irqs |= adev_irq_mask[i];
 			} else if (ret == IRQ_NONE && r == IRQ_HANDLED) {
 				ret = IRQ_HANDLED;
 			}
 		}
 
-		if ((irq_status & BUTTRESS_EVENT) && ret == IRQ_NONE)
+		if ((irq_status & regs->irq_events) && ret == IRQ_NONE)
 			ret = IRQ_HANDLED;
 
-		if (irq_status & BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING) {
+		if (irq_status & regs->irq_cse_ipc) {
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
 
@@ -383,13 +404,13 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 			complete(&b->ipc.recv_complete);
 		}
 
-		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
+		if (irq_status & regs->irq_exec_done) {
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
 			complete(&b->ipc.send_complete);
 		}
 
-		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
+		if (irq_status & regs->irq_sai &&
 		    ipu6_buttress_get_secure_mode(isp))
 			dev_err(&isp->pdev->dev,
 				"BUTTRESS_ISR_SAI_VIOLATION\n");
@@ -408,12 +429,12 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 			break;
 		}
 
-		irq_status = readl(isp->base + reg_irq_sts);
+		irq_status = readl(isp->base + regs->irq_status);
 	} while (irq_status);
 
 	if (disable_irqs)
-		writel(BUTTRESS_IRQS & ~disable_irqs,
-		       isp->base + BUTTRESS_REG_ISR_ENABLE);
+		writel(regs->irq_all & ~disable_irqs,
+		       isp->base + regs->irq_enable);
 
 	if (active > 0)
 		pm_runtime_put(&isp->pdev->dev);
@@ -424,12 +445,13 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 {
 	struct ipu6_device *isp = isp_ptr;
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
 	struct ipu6_bus_device *adev[] = { isp->isys, isp->psys };
 	const struct ipu6_auxdrv_data *drv_data = NULL;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(ipu6_adev_irq_mask) && adev[i]; i++) {
+	for (i = 0; i < ARRAY_SIZE(adev) && adev[i]; i++) {
 		drv_data = adev[i]->auxdrv_data;
 		if (!drv_data)
 			continue;
@@ -439,7 +461,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 			ret = IRQ_HANDLED;
 	}
 
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
+	writel(regs->irq_all, isp->base + regs->irq_enable);
 
 	return ret;
 }
@@ -472,7 +494,7 @@ int ipu6_buttress_power(struct device *dev,
 
 	writel(val, isp->base + ctrl->freq_ctl);
 
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATE,
+	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
 				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
 				 100, BUTTRESS_POWER_TIMEOUT_US);
 	if (ret)
@@ -488,7 +510,7 @@ bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp)
 {
 	u32 val;
 
-	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
+	val = readl(isp->base + isp->buttress.regs->security_ctl);
 
 	return val & BUTTRESS_SECURITY_CTL_FW_SECURE_MODE;
 }
@@ -500,7 +522,7 @@ bool ipu6_buttress_auth_done(struct ipu6_device *isp)
 	if (!isp->secure_mode)
 		return true;
 
-	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
+	val = readl(isp->base + isp->buttress.regs->security_ctl);
 	val = FIELD_GET(BUTTRESS_SECURITY_CTL_FW_SETUP_MASK, val);
 
 	return val == BUTTRESS_SECURITY_CTL_AUTH_DONE;
@@ -518,10 +540,10 @@ int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
 	}
 
 	writel(BUTTRESS_FW_RESET_CTL_START, isp->base +
-	       BUTTRESS_REG_FW_RESET_CTL);
+	       isp->buttress.regs->fw_reset_ctl);
 
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_FW_RESET_CTL, val,
-				 val & BUTTRESS_FW_RESET_CTL_DONE, 500,
+	ret = readl_poll_timeout(isp->base + isp->buttress.regs->fw_reset_ctl,
+				 val, val & BUTTRESS_FW_RESET_CTL_DONE, 500,
 				 BUTTRESS_CSE_FWRESET_TIMEOUT_US);
 	if (ret) {
 		dev_err(&isp->pdev->dev,
@@ -530,7 +552,8 @@ int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
 	}
 
 	dev_dbg(&isp->pdev->dev, "FW reset for authentication done\n");
-	writel(0, isp->base + BUTTRESS_REG_FW_RESET_CTL);
+	writel(0, isp->base + isp->buttress.regs->fw_reset_ctl);
+
 	/* leave some time for HW restore */
 	usleep_range(800, 1000);
 
@@ -660,7 +683,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	mask = BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
 	done = BUTTRESS_SECURITY_CTL_FW_SETUP_DONE;
 	fail = BUTTRESS_SECURITY_CTL_AUTH_FAILED;
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
+	ret = readl_poll_timeout(isp->base + b->regs->security_ctl, data,
 				 ((data & mask) == done ||
 				  (data & mask) == fail), 500,
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
@@ -700,7 +723,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	}
 
 	done = BUTTRESS_SECURITY_CTL_AUTH_DONE;
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
+	ret = readl_poll_timeout(isp->base + b->regs->security_ctl, data,
 				 ((data & mask) == done ||
 				  (data & mask) == fail), 500,
 				 BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
@@ -725,15 +748,16 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 
 static int ipu6_buttress_send_tsc_request(struct ipu6_device *isp)
 {
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
 	u32 val, mask, done;
 	int ret;
 
 	mask = BUTTRESS_PWR_STATE_HH_STATUS_MASK;
 
 	writel(BUTTRESS_FABRIC_CMD_START_TSC_SYNC,
-	       isp->base + BUTTRESS_REG_FABRIC_CMD);
+	       isp->base + regs->fabric_cmd);
 
-	val = readl(isp->base + BUTTRESS_REG_PWR_STATE);
+	val = readl(isp->base + regs->pwr_status);
 	val = FIELD_GET(mask, val);
 	if (val == BUTTRESS_PWR_STATE_HH_STATE_ERR) {
 		dev_err(&isp->pdev->dev, "Start tsc sync failed\n");
@@ -741,8 +765,8 @@ static int ipu6_buttress_send_tsc_request(struct ipu6_device *isp)
 	}
 
 	done = BUTTRESS_PWR_STATE_HH_STATE_DONE;
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATE, val,
-				 FIELD_GET(mask, val) == done, 500,
+	ret = readl_poll_timeout(isp->base + regs->pwr_status,
+				 val, FIELD_GET(mask, val) == done, 500,
 				 BUTTRESS_TSC_SYNC_TIMEOUT_US);
 	if (ret)
 		dev_err(&isp->pdev->dev, "Start tsc sync timeout\n");
@@ -762,11 +786,13 @@ int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
 		if (ret != -ETIMEDOUT)
 			return ret;
 
-		val = readl(isp->base + BUTTRESS_REG_TSW_CTL);
+		u32 tsw_ctl = isp->buttress.regs->tsw_ctl;
+
+		val = readl(isp->base + tsw_ctl);
 		val = val | BUTTRESS_TSW_CTL_SOFT_RESET;
-		writel(val, isp->base + BUTTRESS_REG_TSW_CTL);
+		writel(val, isp->base + tsw_ctl);
 		val = val & ~BUTTRESS_TSW_CTL_SOFT_RESET;
-		writel(val, isp->base + BUTTRESS_REG_TSW_CTL);
+		writel(val, isp->base + tsw_ctl);
 	}
 
 	dev_err(&isp->pdev->dev, "TSC sync failed (timeout)\n");
@@ -781,9 +807,9 @@ void ipu6_buttress_tsc_read(struct ipu6_device *isp, u64 *val)
 	unsigned long flags;
 
 	local_irq_save(flags);
-	tsc_hi_1 = readl(isp->base + BUTTRESS_REG_TSC_HI);
-	tsc_lo = readl(isp->base + BUTTRESS_REG_TSC_LO);
-	tsc_hi_2 = readl(isp->base + BUTTRESS_REG_TSC_HI);
+	tsc_hi_1 = readl(isp->base + isp->buttress.regs->tsc_hi);
+	tsc_lo = readl(isp->base + isp->buttress.regs->tsc_lo);
+	tsc_hi_2 = readl(isp->base + isp->buttress.regs->tsc_hi);
 	if (tsc_hi_1 == tsc_hi_2) {
 		*val = (u64)tsc_hi_1 << 32 | tsc_lo;
 	} else {
@@ -816,9 +842,9 @@ void ipu6_buttress_restore(struct ipu6_device *isp)
 {
 	struct ipu6_buttress *b = &isp->buttress;
 
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
-	writel(b->wdt_cached_value, isp->base + BUTTRESS_REG_WDT);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
+	writel(b->wdt_cached_value, isp->base + b->regs->wdt);
 }
 
 int ipu6_buttress_init(struct ipu6_device *isp)
@@ -834,6 +860,8 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	init_completion(&b->ipc.send_complete);
 	init_completion(&b->ipc.recv_complete);
 
+	b->regs = &ipu6_buttress_regs;
+
 	b->ipc.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
 	b->ipc.nack_mask = BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
 	b->ipc.csr_in = BUTTRESS_REG_CSE2IUCSR;
@@ -851,12 +879,12 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 		readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
 		readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
 
-	b->wdt_cached_value = readl(isp->base + BUTTRESS_REG_WDT);
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
+	b->wdt_cached_value = readl(isp->base + b->regs->wdt);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
 
 	/* get ref_clk frequency by reading the indication in btrs control */
-	val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
+	val = readl(isp->base + b->regs->btrs_ctrl);
 	val = FIELD_GET(BUTTRESS_REG_BTRS_CTRL_REF_CLK_IND, val);
 
 	switch (val) {
@@ -902,7 +930,7 @@ void ipu6_buttress_exit(struct ipu6_device *isp)
 {
 	struct ipu6_buttress *b = &isp->buttress;
 
-	writel(0, isp->base + BUTTRESS_REG_ISR_ENABLE);
+	writel(0, isp->base + b->regs->irq_enable);
 
 	mutex_destroy(&b->power_mutex);
 	mutex_destroy(&b->auth_mutex);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index b1c1a10e3e6d..e60e557af13c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -42,9 +42,35 @@ struct ipu6_buttress_ipc {
 	u32 data0_in;
 };
 
+struct ipu6_buttress_registers {
+	/* Registers */
+	u32 irq_status;
+	u32 irq_clear;
+	u32 irq_enable;
+	u32 pwr_status;
+	u32 security_ctl;
+	u32 fw_reset_ctl;
+	u32 fabric_cmd;
+	u32 tsw_ctl;
+	u32 tsc_hi;
+	u32 tsc_lo;
+	u32 wdt;
+	u32 btrs_ctrl;
+
+	/* Bitmasks */
+	u32 irq_is;
+	u32 irq_ps;
+	u32 irq_all;
+	u32 irq_events;
+	u32 irq_cse_ipc;
+	u32 irq_exec_done;
+	u32 irq_sai;
+};
+
 struct ipu6_buttress {
 	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
 	struct ipu6_buttress_ipc ipc;
+	const struct ipu6_buttress_registers *regs;
 	struct list_head constraints;
 	u32 wdt_cached_value;
 	bool force_suspend;
-- 
2.54.0


