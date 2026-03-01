Return-Path: <linux-media+bounces-53907-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHXbFfaVo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53907-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:27:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E131CAA3E
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A3303053AAE
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856B7285CA2;
	Sun,  1 Mar 2026 01:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8YBBgLp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32913B7AE;
	Sun,  1 Mar 2026 01:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328050; cv=none; b=qC4rhqizvbCCLDNALDcQvfkK47ib3h2T6cgSO/2sTHlrr/gB8bJfhLg84/PSyCqrArO2E5E0uBtDn10eNHo+BqI3eJ+eilnNEVBXYk2U+fXDN1VUxwOyURJt40LgW2VgOjcOoRg+miYFLtKplBBALsQSOwtGWiUKW149q3vOF2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328050; c=relaxed/simple;
	bh=a79ChTW3NrpRfjLSHgOrtfBzyz5+qV3MioVWSF5+sd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZK/iNHqQWeOT3Bugr4j3MHpV9zo9qxzboyPNQ7DSdE676QJbn56EwVCn3nD4W0drsOg8C2D8c+dwpKTiCg8fcF3TxHqIAvAKXFcQWz+OKGAp1Lf5JegI9q4QktB92FU1DhqWyCQGZyrL4KEmryoH4C2+btVXacfkt9Dtc831+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8YBBgLp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49958C19421;
	Sun,  1 Mar 2026 01:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328049;
	bh=a79ChTW3NrpRfjLSHgOrtfBzyz5+qV3MioVWSF5+sd0=;
	h=From:To:Cc:Subject:Date:From;
	b=R8YBBgLpijyARkytXSgfyhu9CjFZ1LRZuN7A5dAL3B1AfjlY18hEfb6s8BKk1XEOU
	 F8Qz+LgRcUV5FhwYMBpARC43BRZDtx3+oMTtRsAZ8B4t3mOTZFhK3O5aeRLz4CrRAv
	 NwFix8KDg+Lj1CprN+HTBMhDiNETM1fDA4Mmcl1rtR2nth5Jma/jM0NP4IqGpHBXm7
	 MdSWT7vDgCPcm9gk6KUK/PppaAMRuT7bCPfVTkQyg7PDdKH0OFCBHDKT8xjLLtj7+f
	 ek3CJf7m0okC2zljxpfwAooSt9pev87BobU8MTeaaIsC6QyKIdwHy0LsXh3TbmPHP7
	 XbyZUdIo74aUg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	bingbu.cao@intel.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: ipu6: Fix typo and wrong constant in ipu6-mmu.c" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:47 -0500
Message-ID: <20260301012048.1676479-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53907-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B4E131CAA3E
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3e0fcc91277d5af114a58aaa68f34b44e8d8a411 Mon Sep 17 00:00:00 2001
From: Bingbu Cao <bingbu.cao@intel.com>
Date: Tue, 23 Dec 2025 15:22:58 +0800
Subject: [PATCH] media: ipu6: Fix typo and wrong constant in ipu6-mmu.c

Fix two coding errors in ipu6-mmu.c:

1. Fix syntax error in page_table_dump() where the closing parenthesis
   and semicolon were swapped in the TBL_PHYS_ADDR macro call.

2. Fix incorrect loop bound in alloc_l2_pt(). When initializing L2 page
   table entries, the loop was incorrectly using ISP_L1PT_PTES instead
   of ISP_L2PT_PTES.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
Cc: stable@vger.kernel.org
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 6d1c0b90169d4..85cc6d5b4dd11 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -102,7 +102,7 @@ static void page_table_dump(struct ipu6_mmu_info *mmu_info)
 		if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval)
 			continue;
 
-		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx];)
+		l2_phys = TBL_PHYS_ADDR(mmu_info->l1_pt[l1_idx]);
 		dev_dbg(mmu_info->dev,
 			"l1 entry %u; iovas 0x%8.8x-0x%8.8x, at %pap\n",
 			l1_idx, iova, iova + ISP_PAGE_SIZE, &l2_phys);
@@ -248,7 +248,7 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info *mmu_info)
 
 	dev_dbg(mmu_info->dev, "alloc_l2: get_zeroed_page() = %p\n", pt);
 
-	for (i = 0; i < ISP_L1PT_PTES; i++)
+	for (i = 0; i < ISP_L2PT_PTES; i++)
 		pt[i] = mmu_info->dummy_page_pteval;
 
 	return pt;
-- 
2.51.0





