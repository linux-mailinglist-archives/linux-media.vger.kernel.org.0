Return-Path: <linux-media+bounces-60181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FUlCrb29WlvQwIAu9opvQ
	(envelope-from <linux-media+bounces-60181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 15:05:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BC14B2144
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 15:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8476230214DF
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 13:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B153806B4;
	Sat,  2 May 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="SoqB0E6M"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D333D6C7;
	Sat,  2 May 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777727112; cv=none; b=HlfcRbcFmivy9eKnhqdK4ClnFKqxYiQtaPGkomAWlsVZ3dbWUPLJzijCP19P6+kq9tb6NciWwWqYbOoP567W7tIqMRj6wNUpWGHsWKkErgMOyk+OZY98qO5ye2nKSBgXDr6PkmKigoO7rIfDmE8zhIW/1ERWp6BkvpJDEZPflO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777727112; c=relaxed/simple;
	bh=cd7SyuVvyi6jISlx8A1zYPP50Rrkz05BZF1l8flLbz0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=VuPmtoTyNWsLC8Of+9XSyvKKuHTXiGpHHSYwzDi+nZSJwvQidWBGQKoR8pT8Qg+wZaOCLzjiaE5ySNkfi+U/UYJBZ3Qmddxf0MD2g+/ENRBfKmIK97LvGXAhdsDkY5sIuImDEP+yVcpjfM4v3VFV6cdM13ry7X51dTaF/sU6ZzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=SoqB0E6M; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777727101; bh=EPIu1VT3+WtFaU6ycaBtpB2LTIlRXTVRY8qiprkx7Gc=;
	h=From:To:Cc:Subject:Date;
	b=SoqB0E6MG0QyyXKSzdFLK+QwrSee9JXInL9cgY1BF+kooEl1hGkCwn/OrK5bVlDhd
	 ANGmWIwS6jgMgJaFgTq7TPCyHUQV9qDx/nGfWR34WFLDHXBfpneiS7l1yXetVtNZYZ
	 oWCaGyrBxjRg5UhJhbYLA2JEQWaSMxR0yalYQVUY=
Received: from Lang.smartont.net ([2409:8a44:2312:14e1:56d8:1e1e:3f0b:d0f3])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 13835EBD; Sat, 02 May 2026 21:04:56 +0800
X-QQ-mid: xmsmtpt1777727096t2xpuewnz
Message-ID: <tencent_7B6592FA660AA38DCB8215456E0DD0032E07@qq.com>
X-QQ-XMAILINFO: NCmjBvJFq6XN9fygQfgBBr3jI/afKESixi/DV2JngKJxDNSdPNYBjFEnRA0RHC
	 23m9JD6OTQX+A9s8LPXSA4jRFNq5X/wTVjIIEafaUIB75EWkvdbrVm+cmy5+/zBRsIUjdgCkYDC3
	 Nm7/gkB7JM2GNnvIoZynZkK6Cvfy/Qv7AqqkdpkTZy/TZBLjggWl407oIRA1SZfvekrtMZQkW5hT
	 C+PXNO1UkYFz/6npEHfEk4YQ5pxOEP2gHGQVxoWSIDKu12WQMQ0cHQVr7daQm7TTAp/cBp87jcp1
	 6yFZnT4y1BMD9iU6S7UkmhGKDyI1vRJTIiEz6MKjRL8ti4jX7waqlEfmoAz9oOUAz4If4foQrw4Q
	 yq3WcNBwv+zs595ha44rSabjuXPGqSA/W6nnSbKm7JRb4Kx+Yld+c+WXCNsJPT+IOFvSogT7rc2b
	 Zc7ITyvvBUB7EvQJmAgtivpasNs4lSiH1eOlXOSEqSotbRqkCOYIa3brvOG7a+bJ8AoWmZuh/UcG
	 vtCQJIytvEM4wieqDbABuj0ceXPwh4QNW53fnLbVyvcT/O8+3e9EPohLi3r2Sh0f0sJcdQAIC5ue
	 PxqUsCMAf/XK+lTTswQ36Bc1JoJdeglQjo6FsxF3LgfSZkmgFdiD0ro6Km5La1OCmR9ZhUZp2FrK
	 9UggnM57z0GRYHQXXW9osEAq33WDDgv2NWGiukIRWWyxCkkDisI9s20Sif3c/D6a83XbZigAFJnt
	 8c+nSRS86rpMcB+2KaTSAygfiYJauTeC6BEDiwEW+z7PLyevLD3u06DsXo2dHVZb0xuZWAIEcl+q
	 iGG5LszxEAPTg0gWdDtmk4xCioIIrfnYNtbS0uewDjcSdO4lCLIRzjZxa8pxZWxRLvd4XNIs6Sqf
	 1t7z+wAlir0c8kXwhSU7+YOaMoRjR7ARA7xhuL6hbpuYUMuB8vWOxAlvCv2TzXWE2Oswn0VlURX9
	 bdyV08PStwDbYhMgF5/fLY6SqMSlik1RdGFDcalt+tnc0K8PcoHnlMc4hvNwLvJpJ/AomXCbQUFM
	 E+kn4zWqvvfRewl2PDlQTzzMg9pm4qHzy8APzf8XWu9pKqDbWd3DonqL4njgETjwOma3RExOeUIJ
	 +E9NPwHb7YR64skIk=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Wang Zihan <jiyu03@qq.com>
To: loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net,
	davem@davemloft.net,
	kuba@kernel.org,
	mchehab@kernel.org,
	richard@nod.at,
	linux-kernel@vger.kernel.org,
	Wang Zihan <3772548978@qq.com>
Subject: [WITHDRAW] Documentation: Fix typo "eXtention" -> "Extension" and duplicated words
Date: Sat,  2 May 2026 21:04:56 +0800
X-OQ-MSGID: <20260502130456.585851-1-jiyu03@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 99BC14B2144
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60181-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[qq.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,xen0n.name,linux.dev,lwn.net,davemloft.net,nod.at,vger.kernel.org,qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiyu03@qq.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,qq.com:dkim,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Wang Zihan <3772548978@qq.com>

I apologize for submitting incorrect patches. After review by Björn Persson,
I realized that my changes were not actually fixing errors:

1. Patch "Documentation: loongarch: Fix typo eXtention -> Extension"
   The capitalization of 'X' in 'eXtention' was intentional to highlight
   the letter, not a spelling mistake.

2. Patch "Documentation: Fix duplicated words" (the "later on on" part)
   "Later on" is an established English expression. The original text
   was not an error, just a stylistic choice.

I am withdrawing these patches:
- Message-ID: <20260502111912.143743-1-3772548978@qq.com>
- Message-ID: <20260502111916.145238-1-3772548978@qq.com>

Thank you for the correction and education. I will be more careful in the future.

Apologies for the noise.

Wang Zihan


