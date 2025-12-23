Return-Path: <linux-media+bounces-49401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A2CD85E9
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02680300D30A
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA442FFFAB;
	Tue, 23 Dec 2025 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Llw2Tion"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D32F6184
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766474597; cv=none; b=qY8HT5ivXsaf8Q2nOlfgGKON5h/i5VcmeJbguERldunTvEQjArc3lwVPa9/g2ZsAL7MHZMYd9KbIATAYZ6wBhOtO1hPQ+LUo9DTmKuJCD07wM+X7NiNCJ76ctI/tXjyLWlqf6r9PBJPMUjpldIAcfxkASkuDdYkmqR3tiqvEGWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766474597; c=relaxed/simple;
	bh=xwuJIeMSifY8LVEI3sqlKWjxYUaZsYLpcblcL0llE0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pqr5OPqvC+lMBzbf2cFNWooxKpM0bKKtKfZw+PBT/wCDHVvvheFW3CIlh9+FEDcN6ei/qqw3TZyH2tT+7q0Akp55t2Ks6naYS4WEskutQiyyGeNNs38jlD1pKxVULBcaA/Id6XFS6b7uKNB/m+krOMJTyJeND17Ppc2LfdYKS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Llw2Tion; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766474596; x=1798010596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xwuJIeMSifY8LVEI3sqlKWjxYUaZsYLpcblcL0llE0A=;
  b=Llw2Tion/XaDpgXWPeHIPtaMjBigB04jz93JTKsPq8n2YKvq3YwwfVAp
   iMV8loA8iSJwV3XnUZra2pJXyV8ualcWWT2t54+AIP7xkRjLymHG4v944
   M8UeE5db+BeLVZz7xuPV0c7A/NYdLeGbFpj0hDVF5ZwtoCeop27sjmY5u
   bAyDgXZ9kVE5VX0CS05nf5LPJD4X5ujLUZsIKfneppLLx/poAKpON1ehk
   2bQQj/lsJycKWoL7WWADc7yQO+JDoZjIOFpHvt8VQwtl4bwhSnREnvol7
   ztPPEMBUEu7cj05PoYzx3WZ9ZN6CNBLGjBWMICkgZO+qo11dZlmeUKBq+
   w==;
X-CSE-ConnectionGUID: FXWBRHyrSCG5WOdO6msANg==
X-CSE-MsgGUID: omv3POIjRLGAd3LtcawGyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79043763"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79043763"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:23:15 -0800
X-CSE-ConnectionGUID: lVNTAnmiR0Ooi1/w1noBEw==
X-CSE-MsgGUID: 9mvJMOMDQiOSa49HZ/Vo+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199747438"
Received: from vtg-chrome.bj.intel.com ([172.16.116.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 23:23:13 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 5/6] media: staging/ipu7: update CDPHY register settings
Date: Tue, 23 Dec 2025 15:23:02 +0800
Message-Id: <20251223072303.4078094-6-bingbu.cao@intel.com>
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

Some CPHY settings needs to updated according to the latest guide from
SNPS. This patch program 45ohm for tuning resistance to fix CPHY problem
and update the ITMINRX and GMODE for CPHY.

Cc: Stable@vger.kernel.org
Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
index 2d5717883518..3f15af3b4c79 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
@@ -124,6 +124,7 @@ static const struct cdr_fbk_cap_prog_params table7[] = {
 	{ 1350, 1589, 4 },
 	{ 1590, 1949, 5 },
 	{ 1950, 2499, 6 },
+	{ 2500, 3500, 7 },
 	{ }
 };
 
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


