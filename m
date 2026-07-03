Return-Path: <linux-media+bounces-66500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J0mpATvVR2rnfwAAu9opvQ
	(envelope-from <linux-media+bounces-66500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:28:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A902A703DFF
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TqKarbFK;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66500-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66500-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9289430923B9
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D251417355;
	Fri,  3 Jul 2026 15:26:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B243CCFC4
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092391; cv=none; b=cVgPhd+luNeJGJtiZoABR9qxdUabac07JxAJwbN5+MlklBPpnTSaRIwel2jF2sV33c3Me/G4FleSHrjkGTaQu2UY/Uma/HA6SZFhC/wq3NHGqbo6SuBYIHEFlUyLGGeg3w63bzRyUQhTuqG246omq25f1ex9pThGqmds+rjKDqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092391; c=relaxed/simple;
	bh=s4OIoHhee5e41l2C2q2rHW9974k2MB8eVrV5VtOqfQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHhhewLfIATAkiIA4MkkmaJgzPbgBt3suc9P27gsK+aqFy9Rzp+S/lGVGs71tWgbbowk3M7hl92HYqC4cXQmRvuad+E/X6DWMNYJgruwWmtyO3WM9rsmaoDx3m08MXU34iCCFpNuTNgggzj+UXSbWQwdNvMuuAo2wEjOgLNY59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqKarbFK; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092390; x=1814628390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s4OIoHhee5e41l2C2q2rHW9974k2MB8eVrV5VtOqfQM=;
  b=TqKarbFK938TjQNHx1xvwTlKH65KAF7mMQVjpSKFO8vu3BDKmVJ2B4Sv
   JDvyd0v1TjnUn1se2ohJ739ug6KEvRWrYFy/ZnxzEljIkvamnFBh3eiRW
   bGhCCIJ31GjbZhgs7DFPX17xFmwC8yjla3cCZ7GnwljUmjuJtn9ige9pN
   H1SYvrb+W6D993tiFVg93kvv95eEpq2VurGIZvVucPwoNC1guRXxxBKUW
   P9jNmBZQVZJltxz4qFNZLPqIVX6Oagsq1htQKm2eWk+S+TZtrRIqtXV3N
   0bX/7AojaQ4qHyWwCkmz2Y1+nbVI3mBLWv8xneH6K4bvDpVD6IqDrhWaI
   A==;
X-CSE-ConnectionGUID: /URDJCIpQ9qkrbfhNiTZQA==
X-CSE-MsgGUID: lW36a34VRYCPrBZjy7Y+NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396259"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:30 -0700
X-CSE-ConnectionGUID: LC9NxNYWToCwOrw8GwivPg==
X-CSE-MsgGUID: gUHej9OyRxCqWYEikeus/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799832"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:28 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 34/41] media: ipu6: Add support for fixed iova region
Date: Fri,  3 Jul 2026 18:24:44 +0300
Message-ID: <20260703152451.1743132-35-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66500-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A902A703DFF

The ipu7 need specific region for firmware in non-secure mode,
add support for it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 26 +++++++++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-dma.h |  2 ++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 6e8295d9c3a3..99a031e5a16e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -371,6 +371,25 @@ void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sg, "INTEL_IPU6");
 
+static struct iova *ipu7_get_fw_code_region(struct ipu6_bus_device *sys)
+{
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu6_mmu *mmu = sys->mmu;
+	struct iova *iova;
+	unsigned long lo, hi;
+
+	lo = iova_pfn(&mmu->dmap->iovad, IPU7_FW_CODE_REGION_START);
+	hi = iova_pfn(&mmu->dmap->iovad, IPU7_FW_CODE_REGION_END) - 1U;
+
+	iova = reserve_iova(&mmu->dmap->iovad, lo, hi);
+	if (!iova) {
+		dev_err(dev, "Reserve iova[%lx:%lx] failed\n", lo, hi);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return iova;
+}
+
 int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 		    int nents, enum dma_data_direction dir,
 		    unsigned long attrs)
@@ -397,8 +416,11 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 	dev_dbg(dev, "dmamap trying to map %d ents %zu pages\n",
 		nents, npages);
 
-	iova = alloc_iova(&mmu->dmap->iovad, npages,
-			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
+	if (attrs & DMA_ATTR_RESERVE_REGION)
+		iova = ipu7_get_fw_code_region(sys);
+	else
+		iova = alloc_iova(&mmu->dmap->iovad, npages,
+				  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
 	if (!iova)
 		return 0;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index ae9b9a5df57f..e5e0e7860423 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -10,6 +10,8 @@
 
 #include "ipu6-bus.h"
 
+#define DMA_ATTR_RESERVE_REGION		BIT(31)
+
 struct ipu6_mmu_info;
 
 struct ipu6_dma_mapping {
-- 
2.54.0


