Return-Path: <linux-media+bounces-66367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6FuLOlFoRmqvTQsAu9opvQ
	(envelope-from <linux-media+bounces-66367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:32:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 440286F85FD
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=jZPsvU0x;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66367-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66367-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A100A3014D97
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554EA4963D4;
	Thu,  2 Jul 2026 13:27:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8908D48034E;
	Thu,  2 Jul 2026 13:27:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998851; cv=none; b=HpzD1D5DMDIiWiYxJSxRWGQR7NqHR0C9B6bTJ1d/vIxefZOjAcuMl+ufwWtS8mO1SQ1jB6E97TOI+y6VO3h3yBjpXROxs621f26Th6BmVKdTAReZ5pBpPjcy37gHyFlzVqFFV7QP506scs9Q+SeE9/D00PRcRDyEmCAVkvGu5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998851; c=relaxed/simple;
	bh=GB/bvAuUnL8pcQEa+/v3DmUoOKXxg2XuWruD5vaMxSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+maIVb/L1qlpC13wqn5bX0gwRQcmZV8UDOuUddfwl/bvjG4Z5UY+Glu80h3S6EExPUtsqyGyYdmpJx53DfOfxeR+DwLj4jKeRvJn4Gy/Zlpn9MRCkT6E9Y9p2hB/0Z9viU+P82RB57LrdYpyCF41BBrLO0yEMNqcJjQanCXWhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZPsvU0x; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782998850; x=1814534850;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GB/bvAuUnL8pcQEa+/v3DmUoOKXxg2XuWruD5vaMxSk=;
  b=jZPsvU0xzg/WnshFZoRpdrOCp7Nqnb0VP0k1s1Q5akA8IS/fXu4xoelk
   YYl7zVfAtrKHDjr7FzqJlE2FYhVvbeY8SS2gMq0QgoWkn623err3A7QaN
   H3hqWn6zHrGL7NVrXDKKCr2Ph4O2/4HMW8/21UMC9b+eKy/i2VlfFtGBe
   oG64iZRGIA+OFd7nrkncAk1+UYUkQKVy3pFm6CdWlqaV5IAzhY8rgQ2Oy
   aUUIPFX3GNEWR3Sebxm4waAK0gQ2imKXjUVyjLHUfwKvFlQDh6/4ixEzl
   9KQGFiTVJyhFiR+07gUYGF2A6WC858/ogoOkX2gw7/3qPjPrjldWDAngl
   Q==;
X-CSE-ConnectionGUID: EBjno9q4S7qJHdQeLeiouQ==
X-CSE-MsgGUID: QiZtftL2QKOcUN3OiS6Y3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82742415"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="82742415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:27:30 -0700
X-CSE-ConnectionGUID: TFi5jZk8RHe+a7QwOq4hQA==
X-CSE-MsgGUID: ATPeFarPQR2RSbht0igPCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="249512247"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.6])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2026 06:27:27 -0700
From: Arun T <arun.t@intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@intel.com>
Subject: [PATCH 3/4] media: i2c: cvs: Add IPU8 PCI device ID
Date: Thu,  2 Jul 2026 18:52:12 +0530
Message-ID: <20260702132213.1226645-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66367-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.vadillo@intel.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mehdi.djait@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 440286F85FD

Add the NVL IPU8 PCI device ID to the CVS driver match table so the
CVS driver can bind to IPU8 camera hardware.

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/media/i2c/cvs/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index 4282f33c7295..8270d93f1abe 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -32,6 +32,7 @@
 
 #define PCI_DEVICE_ID_INTEL_IPU7		0x645d	/* MTL / LNL */
 #define PCI_DEVICE_ID_INTEL_IPU7P5		0xb05d	/* ARL / PTL */
+#define PCI_DEVICE_ID_INTEL_IPU8		0xd719	/* NVL */
 
 /*
  * IPU7 PCI device IDs not covered by ipu6_pci_tbl in ipu6-pci-table.h.
@@ -40,6 +41,7 @@
 static const struct pci_device_id icvs_ipu7_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU8) },
 	{ }
 };
 
-- 
2.43.0


