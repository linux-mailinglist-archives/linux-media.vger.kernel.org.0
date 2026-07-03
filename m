Return-Path: <linux-media+bounces-66494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qcWyLP/UR2rSfwAAu9opvQ
	(envelope-from <linux-media+bounces-66494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DD703DBD
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=mSfd42WX;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66494-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66494-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5885130607B6
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCA4417359;
	Fri,  3 Jul 2026 15:26:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D941734D
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092378; cv=none; b=Vl/2goC+6uUf+ctFk9tfaR3lIYhGLyayFDcBFsEwBFgHselfXYwEcq2wSj3BuXosxcAHGD3/g1DdcdPOhR+HE3+ejo5K7TAbQqGcdyhZq6JwbLJKLAg5tkE8+NdTLrmTI8fJhEUYgX3MJbMzZdmX8pqLm8m4TpaseDj+/mKR9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092378; c=relaxed/simple;
	bh=5wZLQPGO8ou9g1Q5VTSCqIPEm7+/wQ/dOWE+MlbAuWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkmwjwSY4kKAEagqzJL4WykV3RFiAIdyy3AK07/G55oRZWnxwqA15PowWk6fCZd0abVgzXopRb0Jk/A9oJDNlnvkMKp7Ipmdyq5/6JA6cYF1XYBEfQcMWmTV74HJN59s/DmRVuFYVfzI+/Bu5/JB31yfwFLmNFm0DvLq93VnRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSfd42WX; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092377; x=1814628377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5wZLQPGO8ou9g1Q5VTSCqIPEm7+/wQ/dOWE+MlbAuWA=;
  b=mSfd42WXQO98tubEaPWsAXDUftlENTHJABomistyMYg8pgyoPGCrHLZ1
   xCymieoMzvSq0YP/5WNymxjsGtQiXZQqwd2l68Jz2ZcUouHaZ1XqRNpYc
   auEgCXSQYeIZGa/fWod9k0Pwv+wbsNjDPUym15tv/hAWbP80WTJbgoU/u
   gXqnLm5ivzQlZYmEZEnF35SYnQTqFG8I3CqziAZhszRAOf0vfRmxVrM9E
   duYgG/Is0g6ehdulwBAJ5eedd8tP2fdh363GQ5eE2x2MqTnSgAt1QzYsf
   AhlyFfvlF2C8IgHYBfCwV9Yg6z2+hl6HmEOJYeXIE98TBjjzB3G6pGxjY
   Q==;
X-CSE-ConnectionGUID: TuD3A4HYTt2isaOClXWOOA==
X-CSE-MsgGUID: Tx/j8Kg9S1+cT0w9xGuiMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396227"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:16 -0700
X-CSE-ConnectionGUID: DIFjXxa6QommZgQzg92vNA==
X-CSE-MsgGUID: Df7XMyNJSOCLbJUEdee+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799742"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:14 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 28/41] media: ipu6: Enable ipu7 isys interrupts
Date: Fri,  3 Jul 2026 18:24:38 +0300
Message-ID: <20260703152451.1743132-29-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66494-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C1DD703DBD

Add ipu7 specific isys initialization of clocks and
enabling interrupts.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 53 +++++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 74ab5ea7751c..7db0bc657a4c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -180,13 +180,22 @@ static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
 	int ret;
 
 	for (i = 0; i < csi2_pdata->nports; i++) {
-		ret = ipu6_isys_csi2_init(&isys->csi2[i], isys,
-					  isys->pdata->base +
-					  CSI_REG_PORT_BASE(i), i);
+		void __iomem *base = isys->pdata->base;
+
+		if (pci_match_id(ipu7_ids, isys->adev->isp->pdev)) {
+			u32 mask = IPU7_CSI_LEGACY_IRQ_MASK(i);
+
+			isys->isr_csi2_bits |= mask;
+			isys->csi2[i].legacy_irq_mask = mask;
+		} else {
+			base += CSI_REG_PORT_BASE(i);
+			isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
+		}
+
+		ret = ipu6_isys_csi2_init(&isys->csi2[i], isys, base, i);
 		if (ret)
 			goto fail;
 
-		isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
 	}
 
 	return 0;
@@ -273,7 +282,36 @@ static int isys_register_video_devices(struct ipu6_isys *isys)
 	return ret;
 }
 
-static void isys_setup_hw(struct ipu6_isys *isys)
+static void ipu7_isys_setup_hw(struct ipu6_isys *isys)
+{
+	u32 offset, mask;
+	void __iomem *base = isys->pdata->base;
+
+	offset = IPU7_IS_IO_GPREGS_BASE;
+
+	writel(0x0, base + offset + IPU7_CLK_EN_TXCLKESC);
+	/* Update if ISYS freq updated (0: 400/1, 1:400/2, 63:400/64) */
+	writel(0x0, base + offset + IPU7_CLK_DIV_FACTOR_IS_CLK);
+	/* correct the initial printf configuration */
+	writel(0x200, base + IPU7_IS_UC_CTRL_BASE + IPU7_REG_PRINTF_AXI_CNTL);
+
+	offset = IPU7_IS_UC_CTRL_BASE;
+	mask = IPU7_IS_UC_TO_SW_IRQ_MASK;
+
+	writel(mask, base + offset + IPU7_TO_SW_IRQ_CNTL_CLEAR);
+	writel(mask, base + offset + IPU7_TO_SW_IRQ_CNTL_MASK_N);
+	writel(mask, base + offset + IPU7_TO_SW_IRQ_CNTL_ENABLE);
+
+	offset = IPU7_IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE;
+	mask = IPU7_CSI_RX_LEGACY_IRQ_MASK;
+
+	writel(mask, base + offset + IPU7_IRQ_CTL_EDGE);
+	writel(mask, base + offset + IPU7_IRQ_CTL_CLEAR);
+	writel(mask, base + offset + IPU7_IRQ_CTL_MASK);
+	writel(mask, base + offset + IPU7_IRQ_CTL_ENABLE);
+}
+
+static void ipu6_isys_setup_hw(struct ipu6_isys *isys)
 {
 	void __iomem *base = isys->pdata->base;
 	const u8 *thd = isys->pdata->ipdata->hw_variant.cdc_fifo_threshold;
@@ -788,7 +826,10 @@ static int isys_runtime_pm_resume(struct device *dev)
 	isys->power = 1;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
 
-	isys_setup_hw(isys);
+	if (pci_match_id(ipu7_ids, isp->pdev))
+		ipu7_isys_setup_hw(isys);
+	else
+		ipu6_isys_setup_hw(isys);
 
 	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
 
-- 
2.54.0


