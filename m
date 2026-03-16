Return-Path: <linux-media+bounces-55841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECcnOMiet2l/TgEAu9opvQ
	(envelope-from <linux-media+bounces-55841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:10:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ADC294FBE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B2753014C2A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 06:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB429349B19;
	Mon, 16 Mar 2026 06:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="wW7vtg7H"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3658F347FD7;
	Mon, 16 Mar 2026 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641403; cv=none; b=iEIPgUb+QvZgJXrOtV2F3wTwr6+1ood0jOpfl0uhH+XYePAlXmMdRCUurzjV2GqI5DeEx8Z8HxLUqC4ty3drZh19jZhSDKFNwV5e2ev/Ru8sb8Hi+Ir04O5v6F8sU3fRtJgaSf4n/fz1sR0qipzNWI1C0SV0T50KXpWCi+L+ftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641403; c=relaxed/simple;
	bh=w3mpT5C+BCLtvZJwBeytG84peP1yEtl0jeM3A0m+L9s=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqb3JvNhXlf9KbxL26Or2JbL3QUp8/1qSqLnHlGLDz3D+cFTfTIPCInWP/FwU8GDfCCEIReBwJN+5V22rj9lHHeFir4ZaQ6bB/siZbcutITwT9jZC+GrhEnqsU1XQadFRtHiET3IIzI7j2iQpTweFC2fUv+JcAXSGUgP+KAwjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=wW7vtg7H; arc=none smtp.client-ip=43.163.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773641397; bh=Kcc1O46FB81oROkGjwbMHhyco1oeYlT1/Lyt9bm+j3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wW7vtg7H17rALZtYnDiJP7EzxzhuROOF6o4Ru9tOHeQIdlQFs+s3S1oKHEb7ysL83
	 hTFfCbsTK/RLon/efY8yW04MwHpiJ/JA+UVssB6a/NZtTWus9uINUWAnI+8uT9q4jz
	 fVw+Uyi82+Br89PuE5AWLiauS/c7SggMCU705QU4=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 26C8EC29; Mon, 16 Mar 2026 14:09:44 +0800
X-QQ-mid: xmsmtpt1773641384t9bdpombs
Message-ID: <tencent_147C60698481602113E96C4145593FC0850A@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GevpqaKte0fdvpwciIonwgVpliCI/8WlhyzxkdtSSZAty14bcRe
	 hQwQyI5KCXSo7WG335ceSnuoIkOxWnZM6Fd3lSgMlXUiiZeYCwvE5qKUrleC6luTM+imD4zJSfqg
	 FydD0IWhkwx8qTG2EUNZsQNR3VPhF3Tj+BsM+yzgadqMuUxoURVffmDVJbBqd2AS0Z2f5lmM94Cu
	 0sD2PoVLz+r60M4SdrqEKQyGB73QAdfZ/pZIoPdjMW4e7IdA2rcPBGL/BKeeMWb7tvqm0zd2hN9w
	 RB9Fm6ToB25DFIrpR3bZ3Pwg+FhuD1+UmNmF/3S0AlWzQkbaTL8lJ2ZCo/sTKtAk0vmsdqSF14QS
	 /lePsRmsVT4hrsGyy+8dbsihsTaHCRbqtAGFmcd4Xqmd0dwjshcBAytfljQibNAB5NzuGwZnLVbO
	 tmLlnoAGDpEfBFAdJl7GN5WrFW5Gmhe2fcrIVaudP3we2Uo3LUnxOXCsTpjSlsOSlFKL3rnDblYG
	 qVuBGPA3WoWjhKc5O9HiYOu5xR/y7VSp6PrS0ZQUcGHuvsUkH1b7x2NR7Z9+kNXISPJanj6w80BY
	 S8Y91wvZW+6pPsbJEHOBD+p7L5emw+l7lgmilj1dAW8jCVcikT42He6EGkQjxXGLSPxMYeZXHkV/
	 vOqD0ID9Q1GbajQ+HV6ZhhqwI20OJavk2MsGxmL/6QHxvEeumbTt4cGuu9VCiaRUBDTeB/CF4gnQ
	 sYxg/k7dq7JepVqldLHS8ZA57dR0Aklhx44/pztYh8zYLGnjFgdMMGscn+0aaQ+NiVADQt4xvJdj
	 uHJJG7WJV07ZMQH6sfiqpndW8ysl9BVD7LKWVn6mL/99Www/lTq//gxWT+sfi/CGjM6Ps0vbetGO
	 NVGc2pNhRPF+cNvAFhpdP3yfAyHxJapEb3tAEIfT3gIFYmxaMCVz9WAkHJg5HsQ1ymkPGaVw9i3/
	 E6+Z2YcLu9pq3aBdS43E6Ftb2psjf9NnaLMfEkJdKzMsOjpK8UYukCZG6oScWFeZUe/1bZ4Csci1
	 zQArSmy8U/Jsd4MEKfI58VxzUUS0YwV0hrd1T/LTCL7zEh99z53dk2behB2EnEFhcHRB7HqA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Date: Mon, 16 Mar 2026 14:09:37 +0800
X-OQ-MSGID: <20260316060940.9659-1-1742789905@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55841-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[qq.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45ADC294FBE
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


