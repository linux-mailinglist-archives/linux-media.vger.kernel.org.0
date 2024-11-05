Return-Path: <linux-media+bounces-20861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F459BC702
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45E6FB22069
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6C91FF7B0;
	Tue,  5 Nov 2024 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pc/ViEMp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F1B1FEFDA
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730791676; cv=none; b=NSbI/YuPR/GfhlDcrB/OLlN3Dy2xjo69Ah4oPysjrqNjM/vNvPa0lS8PdJV6FAwoQ4HZrwsgIl6xHm5SHIQPZaxcbJYKR2VeftDQ/G7S5nSKZn7GZytkLZn69C2dCwcAH/rVMG3cwMZxax4C5n4B8uPGGz/hjs3Q+N1dqDET3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730791676; c=relaxed/simple;
	bh=N6knG1T6rDh7wC8Hfs6+WLQMcWg6S/UMajDEa/hRksw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bRZ6CIdZE2DlEcP6x145GZC9XyZHKVWzO9wvvGO963DWEi3k8Bge1JZTf0o79PEtngcH6jdz6BVyJgB0OZmqSgk6i3XSR0D1gfWtTy54zDeAL/5SA7AnMvESg+2DsrRjQJnJOQYNg8CwOKdtwOPlgRwOAmIQdv1yeXYmUsJaNI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pc/ViEMp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730791674; x=1762327674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N6knG1T6rDh7wC8Hfs6+WLQMcWg6S/UMajDEa/hRksw=;
  b=Pc/ViEMp683/tFm3Nd6erwSwKvp0DKPjlxwF91dFcp5fqR3hp7yHBdHh
   9E4BoO7I+6qYsGrm876gDPoBGzwTRSAIN2EGVrrc3CA4Um5T8cjlFcmhB
   61vVIhGlf8bbQULPNQq5PAbVJ/Y7gR6F/dYZ78/ieKHL6KulkoIrKOhlw
   SsDhjICtXZ34FvSwnxGflWfTuZInKFtDL3vvJkIprhefl+EAz2xJ3e4LP
   fdstIs1i5LC2Xi7EzlqD52T/Qao8RHqM6+18C8Gk3rDUby2RyEY1HzQva
   qnL5xH1/EgNV54bKh2USyxuf9xidZorsxP8a17F/F44rDbQuwV/msPRtS
   w==;
X-CSE-ConnectionGUID: e3tvtKM6QAammPtlaE/q5g==
X-CSE-MsgGUID: /+OisvxGQpSQG81DLMOVlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30629691"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30629691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:27:54 -0800
X-CSE-ConnectionGUID: K7gOx2/hR5el+3nWh6Pgiw==
X-CSE-MsgGUID: CUjhO8RLQdiVfkpNiqJ8oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84019944"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.118.67])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:27:53 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v4] media: intel/ipu6: remove buttress ish structure
Date: Tue,  5 Nov 2024 08:27:50 +0100
Message-Id: <20241105072750.57001-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buttress ipc ish structure is not effectively used on IPU6 - data
is nullified on init. Remove the ish structure and handing of related
interrupts to cleanup the code.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
v2: fix formatting: use media: prefix in topic and white space alignment
to match open parenthesis
v3: remove also handing of ISH related interrupts
v4: remove ISR irq BITs from BUTTRESS_EVENT 

drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 29 +++----------------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  6 ----
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  2 --
 3 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index e47f84c30e10..e54e72974ddf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -214,20 +214,17 @@ static void ipu6_buttress_ipc_recv(struct ipu6_device *isp,
 }
 
 static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
-				       enum ipu6_buttress_ipc_domain ipc_domain,
 				       struct ipu6_ipc_buttress_bulk_msg *msgs,
 				       u32 size)
 {
 	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
 	unsigned int i, retry = BUTTRESS_IPC_CMD_SEND_RETRY;
 	struct ipu6_buttress *b = &isp->buttress;
-	struct ipu6_buttress_ipc *ipc;
+	struct ipu6_buttress_ipc *ipc = &b->cse;
 	u32 val;
 	int ret;
 	int tout;
 
-	ipc = ipc_domain == IPU6_BUTTRESS_IPC_CSE ? &b->cse : &b->ish;
-
 	mutex_lock(&b->ipc_mutex);
 
 	ret = ipu6_buttress_ipc_validity_open(isp, ipc);
@@ -305,7 +302,6 @@ static int ipu6_buttress_ipc_send_bulk(struct ipu6_device *isp,
 
 static int
 ipu6_buttress_ipc_send(struct ipu6_device *isp,
-		       enum ipu6_buttress_ipc_domain ipc_domain,
 		       u32 ipc_msg, u32 size, bool require_resp,
 		       u32 expected_resp)
 {
@@ -316,7 +312,7 @@ ipu6_buttress_ipc_send(struct ipu6_device *isp,
 		.expected_resp = expected_resp,
 	};
 
-	return ipu6_buttress_ipc_send_bulk(isp, ipc_domain, &msg, 1);
+	return ipu6_buttress_ipc_send_bulk(isp, &msg, 1);
 }
 
 static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
@@ -381,25 +377,12 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 			complete(&b->cse.recv_complete);
 		}
 
-		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
-			dev_dbg(&isp->pdev->dev,
-				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
-			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
-			complete(&b->ish.recv_complete);
-		}
-
 		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
 			complete(&b->cse.send_complete);
 		}
 
-		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
-			dev_dbg(&isp->pdev->dev,
-				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
-			complete(&b->ish.send_complete);
-		}
-
 		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
 		    ipu6_buttress_get_secure_mode(isp))
 			dev_err(&isp->pdev->dev,
@@ -650,7 +633,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	 */
 	dev_info(&isp->pdev->dev, "Sending BOOT_LOAD to CSE\n");
 
-	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
+	ret = ipu6_buttress_ipc_send(isp,
 				     BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
 				     1, true,
 				     BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
@@ -692,7 +675,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
 	 */
 	dev_info(&isp->pdev->dev, "Sending AUTHENTICATE_RUN to CSE\n");
-	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
+	ret = ipu6_buttress_ipc_send(isp,
 				     BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
 				     1, true,
 				     BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
@@ -833,9 +816,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	mutex_init(&b->auth_mutex);
 	mutex_init(&b->cons_mutex);
 	mutex_init(&b->ipc_mutex);
-	init_completion(&b->ish.send_complete);
 	init_completion(&b->cse.send_complete);
-	init_completion(&b->ish.recv_complete);
 	init_completion(&b->cse.recv_complete);
 
 	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
@@ -847,8 +828,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
 	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
 
-	/* no ISH on IPU6 */
-	memset(&b->ish, 0, sizeof(b->ish));
 	INIT_LIST_HEAD(&b->constraints);
 
 	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 9b6f56958be7..482978c2a09d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -46,18 +46,12 @@ struct ipu6_buttress_ipc {
 struct ipu6_buttress {
 	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
 	struct ipu6_buttress_ipc cse;
-	struct ipu6_buttress_ipc ish;
 	struct list_head constraints;
 	u32 wdt_cached_value;
 	bool force_suspend;
 	u32 ref_clk;
 };
 
-enum ipu6_buttress_ipc_domain {
-	IPU6_BUTTRESS_IPC_CSE,
-	IPU6_BUTTRESS_IPC_ISH,
-};
-
 struct ipu6_ipc_buttress_bulk_msg {
 	u32 cmd;
 	u32 expected_resp;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index 20f27011df43..efd65e494c16 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -219,8 +219,6 @@ enum {
 				 BUTTRESS_ISR_IS_IRQ | BUTTRESS_ISR_PS_IRQ)
 
 #define BUTTRESS_EVENT		 (BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING | \
-				  BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING | \
 				  BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE |    \
-				  BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH |    \
 				  BUTTRESS_ISR_SAI_VIOLATION)
 #endif /* IPU6_PLATFORM_BUTTRESS_REGS_H */
-- 
2.34.1


