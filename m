Return-Path: <linux-media+bounces-20638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F19B78A9
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 11:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2035C1F24E6B
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228BC199246;
	Thu, 31 Oct 2024 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFJEtqHk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852281991B8
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730370538; cv=none; b=ZGKa5/AH13ARlMqeUmNbaVBxbgm7kDb61sbOux5jayYalQZQD1iKSB55TOllu0dc8J9cYe/Q4q4xBxakIZQr+AasxV6YxjHcxEPng4walVl2eqN5qwMF2nRSctKXstqie5rsu9ukSHhKiDPqLq46/bHGYM8fmiokpC4vtdGdyMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730370538; c=relaxed/simple;
	bh=A8+nj4UwAZAwwAeMyCapbbPR1xUYcqNfBMrpXHxFBHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XPLnTPY2u20km8x1XYosLjnApU03NELHZ31VEi89/YwfJixa2pJhrrSU4FCOctaMDEysSLti0RFsryQMFZ+a4xoiTsDAomH10gEjJZAgCWAJBJFFONSuLii70dfkY4IJCdyMd0UJ9w66j0PntX0wHCogOnuajBuIh3J/2UpZzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFJEtqHk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730370536; x=1761906536;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A8+nj4UwAZAwwAeMyCapbbPR1xUYcqNfBMrpXHxFBHs=;
  b=oFJEtqHkbUmBG6XwfQADrIWl1M7IGbcQQuXY6fpB+p8LDqstXMKg4u22
   ao7eEfBtNLdjmGJy17HerVqFLHv5+CEYFn7EeyOX8EFgrOFM6vsizHMJP
   jShpTxsfIGlt8peQs2UpWIcoOucnIsEXHmiNCzHaskvIA0L/7LJPN/zhy
   6+NCPwMiPBGmAuhNmSUCKzhqtzkXD6qAeVxOAL4HzQrd/mdXz2pE8AzzO
   eSFBsBeuEmCD2oeF9KOwotJajImujeKZjLdjagNTiFgDJ8Ufpy9QybkUd
   5i4qrrh7HWy+VMRse2K3/O9EhmdrJGmuK82xIlodDwiSr8ES15BFrUZ9E
   w==;
X-CSE-ConnectionGUID: D14vMRDBQQuoIswxuVtaHw==
X-CSE-MsgGUID: uXuYrdNETzC+jh56hTjQyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29958274"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29958274"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:28:48 -0700
X-CSE-ConnectionGUID: DYdKgPyaTsuNG+ec6FOfJw==
X-CSE-MsgGUID: o4nza+JcRW648VqD+4KfQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82510640"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.36])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:28:42 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH] media intel/ipu6: remove buttress ish structure
Date: Thu, 31 Oct 2024 11:28:39 +0100
Message-Id: <20241031102839.410806-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buttress ipc ish structure is not effectively used on IPU6 - data
is nullified on init. Remove it to cleanup the code a bit.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 23 +++++---------------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h |  6 -----
 2 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index edaa285283a1..20dfedd6b2c8 100644
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
@@ -386,10 +382,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 		}
 
 		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
-			dev_dbg(&isp->pdev->dev,
+			dev_warn(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
-			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
-			complete(&b->ish.recv_complete);
 		}
 
 		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
@@ -399,9 +393,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 		}
 
 		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
-			dev_dbg(&isp->pdev->dev,
+			dev_warn(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
-			complete(&b->ish.send_complete);
 		}
 
 		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
@@ -655,7 +648,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	 */
 	dev_info(&isp->pdev->dev, "Sending BOOT_LOAD to CSE\n");
 
-	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
+	ret = ipu6_buttress_ipc_send(isp,
 				     BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
 				     1, true,
 				     BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
@@ -697,7 +690,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
 	 */
 	dev_info(&isp->pdev->dev, "Sending AUTHENTICATE_RUN to CSE\n");
-	ret = ipu6_buttress_ipc_send(isp, IPU6_BUTTRESS_IPC_CSE,
+	ret = ipu6_buttress_ipc_send(isp,
 				     BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
 				     1, true,
 				     BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
@@ -838,9 +831,7 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 	mutex_init(&b->auth_mutex);
 	mutex_init(&b->cons_mutex);
 	mutex_init(&b->ipc_mutex);
-	init_completion(&b->ish.send_complete);
 	init_completion(&b->cse.send_complete);
-	init_completion(&b->ish.recv_complete);
 	init_completion(&b->cse.recv_complete);
 
 	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
@@ -852,8 +843,6 @@ int ipu6_buttress_init(struct ipu6_device *isp)
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
-- 
2.46.1


