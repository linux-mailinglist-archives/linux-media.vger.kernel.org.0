Return-Path: <linux-media+bounces-66477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BRxTCXbUR2qTfwAAu9opvQ
	(envelope-from <linux-media+bounces-66477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B280B703D2F
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fcIvPbs3;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66477-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66477-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2360E302AF42
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E721414DF7;
	Fri,  3 Jul 2026 15:25:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55505414DFC
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092337; cv=none; b=eSsg046YjkLrmNZuM9kcGe5ulFR5ToLO6iZUB9aLWEtaZhe42sSkY70POPmHWFyySnLtQC0Tm6BcpQSE7p1unoE7BhcACQyF7Gi0sw8dNGG3PQQSgjoLV7vZ5haNtGQl/gtsSjg0sUCzV6VXjSrXNM4Ze1l6K74sQBXqMgodgFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092337; c=relaxed/simple;
	bh=wWTCA2vIKwieqzcdj5HKinpibVBI/x685umaR2H96n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvyY2KgVFlt25ype0bKoshSo5Va2N7khpvfU+Y3EDbltsdAWHMnSyiGBVUDRPVX9Gz0ANueZx8kMhEXumJgYdcMmuDMgaF5K0fReqZDU8W0YLiuDfAzKmfmMkhetnTnZ2u9dMYpVEPiKjfjW5hecfc4Qar0EyyT/lu7jrMW4Ef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcIvPbs3; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092336; x=1814628336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wWTCA2vIKwieqzcdj5HKinpibVBI/x685umaR2H96n8=;
  b=fcIvPbs3+ux0eqJhb/yNJiaa1s58DKOO1WFmt+HuL5pkxfAAlF4PNld6
   FXs9/EN9zYhCDm7ds3q+C8Sdloa+m4sneuOtttS556ZdwsrKbtzC2jTU8
   m2VVku7doSoZseuBuvJMmsm2QQcA281gtckQ/Mv1VP/S+n/bw1h7rMCcp
   hEK0TLN0LKZGm8Dz1xv+Tbqh8J4J/lJphj3OCRkJoB3eAy0Wh4vFfo9Z6
   AkNH9j7sqrrEiGAAqSCgHnIo2KM3HSwIy25Li/AXzfu+DT7c2UHiBo2Q+
   OtOTkXEL8FNUgXsI9UaTwelOGFAccILibOLYMg/DIG2HZQfmFIWMXf+hR
   w==;
X-CSE-ConnectionGUID: aiQhjnZORNGiBLQxPYXZBg==
X-CSE-MsgGUID: rVUrHuJLR6ezwiTDXJ36zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396150"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396150"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:36 -0700
X-CSE-ConnectionGUID: gyzxelD4QnC8uVH3M73VSQ==
X-CSE-MsgGUID: LqWluM7lQterADRL5/cIaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799506"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:34 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 11/41] media: ipu6: Use single struct for registers
Date: Fri,  3 Jul 2026 18:24:21 +0300
Message-ID: <20260703152451.1743132-12-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66477-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: B280B703D2F

Move register values from ipu6_buttress_ipc struct to
ipu6_buttress_registers as these are different in future
hardware versions as well.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 87 ++++++++++----------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 14 ++--
 2 files changed, 49 insertions(+), 52 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 4ce1e941b410..155f260db14f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -69,6 +69,12 @@ static const struct ipu6_buttress_registers ipu6_buttress_regs = {
 	.tsc_lo		= BUTTRESS_REG_TSC_LO,
 	.wdt		= BUTTRESS_REG_WDT,
 	.btrs_ctrl	= BUTTRESS_REG_BTRS_CTRL,
+	.csr_in		= BUTTRESS_REG_CSE2IUCSR,
+	.csr_out	= BUTTRESS_REG_IU2CSECSR,
+	.db0_in		= BUTTRESS_REG_CSE2IUDB0,
+	.db0_out	= BUTTRESS_REG_IU2CSEDB0,
+	.data0_in	= BUTTRESS_REG_CSE2IUDATA0,
+	.data0_out	= BUTTRESS_REG_IU2CSEDATA0,
 
 	/* Bitmasks */
 	.irq_is		= BUTTRESS_ISR_IS_IRQ,
@@ -85,6 +91,7 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 {
 	unsigned int retries = BUTTRESS_IPC_RESET_RETRY;
 	struct ipu6_buttress *b = &isp->buttress;
+	const struct ipu6_buttress_registers *regs = b->regs;
 	u32 val = 0, csr_in_clr;
 
 	if (!isp->secure_mode) {
@@ -95,11 +102,11 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 	mutex_lock(&b->ipc_mutex);
 
 	/* Clear-by-1 CSR (all bits), corresponding internal states. */
-	val = readl(isp->base + ipc->csr_in);
-	writel(val, isp->base + ipc->csr_in);
+	val = readl(isp->base + regs->csr_in);
+	writel(val, isp->base + regs->csr_in);
 
 	/* Set peer CSR bit IPC_PEER_COMP_ACTIONS_RST_PHASE1 */
-	writel(ENTRY, isp->base + ipc->csr_out);
+	writel(ENTRY, isp->base + regs->csr_out);
 	/*
 	 * Clear-by-1 all CSR bits EXCEPT following
 	 * bits:
@@ -114,7 +121,7 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 
 	do {
 		usleep_range(400, 500);
-		val = readl(isp->base + ipc->csr_in);
+		val = readl(isp->base + regs->csr_in);
 		switch (val) {
 		case ENTRY | EXIT:
 		case ENTRY | EXIT | QUERY:
@@ -125,8 +132,8 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 2) Set peer CSR bit
 			 * IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE.
 			 */
-			writel(ENTRY | EXIT, isp->base + ipc->csr_in);
-			writel(QUERY, isp->base + ipc->csr_out);
+			writel(ENTRY | EXIT, isp->base + regs->csr_in);
+			writel(QUERY, isp->base + regs->csr_out);
 			break;
 		case ENTRY:
 		case ENTRY | QUERY:
@@ -137,8 +144,8 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 2) Set peer CSR bit
 			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1.
 			 */
-			writel(ENTRY | QUERY, isp->base + ipc->csr_in);
-			writel(ENTRY, isp->base + ipc->csr_out);
+			writel(ENTRY | QUERY, isp->base + regs->csr_in);
+			writel(ENTRY, isp->base + regs->csr_out);
 			break;
 		case EXIT:
 		case EXIT | QUERY:
@@ -155,17 +162,17 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 3) Set peer CSR bit
 			 * IPC_PEER_COMP_ACTIONS_RST_PHASE2.
 			 */
-			writel(EXIT, isp->base + ipc->csr_in);
-			writel(0, isp->base + ipc->db0_in);
-			writel(csr_in_clr, isp->base + ipc->csr_in);
-			writel(EXIT, isp->base + ipc->csr_out);
+			writel(EXIT, isp->base + regs->csr_in);
+			writel(0, isp->base + regs->db0_in);
+			writel(csr_in_clr, isp->base + regs->csr_in);
+			writel(EXIT, isp->base + regs->csr_out);
 
 			/*
 			 * Read csr_in again to make sure if RST_PHASE2 is done.
 			 * If csr_in is QUERY, it should be handled again.
 			 */
 			usleep_range(200, 300);
-			val = readl(isp->base + ipc->csr_in);
+			val = readl(isp->base + regs->csr_in);
 			if (val & QUERY) {
 				dev_dbg(&isp->pdev->dev,
 					"RST_PHASE2 retry csr_in = %x\n", val);
@@ -180,8 +187,8 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			 * 2) Set peer CSR bit
 			 * IPC_PEER_COMP_ACTIONS_RST_PHASE1
 			 */
-			writel(QUERY, isp->base + ipc->csr_in);
-			writel(ENTRY, isp->base + ipc->csr_out);
+			writel(QUERY, isp->base + regs->csr_in);
+			writel(ENTRY, isp->base + regs->csr_out);
 			break;
 		default:
 			dev_dbg_ratelimited(&isp->pdev->dev,
@@ -196,42 +203,42 @@ int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 	return -ETIMEDOUT;
 }
 
-static void ipu6_buttress_ipc_validity_close(struct ipu6_device *isp,
-					     struct ipu6_buttress_ipc *ipc)
+static void ipu6_buttress_ipc_validity_close(struct ipu6_device *isp)
 {
 	writel(BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ,
-	       isp->base + ipc->csr_out);
+	       isp->base + isp->buttress.regs->csr_out);
 }
 
 static int
-ipu6_buttress_ipc_validity_open(struct ipu6_device *isp,
-				struct ipu6_buttress_ipc *ipc)
+ipu6_buttress_ipc_validity_open(struct ipu6_device *isp)
 {
 	unsigned int mask = BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID;
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
 	void __iomem *addr;
 	int ret;
 	u32 val;
 
 	writel(BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ,
-	       isp->base + ipc->csr_out);
+	       isp->base + regs->csr_out);
 
-	addr = isp->base + ipc->csr_in;
+	addr = isp->base + regs->csr_in;
 	ret = readl_poll_timeout(addr, val, val & mask, 200,
 				 BUTTRESS_IPC_VALIDITY_TIMEOUT_US);
 	if (ret) {
 		dev_err(&isp->pdev->dev, "CSE validity timeout 0x%x\n", val);
-		ipu6_buttress_ipc_validity_close(isp, ipc);
+		ipu6_buttress_ipc_validity_close(isp);
 	}
 
 	return ret;
 }
 
-static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
-				   struct ipu6_buttress_ipc *ipc, u32 *ipc_msg)
+static void ipu6_buttress_ipc_recv(struct ipu6_device *isp, u32 *ipc_msg)
 {
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
+
 	if (ipc_msg)
-		*ipc_msg = readl(isp->base + ipc->data0_in);
-	writel(0, isp->base + ipc->db0_in);
+		*ipc_msg = readl(isp->base + regs->data0_in);
+	writel(0, isp->base + regs->db0_in);
 }
 
 static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
@@ -242,13 +249,14 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
 	struct ipu6_buttress *b = &isp->buttress;
 	struct ipu6_buttress_ipc *ipc = &b->ipc;
+	const struct ipu6_buttress_registers *regs = b->regs;
 	u32 val;
 	int ret;
 	int tout;
 
 	mutex_lock(&b->ipc_mutex);
 
-	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
+	ret = ipu6_buttress_ipc_validity_open(isp);
 	if (ret) {
 		dev_err(&isp->pdev->dev, "IPC validity open failed\n");
 		goto out;
@@ -264,9 +272,9 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 
 		dev_dbg(&isp->pdev->dev, "bulk IPC command: 0x%x\n",
 			msgs[i].cmd);
-		writel(msgs[i].cmd, isp->base + ipc->data0_out);
+		writel(msgs[i].cmd, isp->base + regs->data0_out);
 		val = BUTTRESS_IU2CSEDB0_BUSY | msgs[i].cmd_size;
-		writel(val, isp->base + ipc->db0_out);
+		writel(val, isp->base + regs->db0_out);
 
 		tout = wait_for_completion_timeout(&ipc->send_complete,
 						   tx_timeout_jiffies);
@@ -278,7 +286,7 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 			}
 
 			/* Try again if CSE is not responding on first try */
-			writel(0, isp->base + ipc->db0_out);
+			writel(0, isp->base + regs->db0_out);
 			i--;
 			continue;
 		}
@@ -296,8 +304,8 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 			goto out;
 		}
 
-		if (ipc->nack_mask &&
-		    (ipc->recv_data & ipc->nack_mask) == ipc->nack) {
+		if ((ipc->recv_data & BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK) ==
+		     BUTTRESS_CSE2IUDATA0_IPC_NACK) {
 			dev_err(&isp->pdev->dev,
 				"IPC NACK for cmd 0x%x\n", msgs[i].cmd);
 			ret = -EIO;
@@ -316,7 +324,7 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 	dev_dbg(&isp->pdev->dev, "bulk IPC commands done\n");
 
 out:
-	ipu6_buttress_ipc_validity_close(isp, ipc);
+	ipu6_buttress_ipc_validity_close(isp);
 	mutex_unlock(&b->ipc_mutex);
 	return ret;
 }
@@ -400,7 +408,7 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
 
-			ipu6_buttress_ipc_recv(isp, &b->ipc, &b->ipc.recv_data);
+			ipu6_buttress_ipc_recv(isp, &b->ipc.recv_data);
 			complete(&b->ipc.recv_complete);
 		}
 
@@ -862,15 +870,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 
 	b->regs = &ipu6_buttress_regs;
 
-	b->ipc.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
-	b->ipc.nack_mask = BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
-	b->ipc.csr_in = BUTTRESS_REG_CSE2IUCSR;
-	b->ipc.csr_out = BUTTRESS_REG_IU2CSECSR;
-	b->ipc.db0_in = BUTTRESS_REG_CSE2IUDB0;
-	b->ipc.db0_out = BUTTRESS_REG_IU2CSEDB0;
-	b->ipc.data0_in = BUTTRESS_REG_CSE2IUDATA0;
-	b->ipc.data0_out = BUTTRESS_REG_IU2CSEDATA0;
-
 	INIT_LIST_HEAD(&b->constraints);
 
 	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index e60e557af13c..db5388330278 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -31,15 +31,7 @@ struct ipu6_buttress_ctrl {
 struct ipu6_buttress_ipc {
 	struct completion send_complete;
 	struct completion recv_complete;
-	u32 nack;
-	u32 nack_mask;
 	u32 recv_data;
-	u32 csr_out;
-	u32 csr_in;
-	u32 db0_in;
-	u32 db0_out;
-	u32 data0_out;
-	u32 data0_in;
 };
 
 struct ipu6_buttress_registers {
@@ -56,6 +48,12 @@ struct ipu6_buttress_registers {
 	u32 tsc_lo;
 	u32 wdt;
 	u32 btrs_ctrl;
+	u32 csr_in;
+	u32 csr_out;
+	u32 db0_in;
+	u32 db0_out;
+	u32 data0_in;
+	u32 data0_out;
 
 	/* Bitmasks */
 	u32 irq_is;
-- 
2.54.0


