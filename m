Return-Path: <linux-media+bounces-66480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dhj7DojUR2qZfwAAu9opvQ
	(envelope-from <linux-media+bounces-66480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9E6703D38
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kkZFuzhx;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66480-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66480-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5D0130166E7
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD31414DFF;
	Fri,  3 Jul 2026 15:25:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932DA417340
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092346; cv=none; b=G+dGs8P9gWVXbK6To4KfgLUxe0Lni7p537lPqegqfieA+x7X8XwGVLBUMML2Qv+ByvRXDs4f6Qaw+cj2at7RoIzOYO1ycAhSe1mcH5aw65JJ2r97jrErgPeP6V4zOPRa4Zxs+nedR/hqe7huEjioclYzcWey34n9fJjMmxcPX+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092346; c=relaxed/simple;
	bh=qf76lQnR36WZqH0sLiY9t41SRmot8CGn/P2Co9Fu6+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ym8HoGoPHrom/xkd8e9/M2bgb0V/rphNJ4a+Am8B28narZ4fT5GBAGfX5bz97z0ad7rysMZYHCtYJhpsopR+tLZllngWMzNnY+3aRfiyZcdOVcM3yTnwS8Cuf8ICEYsWb5OUTLGz9x7bysnTGES52TwoDe5uWXMyaPxJYl/QTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkZFuzhx; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092343; x=1814628343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qf76lQnR36WZqH0sLiY9t41SRmot8CGn/P2Co9Fu6+s=;
  b=kkZFuzhxldr9MeK2IG+YNZuHv0zJWH0ZaHGuL9zMYCEu4zBKhttONDfd
   P5/5BCYp4Zv44RfeB9KQwX4QBkT6gL0zcY68YEB/n4boZJB2TPOCRTSEb
   Bn0Wzr4Wu9v5gCAnR4mFteNjzRqMooJirCZEt01oox8u2JUt6tOSr91Hk
   cDJbL7G4XA6nlNCX6SmbbRjiJQ7H4Df5UmYAIGiGYW3IOE/q20B++prXE
   FKecb0+dDM2E70OnR2dlK7NymuTCGlZhhUEh5YCq93sSJXvPgkL+sNau8
   RVhuIfJUWzdZZdpGsbEw4kkU4NkbBzUMouoqte07HKa0q/eToR8qyEpH5
   w==;
X-CSE-ConnectionGUID: HLhlZmB6QOKE24GQkMPEbQ==
X-CSE-MsgGUID: 2HDUW/6IShCt/Agw2OFQ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396161"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:43 -0700
X-CSE-ConnectionGUID: 8B2hjDy1TEmm/OVF09U7SQ==
X-CSE-MsgGUID: fToXVhr/Tuus2PGYcj0jQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799539"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:41 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 14/41] media: ipu6: Prepare mmu code for hw variation
Date: Fri,  3 Jul 2026 18:24:24 +0300
Message-ID: <20260703152451.1743132-15-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66480-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 9C9E6703D38

We are about to add support for ipu7 mmu. Split ipu6 mmu
hardware specific and common code to separate files.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Makefile      |   1 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c    |   4 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c | 292 +++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c    | 118 +--------
 drivers/media/pci/intel/ipu6/ipu6-mmu.h    | 149 ++++++++++-
 drivers/media/pci/intel/ipu6/ipu6.c        | 123 +--------
 drivers/media/pci/intel/ipu6/ipu6.h        | 130 ---------
 7 files changed, 451 insertions(+), 366 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
index a821b0a1567f..2106ab84acde 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -4,6 +4,7 @@ intel-ipu6-y			:= ipu6.o \
 				ipu6-bus.o \
 				ipu6-dma.o \
 				ipu6-mmu.o \
+				ipu6-mmu-hw.o \
 				ipu6-buttress.o \
 				ipu6-cpd.o \
 				ipu6-fw-com.o
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index fdcdb15b073c..6e8295d9c3a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -286,7 +286,7 @@ void ipu6_dma_free(struct ipu6_bus_device *sys, size_t size, void *vaddr,
 
 	__free_buffer(pages, size, attrs);
 
-	mmu->tlb_invalidate(mmu);
+	mmu->ops->tlb_invalidate(mmu);
 
 	__free_iova(&mmu->dmap->iovad, iova);
 
@@ -366,7 +366,7 @@ void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 	ipu6_mmu_unmap(mmu->dmap->mmu_info, PFN_PHYS(iova->pfn_lo),
 		       PFN_PHYS(iova_size(iova)));
 
-	mmu->tlb_invalidate(mmu);
+	mmu->ops->tlb_invalidate(mmu);
 	__free_iova(&mmu->dmap->iovad, iova);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sg, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c b/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
new file mode 100644
index 000000000000..aec310ff0cac
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ */
+#include <asm/barrier.h>
+
+#include <linux/bits.h>
+#include <linux/gfp.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include "ipu6.h"
+#include "ipu6-dma.h"
+#include "ipu6-mmu.h"
+#include "ipu6-platform-regs.h"
+
+#define ISP_PAGE_SHIFT		12
+#define ISP_PAGE_SIZE		BIT(ISP_PAGE_SHIFT)
+#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1))
+
+#define ISP_L1PT_SHIFT		22
+#define ISP_L1PT_MASK		(~((1U << ISP_L1PT_SHIFT) - 1))
+
+#define ISP_L2PT_SHIFT		12
+#define ISP_L2PT_MASK		(~(ISP_L1PT_MASK | (~(ISP_PAGE_MASK))))
+
+#define ISP_L1PT_PTES           1024
+#define ISP_L2PT_PTES           1024
+
+#define ISP_PADDR_SHIFT		12
+
+#define REG_TLB_INVALIDATE	0x0000
+
+#define REG_L1_PHYS		0x0004	/* 27-bit pfn */
+#define REG_INFO		0x0008
+
+#define TBL_PHYS_ADDR(a)	((phys_addr_t)(a) << ISP_PADDR_SHIFT)
+
+static struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] = {
+	{
+		.offset = IPU6_ISYS_IOMMU0_OFFSET,
+		.info_bits = IPU6_INFO_REQUEST_DESTINATION_IOSF,
+		.nr_l1streams = 16,
+		.l1_block_sz = {
+			3, 8, 2, 2, 2, 2, 2, 2, 1, 1,
+			1, 1, 1, 1, 1, 1
+		},
+		.nr_l2streams = 16,
+		.l2_block_sz = {
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2
+		},
+		.insert_read_before_invalidate = false,
+		.l1_stream_id_reg_offset =
+		IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+		.l2_stream_id_reg_offset =
+		IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+	},
+	{
+		.offset = IPU6_ISYS_IOMMU1_OFFSET,
+		.info_bits = 0,
+		.nr_l1streams = 16,
+		.l1_block_sz = {
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 1, 1, 4
+		},
+		.nr_l2streams = 16,
+		.l2_block_sz = {
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2
+		},
+		.insert_read_before_invalidate = false,
+		.l1_stream_id_reg_offset =
+		IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+		.l2_stream_id_reg_offset =
+		IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+	},
+	{
+		.offset = IPU6_ISYS_IOMMUI_OFFSET,
+		.info_bits = 0,
+		.nr_l1streams = 0,
+		.nr_l2streams = 0,
+		.insert_read_before_invalidate = false,
+	},
+};
+
+static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] = {
+	{
+		.offset = IPU6_PSYS_IOMMU0_OFFSET,
+		.info_bits =
+		IPU6_INFO_REQUEST_DESTINATION_IOSF,
+		.nr_l1streams = 16,
+		.l1_block_sz = {
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2
+		},
+		.nr_l2streams = 16,
+		.l2_block_sz = {
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2
+		},
+		.insert_read_before_invalidate = false,
+		.l1_stream_id_reg_offset =
+		IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+		.l2_stream_id_reg_offset =
+		IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+	},
+	{
+		.offset = IPU6_PSYS_IOMMU1_OFFSET,
+		.info_bits = 0,
+		.nr_l1streams = 32,
+		.l1_block_sz = {
+			1, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 10,
+			5, 4, 14, 6, 4, 14, 6, 4, 8,
+			4, 2, 1, 1, 1, 1, 14
+		},
+		.nr_l2streams = 32,
+		.l2_block_sz = {
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2
+		},
+		.insert_read_before_invalidate = false,
+		.l1_stream_id_reg_offset =
+		IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+		.l2_stream_id_reg_offset =
+		IPU6_PSYS_MMU1W_L2_STREAM_ID_REG_OFFSET,
+	},
+	{
+		.offset = IPU6_PSYS_IOMMU1R_OFFSET,
+		.info_bits = 0,
+		.nr_l1streams = 16,
+		.l1_block_sz = {
+			1, 4, 4, 4, 4, 16, 8, 4, 32,
+			16, 16, 2, 2, 2, 1, 12
+		},
+		.nr_l2streams = 16,
+		.l2_block_sz = {
+			2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
+			2, 2, 2, 2, 2, 2
+		},
+		.insert_read_before_invalidate = false,
+		.l1_stream_id_reg_offset =
+		IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
+		.l2_stream_id_reg_offset =
+		IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
+	},
+	{
+		.offset = IPU6_PSYS_IOMMUI_OFFSET,
+		.info_bits = 0,
+		.nr_l1streams = 0,
+		.nr_l2streams = 0,
+		.insert_read_before_invalidate = false,
+	},
+};
+
+static const struct {
+	struct ipu6_mmu_hw *hwdata;
+	unsigned int nr_mmus;
+} ipu6_mmu_hwdata_lookup[] = {
+	[IPU_PSYS] = {
+		.hwdata = ipu6_psys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu6_psys_mmu_hwdata),
+	},
+	[IPU_ISYS] = {
+		.hwdata = ipu6_isys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu6_isys_mmu_hwdata),
+	},
+};
+
+static void __ipu6_tlb_invalidate(struct ipu6_mmu *mmu)
+{
+	struct ipu6_mmu_hw *mmu_hw = mmu->ipu6_mmu_hw;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&mmu->ready_lock, flags);
+	if (!mmu->ready) {
+		spin_unlock_irqrestore(&mmu->ready_lock, flags);
+		return;
+	}
+
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		/*
+		 * To avoid the HW bug induced dead lock in some of the IPU6
+		 * MMUs on successive invalidate calls, we need to first do a
+		 * read to the page table base before writing the invalidate
+		 * register. MMUs which need to implement this WA, will have
+		 * the insert_read_before_invalidate flags set as true.
+		 * Disregard the return value of the read.
+		 */
+		if (mmu_hw[i].insert_read_before_invalidate)
+			readl(mmu_hw[i].base + REG_L1_PHYS);
+
+		writel(0xffffffff, mmu_hw[i].base + REG_TLB_INVALIDATE);
+		/*
+		 * The TLB invalidation is a "single cycle" (IOMMU clock cycles)
+		 * When the actual MMIO write reaches the IPU6 TLB Invalidate
+		 * register, wmb() will force the TLB invalidate out if the CPU
+		 * attempts to update the IOMMU page table (or sooner).
+		 */
+		wmb();
+	}
+	spin_unlock_irqrestore(&mmu->ready_lock, flags);
+}
+
+static int __ipu6_mmu_hw_init(struct ipu6_mmu *mmu)
+{
+	struct ipu6_mmu_info *mmu_info = mmu->dmap->mmu_info;
+	struct ipu6_mmu_hw *mmu_hw = mmu->ipu6_mmu_hw;
+
+	/* Initialise the each MMU HW block */
+	for (unsigned int i = 0; i < mmu->nr_mmus; i++) {
+		unsigned int j;
+		u16 block_addr;
+
+		/* Write page table address per MMU */
+		writel((phys_addr_t)mmu_info->l1_pt_dma,
+		       mmu_hw[i].base + REG_L1_PHYS);
+
+		/* Set info bits per MMU */
+		writel(mmu_hw[i].info_bits, mmu_hw[i].base + REG_INFO);
+
+		/* Configure MMU TLB stream configuration for L1 */
+		for (j = 0, block_addr = 0; j < mmu_hw->nr_l1streams;
+		     block_addr += mmu_hw[i].l1_block_sz[j], j++) {
+			if (block_addr > IPU6_MAX_LI_BLOCK_ADDR) {
+				dev_err(mmu->dev, "invalid L1 configuration\n");
+				return -EINVAL;
+			}
+
+			/* Write block start address for each streams */
+			writel(block_addr, mmu_hw->base +
+			       mmu_hw->l1_stream_id_reg_offset + 4 * j);
+		}
+
+		/* Configure MMU TLB stream configuration for L2 */
+		for (j = 0, block_addr = 0; j < mmu_hw->nr_l2streams;
+		     block_addr += mmu_hw[i].l2_block_sz[j], j++) {
+			if (block_addr > IPU6_MAX_L2_BLOCK_ADDR) {
+				dev_err(mmu->dev, "invalid L2 configuration\n");
+				return -EINVAL;
+			}
+
+			writel(block_addr, mmu_hw->base +
+			       mmu_hw->l2_stream_id_reg_offset + 4 * j);
+		}
+	}
+
+	return 0;
+}
+
+static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
+				  void __iomem *base)
+{
+	struct ipu6_mmu_hw *mmu_hw, *src;
+	unsigned int i, nr_mmus;
+
+	if (mmu->mmid < 0 || mmu->mmid >= ARRAY_SIZE(ipu6_mmu_hwdata_lookup))
+		return -EINVAL;
+
+	src = ipu6_mmu_hwdata_lookup[mmu->mmid].hwdata;
+	nr_mmus = ipu6_mmu_hwdata_lookup[mmu->mmid].nr_mmus;
+
+	mmu_hw = devm_kcalloc(dev, nr_mmus, sizeof(*mmu_hw), GFP_KERNEL);
+	if (!mmu_hw)
+		return -ENOMEM;
+
+	for (i = 0; i < nr_mmus; i++) {
+		if (src[i].nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
+		    src[i].nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
+			return -EINVAL;
+
+		mmu_hw[i] = src[i];
+		mmu_hw[i].base = base + src[i].offset;
+	}
+
+	mmu->nr_mmus = nr_mmus;
+	mmu->ipu6_mmu_hw = mmu_hw;
+
+	return 0;
+}
+
+const struct ipu6_mmu_hw_ops ipu6_mmu_ops = {
+	.init_hw_data = __ipu6_mmu_init_hw_data,
+	.hw_init = __ipu6_mmu_hw_init,
+	.tlb_invalidate = __ipu6_tlb_invalidate,
+};
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 35307ebc2f43..665ca26004b4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -5,7 +5,6 @@
 #include <asm/barrier.h>
 
 #include <linux/align.h>
-#include <linux/atomic.h>
 #include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
@@ -13,10 +12,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/gfp.h>
-#include <linux/io.h>
 #include <linux/iova.h>
 #include <linux/math.h>
-#include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/pfn.h>
 #include <linux/slab.h>
@@ -51,42 +48,6 @@
 
 #define TBL_PHYS_ADDR(a)	((phys_addr_t)(a) << ISP_PADDR_SHIFT)
 
-static void tlb_invalidate(struct ipu6_mmu *mmu)
-{
-	unsigned long flags;
-	unsigned int i;
-
-	spin_lock_irqsave(&mmu->ready_lock, flags);
-	if (!mmu->ready) {
-		spin_unlock_irqrestore(&mmu->ready_lock, flags);
-		return;
-	}
-
-	for (i = 0; i < mmu->nr_mmus; i++) {
-		/*
-		 * To avoid the HW bug induced dead lock in some of the IPU6
-		 * MMUs on successive invalidate calls, we need to first do a
-		 * read to the page table base before writing the invalidate
-		 * register. MMUs which need to implement this WA, will have
-		 * the insert_read_before_invalidate flags set as true.
-		 * Disregard the return value of the read.
-		 */
-		if (mmu->mmu_hw[i].insert_read_before_invalidate)
-			readl(mmu->mmu_hw[i].base + REG_L1_PHYS);
-
-		writel(0xffffffff, mmu->mmu_hw[i].base +
-		       REG_TLB_INVALIDATE);
-		/*
-		 * The TLB invalidation is a "single cycle" (IOMMU clock cycles)
-		 * When the actual MMIO write reaches the IPU6 TLB Invalidate
-		 * register, wmb() will force the TLB invalidate out if the CPU
-		 * attempts to update the IOMMU page table (or sooner).
-		 */
-		wmb();
-	}
-	spin_unlock_irqrestore(&mmu->ready_lock, flags);
-}
-
 #ifdef DEBUG
 static void page_table_dump(struct ipu6_mmu_info *mmu_info)
 {
@@ -472,51 +433,12 @@ static int allocate_trash_buffer(struct ipu6_mmu *mmu)
 
 int ipu6_mmu_hw_init(struct ipu6_mmu *mmu)
 {
-	struct ipu6_mmu_info *mmu_info;
 	unsigned long flags;
-	unsigned int i;
-
-	mmu_info = mmu->dmap->mmu_info;
-
-	/* Initialise the each MMU HW block */
-	for (i = 0; i < mmu->nr_mmus; i++) {
-		struct ipu6_mmu_hw *mmu_hw = &mmu->mmu_hw[i];
-		unsigned int j;
-		u16 block_addr;
-
-		/* Write page table address per MMU */
-		writel((phys_addr_t)mmu_info->l1_pt_dma,
-		       mmu->mmu_hw[i].base + REG_L1_PHYS);
-
-		/* Set info bits per MMU */
-		writel(mmu->mmu_hw[i].info_bits,
-		       mmu->mmu_hw[i].base + REG_INFO);
-
-		/* Configure MMU TLB stream configuration for L1 */
-		for (j = 0, block_addr = 0; j < mmu_hw->nr_l1streams;
-		     block_addr += mmu->mmu_hw[i].l1_block_sz[j], j++) {
-			if (block_addr > IPU6_MAX_LI_BLOCK_ADDR) {
-				dev_err(mmu->dev, "invalid L1 configuration\n");
-				return -EINVAL;
-			}
-
-			/* Write block start address for each streams */
-			writel(block_addr, mmu_hw->base +
-			       mmu_hw->l1_stream_id_reg_offset + 4 * j);
-		}
-
-		/* Configure MMU TLB stream configuration for L2 */
-		for (j = 0, block_addr = 0; j < mmu_hw->nr_l2streams;
-		     block_addr += mmu->mmu_hw[i].l2_block_sz[j], j++) {
-			if (block_addr > IPU6_MAX_L2_BLOCK_ADDR) {
-				dev_err(mmu->dev, "invalid L2 configuration\n");
-				return -EINVAL;
-			}
+	int ret;
 
-			writel(block_addr, mmu_hw->base +
-			       mmu_hw->l2_stream_id_reg_offset + 4 * j);
-		}
-	}
+	ret = mmu->ops->hw_init(mmu);
+	if (ret)
+		return ret;
 
 	if (!mmu->trash_page) {
 		int ret;
@@ -746,44 +668,26 @@ static void ipu6_mmu_destroy(struct ipu6_mmu *mmu)
 }
 
 struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
-			       void __iomem *base, int mmid,
-			       const struct ipu6_hw_variants *hw)
+			       void __iomem *base, int mmid)
 {
 	struct ipu6_device *isp = pci_get_drvdata(to_pci_dev(dev));
-	struct ipu6_mmu_hw *mmu_hw;
 	struct ipu6_mmu *mmu;
-	unsigned int i;
-
-	if (hw->nr_mmus > IPU6_MMU_MAX_DEVICES)
-		return ERR_PTR(-EINVAL);
-
-	mmu_hw = devm_kzalloc(dev, sizeof(*mmu_hw) * hw->nr_mmus, GFP_KERNEL);
-	if (!mmu_hw)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < hw->nr_mmus; i++) {
-		const struct ipu6_mmu_hw *src_mmu = &hw->mmu_hw[i];
-
-		if (src_mmu->nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
-		    src_mmu->nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
-			return ERR_PTR(-EINVAL);
-
-		mmu_hw[i] = *src_mmu;
-		mmu_hw[i].base = base + src_mmu->offset;
-	}
+	int ret;
 
 	mmu = devm_kzalloc(dev, sizeof(*mmu), GFP_KERNEL);
 	if (!mmu)
 		return ERR_PTR(-ENOMEM);
 
+	mmu->ops = &ipu6_mmu_ops;
 	mmu->mmid = mmid;
-	mmu->mmu_hw = mmu_hw;
-	mmu->nr_mmus = hw->nr_mmus;
-	mmu->tlb_invalidate = tlb_invalidate;
 	mmu->ready = false;
 	INIT_LIST_HEAD(&mmu->vma_list);
 	spin_lock_init(&mmu->ready_lock);
 
+	ret = mmu->ops->init_hw_data(mmu, dev, base);
+	if (ret)
+		return ERR_PTR(ret);
+
 	mmu->dmap = alloc_dma_mapping(isp);
 	if (!mmu->dmap) {
 		dev_err(dev, "can't alloc dma mapping\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
index 35cac80d2d4e..a741f1c0e284 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (C) 2013--2024 Intel Corporation */
+/* Copyright (C) 2013--2026 Intel Corporation */
 
 #ifndef IPU6_MMU_H
 #define IPU6_MMU_H
@@ -10,7 +10,6 @@
 
 struct device;
 struct page;
-struct ipu6_hw_variants;
 
 struct ipu6_mmu_info {
 	struct device *dev;
@@ -32,10 +31,147 @@ struct ipu6_mmu_info {
 	struct ipu6_dma_mapping *dmap;
 };
 
+/*
+ * MMU Invalidation HW bug workaround by ZLW mechanism
+ *
+ * Old IPU6 MMUV2 has a bug in the invalidation mechanism which might result in
+ * wrong translation or replication of the translation. This will cause data
+ * corruption. So we cannot directly use the MMU V2 invalidation registers
+ * to invalidate the MMU. Instead, whenever an invalidate is called, we need to
+ * clear the TLB by evicting all the valid translations by filling it with trash
+ * buffer (which is guaranteed not to be used by any other processes). ZLW is
+ * used to fill the L1 and L2 caches with the trash buffer translations. ZLW
+ * or Zero length write, is pre-fetch mechanism to pre-fetch the pages in
+ * advance to the L1 and L2 caches without triggering any memory operations.
+ *
+ * In MMU V2, L1 -> 16 streams and 64 blocks, maximum 16 blocks per stream
+ * One L1 block has 16 entries, hence points to 16 * 4K pages
+ * L2 -> 16 streams and 32 blocks. 2 blocks per streams
+ * One L2 block maps to 1024 L1 entries, hence points to 4MB address range
+ * 2 blocks per L2 stream means, 1 stream points to 8MB range
+ *
+ * As we need to clear the caches and 8MB being the biggest cache size, we need
+ * to have trash buffer which points to 8MB address range. As these trash
+ * buffers are not used for any memory transactions, we need only the least
+ * amount of physical memory. So we reserve 8MB IOVA address range but only
+ * one page is reserved from physical memory. Each of this 8MB IOVA address
+ * range is then mapped to the same physical memory page.
+ */
+/* One L2 entry maps 1024 L1 entries and one L1 entry per page */
+#define IPU6_MMUV2_L2_RANGE		(1024 * PAGE_SIZE)
+/* Max L2 blocks per stream */
+#define IPU6_MMUV2_MAX_L2_BLOCKS	2
+/* Max L1 blocks per stream */
+#define IPU6_MMUV2_MAX_L1_BLOCKS	16
+#define IPU6_MMUV2_TRASH_RANGE	(IPU6_MMUV2_L2_RANGE * IPU6_MMUV2_MAX_L2_BLOCKS)
+/* Entries per L1 block */
+#define MMUV2_ENTRIES_PER_L1_BLOCK	16
+#define MMUV2_TRASH_L1_BLOCK_OFFSET	(MMUV2_ENTRIES_PER_L1_BLOCK * PAGE_SIZE)
+#define MMUV2_TRASH_L2_BLOCK_OFFSET	IPU6_MMUV2_L2_RANGE
+
+/*
+ * In some of the IPU6 MMUs, there is provision to configure L1 and L2 page
+ * table caches. Both these L1 and L2 caches are divided into multiple sections
+ * called streams. There is maximum 16 streams for both caches. Each of these
+ * sections are subdivided into multiple blocks. When nr_l1streams = 0 and
+ * nr_l2streams = 0, means the MMU is of type MMU_V1 and do not support
+ * L1/L2 page table caches.
+ *
+ * L1 stream per block sizes are configurable and varies per usecase.
+ * L2 has constant block sizes - 2 blocks per stream.
+ *
+ * MMU1 support pre-fetching of the pages to have less cache lookup misses. To
+ * enable the pre-fetching, MMU1 AT (Address Translator) device registers
+ * need to be configured.
+ *
+ * There are four types of memory accesses which requires ZLW configuration.
+ * ZLW(Zero Length Write) is a mechanism to enable VT-d pre-fetching on IOMMU.
+ *
+ * 1. Sequential Access or 1D mode
+ *	Set ZLW_EN -> 1
+ *	set ZLW_PAGE_CROSS_1D -> 1
+ *	Set ZLW_N to "N" pages so that ZLW will be inserte N pages ahead where
+ *		  N is pre-defined and hardcoded in the platform data
+ *	Set ZLW_2D -> 0
+ *
+ * 2. ZLW 2D mode
+ *	Set ZLW_EN -> 1
+ *	set ZLW_PAGE_CROSS_1D -> 1,
+ *	Set ZLW_N -> 0
+ *	Set ZLW_2D -> 1
+ *
+ * 3. ZLW Enable (no 1D or 2D mode)
+ *	Set ZLW_EN -> 1
+ *	set ZLW_PAGE_CROSS_1D -> 0,
+ *	Set ZLW_N -> 0
+ *	Set ZLW_2D -> 0
+ *
+ * 4. ZLW disable
+ *	Set ZLW_EN -> 0
+ *	set ZLW_PAGE_CROSS_1D -> 0,
+ *	Set ZLW_N -> 0
+ *	Set ZLW_2D -> 0
+ *
+ * To configure the ZLW for the above memory access, four registers are
+ * available. Hence to track these four settings, we have the following entries
+ * in the struct ipu6_mmu_hw. Each of these entries are per stream and
+ * available only for the L1 streams.
+ *
+ * a. l1_zlw_en -> To track zlw enabled per stream (ZLW_EN)
+ * b. l1_zlw_1d_mode -> Track 1D mode per stream. ZLW inserted at page boundary
+ * c. l1_ins_zlw_ahead_pages -> to track how advance the ZLW need to be inserted
+ *			Insert ZLW request N pages ahead address.
+ * d. l1_zlw_2d_mode -> To track 2D mode per stream (ZLW_2D)
+ *
+ *
+ * Currently L1/L2 streams, blocks, AT ZLW configurations etc. are pre-defined
+ * as per the usecase specific calculations. Any change to this pre-defined
+ * table has to happen in sync with IPU6 FW.
+ */
+
+struct ipu6_mmu_hw {
+	union {
+		unsigned long offset;
+		void __iomem *base;
+	};
+	u32 info_bits;
+	u8 nr_l1streams;
+	/*
+	 * L1 has variable blocks per stream - total of 64 blocks and maximum of
+	 * 16 blocks per stream. Configurable by using the block start address
+	 * per stream. Block start address is calculated from the block size
+	 */
+	u8 l1_block_sz[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	/* Is ZLW is enabled in each stream */
+	bool l1_zlw_en[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	bool l1_zlw_1d_mode[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	u8 l1_ins_zlw_ahead_pages[IPU6_MMU_MAX_TLB_L1_STREAMS];
+	bool l1_zlw_2d_mode[IPU6_MMU_MAX_TLB_L1_STREAMS];
+
+	u32 l1_stream_id_reg_offset;
+	u32 l2_stream_id_reg_offset;
+
+	u8 nr_l2streams;
+	/*
+	 * L2 has fixed 2 blocks per stream. Block address is calculated
+	 * from the block size
+	 */
+	u8 l2_block_sz[IPU6_MMU_MAX_TLB_L2_STREAMS];
+	/* flag to track if WA is needed for successive invalidate HW bug */
+	bool insert_read_before_invalidate;
+};
+
+struct ipu6_mmu_hw_ops {
+	int (*init_hw_data)(struct ipu6_mmu *mmu, struct device *dev,
+			    void __iomem *base);
+	int (*hw_init)(struct ipu6_mmu *mmu);
+	void (*tlb_invalidate)(struct ipu6_mmu *mmu);
+};
+
 struct ipu6_mmu {
 	struct list_head node;
 
-	struct ipu6_mmu_hw *mmu_hw;
+	struct ipu6_mmu_hw *ipu6_mmu_hw;
 	unsigned int nr_mmus;
 	unsigned int mmid;
 
@@ -52,12 +188,13 @@ struct ipu6_mmu {
 	bool ready;
 	spinlock_t ready_lock;	/* Serialize access to bool ready */
 
-	void (*tlb_invalidate)(struct ipu6_mmu *mmu);
+	const struct ipu6_mmu_hw_ops *ops;
 };
 
+extern const struct ipu6_mmu_hw_ops ipu6_mmu_ops;
+
 struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
-			       void __iomem *base, int mmid,
-			       const struct ipu6_hw_variants *hw);
+			       void __iomem *base, int mmid);
 void ipu6_mmu_cleanup(struct ipu6_mmu *mmu);
 int ipu6_mmu_hw_init(struct ipu6_mmu *mmu);
 void ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index e72e404e6ed4..31b175e2a4c6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -75,53 +75,6 @@ static struct ipu6_isys_internal_pdata isys_ipdata = {
 	.hw_variant = {
 		.offset = IPU6_UNIFIED_OFFSET,
 		.nr_mmus = 3,
-		.mmu_hw = {
-			{
-				.offset = IPU6_ISYS_IOMMU0_OFFSET,
-				.info_bits = IPU6_INFO_REQUEST_DESTINATION_IOSF,
-				.nr_l1streams = 16,
-				.l1_block_sz = {
-					3, 8, 2, 2, 2, 2, 2, 2, 1, 1,
-					1, 1, 1, 1, 1, 1
-				},
-				.nr_l2streams = 16,
-				.l2_block_sz = {
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2
-				},
-				.insert_read_before_invalidate = false,
-				.l1_stream_id_reg_offset =
-				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
-				.l2_stream_id_reg_offset =
-				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
-			},
-			{
-				.offset = IPU6_ISYS_IOMMU1_OFFSET,
-				.info_bits = 0,
-				.nr_l1streams = 16,
-				.l1_block_sz = {
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 1, 1, 4
-				},
-				.nr_l2streams = 16,
-				.l2_block_sz = {
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2
-				},
-				.insert_read_before_invalidate = false,
-				.l1_stream_id_reg_offset =
-				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
-				.l2_stream_id_reg_offset =
-				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
-			},
-			{
-				.offset = IPU6_ISYS_IOMMUI_OFFSET,
-				.info_bits = 0,
-				.nr_l1streams = 0,
-				.nr_l2streams = 0,
-				.insert_read_before_invalidate = false,
-			},
-		},
 		.cdc_fifos = 3,
 		.cdc_fifo_threshold = {6, 8, 2},
 		.dmem_offset = IPU6_ISYS_DMEM_OFFSET,
@@ -134,77 +87,6 @@ static struct ipu6_psys_internal_pdata psys_ipdata = {
 	.hw_variant = {
 		.offset = IPU6_UNIFIED_OFFSET,
 		.nr_mmus = 4,
-		.mmu_hw = {
-			{
-				.offset = IPU6_PSYS_IOMMU0_OFFSET,
-				.info_bits =
-				IPU6_INFO_REQUEST_DESTINATION_IOSF,
-				.nr_l1streams = 16,
-				.l1_block_sz = {
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2
-				},
-				.nr_l2streams = 16,
-				.l2_block_sz = {
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2
-				},
-				.insert_read_before_invalidate = false,
-				.l1_stream_id_reg_offset =
-				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
-				.l2_stream_id_reg_offset =
-				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
-			},
-			{
-				.offset = IPU6_PSYS_IOMMU1_OFFSET,
-				.info_bits = 0,
-				.nr_l1streams = 32,
-				.l1_block_sz = {
-					1, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 10,
-					5, 4, 14, 6, 4, 14, 6, 4, 8,
-					4, 2, 1, 1, 1, 1, 14
-				},
-				.nr_l2streams = 32,
-				.l2_block_sz = {
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2
-				},
-				.insert_read_before_invalidate = false,
-				.l1_stream_id_reg_offset =
-				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
-				.l2_stream_id_reg_offset =
-				IPU6_PSYS_MMU1W_L2_STREAM_ID_REG_OFFSET,
-			},
-			{
-				.offset = IPU6_PSYS_IOMMU1R_OFFSET,
-				.info_bits = 0,
-				.nr_l1streams = 16,
-				.l1_block_sz = {
-					1, 4, 4, 4, 4, 16, 8, 4, 32,
-					16, 16, 2, 2, 2, 1, 12
-				},
-				.nr_l2streams = 16,
-				.l2_block_sz = {
-					2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
-					2, 2, 2, 2, 2, 2
-				},
-				.insert_read_before_invalidate = false,
-				.l1_stream_id_reg_offset =
-				IPU6_MMU_L1_STREAM_ID_REG_OFFSET,
-				.l2_stream_id_reg_offset =
-				IPU6_MMU_L2_STREAM_ID_REG_OFFSET,
-			},
-			{
-				.offset = IPU6_PSYS_IOMMUI_OFFSET,
-				.info_bits = 0,
-				.nr_l1streams = 0,
-				.nr_l2streams = 0,
-				.insert_read_before_invalidate = false,
-			},
-		},
 		.dmem_offset = IPU6_PSYS_DMEM_OFFSET,
 	},
 };
@@ -398,7 +280,7 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 				"ipu6_bus_initialize_device isys failed\n");
 	}
 
-	isys_adev->mmu = ipu6_mmu_init(dev, base, IPU_ISYS, &ipdata->hw_variant);
+	isys_adev->mmu = ipu6_mmu_init(dev, base, IPU_ISYS);
 	if (IS_ERR(isys_adev->mmu)) {
 		put_device(&isys_adev->auxdev.dev);
 		kfree(pdata);
@@ -441,8 +323,7 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 				"ipu6_bus_initialize_device psys failed\n");
 	}
 
-	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, IPU_PSYS,
-				       &ipdata->hw_variant);
+	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, IPU_PSYS);
 	if (IS_ERR(psys_adev->mmu)) {
 		put_device(&psys_adev->auxdev.dev);
 		kfree(pdata);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index b7025b5e06cc..c1693e0022b4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -137,135 +137,6 @@ struct ipu6_device {
 #define IPU6_BTRS_ARB_STALL_MODE_VC1	\
 			IPU6_BTRS_ARB_MODE_TYPE_REARB
 
-/*
- * MMU Invalidation HW bug workaround by ZLW mechanism
- *
- * Old IPU6 MMUV2 has a bug in the invalidation mechanism which might result in
- * wrong translation or replication of the translation. This will cause data
- * corruption. So we cannot directly use the MMU V2 invalidation registers
- * to invalidate the MMU. Instead, whenever an invalidate is called, we need to
- * clear the TLB by evicting all the valid translations by filling it with trash
- * buffer (which is guaranteed not to be used by any other processes). ZLW is
- * used to fill the L1 and L2 caches with the trash buffer translations. ZLW
- * or Zero length write, is pre-fetch mechanism to pre-fetch the pages in
- * advance to the L1 and L2 caches without triggering any memory operations.
- *
- * In MMU V2, L1 -> 16 streams and 64 blocks, maximum 16 blocks per stream
- * One L1 block has 16 entries, hence points to 16 * 4K pages
- * L2 -> 16 streams and 32 blocks. 2 blocks per streams
- * One L2 block maps to 1024 L1 entries, hence points to 4MB address range
- * 2 blocks per L2 stream means, 1 stream points to 8MB range
- *
- * As we need to clear the caches and 8MB being the biggest cache size, we need
- * to have trash buffer which points to 8MB address range. As these trash
- * buffers are not used for any memory transactions, we need only the least
- * amount of physical memory. So we reserve 8MB IOVA address range but only
- * one page is reserved from physical memory. Each of this 8MB IOVA address
- * range is then mapped to the same physical memory page.
- */
-/* One L2 entry maps 1024 L1 entries and one L1 entry per page */
-#define IPU6_MMUV2_L2_RANGE		(1024 * PAGE_SIZE)
-/* Max L2 blocks per stream */
-#define IPU6_MMUV2_MAX_L2_BLOCKS	2
-/* Max L1 blocks per stream */
-#define IPU6_MMUV2_MAX_L1_BLOCKS	16
-#define IPU6_MMUV2_TRASH_RANGE	(IPU6_MMUV2_L2_RANGE * IPU6_MMUV2_MAX_L2_BLOCKS)
-/* Entries per L1 block */
-#define MMUV2_ENTRIES_PER_L1_BLOCK	16
-#define MMUV2_TRASH_L1_BLOCK_OFFSET	(MMUV2_ENTRIES_PER_L1_BLOCK * PAGE_SIZE)
-#define MMUV2_TRASH_L2_BLOCK_OFFSET	IPU6_MMUV2_L2_RANGE
-
-/*
- * In some of the IPU6 MMUs, there is provision to configure L1 and L2 page
- * table caches. Both these L1 and L2 caches are divided into multiple sections
- * called streams. There is maximum 16 streams for both caches. Each of these
- * sections are subdivided into multiple blocks. When nr_l1streams = 0 and
- * nr_l2streams = 0, means the MMU is of type MMU_V1 and do not support
- * L1/L2 page table caches.
- *
- * L1 stream per block sizes are configurable and varies per usecase.
- * L2 has constant block sizes - 2 blocks per stream.
- *
- * MMU1 support pre-fetching of the pages to have less cache lookup misses. To
- * enable the pre-fetching, MMU1 AT (Address Translator) device registers
- * need to be configured.
- *
- * There are four types of memory accesses which requires ZLW configuration.
- * ZLW(Zero Length Write) is a mechanism to enable VT-d pre-fetching on IOMMU.
- *
- * 1. Sequential Access or 1D mode
- *	Set ZLW_EN -> 1
- *	set ZLW_PAGE_CROSS_1D -> 1
- *	Set ZLW_N to "N" pages so that ZLW will be inserte N pages ahead where
- *		  N is pre-defined and hardcoded in the platform data
- *	Set ZLW_2D -> 0
- *
- * 2. ZLW 2D mode
- *	Set ZLW_EN -> 1
- *	set ZLW_PAGE_CROSS_1D -> 1,
- *	Set ZLW_N -> 0
- *	Set ZLW_2D -> 1
- *
- * 3. ZLW Enable (no 1D or 2D mode)
- *	Set ZLW_EN -> 1
- *	set ZLW_PAGE_CROSS_1D -> 0,
- *	Set ZLW_N -> 0
- *	Set ZLW_2D -> 0
- *
- * 4. ZLW disable
- *	Set ZLW_EN -> 0
- *	set ZLW_PAGE_CROSS_1D -> 0,
- *	Set ZLW_N -> 0
- *	Set ZLW_2D -> 0
- *
- * To configure the ZLW for the above memory access, four registers are
- * available. Hence to track these four settings, we have the following entries
- * in the struct ipu6_mmu_hw. Each of these entries are per stream and
- * available only for the L1 streams.
- *
- * a. l1_zlw_en -> To track zlw enabled per stream (ZLW_EN)
- * b. l1_zlw_1d_mode -> Track 1D mode per stream. ZLW inserted at page boundary
- * c. l1_ins_zlw_ahead_pages -> to track how advance the ZLW need to be inserted
- *			Insert ZLW request N pages ahead address.
- * d. l1_zlw_2d_mode -> To track 2D mode per stream (ZLW_2D)
- *
- *
- * Currently L1/L2 streams, blocks, AT ZLW configurations etc. are pre-defined
- * as per the usecase specific calculations. Any change to this pre-defined
- * table has to happen in sync with IPU6 FW.
- */
-struct ipu6_mmu_hw {
-	union {
-		unsigned long offset;
-		void __iomem *base;
-	};
-	u32 info_bits;
-	u8 nr_l1streams;
-	/*
-	 * L1 has variable blocks per stream - total of 64 blocks and maximum of
-	 * 16 blocks per stream. Configurable by using the block start address
-	 * per stream. Block start address is calculated from the block size
-	 */
-	u8 l1_block_sz[IPU6_MMU_MAX_TLB_L1_STREAMS];
-	/* Is ZLW is enabled in each stream */
-	bool l1_zlw_en[IPU6_MMU_MAX_TLB_L1_STREAMS];
-	bool l1_zlw_1d_mode[IPU6_MMU_MAX_TLB_L1_STREAMS];
-	u8 l1_ins_zlw_ahead_pages[IPU6_MMU_MAX_TLB_L1_STREAMS];
-	bool l1_zlw_2d_mode[IPU6_MMU_MAX_TLB_L1_STREAMS];
-
-	u32 l1_stream_id_reg_offset;
-	u32 l2_stream_id_reg_offset;
-
-	u8 nr_l2streams;
-	/*
-	 * L2 has fixed 2 blocks per stream. Block address is calculated
-	 * from the block size
-	 */
-	u8 l2_block_sz[IPU6_MMU_MAX_TLB_L2_STREAMS];
-	/* flag to track if WA is needed for successive invalidate HW bug */
-	bool insert_read_before_invalidate;
-};
-
 struct ipu6_isys_csi2_pdata {
 	void __iomem *base;
 };
@@ -291,7 +162,6 @@ struct ipu6_isys_internal_tpg_pdata {
 struct ipu6_hw_variants {
 	unsigned long offset;
 	u32 nr_mmus;
-	struct ipu6_mmu_hw mmu_hw[IPU6_MMU_MAX_DEVICES];
 	u8 cdc_fifos;
 	u8 cdc_fifo_threshold[IPU6_MAX_VC_IOSF_PORTS];
 	u32 dmem_offset;
-- 
2.54.0


