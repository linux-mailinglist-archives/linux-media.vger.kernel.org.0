Return-Path: <linux-media+bounces-61910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCeLFMnRCmru8QQAu9opvQ
	(envelope-from <linux-media+bounces-61910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:46:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24856911F
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 140EB302F6B3
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 08:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B6B3E3166;
	Mon, 18 May 2026 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="A4FDVe8F"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401633E2AB8;
	Mon, 18 May 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093446; cv=none; b=BRCgKEn/ndapIRexy+N5ehMHX7QjNGDQvOGes3rGoILNMuYduqpCedxhbWFGjM37uKAF8+nJrp8EUap8BuKt16xbUy6oOZ/tFe2A2V8veNnECnw3SxXlfuYg2mTTLy0k1M37ajt1PHJSFLzvFjuledTFTc2mOzZtxSN/A+A68gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093446; c=relaxed/simple;
	bh=ggCi8n/BT9NoJR+AAcDowFfFGXlbfTYVC0uSMhMcJvQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=UbX5blfgYULKwHNN7scqxyMbIYAguOB0xG443BmAJKtOI4KJovqRzGCHjevkI6B5p0SZHl/LiuGfjSHuTakRwRYebApFiJFQV1+FQFVMpuBmIEXGLKgyIjfdlgwOECZT17ePYz/n3eei2gyZHbo5uJGUQU9TTgp+6rcZLrOT3n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=A4FDVe8F; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779093442; x=1779698242; i=markus.elfring@web.de;
	bh=ppS8uYay3QGOnM7C0BPNyYJQy3U1nTCIK2ZlFp1+LBg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A4FDVe8FNA12eGQeTK8MJCdkpDARgO82oQ9MRxd+uPcSIcTdP2Z5QOV9txhVj2f5
	 CZzSB5PGanuLzLGNa7kWwqLrfyz1Qryi/IVkRtFYZ6A1AZouGW6BuIsGKNkYe1MOc
	 qlkj59+NLKkV7jb1AQtGRLClAYAohVeYnweR9LSDZXDn9BdHcHz+51Ojy7UMlZkXI
	 PXXN7Yzq+pU+Vx3jFocO8mS7sEivR8IyaeWX8V7fhj+Jx5gq23m7EWuUmAeBZdyv6
	 qng2BBjgMQMapEYq/qETAAiiNiXI3cOGr2Jrp9ACrcOLhLU/PR/xSu7nrTmkIEG5I
	 43GkBiCucSgJI7MVWg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlL9z-1x5wsB0NUD-00o4mE; Mon, 18
 May 2026 10:37:22 +0200
Message-ID: <a77b88d4-249e-4c9e-b529-72127bbb1103@web.de>
Date: Mon, 18 May 2026 10:37:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dawei Feng <dawei.feng@seu.edu.cn>, Zilin Guan <zilin@seu.edu.cn>,
 linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jianhao Xu <jianhao.xu@seu.edu.cn>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
References: <20260515152529.1007540-1-dawei.feng@seu.edu.cn>
Subject: Re: [PATCH] media: bcm2835-unicam: fix dummy buffer double free when
 register fails
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260515152529.1007540-1-dawei.feng@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tx80KagCZZJg1dCw/zekfsK+LD3m2hVT3DSIOs3jDkDfennHF7w
 WD7aauMj07KuadCyu/H0jhPBcTamU4EQ1nzJbns08ZjECWQMzJkuYac4lCsY6nxkTfHttDC
 lHrQv3gUKlx57gbE5Zk/7c4m76Jr17+T65oWtaafHCc81yTDGGEaatR0keosZu8b/my1J8z
 5b+29JIIRL0IbQ7fcHeEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U7Rbl2jFnrY=;qmpmyer6HO8vle17dbUrkTN9dpn
 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
 GwWG9w==
X-Rspamd-Queue-Id: EE24856911F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61910-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[web.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

=E2=80=A6
> Set dummy_buf_cpu_addr to NULL after dma_free_coherent() in both the
> local error path and unicam_unregister_nodes() so later cleanup skips
=E2=80=A6
                                                 so that?


> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1-rc3.

Under which circumstances will the mentioned software revision gap
be adjusted accordingly?

Regards,
Markus

