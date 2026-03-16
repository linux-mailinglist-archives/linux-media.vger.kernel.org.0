Return-Path: <linux-media+bounces-55824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /p/yH5ZTt2kCQAEAu9opvQ
	(envelope-from <linux-media+bounces-55824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:49:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28852293255
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8339F30078B8
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 00:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330DC1D63F0;
	Mon, 16 Mar 2026 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bDL6KhHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC213AF2;
	Mon, 16 Mar 2026 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622156; cv=none; b=o8byo40rq59xX1cMblniqqxvNY/bbjCQXoDqakgVqo9w61uXJJknC+RMo0gsNAiFF7PiVCOAjG6ncNIHLDs2CYmOgtUurfgzBS7EN0lgfDGiLAAmI4rVWejHIamt0IVTXf3d2CaEHaGZT/XJSGEt14C3xkgjwI4Vbom/ES374H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622156; c=relaxed/simple;
	bh=w3mpT5C+BCLtvZJwBeytG84peP1yEtl0jeM3A0m+L9s=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=juqGDLwOfuk4KGl4ixdHgCxPKRSqhsf0CwMEO9E8Mr7SoJcUqGOvLATu07Su80Vf3TUwYixA/Qbf76pIkNKR/Be1R8KxIug6mkSeo1M1jApqfq+v/96/OvmwvnfnGl3dluK/tFhLbpEZi/6IlmtWyQasmOIS4Szf3oJ46o5NLF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bDL6KhHQ; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773622143; bh=Kcc1O46FB81oROkGjwbMHhyco1oeYlT1/Lyt9bm+j3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bDL6KhHQxXPol14CETZGC34Dmdepd44SKeuniyABD83T9JxmlD/4PLjLmmYtqsRQ0
	 YZe2KCJMWFjAKCitu9DuMQuppXuCDFvumYCadbSAThZOSW3r9be4jvmgVd4q9mRI1S
	 JPlt0r1H/2NtgVFeDIpzIK/FdbdHF9MZGJhdWxsQ=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id C398223C; Mon, 16 Mar 2026 08:48:57 +0800
X-QQ-mid: xmsmtpt1773622137tjxhmgks5
Message-ID: <tencent_21D64A70C21FD11A842047C8013AB550C308@qq.com>
X-QQ-XMAILINFO: OVJ70/r6OeAi2Ry3E2wpgwj4z/G5bDhQ8fZw1tEiXXS/2N4ngux42NZ0Gn7y+r
	 5nC9vF4rYP8SLy2K4DfQ1sboCwyfy/YdIUnQ+9/WR1FE6Ejdx0SIx79XRwZaqNpMfsnug72vyOz5
	 qJidobgFep+UgSChG1VNAV4YqUff7VF6mMH/qQeNLYqGjWSKK9riQH+PbTXP7obFJGfdAKJpzFCN
	 QolCEXconAWAcDtDJHxcV2WeKQhslC2JgdVRGHe//GIBwZAVl/jjc8P+Nn4e6e3h7WBwIjPSlztw
	 kikPV+NsOKBkp7U5f4TpJtxI35prkaVdqf3vvlyD77eleBc7EqPkm4qAqn0TtFel9aoJhjLxTdqM
	 t/5+s4oP9UknpsSi+dKEYSWg75kfLtf0HPAzge6hKa3Sn0l6Xr+tzJji1SaqAxLSp9GhtSl4DyqX
	 /hzjYuReEKyPUAGO+Ai5dIifnYP1gZ/TDIdaEzyuB2ASo+PhBzw7RsqwrHEzDiCNmTkgNllaxgRD
	 BiooPP39kdTt0zNnv2EBWUxYs5K7u/K468lBUtNtMe2OPGKGB64koWZmGcNJDHWBtsNgnYFUma8i
	 ptSLHeNZY9SWqvNhCFLqwhBg4FdHEBsFffbpWLJT532siEqSR8HIo8Mz6mWmV2PdSFBM+4fh6fZD
	 ZcRbYa4gb04ofvCXlPViT0PR257tt1i+QuBoUdcRQ860+8jWnISTgvsC7tDqQz2voqSb3687FrB0
	 ij9PaTUBLdsbBaK4rr8lk7a5Kxie/HGWDQoBz2qLKHJREv37z9oCcMtj5/np10hpNE6RW5MATQ/j
	 g7So5eQBs6N1XXIymiQWEBE6aOizGGoDNo+wJ/Y0xkaNqeMD5AyH0DhwAiG0+2qOh+uZeIS8k9w1
	 FYRh5U+hU9btz8tzR4M2YKj4LdSED8wS/hn6PbjjFB4wZsYpYaC5wiYVjTnGX3xYjRW17Rnzp/T1
	 trRHoYeR1rPT6s2BSCVtDvIwPXwOKfKRgJ67JweHNkccWryfGEpLO6Gd+ycLRE2iW/8mXYNTBAMI
	 iFOifa44/RmoK345U/oDvzDRr+/W4voe2l5m609w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn
Subject: [PATCH v5 0/1] media: saa7164: add ioremap return checks and cleanups
Date: Mon, 16 Mar 2026 08:48:17 +0800
X-OQ-MSGID: <20260316004854.1711-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55824-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[qq.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: 28852293255
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Markus,

Thank you for your thorough review of v3. This v5 addresses the issues
reported by the Media CI robot after v4 was submitted:
- Fixed build errors caused by incorrect struct member names
  (`immio` → `lmmio`, `pci_dev` → `pci`).
- Adjusted code alignment to satisfy checkpatch.pl (two CHECK
  warnings about open parenthesis alignment).

This v4 addresses all your comments:
- Added `Cc: stable@vger.kernel.org` to ensure the fix reaches stable
  kernels.
- Refactored the duplicate ioremap error handling into a helper function 
  to improve code clarity and reduce duplication.
- Replaced manual mutex lock/unlock with `scoped_guard()` 
  for better safety and readability.

Regarding the `Fixes` tag: I've added a tag pointing to the 
commit that originally introduced the driver. 
At that time, the file
was located at drivers/media/video/saa7164/saa7164-core.c; the `Fixes` tag
correctly identifies the commit where the issue first appeared, regardless
of the later file move.

The patch adds missing error checks for two ioremap calls in
saa7164_dev_setup(). If either mapping fails, the function now properly
releases previously allocated PCI resources, removes the device from the
global list, and returns -ENODEV. This prevents potential null pointer
dereferences and ensures proper cleanup on failure.

Please review the updated patch. Thanks!

Wang Jun (1):
  media: saa7164: add ioremap return checks and cleanups

 drivers/media/pci/saa7164/saa7164-core.c | 47 ++++++++++++++++++------
 1 file changed, 35 insertions(+), 12 deletions(-)

-- 
2.43.0


