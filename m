Return-Path: <linux-media+bounces-49274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4D4CD493C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 03:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF7DD3004F00
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 02:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826BB2AD37;
	Mon, 22 Dec 2025 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSQaFJac"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE32BE7DC
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 02:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766371693; cv=none; b=lPHh24nFfaPuZUpbmw6sbq0wxALKY7EFLv1Wa3FmWO6NuILSf2FH2/8TDxkBm8ooHkKhNVXNel76fFvyUrx+EDLmkXH5AOxeSky6C/ZAJtNanLUgFAHT6tsEKLMBqxFa2BJCoMxPFW2J75RM9VxdXo3VMF1tXoDNb2E9eAZ3mN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766371693; c=relaxed/simple;
	bh=1fPBULAvpFS8rUswOx5LQ0Tk0d80hYqs4NCqUSqz3mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LzkLdVDufcq1k3BveBCFhbkfSV8+iH14p2sgQRA7Je04ZcT57RsyAvYLDNoImyfdOiwkWkn83/3wf/wJbca7Ke1ZFYaCKEb2oFB+zuqeCqJq4UYifllsH4PCvmsgLZN+vJex+owFMlXzNsAIauAQOhdqdPF1cmqUeR2/QfceZQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSQaFJac; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766371692; x=1797907692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1fPBULAvpFS8rUswOx5LQ0Tk0d80hYqs4NCqUSqz3mo=;
  b=BSQaFJacTF+irWi/7CySU7swdjzT+jHkBAPismuniSIFoSD1RI0DvA/A
   3ekM8zgsWn4qPt2SRA6kD65eXU5H+aWOadVozpk/zKr7mJhOMtU+6kMF5
   txYhKJ736yYXpShZyJLPWSszklCdlgVP6NKr9W84bMlxILgR3NMNqRfAA
   t9e/YbGLd/KXmclsOA9JIZvoSRKRU//PKy4/AMJygYTS8gt2bspxuQVqH
   S+G99SVXJnV6f1NakQ/BXH2UlwOj4rDtHvQ3XAdm8gIo/K0mxhDLroQCR
   z1gYjzMMv46/uPboh0TNgGVIs8N9DASCtkClC/pb1zu7Q+T8qDTy+y/Fa
   g==;
X-CSE-ConnectionGUID: b17OW0zvTRafFL6GNPc+ZA==
X-CSE-MsgGUID: +vpr0AKxT72XOIiDuw0Uag==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="93701903"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="93701903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:48:12 -0800
X-CSE-ConnectionGUID: 6GoB6KBOST24+A6o9VkBpA==
X-CSE-MsgGUID: rYGCPE06SHafAyhcq5a2vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203545253"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 18:48:10 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 3/4] media: ipu7: update CDPHY register settings
Date: Mon, 22 Dec 2025 10:48:01 +0800
Message-Id: <20251222024802.1253754-4-bingbu.cao@intel.com>
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

Some CPHY settings needs to updated according to the latest
guide from SNPS. Program 45ohm for tuning resistance to fix
CPHY problem and update the ITMINRX and GMODE for CPHY.

Cc: Stable@vger.kernel.org
Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 2d5717883518..75369dd9d9b7 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -124,6 +124,7 @@ static const struct cdr_fbk_cap_prog_params table7[] = {
 	{ 1350, 1589, 4 },
 	{ 1590, 1949, 5 },
 	{ 1950, 2499, 6 },
+	{ 2500, 3500, 7 },
 	{ }
 };
 
@@ -730,7 +731,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 	u16 deass_thresh;
 	u16 delay_thresh;
 	u16 reset_thresh;
-	u16 cap_prog = 6U;
+	u16 cap_prog;
 	u16 reg;
 	u16 val;
 	u32 i;
@@ -838,9 +839,10 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
 				   reset_thresh, 9, 11);
 
+	/* Tuning ITMINRX to 2 for CPHY */
 	reg = CORE_DIG_CLANE_0_RW_LP_0;
 	for (i = 0; i < trios; i++)
-		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 1, 12, 15);
+		dwc_phy_write_mask(isys, id, reg + 0x400 * i, 2, 12, 15);
 
 	reg = CORE_DIG_CLANE_0_RW_LP_2;
 	for (i = 0; i < trios; i++)
@@ -860,7 +862,11 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 	for (i = 0; i < (lanes + 1); i++) {
 		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9 + 0x400 * i;
 		dwc_phy_write_mask(isys, id, reg, 4U, 0, 2);
-		dwc_phy_write_mask(isys, id, reg, 0U, 3, 4);
+		/* Set GMODE to 2 when CPHY >= 1.5Gsps */
+		if (mbps >= 1500)
+			dwc_phy_write_mask(isys, id, reg, 2U, 3, 4);
+		else
+			dwc_phy_write_mask(isys, id, reg, 0U, 3, 4);
 
 		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_7 + 0x400 * i;
 		dwc_phy_write_mask(isys, id, reg, cap_prog, 10, 12);
@@ -930,8 +936,9 @@ static int ipu7_isys_phy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
 			   7, 12, 14);
 	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_7,
 			   0, 8, 10);
+	/* resistance tuning: 1 for 45ohm, 0 for 50ohm */
 	dwc_phy_write_mask(isys, id, CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_5,
-			   0, 8, 8);
+			   1, 8, 8);
 
 	if (aggregation)
 		phy_mode = isys->csi2[0].phy_mode;
-- 
2.34.1


