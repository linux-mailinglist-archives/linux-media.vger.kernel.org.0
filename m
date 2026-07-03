Return-Path: <linux-media+bounces-66479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ied/BXrUR2qUfwAAu9opvQ
	(envelope-from <linux-media+bounces-66479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7A703D32
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="d/e4Yckc";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66479-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66479-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D5BA302964C
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0E4416D13;
	Fri,  3 Jul 2026 15:25:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC24414DFD
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092343; cv=none; b=HO3pWXXlGkuTz/D0Su2KS0yHKxbEYtKqiqsdMcp52tScRtUTQxWtGq4N8oYQMoyByk8FNKaCuoEno6uQU3arwPyFRp0vt4VLc7NEmsQ0gqol82E5FnPResOK3U3TprV6I5HkAcTUYoKPRjBh2SIiobo7O6EcIdDejAM1JJymb4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092343; c=relaxed/simple;
	bh=6xtGQzO38UIpAOTFN6V/0zCXmmyGHmUM776bw/v7MSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jV653uhtrzY0D4HiOnHSWA3ym5oxoPP6GHJCv+zkIdrV7Y3lnJ9ndOa7wizaRikh159GNks7j16YTi7G+SzSVNuWlT+fLKS213vWcSeH6ceUIWZsXGXUDAVqXaPNZ5raojF8JFft+lb8SPHjMZ/jHXIxJn/ce7DtMSB21vmyzAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/e4Yckc; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092341; x=1814628341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6xtGQzO38UIpAOTFN6V/0zCXmmyGHmUM776bw/v7MSs=;
  b=d/e4Yckc/BpO1e8xhzSFwZ+2snsQ+dlSDaw8IM026bchWs2u4YmCZAA0
   9E1X3WsSTdpL7EwHq0XiaatFEFJgJDzCKp7UilqOLHcVv4OM4O/BVWd+r
   v7cnQFjQ9sOETM/6PK0LdV310lulEKVd9nlRJZSsTvROi/lgv/H9E123r
   JWn/q/zebWw2Q8LHBgqtp9gFWdy0oKd2QBnVbNBEA6zyC/gWwVGNvB2qd
   izLr/f44sLuThKI7v7vtM8E204fd3XYHfRjb3TPUl0tANlpOVgAAxwKtk
   zClvetynV9w+BcEZpbw0Z6LV9dHqbfoupDDVs9ZJwBEMJU0OdWc3B1/pv
   g==;
X-CSE-ConnectionGUID: kE4aR0n0REqbOsDPHdPXaA==
X-CSE-MsgGUID: TJdzs0m8R+q2OX0S4du47w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396158"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396158"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:41 -0700
X-CSE-ConnectionGUID: Gz5Hbat3QdWrKCQ7z7aXbQ==
X-CSE-MsgGUID: QdGn5IWfSL+styxseiQpTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799522"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:39 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 13/41] media: ipu6: Add ipu7 buttress support
Date: Fri,  3 Jul 2026 18:24:23 +0300
Message-ID: <20260703152451.1743132-14-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66479-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFB7A703D32

The ipu7 differs from ipu6 e.g. in power management, authentication,
interrupt handling and clock setup. Add support for ipu7 buttress.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 328 +++++++++++++++---
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |   3 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  | 103 ++++++
 drivers/media/pci/intel/ipu6/ipu6.c           |  12 +
 drivers/media/pci/intel/ipu6/ipu6.h           |   1 +
 5 files changed, 403 insertions(+), 44 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 155f260db14f..c1dfc4e45424 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -86,6 +86,36 @@ static const struct ipu6_buttress_registers ipu6_buttress_regs = {
 	.irq_sai	= BUTTRESS_ISR_SAI_VIOLATION,
 };
 
+static const struct ipu6_buttress_registers ipu7_buttress_regs = {
+	/* Registers */
+	.irq_status	= IPU7_BUTTRESS_REG_IRQ_STATUS,
+	.irq_clear	= IPU7_BUTTRESS_REG_IRQ_CLEAR,
+	.irq_enable	= IPU7_BUTTRESS_REG_IRQ_ENABLE,
+	.pwr_status	= IPU7_BUTTRESS_REG_PWR_STATUS,
+	.security_ctl	= IPU7_BUTTRESS_REG_SECURITY_CTL,
+	.fw_reset_ctl	= IPU7_BUTTRESS_REG_FW_RESET_CTL,
+	.fabric_cmd	= IPU7_BUTTRESS_REG_TSC_CMD,
+	.tsw_ctl	= IPU7_BUTTRESS_REG_TSC_CTL,
+	.tsc_lo		= IPU7_BUTTRESS_REG_TSC_LO,
+	.tsc_hi		= IPU7_BUTTRESS_REG_TSC_HI,
+	.wdt		= IPU7_BUTTRESS_REG_IDLE_WDT,
+	.csr_in		= IPU7_BUTTRESS_REG_CSE2IUCSR,
+	.csr_out	= IPU7_BUTTRESS_REG_IU2CSECSR,
+	.db0_in		= IPU7_BUTTRESS_REG_CSE2IUDB0,
+	.db0_out	= IPU7_BUTTRESS_REG_IU2CSEDB0,
+	.data0_in	= IPU7_BUTTRESS_REG_CSE2IUDATA0,
+	.data0_out	= IPU7_BUTTRESS_REG_IU2CSEDATA0,
+
+	/* Bitmasks */
+	.irq_is		= IPU7_BUTTRESS_IRQ_IS_IRQ,
+	.irq_ps		= IPU7_BUTTRESS_IRQ_PS_IRQ,
+	.irq_all	= IPU7_BUTTRESS_IRQS,
+	.irq_events	= IPU7_BUTTRESS_IRQS,
+	.irq_cse_ipc	= IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING,
+	.irq_exec_done	= IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE,
+	.irq_sai	= IPU7_BUTTRESS_IRQ_SAI_VIOLATION,
+};
+
 int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			    struct ipu6_buttress_ipc *ipc)
 {
@@ -377,6 +407,13 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	if (!active)
 		return IRQ_NONE;
 
+	if (pci_match_id(ipu7_ids, isp->pdev)) {
+		u32 pb_irq;
+
+		pb_irq = readl(isp->pb_base + IPU7_PB_INTERRUPT_STATUS);
+		writel(pb_irq, isp->pb_base + IPU7_PB_INTERRUPT_STATUS);
+	}
+
 	irq_status = readl(isp->base + regs->irq_status);
 	if (irq_status == 0 || WARN_ON_ONCE(irq_status == 0xffffffffu)) {
 		if (active > 0)
@@ -474,28 +511,143 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 	return ret;
 }
 
-int ipu6_buttress_power(struct device *dev,
-			const struct ipu6_buttress_ctrl *ctrl, bool on)
+static int ipu7_isys_d2d_power(struct ipu6_device *isp, bool on)
+{
+	u32 target = on ? IPU7_BUTTRESS_D2D_PWR_ACK : 0U;
+	u32 val;
+	int ret;
+
+	val = readl(isp->base + IPU7_BUTTRESS_REG_D2D_CTL);
+	if ((val & IPU7_BUTTRESS_D2D_PWR_ACK) == target)
+		return 0;
+
+	if (on)
+		val |= IPU7_BUTTRESS_D2D_PWR_EN;
+	else
+		val &= ~IPU7_BUTTRESS_D2D_PWR_EN;
+	writel(val, isp->base + IPU7_BUTTRESS_REG_D2D_CTL);
+
+	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_D2D_CTL, val,
+				 (val & IPU7_BUTTRESS_D2D_PWR_ACK) == target,
+				 100, BUTTRESS_POWER_TIMEOUT_US);
+	if (ret)
+		dev_err(&isp->pdev->dev, "D2D power %s timeout: 0x%x\n",
+			on ? "up" : "down", val);
+
+	return ret;
+}
+
+static void ipu7_nde_control(struct ipu6_device *isp, bool on)
+{
+	u32 val;
+
+	val = FIELD_PREP(IPU7_NDE_VAL_MASK,
+			 on ? IPU7_NDE_VAL_ACTIVE : IPU7_NDE_VAL_DEFAULT) |
+	      FIELD_PREP(IPU7_NDE_SCALE_MASK,
+			 on ? IPU7_NDE_SCALE_ACTIVE : IPU7_NDE_SCALE_DEFAULT) |
+	      FIELD_PREP(IPU7_NDE_VALID_MASK,
+			 on ? IPU7_NDE_VALID_ACTIVE : IPU7_NDE_VALID_DEFAULT) |
+	      FIELD_PREP(IPU7_NDE_RESVEC_MASK, IPU7_NDE_RESVEC);
+	writel(val, isp->base + IPU7_BUTTRESS_REG_NDE_CONTROL);
+}
+
+static int __ipu7_power_on(struct device *dev,
+			   const struct ipu6_buttress_ctrl *ctrl)
+{
+	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
+	bool is_isys = ctrl->subsys_id == IPU_ISYS;
+	u32 pwr_sts, val, ovrd_clk, slp, own_clk_ack;
+	int ret;
+
+	val = ctrl->ratio | (IPU7_FREQ_CTL_CDYN << IPU7_FREQ_CTL_CDYN_SHIFT);
+	pwr_sts = ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
+
+	if (is_isys) {
+		ret = ipu7_isys_d2d_power(isp, true);
+		if (ret)
+			return ret;
+
+		ipu7_nde_control(isp, true);
+	}
+
+	/* Request clock ownership. */
+	ovrd_clk = is_isys ? IPU7_BUTTRESS_OVERRIDE_IS_CLK :
+			     IPU7_BUTTRESS_OVERRIDE_PS_CLK;
+
+	slp = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
+	slp |= ovrd_clk;
+	writel(slp, isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
+
+	own_clk_ack = is_isys ? IPU7_BUTTRESS_OWN_ACK_IS_CLK :
+				IPU7_BUTTRESS_OWN_ACK_PS_CLK;
+	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS,
+				 slp, (slp & own_clk_ack),
+				 100, BUTTRESS_POWER_TIMEOUT_US);
+	if (ret)
+		dev_warn(&isp->pdev->dev, "clock ownership timeout: 0x%x\n",
+			 slp);
+
+	writel(val, isp->base + ctrl->freq_ctl);
+
+	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
+				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
+				 100, BUTTRESS_POWER_TIMEOUT_US);
+	if (ret) {
+		dev_err(&isp->pdev->dev,
+			"Change power status timeout with 0x%x\n", val);
+		return ret;
+	}
+
+	slp = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
+	slp &= ~ovrd_clk;
+	writel(slp, isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
+
+	return ret;
+}
+
+static int __ipu7_power_off(struct device *dev,
+			    const struct ipu6_buttress_ctrl *ctrl)
 {
 	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
 	u32 pwr_sts, val;
 	int ret;
 
-	if (!ctrl)
-		return 0;
+	writel(0x8U, isp->base + ctrl->freq_ctl);
 
-	mutex_lock(&isp->buttress.power_mutex);
+	pwr_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
+	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
+				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
+				 100, BUTTRESS_POWER_TIMEOUT_US);
+	if (ret) {
+		dev_err(&isp->pdev->dev,
+			"Change power status timeout with 0x%x\n", val);
+		return ret;
+	}
+
+	if (ctrl->subsys_id == IPU_ISYS) {
+		ipu7_isys_d2d_power(isp, false);
+		ipu7_nde_control(isp, false);
+	}
+
+	return ret;
+}
+
+static int __ipu6_power(struct device *dev,
+			const struct ipu6_buttress_ctrl *ctrl, bool on)
+{
+	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
+	u32 pwr_sts, val;
+	int ret;
 
 	if (!on) {
 		val = 0;
 		pwr_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
 	} else {
 		val = BUTTRESS_FREQ_CTL_START |
-			FIELD_PREP(BUTTRESS_FREQ_CTL_RATIO_MASK,
-				   ctrl->ratio) |
-			FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK,
-				   ctrl->qos_floor) |
-			BUTTRESS_FREQ_CTL_ICCMAX_LEVEL;
+		      FIELD_PREP(BUTTRESS_FREQ_CTL_RATIO_MASK, ctrl->ratio) |
+		      FIELD_PREP(BUTTRESS_FREQ_CTL_QOS_FLOOR_MASK,
+				 ctrl->qos_floor) |
+		      BUTTRESS_FREQ_CTL_ICCMAX_LEVEL;
 
 		pwr_sts = ctrl->pwr_sts_on << ctrl->pwr_sts_shift;
 	}
@@ -509,6 +661,26 @@ int ipu6_buttress_power(struct device *dev,
 		dev_err(&isp->pdev->dev,
 			"Change power status timeout with 0x%x\n", val);
 
+	return ret;
+}
+
+int ipu6_buttress_power(struct device *dev,
+			const struct ipu6_buttress_ctrl *ctrl, bool on)
+{
+	struct ipu6_device *isp = to_ipu6_bus_device(dev)->isp;
+	int ret;
+
+	if (!ctrl)
+		return 0;
+
+	mutex_lock(&isp->buttress.power_mutex);
+
+	if (pci_match_id(ipu7_ids, isp->pdev))
+		ret = on ? __ipu7_power_on(dev, ctrl) :
+			   __ipu7_power_off(dev, ctrl);
+	else
+		ret = __ipu6_power(dev, ctrl, on);
+
 	mutex_unlock(&isp->buttress.power_mutex);
 
 	return ret;
@@ -666,11 +838,18 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	 * Write address of FIT table to FW_SOURCE register
 	 * Let's use fw address. I.e. not using FIT table yet
 	 */
-	data = lower_32_bits(isp->psys->pkg_dir_dma_addr);
-	writel(data, isp->base + BUTTRESS_REG_FW_SOURCE_BASE_LO);
+	if (pci_match_id(ipu7_ids, isp->pdev)) {
+		writel(isp->cpd_fw->size,
+		       isp->base + IPU7_BUTTRESS_REG_FW_SOURCE_SIZE);
+		writel(sg_dma_address(isp->psys->fw_sgt.sgl),
+		       isp->base + IPU7_BUTTRESS_REG_FW_SOURCE_BASE);
+	} else {
+		data = lower_32_bits(isp->psys->pkg_dir_dma_addr);
+		writel(data, isp->base + BUTTRESS_REG_FW_SOURCE_BASE_LO);
 
-	data = upper_32_bits(isp->psys->pkg_dir_dma_addr);
-	writel(data, isp->base + BUTTRESS_REG_FW_SOURCE_BASE_HI);
+		data = upper_32_bits(isp->psys->pkg_dir_dma_addr);
+		writel(data, isp->base + BUTTRESS_REG_FW_SOURCE_BASE_HI);
+	}
 
 	/*
 	 * Write boot_load into IU2CSEDATA0
@@ -706,8 +885,11 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 		goto out_unlock;
 	}
 
-	ret = readl_poll_timeout(psys_pdata->base + BOOTLOADER_STATUS_OFFSET,
-				 data, data == BOOTLOADER_MAGIC_KEY, 500,
+	void __iomem *base = pci_match_id(ipu7_ids, isp->pdev) ?
+			     isp->base + IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7 :
+			     psys_pdata->base + BOOTLOADER_STATUS_OFFSET;
+
+	ret = readl_poll_timeout(base, data, data == BOOTLOADER_MAGIC_KEY, 500,
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
 	if (ret) {
 		dev_err(&isp->pdev->dev, "Unexpected magic number 0x%x\n",
@@ -846,12 +1028,61 @@ u64 ipu6_buttress_tsc_ticks_to_ns(u64 ticks, const struct ipu6_device *isp)
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_buttress_tsc_ticks_to_ns, "INTEL_IPU6");
 
-void ipu6_buttress_restore(struct ipu6_device *isp)
+/* trigger uc control to wakeup fw */
+void ipu7_buttress_wakeup_isys(const struct ipu6_device *isp)
+{
+	u32 val;
+
+	val = readl(isp->base + IPU7_BUTTRESS_REG_ISYS_UCX_CTRL_STATUS);
+	val |= IPU7_UCX_CTL_WAKEUP;
+	writel(val, isp->base + IPU7_BUTTRESS_REG_ISYS_UCX_CTRL_STATUS);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_buttress_wakeup_isys, "INTEL_IPU6");
+
+u32 ipu7_buttress_get_isys_freq(struct ipu6_device *isp)
+{
+	u32 val;
+
+	val = readl(isp->base + IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ);
+	val &= IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK;
+
+	return val ? val * 50 / 3 : 0;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_buttress_get_isys_freq, "INTEL_IPU6");
+
+static void ipu7_buttress_setup(struct ipu6_device *isp)
 {
 	struct ipu6_buttress *b = &isp->buttress;
+	u32 val;
+
+	/* program PB BAR */
+	writel(0, isp->pb_base + IPU7_GLOBAL_INTERRUPT_MASK);
+	val = readl(isp->pb_base + IPU7_BAR2_MISC_CONFIG);
+	val |= 0x100U;
+
+	writel(val, isp->pb_base + IPU7_BAR2_MISC_CONFIG);
+
+	writel(BIT(22), isp->pb_base + IPU7_TLBID_HASH_ENABLE_63_32);
+	writel(BIT(1), isp->pb_base + IPU7_TLBID_HASH_ENABLE_127_96);
 
 	writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
+	writel(b->regs->irq_all, isp->base + IPU7_BUTTRESS_REG_IRQ_MASK);
 	writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
+
+	/* LNL SW workaround for PS PD hang when PS sub-domain during PD */
+	writel(IPU7_BUTTRESS_CG_CTRL_PS_FSM_CG, isp->base + IPU7_BUTTRESS_REG_CG_CTRL_BITS);
+}
+
+void ipu6_buttress_restore(struct ipu6_device *isp)
+{
+	struct ipu6_buttress *b = &isp->buttress;
+
+	if (pci_match_id(ipu7_ids, isp->pdev)) {
+		ipu7_buttress_setup(isp);
+	} else {
+		writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
+		writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
+	}
 	writel(b->wdt_cached_value, isp->base + b->regs->wdt);
 }
 
@@ -868,40 +1099,49 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	init_completion(&b->ipc.send_complete);
 	init_completion(&b->ipc.recv_complete);
 
-	b->regs = &ipu6_buttress_regs;
+	b->regs = pci_match_id(ipu7_ids, isp->pdev) ?
+		  &ipu7_buttress_regs : &ipu6_buttress_regs;
 
 	INIT_LIST_HEAD(&b->constraints);
-
 	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
-	dev_dbg(&isp->pdev->dev, "IPU6 in %s mode touch 0x%x mask 0x%x\n",
-		isp->secure_mode ? "secure" : "non-secure",
-		readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
-		readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
 
-	b->wdt_cached_value = readl(isp->base + b->regs->wdt);
-	writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
-	writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
+	dev_dbg(&isp->pdev->dev, "IPU in %s mode\n",
+		isp->secure_mode ? "secure" : "non-secure");
 
-	/* get ref_clk frequency by reading the indication in btrs control */
-	val = readl(isp->base + b->regs->btrs_ctrl);
-	val = FIELD_GET(BUTTRESS_REG_BTRS_CTRL_REF_CLK_IND, val);
-
-	switch (val) {
-	case 0x0:
-		b->ref_clk = 240;
-		break;
-	case 0x1:
-		b->ref_clk = 192;
-		break;
-	case 0x2:
+	if (pci_match_id(ipu7_ids, isp->pdev)) {
+		ipu7_buttress_setup(isp);
 		b->ref_clk = 384;
-		break;
-	default:
-		dev_warn(&isp->pdev->dev,
-			 "Unsupported ref clock, use 19.2Mhz by default.\n");
-		b->ref_clk = 192;
-		break;
+	} else {
+		dev_dbg(&isp->pdev->dev, "IPU6 touch 0x%x mask 0x%x\n",
+			readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
+			readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
+
+		writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
+		writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
+
+		/* get ref_clk frequency by reading the indication in btrs control */
+		val = readl(isp->base + b->regs->btrs_ctrl);
+		val = FIELD_GET(BUTTRESS_REG_BTRS_CTRL_REF_CLK_IND, val);
+
+		switch (val) {
+		case 0x0:
+			b->ref_clk = 240;
+			break;
+		case 0x1:
+			b->ref_clk = 192;
+			break;
+		case 0x2:
+			b->ref_clk = 384;
+			break;
+		default:
+			dev_warn(&isp->pdev->dev,
+				 "Unsupported ref clock, use 19.2Mhz by default.\n");
+			b->ref_clk = 192;
+			break;
+	}
 	}
+	b->wdt_cached_value = readl(isp->base + b->regs->wdt);
+
 
 	/* Retry couple of times in case of CSE initialization is delayed */
 	do {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index db5388330278..6691d511c97b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -26,6 +26,7 @@ struct ipu6_buttress_ctrl {
 	u32 freq_ctl, pwr_sts_shift, pwr_sts_mask, pwr_sts_on, pwr_sts_off;
 	unsigned int ratio;
 	unsigned int qos_floor;
+	int subsys_id;
 };
 
 struct ipu6_buttress_ipc {
@@ -106,4 +107,6 @@ void ipu6_buttress_exit(struct ipu6_device *isp);
 void ipu6_buttress_csi_port_config(struct ipu6_device *isp,
 				   u32 legacy, u32 combo);
 void ipu6_buttress_restore(struct ipu6_device *isp);
+void ipu7_buttress_wakeup_isys(const struct ipu6_device *isp);
+u32 ipu7_buttress_get_isys_freq(struct ipu6_device *isp);
 #endif /* IPU6_BUTTRESS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index efd65e494c16..1fc1188a852f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -221,4 +221,107 @@ enum {
 #define BUTTRESS_EVENT		 (BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING | \
 				  BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE |    \
 				  BUTTRESS_ISR_SAI_VIOLATION)
+
+/* IPU7 */
+
+/* IPU7 buttress register offsets */
+#define IPU7_BUTTRESS_REG_SKU			0x3030
+#define IPU7_BUTTRESS_REG_IRQ_STATUS		0x2000
+#define IPU7_BUTTRESS_REG_IRQ_ENABLE		0x2008
+#define IPU7_BUTTRESS_REG_IRQ_CLEAR		0x200c
+#define IPU7_BUTTRESS_REG_IRQ_MASK		0x2010
+#define IPU7_BUTTRESS_REG_TSC_CMD		0x2014
+#define IPU7_BUTTRESS_REG_TSC_CTL		0x2018
+#define IPU7_BUTTRESS_REG_TSC_LO		0x201c
+#define IPU7_BUTTRESS_REG_TSC_HI		0x2020
+#define IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ	0x2104
+#define IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ	0x2100
+#define IPU7_BUTTRESS_REG_IDLE_WDT		0x218c
+#define IPU7_BUTTRESS_REG_ISYS_UCX_CTRL_STATUS	0x2200
+#define IPU7_BUTTRESS_REG_ISYS_UCX_START_ADDR	0x2204
+#define IPU7_BUTTRESS_REG_PSYS_UCX_CTRL_STATUS	0x2208
+#define IPU7_BUTTRESS_REG_PSYS_UCX_START_ADDR	0x220c
+#define IPU7_BUTTRESS_REG_SECURITY_CTL		0x2318
+#define IPU7_BUTTRESS_REG_FW_RESET_CTL		0x2334
+#define IPU7_BUTTRESS_REG_FW_SOURCE_SIZE	0x2338
+#define IPU7_BUTTRESS_REG_FW_SOURCE_BASE	0x233c
+#define IPU7_BUTTRESS_REG_CSE2IUDB0		0x2500
+#define IPU7_BUTTRESS_REG_CSE2IUDATA0		0x2504
+#define IPU7_BUTTRESS_REG_CSE2IUCSR		0x2508
+#define IPU7_BUTTRESS_REG_IU2CSEDB0		0x250c
+#define IPU7_BUTTRESS_REG_IU2CSEDATA0		0x2510
+#define IPU7_BUTTRESS_REG_IU2CSECSR		0x2514
+#define IPU7_BUTTRESS_REG_CG_CTRL_BITS		0x3014
+#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0	0x4000
+#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7	0x401c
+#define IPU7_BUTTRESS_REG_PWR_STATUS		0x2114
+
+#define IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE		BIT(0)
+#define IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING	BIT(1)
+#define IPU7_BUTTRESS_IRQ_CSE_CSR_SET			BIT(2)
+#define IPU7_BUTTRESS_IRQ_SAI_VIOLATION			BIT(4)
+#define IPU7_BUTTRESS_IRQ_IS_IRQ			BIT(30)
+#define IPU7_BUTTRESS_IRQ_PS_IRQ			BIT(31)
+
+#define IPU7_BUTTRESS_IRQS	(IPU7_BUTTRESS_IRQ_IS_IRQ |		\
+				 IPU7_BUTTRESS_IRQ_PS_IRQ |		\
+				 IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING | \
+				 IPU7_BUTTRESS_IRQ_CSE_CSR_SET |	\
+				 IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE)
+
+/* LNL SW workaround for PS PD hang */
+#define IPU7_BUTTRESS_CG_CTRL_PS_FSM_CG		BIT(3)
+
+/* P-unit Bridge (PB) BAR registers */
+#define IPU7_PB_INTERRUPT_STATUS		0x0
+
+/* Frequency control encoding */
+#define IPU7_FREQ_CTL_CDYN			0x80
+#define IPU7_FREQ_CTL_CDYN_SHIFT		8
+#define IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK	GENMASK(23, 8)
+#define IPU7_IS_FREQ_CTL_DEFAULT_RATIO			0x1b
+#define IPU7_PS_FREQ_CTL_DEFAULT_RATIO			0x14
+
+/* D2D power control */
+#define IPU7_BUTTRESS_REG_D2D_CTL		0x21d4
+#define IPU7_BUTTRESS_D2D_PWR_EN		BIT(0)
+#define IPU7_BUTTRESS_D2D_PWR_ACK		BIT(4)
+
+#define IPU7_BUTTRESS_PWR_STATE_IS_PWR_SHIFT	0
+#define IPU7_BUTTRESS_PWR_STATE_IS_PWR_MASK	(0x3U << 0)
+#define IPU7_BUTTRESS_PWR_STATE_PS_PWR_SHIFT	4
+#define IPU7_BUTTRESS_PWR_STATE_PS_PWR_MASK	(0x3U << 4)
+
+/* NDE */
+#define IPU7_BUTTRESS_REG_NDE_CONTROL		0x21a4
+#define IPU7_NDE_VAL_MASK			GENMASK(9, 0)
+#define IPU7_NDE_SCALE_MASK			GENMASK(12, 10)
+#define IPU7_NDE_VALID_MASK			BIT(13)
+#define IPU7_NDE_RESVEC_MASK			GENMASK(19, 16)
+#define IPU7_NDE_VAL_ACTIVE			48
+#define IPU7_NDE_SCALE_ACTIVE			2
+#define IPU7_NDE_VALID_ACTIVE			1
+#define IPU7_NDE_VAL_DEFAULT			1023
+#define IPU7_NDE_SCALE_DEFAULT			2
+#define IPU7_NDE_VALID_DEFAULT			0
+#define IPU7_NDE_RESVEC				0xe
+
+/* IS UCX control */
+#define IPU7_UCX_CTL_RESET			BIT(0)
+#define IPU7_UCX_CTL_RUN			BIT(1)
+#define IPU7_UCX_CTL_WAKEUP			BIT(2)
+
+#define IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG	0x21b0
+#define IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS	0x21b4
+#define IPU7_BUTTRESS_OVERRIDE_IS_CLK		BIT(1)
+#define IPU7_BUTTRESS_OWN_ACK_IS_CLK		BIT(9)
+#define IPU7_BUTTRESS_OVERRIDE_PS_CLK		BIT(2)
+#define IPU7_BUTTRESS_OWN_ACK_PS_CLK		BIT(10)
+
+/* PB registers */
+#define IPU7_GLOBAL_INTERRUPT_MASK		0x8
+#define IPU7_TLBID_HASH_ENABLE_63_32		0x34
+#define IPU7_TLBID_HASH_ENABLE_127_96		0x3c
+#define IPU7_BAR2_MISC_CONFIG			0x64
+
 #endif /* IPU6_PLATFORM_BUTTRESS_REGS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 3e90e1585d07..e72e404e6ed4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -34,6 +34,7 @@
 #include "ipu6-platform-regs.h"
 
 #define IPU6_PCI_BAR		0
+#define IPU7_PCI_PBBAR		4
 
 struct ipu6_cell_program {
 	u32 magic_number;
@@ -209,6 +210,7 @@ static struct ipu6_psys_internal_pdata psys_ipdata = {
 };
 
 static const struct ipu6_buttress_ctrl isys_buttress_ctrl = {
+	.subsys_id = IPU_ISYS,
 	.ratio = IPU6_IS_FREQ_CTL_DEFAULT_RATIO,
 	.qos_floor = IPU6_IS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
 	.freq_ctl = IPU6_BUTTRESS_REG_IS_FREQ_CTL,
@@ -219,6 +221,7 @@ static const struct ipu6_buttress_ctrl isys_buttress_ctrl = {
 };
 
 static const struct ipu6_buttress_ctrl psys_buttress_ctrl = {
+	.subsys_id = IPU_PSYS,
 	.ratio = IPU6_PS_FREQ_CTL_DEFAULT_RATIO,
 	.qos_floor = IPU6_PS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
 	.freq_ctl = IPU6_BUTTRESS_REG_PS_FREQ_CTL,
@@ -524,6 +527,15 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return dev_err_probe(dev, PTR_ERR(isp->base),
 				     "Failed to I/O mem remapping\n");
 
+	if (pci_match_id(ipu7_ids, pdev)) {
+		isp->pb_base = pcim_iomap_region(pdev, IPU7_PCI_PBBAR,
+						 IPU6_NAME);
+		if (IS_ERR(isp->pb_base))
+			return dev_err_probe(dev, PTR_ERR(isp->pb_base),
+					     "I/O remapping PB BAR %u failed\n",
+					     IPU7_PCI_PBBAR);
+	}
+
 	pci_set_drvdata(pdev, isp);
 	pci_set_master(pdev);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 01bd2a965367..b7025b5e06cc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -82,6 +82,7 @@ struct ipu6_device {
 	u32 cpd_metadata_cmpnt_size;
 
 	void __iomem *base;
+	void __iomem *pb_base;
 	bool need_ipc_reset;
 	bool secure_mode;
 	bool bus_ready_to_probe;
-- 
2.54.0


