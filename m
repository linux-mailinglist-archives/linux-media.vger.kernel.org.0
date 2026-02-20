Return-Path: <linux-media+bounces-53127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFsuHDZlmGmJHgMAu9opvQ
	(envelope-from <linux-media+bounces-53127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 14:44:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AD167EFF
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 14:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E05A9309346E
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 13:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B944347BB9;
	Fri, 20 Feb 2026 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fN16hjoi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E482AD35;
	Fri, 20 Feb 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594960; cv=none; b=OxkStXLZd/qfNe4zopStzOZ0h5mJ63eJ3vPdw4dSl4vwJlG8Z0Kbct+ckBFy2VeN0LRrX2DY/3XlxC0yuRSsdOeP7ILZPD41/6ZH317yB6u7k6w89/RuLKEl6wR/pZITXo7ruojOtOBt1hJ5f0sWabDCWjy96x8L4hLJzN54NXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594960; c=relaxed/simple;
	bh=zi6otyit5q4mXqgLX4/iodqw288StkIbA2wzfkURf+A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=crvqs5BB9KHURqLsHPS024yuE6D+YpgKyLkj9JC7lTYOHTrvIisggmdHoY8EDvq3EgDOiosgjZIAhyjm9iC/B6uqF6SIrNuLpmtjR0xeDgQhIwrPX1K+qje4xxu6ossr4K+L/2hAetSD5LdWEZh4msv8LZasgefs106WsPePvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fN16hjoi; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1771594944;
	bh=FkODOR0bSCEHqd6sotNNe2XMug91pkvwDuUbnJ4/a/k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject;
	b=fN16hjoia8fnwg8scrTYewjzuZl/rVPGoUfHWqVZ1CrMs8htZ0937EGeozBlSe7CZ
	 mDHWN2Soci/OEatvJsiNzeD+g5dvfDg63ios2oSF5HUnDTu2q2/Zt0dubT+gDNg4SF
	 zb9s1XhTQyUYuhjyQEdr7W4GNYouVQf6bXCqCLH4=
X-QQ-mid: esmtpsz18t1771594787tf9499a9b
X-QQ-Originating-IP: JHjcpki6SJEHxfa7QV7PChZOd7R1o6LPqJareNcq1tM=
Received: from [10.10.74.107] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Feb 2026 21:39:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3102520111874607465
Message-ID: <AC57A72C7BF9B508+c75971da-ad61-446d-acd6-0ff2c993dbb6@uniontech.com>
Date: Fri, 20 Feb 2026 21:39:45 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
From: Ding Yihan <dingyihan@uniontech.com>
Subject: Re: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by
 value
Cc: dwlsalmeida@gmail.com, mchehab@kernel.org, linmag7@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Ndw/mc8X39Ob9wjrjZcrG3L16rozmwFZwitDAKpwYgmn4v8Qt4BQ5vx/
	USOe8gsQkbK7Pz+JfEqU8ka/6iE4Tu5iev7VwIqoE6aZ3oCmdZh9jiLnitBhfluSXpSBtV6
	phJfk/3imBbW6RGnx7H5glfDhjwobjYPB/dFXdNjE8Zygyp+SpO8izUYzGD7fGl6SNLjL3U
	aQ6R2FvA6FavGQaF7aDpz14X906aBIDtsasPmZjiqXkQSP3rGLvNXYxx7tT0c0f/tFE+q2V
	bOo4Q1+uGS7mrmHo7Y1ip0Tew4g9Z3XBoz/GrgBTLpWUGxNLowPVPyXP8+OEgPWC79ZtUdK
	kfvskH0jaPNM1a7rYTj6ELbv2UAquLKE2u3ClQ8slD6x4nOliB9BxQb5EYlEfHomOWmPyNE
	8PavZSriiWCohTBu61X0W8GMQeuvj2pwJYSo4liCXb4Q0Wgjwq3SMovvnpS4DHGnSdhdGy8
	OWMJdpT5vtTPNHXc473jr8K6Uv8nKhli6pmUWwAQP2Lwdp5TfqFGVAm6CP+NoltTbZv4rQq
	q5cT8q8PmOKhDpk1eofzGMqLooAXSf6DZh20SyD7Snyd9PffnbCHRCrWrQUiJ3ypx4cvsa+
	zKhVt1hcsVeDHUE3OmQ2MR0Egx2wKaQ7Ft+ABGoVcRJHWDYWPQIxqQHhmOBEP0TsjtOBA9m
	ltZVq+c32oSbxreOasWYgZugQcunLy0+tqcP1VK9Px8y9pGBgmNT1oHCj4ZFTQ/7TajIgH9
	gxk+yDKnwvUpTFyU802VWCRNmPNFZuJuNg+LJAVopqZ+FMC6DUfoFUfrKGU5lbZV5N+M0rM
	bSBwPCkiWa2w/9S+ukhfSyCYceAiomNVQBkMyEvVEF2xwvlRmAk2l1PERP8T0DeSRWTI8hK
	hPLvRR8nnFHV4AeXKdHE0RgpeZ8AxfToi9/swuSeEg/+iuDLya2cbQ0CEzNGTAWatgE7l/0
	2h+4+Ps/AD8minpSQ5vzLOjIyQrkpWvmcGX0uovxbm9WW2cfTVolUcKAytF2qGfdJ651Bka
	KLftjQ4Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53127-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dingyihan@uniontech.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,syzkaller.appspotmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:mid,uniontech.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D3AD167EFF
X-Rspamd-Action: no action

Hi Thomas and Abd-Alrhman,

While looking into this exact same syzbot report, I noticed that 
`vidtv_ts_pcr_write_into()` in the same file also suffers from the
 exact same pass-by-value anti-pattern (passing `struct pcr_write_args` by value). 

Since `pcr_write_args` also contains implicit padding, it remains a potential trigger
 for identical KMSAN uninit-value warnings during fuzzing in the future.

Also, regarding Thomas's concern about modifying shared data: passing the struct 
as a `const pointer` (e.g., `const struct null_packet_write_args *`) 
would perfectly guarantee that the state remains read-only.

Thomas, would it be worth submitting a separate patch now to fix `vidtv_ts_pcr_write_into()`
to prevent future KMSAN errors? Or would you prefer this to be addressed together in Abd-Alrhman's v2?

Best regards,
Yihan Ding


