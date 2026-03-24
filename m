Return-Path: <linux-media+bounces-56873-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFQRD4uDwmlneQQAu9opvQ
	(envelope-from <linux-media+bounces-56873-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:28:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E89308377
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC8713103327
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB4C3F7879;
	Tue, 24 Mar 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kxPAgqRc"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CDC3E0224;
	Tue, 24 Mar 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354929; cv=none; b=LwdYcGws+dyMLPvCvm3mbvusnGQau8gcHlG0ckcd0f+DCBaFvx7Y1PxsJusj2Fb+txhwkgvvUfOQu+xSIz4r15/p76yjm7I0XaUEHR6GR2mIc3fXyUdHm5DCZx7YLN5ZBLj+fbIn4U9JOd3uOBQS9zQH9Ukz36lEtEIT/QcFJeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354929; c=relaxed/simple;
	bh=4VpnRqghmRANkFFcN5UdVj2KSaLq0xbcH4AV10YOhzY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=PEs3o56DuYDwEzRUVeHhhMpLi4HauwIZSkuN9vORHhqcbaJ+s36US9TYTjaXb6zdlsMNCv86AaeK76ptPkjOmGx4B6Q6HWJVCIt33faFRey9CVM1E1h0XuT2crWVqEHT57micPdeii4kF8JV0ehdhTLBxZiNqd3mlg84Fnt0Yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kxPAgqRc; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774354904; x=1774959704; i=markus.elfring@web.de;
	bh=4VpnRqghmRANkFFcN5UdVj2KSaLq0xbcH4AV10YOhzY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kxPAgqRcp8+dU8VnS/soV1FYF/xqddK/7iwoGXJTTIpDkoFIL2+Gwh9g97x76wis
	 M8Fd+VYwQPEd/ab78NAfIw/k7wm3nX36578lH0mevdCoANc8WlJnHfdCDgAQ8si69
	 BMc9ZQ35vZUEZa9Hi40NONdqElbIr1TnR7Nwj2YL+Z3y0hM63dtM2+C0R5fLg5Euc
	 pYcLH9J4H1fG6YSX4yeJ5PSUyXF47RhVKyqd8OyGt6kGZI1LKi1TxItJbrWK/sm6c
	 gWYpmSjDKAPJAsOCvkkac4ObfRCujbWwGS//2TXKTMDhN/xGf+V+gJs3FXReIeMyn
	 UDgXLmMdLSVMIBfEoA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MtPvm-1vGuU22Sxa-012KHM; Tue, 24
 Mar 2026 13:21:44 +0100
Message-ID: <e3b57c7f-67d8-4d35-bdd7-3d1b05a1f31b@web.de>
Date: Tue, 24 Mar 2026 13:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenyuan Li <2063309626@qq.com>, linux-media@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, gszhai@bjtu.edu.cn,
 23120469@bjtu.edu.cn, 25125332@bjtu.edu.cn, 25125283@bjtu.edu.cn
References: <tencent_FF07F161B5E002ECD9C7E2A9E2BD08B51B05@qq.com>
Subject: Re: [PATCH] media: ir-i2c: add error handling for I2C send in
 get_key_adaptec()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_FF07F161B5E002ECD9C7E2A9E2BD08B51B05@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zmzQFL8urPln5X2fd+rdJ90IidGDa/1qOf4xdgYei+wkImmT0Ch
 QdJ2uRl8grgSgBIqbKg9W3oHzYjl4NPQh2mtwvJD30MsbUI1cIgarlxjZa3ltcFHhej7nzg
 ojzB4zAiv05SC478cbXgTdnI01VgScl1cZCeK2WOCWiAIOhGfi3cqdPG6RA/RX8T44U6M2Z
 T1b3TrMCKPA0pnaAWxiOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fx1IVmRYI3I=;cA6z/eSOAG6DCDb20QrWFKGffRk
 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
 iz
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56873-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,vger.kernel.org,md.metrocast.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3E89308377
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> In get_key_adaptec(), a command byte (0x00) is sent to the IR chip via
> i2c_master_send() to initiate a key read. However, the return value of
> i2c_master_send() is not checked.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.0-rc5#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.0-rc5#n34


=E2=80=A6
> If the send fails, return 0 to maintain the existing behavior (no key
> detected), but log the error for debugging purposes.

Will such a technical aspect be reconsidered in more detail?

Regards,
Markus

