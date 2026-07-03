Return-Path: <linux-media+bounces-66472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /6PrHxvWR2pTgAAAu9opvQ
	(envelope-from <linux-media+bounces-66472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A5B703E89
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=A+XNlTu4;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66472-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66472-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8261F30492B9
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AFC414DF1;
	Fri,  3 Jul 2026 15:25:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED53DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092325; cv=none; b=tEXVTceiVfKWkYnKYPYQ0YsSGperYXuat3RzQ6gumBoLsh2lH56s31+z0vAbLsdRtHrjlLoQ0+Z0G3ooOjiouE/Uz4z5J4GFREKTEHbu4uR8TNpbxABNxqc+tNmvLQTBjgtIL35N6I+lZUSOJRv1f82Ad/yQCesciHB8D5Hl8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092325; c=relaxed/simple;
	bh=47qGxeltxuyNgiudxoAxO8qVAdooHa+Jfc8PWSOQyFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYzZeYeSxS0EKXyoRxJBw7DM5AKVWRjjIvQ//4zFBkL4BiyU0YdASDHM7iwDepg8dYUaQ9UY8DijmQqfEKaC7CacxmTIlf5Vc1cdKd0DqoVEmrM89NxXrpN/Ed9cfKHRJKA8ZfZ9riSE601XCm8dIId97ooC12OK+rmPv0q2Bnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+XNlTu4; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092325; x=1814628325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=47qGxeltxuyNgiudxoAxO8qVAdooHa+Jfc8PWSOQyFY=;
  b=A+XNlTu4RhCYiu9b1Bd0upt3d71N6mX2BGn3CQ4TKeNDXmLGlLlzguaW
   tCIipH7LcUgcC8KQuPUZPbpgLNxoUpjBei1hrD5dzklzM4BVx0dhAnu+7
   yDGxpA4VWg72uyvkk+JymDzM0DqvuBRf3RtFB7BxxR429Dw+ckxRAYhu0
   /yqw5Rpb0HGhHhSRk7dpbaaTnRuId7DG+5PUjySsQ6VWqzMoxZnZ0nzVI
   Iyw2jIkFYdRX3x8wIXFbzgSVJySVVJqs3bbQc5h3e/0FWkXXSDCiXMJF/
   qVxsuLh+OQtZ/RTq0Ba/JOvSYyla+5eyVJlYQe+jtbGss7VlBIJqxDyDq
   A==;
X-CSE-ConnectionGUID: TrEGzat+SzSzg8umtJTZ2Q==
X-CSE-MsgGUID: vHHQLn+LRgqS7veNWllmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396132"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:24 -0700
X-CSE-ConnectionGUID: FcCcwNPwTiWb2RExfYgkdQ==
X-CSE-MsgGUID: B7dogx3YQT2KJcByLWbCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799480"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:23 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 06/41] media: ipu6: Cleanup ipu6_mmu_init()
Date: Fri,  3 Jul 2026 18:24:16 +0300
Message-ID: <20260703152451.1743132-7-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66472-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1A5B703E89

The struct ipu6_mmu_pdata is used only in ipu6_mmu_init(),
and not really needed, remove it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 13 ++++++-------
 drivers/media/pci/intel/ipu6/ipu6.h     |  6 ------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 0e6dca36b6ba..35307ebc2f43 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -750,27 +750,26 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 			       const struct ipu6_hw_variants *hw)
 {
 	struct ipu6_device *isp = pci_get_drvdata(to_pci_dev(dev));
-	struct ipu6_mmu_pdata *pdata;
+	struct ipu6_mmu_hw *mmu_hw;
 	struct ipu6_mmu *mmu;
 	unsigned int i;
 
 	if (hw->nr_mmus > IPU6_MMU_MAX_DEVICES)
 		return ERR_PTR(-EINVAL);
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
+	mmu_hw = devm_kzalloc(dev, sizeof(*mmu_hw) * hw->nr_mmus, GFP_KERNEL);
+	if (!mmu_hw)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < hw->nr_mmus; i++) {
-		struct ipu6_mmu_hw *pdata_mmu = &pdata->mmu_hw[i];
 		const struct ipu6_mmu_hw *src_mmu = &hw->mmu_hw[i];
 
 		if (src_mmu->nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
 		    src_mmu->nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
 			return ERR_PTR(-EINVAL);
 
-		*pdata_mmu = *src_mmu;
-		pdata_mmu->base = base + src_mmu->offset;
+		mmu_hw[i] = *src_mmu;
+		mmu_hw[i].base = base + src_mmu->offset;
 	}
 
 	mmu = devm_kzalloc(dev, sizeof(*mmu), GFP_KERNEL);
@@ -778,7 +777,7 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	mmu->mmid = mmid;
-	mmu->mmu_hw = pdata->mmu_hw;
+	mmu->mmu_hw = mmu_hw;
 	mmu->nr_mmus = hw->nr_mmus;
 	mmu->tlb_invalidate = tlb_invalidate;
 	mmu->ready = false;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 883c83f30682..3c1197b59240 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -252,12 +252,6 @@ struct ipu6_mmu_hw {
 	bool insert_read_before_invalidate;
 };
 
-struct ipu6_mmu_pdata {
-	u32 nr_mmus;
-	struct ipu6_mmu_hw mmu_hw[IPU6_MMU_MAX_DEVICES];
-	int mmid;
-};
-
 struct ipu6_isys_csi2_pdata {
 	void __iomem *base;
 };
-- 
2.54.0


