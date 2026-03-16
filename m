Return-Path: <linux-media+bounces-55901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGLrLvf2t2nSXgEAu9opvQ
	(envelope-from <linux-media+bounces-55901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:26:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8A299787
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C699304B8DA
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866F13947BC;
	Mon, 16 Mar 2026 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vyaMykrn"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44633A1DB;
	Mon, 16 Mar 2026 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663854; cv=none; b=mk4kFiGJedRgqov86CxCk+GbWIUy7a5g0FM46MFIvszpvj8EdEA/RZyJRdYK7MB4+tzn9aKz8q0BOhlG4uqcy5PEC8vs7LlBeZ0gIyZ2eG8nH9W/b0P249xuoVrtLS2Xc2XAg2tYt9kLmXDvNQjR63CEIEmUVQa5we/vjLH1Jgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663854; c=relaxed/simple;
	bh=XhaJGw+Lyj4h5vWrO6UDgVdRXPZsDpXdvuzAigUvfIs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADtqzf/UR4JHNjc+glATy7e1Wbo2Ejf44Wr/4fCXlv7ku1qVVRwipHjS2uxh4MciH6S2QsPPF2XIEGqoeBmVUE7s0CZplHI/6Chbap7eb00x8p/qot9g2R33gI0W/o5IznyUFQg9SjPTBSmRTHOpX7GuYLmU5odp3WoCxGRMY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vyaMykrn; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773663847; bh=MH6rMAvfdrXPigCvT9mZ2WV9DLeFXxCHj77jaVNN9WY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vyaMykrn6uJSukU0nRgQ1mMcp++sSJxl3LM9X2lZ9WWELa4i7c20Wby9+0lT2k9Pa
	 LtgcTbjDJ2gbMIyOZEIy++22b9LsLGcRvnECH3ih1hR6PkzB5GkqvOeezaWbzs7n1k
	 pliDq/ILAC2JSMxsAg/pQvaBZqWW0fxFQ8cMusQU=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 6040EEFF; Mon, 16 Mar 2026 20:24:04 +0800
X-QQ-mid: xmsmtpt1773663844t022sqy5b
Message-ID: <tencent_8C4BA706AAC29A1F8EEE434963090403B905@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uj1/CIw6g/zbggfNCj/BVrfCy/1C+Yb1nhOl6bMrl5UvKSdTwnP
	 09YWLD42mDAZvPL/ljZqFznwioQ0lpurFniOn/Gb8WEmRxt7XNwhS/a7wg02kaWiRISQDS2uzpL4
	 5He17yfjC/6dlfuahVBTmtoaEE4cRK9iM6MJjtPhfyCYPKQEANd0Ko2oj4HTfwz6/f4IbkHQdtUd
	 7WR5wt/UfWx7mtNSyoYoEygaYGYmDAm9zc9y6mQG82KWtbrnzd++5PEBxi4dIGfR1VM1g6OtD/72
	 NG6fXH9wFwjp/8K+N/GTNhrHQw/WhpWaMLs7U+dc8hMDwXWlbC+xkiVaqI4DfhCKXofVdOB9fsj5
	 jIRqwsbQD8xD5mG+9EV6t/XhOutFdksDAdWn5lFcwFHRqlRx7iWi4fpYS/zaleV3eiovqS6bm+PQ
	 vfWoO2WAJZkC52sO4n61IUHScpSlOYowEeSi4XA51EI7RuRLK88+4Nu4+Ht3zIFsDBHBnv8ETv0A
	 vIKBifp+Yfp2RPP5IXsJPVQ8+1taM6e67XV63LiiwX084zS+afE2cvGl8WV0yLwymPDtqhUebiyC
	 suqeUQGMUC9VL3NuUIZ4bAf33+A4ivhUt0qnfvw99y53xleaKmwKcqGP/+VtiwQEJp2i9fRYC6K5
	 niC2TJ9vcyyRYpE78BWdO5sVASQms7kz57CK7dBdUMIGclw6m+5mY5hRuvJnR1U7x3MsS8nf9+SJ
	 jX1M9/85dztth+PXtYIiQJ5xwqqdwzV2flUuHDOwqzpufN+fmVEc9i5+H30UH61Q4/yJhzZlxx14
	 uKyzXsrOUeszbDc7P032m2S2abHo5Lqzjfn5980JmApvE/J1+Hd6yzq43FEpfDE2ZshuWztCTIf0
	 IZV7y9ooeMi6PgrEQOkss6s19bt1iCBu31/u/2AUp5xOW1bCmF4+IHiO2cUf1Uof9WTGVudshBMT
	 VeGEzHSme/mjGtxskZG3VdiFjH4rIF8zjM4QnuglP8VHPfVkJWYzkXxu6lWlddAIeay1hZHijHfX
	 QPoWFotxkRRxndab5EydN6JGCnWlUz+wL8RRkafLNrz03sVOk/aAfhNR8cI0H/YedneMqcF/i0cY
	 0qyWwqceH4ZjFD8d6MWy7iuTORWyBCuh09vczo
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
Subject: [PATCH v7 0/1] media: saa7164: add ioremap return checks and cleanups
Date: Mon, 16 Mar 2026 20:24:00 +0800
X-OQ-MSGID: <20260316122403.23337-1-1742789905@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55901-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[qq.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: 39D8A299787
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Markus,

This v4 addressed all your comments:
- Added `Cc: stable@vger.kernel.org` to 
ensure the fix reaches stable kernels.
- Refactored the duplicate ioremap error handling into a helper function 
to improve code clarity and reduce duplication.
- Replaced manual mutex lock/unlock with `scoped_guard()` for better 
safety and readability.

After submitting v4 (which became v5 in the patchwork series due to 
a version bump), the Media CI robot detected two issues:
- Build errors caused by incorrect struct member names 
(`immio` → `lmmio`, `pci_dev` → `pci`).
- Two checkpatch `CHECK` warnings about alignment of function call
 arguments (open parenthesis alignment).

This v6 fixes those issues:
- Corrected the member names to match the actual struct definitions.
- Adjusted the code alignment in the `release_resources()` helper to
 satisfy `checkpatch.pl --strict`.

This v7 addresses two additional issues that were identified 
in the v6 submission:
Corrected a remaining instance where dev->lmmio was used 
instead of the correct dev->lmmio2 in the foo_bar() function.

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


