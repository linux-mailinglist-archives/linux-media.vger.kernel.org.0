Return-Path: <linux-media+bounces-66481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bghAKIvUR2qbfwAAu9opvQ
	(envelope-from <linux-media+bounces-66481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CCF703D45
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=IUjOuuob;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66481-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66481-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49443301BA42
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EDD414DFF;
	Fri,  3 Jul 2026 15:25:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5FB414DF9
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092348; cv=none; b=m5xU8BSDz/HH/BV4i7rRNnnj0VJlhj/JxCQNu3JxloMGRt+Wt9fsqMnjXhfJKcKjcKZEiVbr56qW7ioIt8Y+VGkEFEnLKM9kOdPS5FisPgqH/i87dn/7I4IHQYwQFHftspa2Qyhhr74n97EGJ/sAjna+r7ODzeRbz6ZICsmUD+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092348; c=relaxed/simple;
	bh=F6pzqsHmmH7E4YC5uMSB8nkMQWOWy/wpDC2NBCdnS9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJBJRwvXmrZl8Yrnl7MTn7Qc5ID3PqnBe5AM5MoGiASvtc9JM3CDnD3JhLreiB8awOoAEhiSFIh8da1T+bY+yk2F7Gzz1FGm8BVHNEBY1hvB+sXjlIxykdVzTHT/VKqKBcxSnS+zsF1ack6ce1eXucN+I1Isq8Xtjof4duR+G2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUjOuuob; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092346; x=1814628346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F6pzqsHmmH7E4YC5uMSB8nkMQWOWy/wpDC2NBCdnS9k=;
  b=IUjOuuobiSZEhfa0K3WXHYKHwYl2g6+Hok+GgKR6DCb1ges4POL/EciW
   qdHAs9TOt/v0rDcBQa8KNaPdjpKWVr3LqdLuyBTAchtTGRBu0TKhAZZoJ
   9e6uqLHUcw0H+VF4QZGPKnaXlJ53EhfugrIEIQe3U/eF8RsNJuMX/2B4E
   WrorY79OMatPHvzA6LFwKCV2gXu/+yR3y5a+Ynrsk+/Q7DvRKvH8v7t5o
   6xiqNXelmKvC29NpPC9+FO1P5kL4WeSRUvrd7IcyM45PbhC2v9sut0F4z
   JZIh/CAfzG/NrFduCep+9Xp3Wi4uhw7zwHP5nKG06Ddvkd+GUnftG9q4S
   w==;
X-CSE-ConnectionGUID: gOh4x3dVRZ+mTwby/6cVFw==
X-CSE-MsgGUID: fDZm98cQR5aDLs/acvSSEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396164"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:46 -0700
X-CSE-ConnectionGUID: NcD6YhdFT/O7jfNuKi3Odg==
X-CSE-MsgGUID: efWgkb8sTr6QGGVrUCiz1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799561"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:44 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 15/41] media: ipu6: Add ipu7 mmu support
Date: Fri,  3 Jul 2026 18:24:25 +0300
Message-ID: <20260703152451.1743132-16-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66481-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39CCF703D45

The ipu7 mmu have similar page tables as ipu6, but e.g. register interface
is different. Add own driver handling ipu7 mmu specifics.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Makefile      |   1 +
 drivers/media/pci/intel/ipu6/ipu6-mmu.c    |   3 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h    |   8 +-
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c | 601 +++++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h | 146 +++++
 5 files changed, 757 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h

diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
index 2106ab84acde..c0daf0995b22 100644
--- a/drivers/media/pci/intel/ipu6/Makefile
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -5,6 +5,7 @@ intel-ipu6-y			:= ipu6.o \
 				ipu6-dma.o \
 				ipu6-mmu.o \
 				ipu6-mmu-hw.o \
+				ipu7-mmu-hw.o \
 				ipu6-buttress.o \
 				ipu6-cpd.o \
 				ipu6-fw-com.o
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 665ca26004b4..93293a3ed892 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -678,7 +678,8 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 	if (!mmu)
 		return ERR_PTR(-ENOMEM);
 
-	mmu->ops = &ipu6_mmu_ops;
+	mmu->ops = pci_match_id(ipu7_ids, isp->pdev) ? &ipu7_mmu_ops :
+						       &ipu6_mmu_ops;
 	mmu->mmid = mmid;
 	mmu->ready = false;
 	INIT_LIST_HEAD(&mmu->vma_list);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
index a741f1c0e284..44880478d242 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -8,6 +8,8 @@
 #include <linux/spinlock_types.h>
 #include <linux/types.h>
 
+#include "ipu7-mmu-hw.h"
+
 struct device;
 struct page;
 
@@ -171,7 +173,10 @@ struct ipu6_mmu_hw_ops {
 struct ipu6_mmu {
 	struct list_head node;
 
-	struct ipu6_mmu_hw *ipu6_mmu_hw;
+	union {
+		struct ipu6_mmu_hw *ipu6_mmu_hw;
+		struct ipu7_mmu_hw *ipu7_mmu_hw;
+	};
 	unsigned int nr_mmus;
 	unsigned int mmid;
 
@@ -192,6 +197,7 @@ struct ipu6_mmu {
 };
 
 extern const struct ipu6_mmu_hw_ops ipu6_mmu_ops;
+extern const struct ipu6_mmu_hw_ops ipu7_mmu_ops;
 
 struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 			       void __iomem *base, int mmid);
diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
new file mode 100644
index 000000000000..eadf2483a6b2
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
@@ -0,0 +1,601 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Intel Corporation
+ */
+
+#include <linux/types.h>
+#include <linux/iopoll.h>
+
+#include "ipu6.h"
+#include "ipu6-dma.h"
+#include "ipu6-mmu.h"
+
+static struct ipu7_mmu_hw ipu7_isys_mmu_hwdata[] = {
+	{
+		.offset = IPU7_IS_MMU_FW_RD_OFFSET,
+		.zlx_offset = IPU7_IS_ZLX_UC_RD_OFFSET,
+		.uao_offset = IPU7_IS_UAO_UC_RD_OFFSET,
+		.info_bits = 0x20006701,
+		.refill = 0x00002726,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_IS_MMU_FW_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU7_IS_MMU_FW_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_IS_MMU_FW_RD_STREAM_NUM,
+		.nr_l2streams = IPU7_IS_MMU_FW_RD_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x8, 0xa },
+		.l2_block_sz = { 0x0, 0x2, 0x4 },
+		.zlx_nr = IPU7_IS_ZLX_UC_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = { 0, 0, 0, 0 },
+		.zlx_conf = { 0x0, 0x0, 0x0, 0x0 },
+		.uao_p_num = IPU7_IS_UAO_UC_RD_PLANENUM,
+		.uao_p2tlb = { 0x61, 0x64, 0x65 },
+	},
+	{
+		.offset = IPU7_IS_MMU_FW_WR_OFFSET,
+		.zlx_offset = IPU7_IS_ZLX_UC_WR_OFFSET,
+		.uao_offset = IPU7_IS_UAO_UC_WR_OFFSET,
+		.info_bits = 0x20006801,
+		.refill = 0x00002524,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_IS_MMU_FW_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU7_IS_MMU_FW_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_IS_MMU_FW_WR_STREAM_NUM,
+		.nr_l2streams = IPU7_IS_MMU_FW_WR_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x8, 0xa },
+		.l2_block_sz = { 0x0, 0x2, 0x4	},
+		.zlx_nr = IPU7_IS_ZLX_UC_WR_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 0, 1, 1, 0 },
+		.zlx_conf = { 0x0, 0x00010101, 0x00010101 },
+		.uao_p_num = IPU7_IS_UAO_UC_WR_PLANENUM,
+		.uao_p2tlb = { 0x61, 0x62, 0x63 },
+	},
+	{
+		.offset = IPU7_IS_MMU_M0_OFFSET,
+		.zlx_offset = IPU7_IS_ZLX_M0_OFFSET,
+		.uao_offset = IPU7_IS_UAO_M0_WR_OFFSET,
+		.info_bits = 0x20006601,
+		.refill = 0x00002120,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_IS_MMU_M0_L1_BLOCKNR_REG,
+		.l2_block = IPU7_IS_MMU_M0_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_IS_MMU_M0_STREAM_NUM,
+		.nr_l2streams = IPU7_IS_MMU_M0_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x3, 0x6, 0x8, 0xa, 0xc, 0xe, 0x10 },
+		.l2_block_sz = { 0x0, 0x2, 0x4, 0x6, 0x8, 0xa, 0xc, 0xe },
+		.zlx_nr = IPU7_IS_ZLX_M0_NUM,
+		.zlx_axi_pool = { 0x00000f10 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1 },
+		.zlx_conf = {
+			0x00010103,
+			0x00010103,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+		},
+		.uao_p_num = IPU7_IS_UAO_M0_WR_PLANENUM,
+		.uao_p2tlb = {
+			0x00000049,
+			0x0000004a,
+			0x0000004b,
+			0x0000004c,
+			0x0000004d,
+			0x0000004e,
+			0x0000004f,
+			0x00000050,
+		},
+	},
+	{
+		.offset = IPU7_IS_MMU_M1_OFFSET,
+		.zlx_offset = IPU7_IS_ZLX_M1_OFFSET,
+		.uao_offset = IPU7_IS_UAO_M1_WR_OFFSET,
+		.info_bits = 0x20006901,
+		.refill = 0x00002322,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_IS_MMU_M1_L1_BLOCKNR_REG,
+		.l2_block = IPU7_IS_MMU_M1_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_IS_MMU_M1_STREAM_NUM,
+		.nr_l2streams = IPU7_IS_MMU_M1_STREAM_NUM,
+		.l1_block_sz = {
+			0x0, 0x3, 0x6, 0x9, 0xc,
+			0xe, 0x10, 0x12, 0x14, 0x16,
+			0x18, 0x1a, 0x1c, 0x1e, 0x20, 0x22,
+		},
+		.l2_block_sz = {
+			0x0, 0x2, 0x4, 0x6, 0x8,
+			0xa, 0xc, 0xe, 0x10, 0x12,
+			0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e,
+		},
+		.zlx_nr = IPU7_IS_ZLX_M1_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1,
+			    1, 1, 1, 1, 1, 1, 1, 1,
+		},
+		.zlx_conf = {
+			0x00010103,
+			0x00010103,
+			0x00010103,
+			0x00010103,
+			0x00010103,
+			0x00010103,
+			0x00010103,
+			0x00010103,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+		},
+		.uao_p_num = IPU7_IS_UAO_M1_WR_PLANENUM,
+		.uao_p2tlb = {
+			0x00000051,
+			0x00000052,
+			0x00000053,
+			0x00000054,
+			0x00000055,
+			0x00000056,
+			0x00000057,
+			0x00000058,
+			0x00000059,
+			0x0000005a,
+			0x0000005b,
+			0x0000005c,
+			0x0000005d,
+			0x0000005e,
+			0x0000005f,
+			0x00000060,
+		},
+	},
+};
+
+static struct ipu7_mmu_hw ipu7_psys_mmu_hwdata[] = {
+	{
+		.name = "PS_FW_RD",
+		.offset = IPU7_PS_MMU_FW_RD_OFFSET,
+		.zlx_offset = IPU7_PS_ZLX_FW_RD_OFFSET,
+		.uao_offset = IPU7_PS_UAO_FW_RD_OFFSET,
+		.info_bits = 0x20004801,
+		.refill = 0x00002726,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_PS_MMU_FW_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU7_PS_MMU_FW_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_PS_MMU_FW_RD_STREAM_NUM,
+		.nr_l2streams = IPU7_PS_MMU_FW_RD_STREAM_NUM,
+		.l1_block_sz = {
+			0, 0x8, 0xa, 0xc, 0xd,
+			0xf, 0x11, 0x12, 0x13, 0x14,
+			0x16, 0x18, 0x19, 0x1a, 0x1a,
+			0x1a, 0x1a, 0x1a, 0x1a, 0x1a,
+		},
+		.l2_block_sz = {
+			0x0, 0x2, 0x4, 0x6, 0x8,
+			0xa, 0xc, 0xe, 0x10, 0x12,
+			0x14, 0x16, 0x18, 0x1a, 0x1c,
+			0x1e, 0x20, 0x22, 0x24, 0x26,
+		},
+		.zlx_nr = IPU7_PS_ZLX_FW_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = {
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+		},
+		.zlx_conf = { 0x0 },
+		.uao_p_num = IPU7_PS_UAO_FW_RD_PLANENUM,
+		.uao_p2tlb = {
+			0x00000036,
+			0x0000003d,
+			0x0000003e,
+			0x00000039,
+			0x0000003f,
+			0x00000040,
+			0x00000041,
+			0x0000003a,
+			0x0000003b,
+			0x00000042,
+			0x00000043,
+			0x00000044,
+			0x0000003c,
+		},
+	},
+	{
+		.offset = IPU7_PS_MMU_FW_WR_OFFSET,
+		.zlx_offset = IPU7_PS_ZLX_FW_WR_OFFSET,
+		.uao_offset = IPU7_PS_UAO_FW_WR_OFFSET,
+		.info_bits = 0x20004601,
+		.refill = 0x00002322,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_PS_MMU_FW_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU7_PS_MMU_FW_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_PS_MMU_FW_WR_STREAM_NUM,
+		.nr_l2streams = IPU7_PS_MMU_FW_WR_STREAM_NUM,
+		.l1_block_sz = {
+			0, 0x8, 0xa, 0xc, 0xd,
+			0xe, 0xf, 0x10, 0x10, 0x10,
+		},
+		.l2_block_sz = {
+			0x0, 0x2, 0x4, 0x6, 0x8,
+			0xa, 0xc, 0xe, 0x10, 0x12,
+		},
+		.zlx_nr = IPU7_PS_ZLX_FW_WR_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 0, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
+		.zlx_conf = { 0x0, 0x00010101, 0x00010101 },
+		.uao_p_num = IPU7_PS_UAO_FW_WR_PLANENUM,
+		.uao_p2tlb = { 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c },
+	},
+	{
+		.offset = IPU7_PS_MMU_SRT_RD_OFFSET,
+		.zlx_offset = IPU7_PS_ZLX_DATA_RD_OFFSET,
+		.uao_offset = IPU7_PS_UAO_SRT_RD_OFFSET,
+		.info_bits = 0x20004701,
+		.refill = 0x00002120,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_PS_MMU_SRT_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU7_PS_MMU_SRT_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_PS_MMU_SRT_RD_STREAM_NUM,
+		.nr_l2streams = IPU7_PS_MMU_SRT_RD_STREAM_NUM,
+		.l1_block_sz = {
+			0x0, 0x4, 0x6, 0x8, 0xb,
+			0xd, 0xf, 0x11, 0x13, 0x15,
+			0x17, 0x23, 0x2b, 0x37, 0x3f,
+			0x41, 0x43, 0x44, 0x45, 0x46,
+			0x47, 0x48, 0x49, 0x4a, 0x4b,
+			0x4c, 0x4d, 0x4e, 0x4f, 0x50,
+			0x51, 0x52, 0x53, 0x55, 0x57,
+			0x59, 0x5b, 0x5d, 0x5f, 0x61,
+		},
+		.l2_block_sz = {
+			0x0, 0x2, 0x4, 0x6, 0x8,
+			0xa, 0xc, 0xe, 0x10, 0x12,
+			0x14, 0x16, 0x18, 0x1a, 0x1c,
+			0x1e, 0x20, 0x22, 0x24, 0x26,
+			0x28, 0x2a, 0x2c, 0x2e, 0x30,
+			0x32, 0x34, 0x36, 0x38, 0x3a,
+			0x3c, 0x3e, 0x40, 0x42, 0x44,
+			0x46, 0x48, 0x4a, 0x4c, 0x4e,
+		},
+		.zlx_nr = IPU7_PS_ZLX_DATA_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = {
+			1, 1, 1, 1, 1, 1, 1, 1,
+			1, 1, 1, 1, 1, 1, 1, 1,
+			0, 0, 0, 0, 0, 0, 0, 0,
+			0, 0, 0, 0, 0, 0, 0, 0,
+		},
+		.zlx_conf = {
+			0x00030303,
+			0x00010101,
+			0x00010101,
+			0x00030202,
+			0x00010101,
+			0x00010101,
+			0x00010101,
+			0x00030800,
+			0x00030500,
+			0x00020101,
+			0x00042000,
+			0x00031000,
+			0x00042000,
+			0x00031000,
+			0x00020400,
+			0x00010101,
+		},
+		.uao_p_num = IPU7_PS_UAO_SRT_RD_PLANENUM,
+		.uao_p2tlb = {
+			0x00000022,
+			0x00000023,
+			0x00000024,
+			0x00000025,
+			0x00000026,
+			0x00000027,
+			0x00000028,
+			0x00000029,
+			0x0000002a,
+			0x0000002b,
+			0x0000002c,
+			0x0000002d,
+			0x0000002e,
+			0x0000002f,
+			0x00000030,
+			0x00000031,
+			0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+			0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+			0x0000001e,
+			0x0000001f,
+			0x00000020,
+			0x00000021,
+			0x00000032,
+			0x00000033,
+			0x00000034,
+			0x00000035,
+		},
+	},
+	{
+		.offset = IPU7_PS_MMU_SRT_WR_OFFSET,
+		.zlx_offset = IPU7_PS_ZLX_DATA_WR_OFFSET,
+		.uao_offset = IPU7_PS_UAO_SRT_WR_OFFSET,
+		.info_bits = 0x20004501,
+		.refill = 0x00002120,
+		.collapse_en_bitmap = 0x0,
+		.l1_block = IPU7_PS_MMU_SRT_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU7_PS_MMU_SRT_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7_PS_MMU_SRT_WR_STREAM_NUM,
+		.nr_l2streams = IPU7_PS_MMU_SRT_WR_STREAM_NUM,
+		.l1_block_sz = {
+			0x0, 0x2, 0x6, 0xa, 0xc,
+			0xe, 0x10, 0x12, 0x14, 0x16,
+			0x18, 0x1a, 0x1c, 0x1e, 0x20,
+			0x22, 0x24, 0x26, 0x32, 0x3a,
+			0x3c, 0x3e, 0x4a, 0x52, 0x58,
+			0x64, 0x6c, 0x72, 0x7e, 0x86,
+			0x8c, 0x8d, 0x8e, 0x8f, 0x90,
+			0x91, 0x92, 0x94, 0x96, 0x98,
+		},
+		.l2_block_sz = {
+			0x0, 0x2, 0x4, 0x6, 0x8,
+			0xa, 0xc, 0xe, 0x10, 0x12,
+			0x14, 0x16, 0x18, 0x1a, 0x1c,
+			0x1e, 0x20, 0x22, 0x24, 0x26,
+			0x28, 0x2a, 0x2c, 0x2e, 0x30,
+			0x32, 0x34, 0x36, 0x38, 0x3a,
+			0x3c, 0x3e, 0x40, 0x42, 0x44,
+			0x46, 0x48, 0x4a, 0x4c, 0x4e,
+		},
+		.zlx_nr = IPU7_PS_ZLX_DATA_WR_NUM,
+		.zlx_axi_pool = { 0x00000f50 },
+		.zlx_en = {
+			1, 1, 1, 1, 1, 1, 1, 1,
+			0, 0, 1, 1, 1, 1, 1, 1,
+			1, 1, 1, 1, 1, 1, 1, 1,
+			1, 1, 1, 1, 1, 1, 0, 0,
+		},
+		.zlx_conf = {
+			0x00010102,
+			0x00030103,
+			0x00030103,
+			0x00010101,
+			0x00010101,
+			0x00030101,
+			0x00010101,
+			0x38010101,
+			0x0,
+			0x0,
+			0x38010101,
+			0x38010101,
+			0x38010101,
+			0x38010101,
+			0x38010101,
+			0x38010101,
+			0x00010101,
+			0x00042000,
+			0x00031000,
+			0x00010101,
+			0x00010101,
+			0x00042000,
+			0x00031000,
+			0x00031000,
+			0x00042000,
+			0x00031000,
+			0x00031000,
+			0x00042000,
+			0x00031000,
+			0x00031000,
+			0x0,
+			0x0,
+		},
+		.uao_p_num = IPU7_PS_UAO_SRT_WR_PLANENUM,
+		.uao_p2tlb = {
+			0x00000000,
+			0x00000001,
+			0x00000002,
+			0x00000003,
+			0x00000004,
+			0x00000005,
+			0x00000006,
+			0x00000007,
+			0x00000008,
+			0x00000009,
+			0x0000000a,
+			0x0000000b,
+			0x0000000c,
+			0x0000000d,
+			0x0000000e,
+			0x0000000f,
+			0x00000010,
+			0x00000011,
+			0x00000012,
+			0x00000013,
+			0x00000014,
+			0x00000015,
+			0x00000016,
+			0x00000017,
+			0x00000018,
+			0x00000019,
+			0x0000001a,
+			0x0000001b,
+			0x0000001c,
+			0x0000001d,
+			0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+			0x0000001e,
+			0x0000001f,
+			0x00000020,
+			0x00000021,
+		},
+	},
+};
+
+static const struct {
+	struct ipu7_mmu_hw *hwdata;
+	unsigned int nr_mmus;
+} ipu7_mmu_hwdata_lookup[] = {
+	[IPU_PSYS] = {
+		.hwdata = ipu7_psys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu7_psys_mmu_hwdata),
+	},
+	[IPU_ISYS] = {
+		.hwdata = ipu7_isys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu7_isys_mmu_hwdata),
+	},
+};
+
+static void __ipu7_tlb_invalidate(struct ipu6_mmu *mmu)
+{
+	struct ipu7_mmu_hw *mmu_hw = mmu->ipu7_mmu_hw;
+	unsigned long flags;
+	unsigned int i;
+	int ret;
+	u32 val;
+
+	spin_lock_irqsave(&mmu->ready_lock, flags);
+	if (!mmu->ready) {
+		spin_unlock_irqrestore(&mmu->ready_lock, flags);
+		return;
+	}
+
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		writel(0xffffffffU, mmu_hw[i].base +
+		       IPU7_MMU_REG_INVALIDATE_0);
+
+		/* Need check with HW, use l1streams or l2streams */
+		if (mmu_hw[i].nr_l2streams > 32)
+			writel(0xffffffffU, mmu_hw[i].base +
+			       IPU7_MMU_REG_INVALIDATE_1);
+
+		/*
+		 * The TLB invalidation is a "single cycle" (IOMMU clock cycles)
+		 * When the actual MMIO write reaches the IPU TLB Invalidate
+		 * register, wmb() will force the TLB invalidate out if the CPU
+		 * attempts to update the IOMMU page table (or sooner).
+		 */
+		wmb();
+
+		/* wait invalidation done */
+		ret = readl_poll_timeout_atomic(mmu_hw[i].base +
+						IPU7_MMU_REG_INVALIDATION_STATUS,
+						val, !(val & 0x1U), 500,
+						IPU7_MMU_TLB_INVALIDATE_TIMEOUT);
+		if (ret)
+			dev_err(mmu->dev, "MMU[%u] TLB invalidate failed\n", i);
+	}
+
+	spin_unlock_irqrestore(&mmu->ready_lock, flags);
+}
+
+static int __ipu7_mmu_hw_init(struct ipu6_mmu *mmu)
+{
+	struct ipu6_mmu_info *mmu_info;
+	struct ipu7_mmu_hw *mmu_hw = mmu->ipu7_mmu_hw;
+	unsigned int i, j;
+
+	mmu_info = mmu->dmap->mmu_info;
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		/* Write page table address per MMU */
+		writel((phys_addr_t)mmu_info->l1_pt_dma,
+		       mmu_hw[i].base + IPU7_MMU_REG_PAGE_TABLE_BASE_ADDR);
+
+		/* Set info bits and axi_refill per MMU */
+		writel(mmu_hw[i].info_bits,
+		       mmu_hw[i].base + IPU7_MMU_REG_USER_INFO_BITS);
+		writel(mmu_hw[i].refill, mmu_hw[i].base + IPU7_MMU_REG_AXI_REFILL_IF_ID);
+		writel(mmu_hw[i].collapse_en_bitmap,
+		       mmu_hw[i].base + IPU7_MMU_REG_COLLAPSE_ENABLE_BITMAP);
+
+		if (mmu_hw[i].at_sp_arb_cfg)
+			writel(mmu_hw[i].at_sp_arb_cfg,
+			       mmu_hw[i].base + IPU7_MMU_REG_AT_SP_ARB_CFG);
+
+		/* Default irq configuration */
+		writel(0x3ff, mmu_hw[i].base + IPU7_MMU_REG_IRQ_MASK);
+		writel(0x3ff, mmu_hw[i].base + IPU7_MMU_REG_IRQ_ENABLE);
+
+		/* Configure MMU TLB stream configuration for L1/L2 */
+		for (j = 0; j < mmu_hw[i].nr_l1streams; j++) {
+			writel(mmu_hw[i].l1_block_sz[j], mmu_hw[i].base +
+			       mmu_hw[i].l1_block + 4U * j);
+		}
+
+		for (j = 0; j < mmu_hw[i].nr_l2streams; j++) {
+			writel(mmu_hw[i].l2_block_sz[j], mmu_hw[i].base +
+			       mmu_hw[i].l2_block + 4U * j);
+		}
+
+		for (j = 0; j < mmu_hw[i].uao_p_num; j++) {
+			if (!mmu_hw[i].uao_p2tlb[j])
+				continue;
+			writel(mmu_hw[i].uao_p2tlb[j], mmu_hw[i].uao_base + 4U * j);
+		}
+	}
+
+	for (i = 0; i < mmu->nr_mmus; i++) {
+		for (j = 0; j < IPU7_ZLX_POOL_NUM; j++) {
+			if (!mmu_hw[i].zlx_axi_pool[j])
+				continue;
+			writel(mmu_hw[i].zlx_axi_pool[j],
+			       mmu_hw[i].zlx_base + IPU7_ZLX_REG_AXI_POOL + j * 0x4U);
+		}
+
+		for (j = 0; j < mmu_hw[i].zlx_nr; j++) {
+			if (!mmu_hw[i].zlx_conf[j])
+				continue;
+
+			writel(mmu_hw[i].zlx_conf[j],
+			       mmu_hw[i].zlx_base + IPU7_ZLX_REG_CONF + j * 0x8U);
+		}
+
+		for (j = 0; j < mmu_hw[i].zlx_nr; j++) {
+			if (!mmu_hw[i].zlx_en[j])
+				continue;
+
+			writel(mmu_hw[i].zlx_en[j],
+			       mmu_hw[i].zlx_base + IPU7_ZLX_REG_EN + j * 0x8U);
+		}
+	}
+
+	return 0;
+}
+
+static int __ipu7_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
+				   void __iomem *base)
+{
+	struct ipu7_mmu_hw *mmu_hw, *src;
+	unsigned int i, nr_mmus;
+
+	if (mmu->mmid < 0 || mmu->mmid >= ARRAY_SIZE(ipu7_mmu_hwdata_lookup))
+		return -EINVAL;
+
+	src = ipu7_mmu_hwdata_lookup[mmu->mmid].hwdata;
+	nr_mmus = ipu7_mmu_hwdata_lookup[mmu->mmid].nr_mmus;
+
+	mmu_hw = devm_kcalloc(dev, nr_mmus, sizeof(*mmu_hw), GFP_KERNEL);
+	if (!mmu_hw)
+		return -ENOMEM;
+
+	for (i = 0; i < nr_mmus; i++) {
+		if (src[i].nr_l1streams > IPU7_MMU_MAX_TLB_L1_STREAMS ||
+		    src[i].nr_l2streams > IPU7_MMU_MAX_TLB_L2_STREAMS)
+			return -EINVAL;
+
+		mmu_hw[i] = src[i];
+		mmu_hw[i].base = base + src[i].offset;
+		mmu_hw[i].zlx_base = base + src[i].zlx_offset;
+		mmu_hw[i].uao_base = base + src[i].uao_offset;
+	}
+
+	mmu->nr_mmus = nr_mmus;
+	mmu->ipu7_mmu_hw = mmu_hw;
+
+	return 0;
+}
+
+const struct ipu6_mmu_hw_ops ipu7_mmu_ops = {
+	.init_hw_data = __ipu7_mmu_init_hw_data,
+	.hw_init = __ipu7_mmu_hw_init,
+	.tlb_invalidate = __ipu7_tlb_invalidate,
+};
diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
new file mode 100644
index 000000000000..995cc171d676
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
@@ -0,0 +1,146 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#define IPU7_MMU_REG_IRQ_MASK			0x2c
+#define IPU7_MMU_REG_IRQ_ENABLE			0x30
+#define IPU7_MMU_REG_PAGE_TABLE_BASE_ADDR	0x08
+#define IPU7_MMU_REG_USER_INFO_BITS		0x0c
+#define IPU7_MMU_REG_AXI_REFILL_IF_ID		0x10
+#define IPU7_MMU_REG_COLLAPSE_ENABLE_BITMAP	0x18
+#define IPU7_MMU_REG_AT_SP_ARB_CFG		0x20
+
+#define IPU7_ZLX_REG_AXI_POOL			0x0
+#define IPU7_ZLX_REG_EN				0x20
+#define IPU7_ZLX_REG_CONF			0x24
+#define IPU7_ZLX_POOL_NUM			8U
+
+#define IPU7_MMU_MAX_TLB_L1_STREAMS		40U
+#define IPU7_MMU_MAX_TLB_L2_STREAMS		40U
+#define IPU7_UAO_PLANE_MAX_NUM			64U
+#define IPU7_ZLX_MAX_NUM			32U
+
+#define IPU7_MMU_REG_INVALIDATE_0		0x00
+#define IPU7_MMU_REG_INVALIDATE_1		0x04
+#define IPU7_MMU_REG_INVALIDATION_STATUS	0x24
+#define IPU7_MMU_TLB_INVALIDATE_TIMEOUT		2000
+
+#define IPU7_FW_CODE_REGION_SIZE	0x1000000 /* 16MB */
+#define IPU7_FW_CODE_REGION_START	0x4000000 /* 64MB */
+#define IPU7_FW_CODE_REGION_END		(IPU7_FW_CODE_REGION_START +	\
+					 IPU7_FW_CODE_REGION_SIZE) /* 80MB */
+
+#define IPU7_IS_MMU_FW_RD_OFFSET		0x274000
+#define IPU7_IS_MMU_FW_RD_STREAM_NUM		3
+#define IPU7_IS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7_IS_MMU_FW_RD_L2_BLOCKNR_REG	0x60
+
+#define IPU7_IS_MMU_FW_WR_OFFSET		0x275000
+#define IPU7_IS_MMU_FW_WR_STREAM_NUM		3
+#define IPU7_IS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7_IS_MMU_FW_WR_L2_BLOCKNR_REG	0x60
+
+#define IPU7_IS_MMU_M0_OFFSET			0x276000
+#define IPU7_IS_MMU_M0_STREAM_NUM		8
+#define IPU7_IS_MMU_M0_L1_BLOCKNR_REG		0x54
+#define IPU7_IS_MMU_M0_L2_BLOCKNR_REG		0x74
+
+#define IPU7_IS_MMU_M1_OFFSET			0x277000
+#define IPU7_IS_MMU_M1_STREAM_NUM		16
+#define IPU7_IS_MMU_M1_L1_BLOCKNR_REG		0x54
+#define IPU7_IS_MMU_M1_L2_BLOCKNR_REG		0x94
+
+#define IPU7_PS_MMU_FW_RD_OFFSET		0x148000
+#define IPU7_PS_MMU_FW_RD_STREAM_NUM		20
+#define IPU7_PS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_FW_RD_L2_BLOCKNR_REG	0xa4
+
+#define IPU7_PS_MMU_FW_WR_OFFSET		0x149000
+#define IPU7_PS_MMU_FW_WR_STREAM_NUM		10
+#define IPU7_PS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_FW_WR_L2_BLOCKNR_REG	0x7c
+
+#define IPU7_PS_MMU_SRT_RD_OFFSET		0x14a000
+#define IPU7_PS_MMU_SRT_RD_STREAM_NUM		40
+#define IPU7_PS_MMU_SRT_RD_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_SRT_RD_L2_BLOCKNR_REG	0xf4
+
+#define IPU7_PS_MMU_SRT_WR_OFFSET		0x14b000
+#define IPU7_PS_MMU_SRT_WR_STREAM_NUM		40
+#define IPU7_PS_MMU_SRT_WR_L1_BLOCKNR_REG	0x54
+#define IPU7_PS_MMU_SRT_WR_L2_BLOCKNR_REG	0xf4
+
+#define IPU7_IS_UAO_UC_RD_OFFSET		0x27c000
+#define IPU7_IS_UAO_UC_RD_PLANENUM		4
+
+#define IPU7_IS_UAO_UC_WR_OFFSET		0x27d000
+#define IPU7_IS_UAO_UC_WR_PLANENUM		4
+
+#define IPU7_IS_UAO_M0_WR_OFFSET		0x27e000
+#define IPU7_IS_UAO_M0_WR_PLANENUM		8
+
+#define IPU7_IS_UAO_M1_WR_OFFSET		0x27f000
+#define IPU7_IS_UAO_M1_WR_PLANENUM		16
+
+#define IPU7_PS_UAO_FW_RD_OFFSET		0x156000
+#define IPU7_PS_UAO_FW_RD_PLANENUM		20
+
+#define IPU7_PS_UAO_FW_WR_OFFSET		0x157000
+#define IPU7_PS_UAO_FW_WR_PLANENUM		16
+
+#define IPU7_PS_UAO_SRT_RD_OFFSET		0x154000
+#define IPU7_PS_UAO_SRT_RD_PLANENUM		40
+
+#define IPU7_PS_UAO_SRT_WR_OFFSET		0x155000
+#define IPU7_PS_UAO_SRT_WR_PLANENUM		40
+
+#define IPU7_IS_ZLX_UC_RD_OFFSET		0x278000
+#define IPU7_IS_ZLX_UC_WR_OFFSET		0x279000
+#define IPU7_IS_ZLX_M0_OFFSET			0x27a000
+#define IPU7_IS_ZLX_M1_OFFSET			0x27b000
+#define IPU7_IS_ZLX_UC_RD_NUM			4
+#define IPU7_IS_ZLX_UC_WR_NUM			4
+#define IPU7_IS_ZLX_M0_NUM			8
+#define IPU7_IS_ZLX_M1_NUM			16
+
+#define IPU7_PS_ZLX_DATA_RD_OFFSET		0x14e000
+#define IPU7_PS_ZLX_DATA_WR_OFFSET		0x14f000
+#define IPU7_PS_ZLX_FW_RD_OFFSET		0x150000
+#define IPU7_PS_ZLX_FW_WR_OFFSET		0x151000
+#define IPU7_PS_ZLX_DATA_RD_NUM			32
+#define IPU7_PS_ZLX_DATA_WR_NUM			32
+#define IPU7_PS_ZLX_FW_RD_NUM			16
+#define IPU7_PS_ZLX_FW_WR_NUM			10
+
+struct ipu7_mmu_hw {
+	char name[32];
+
+	void __iomem *base;
+	void __iomem *zlx_base;
+	void __iomem *uao_base;
+
+	u32 offset;
+	u32 zlx_offset;
+	u32 uao_offset;
+
+	u32 info_bits;
+	u32 refill;
+	u32 collapse_en_bitmap;
+	u32 at_sp_arb_cfg;
+
+	u32 l1_block;
+	u32 l2_block;
+
+	u8 nr_l1streams;
+	u8 nr_l2streams;
+	u32 l1_block_sz[IPU7_MMU_MAX_TLB_L1_STREAMS];
+	u32 l2_block_sz[IPU7_MMU_MAX_TLB_L2_STREAMS];
+
+	u8 zlx_nr;
+	u32 zlx_axi_pool[IPU7_ZLX_POOL_NUM];
+	u32 zlx_en[IPU7_ZLX_MAX_NUM];
+	u32 zlx_conf[IPU7_ZLX_MAX_NUM];
+
+	u32 uao_p_num;
+	u32 uao_p2tlb[IPU7_UAO_PLANE_MAX_NUM];
+};
+
-- 
2.54.0


