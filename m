Return-Path: <linux-media+bounces-52814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCEmE611kGmCaAEAu9opvQ
	(envelope-from <linux-media+bounces-52814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:16:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0713C184
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EC5A300611E
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 13:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021B82FF158;
	Sat, 14 Feb 2026 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EWyA5Ol1"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966E149E17;
	Sat, 14 Feb 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074981; cv=none; b=mt4GKsgBuQGDap9wvx9KjMIUUJKn/bPu1gzzpqu19GO7BUV7fL0zZVRtr9pOPZw14Gb/kUHYF2vcSf2+KI8+gaaLVH+HA/dfH4F1pkRVQbMnWAGMbGny1Zh+MCuLujwcsRoELsr7DhLa+1TNiChRESQ2YXOmTaRFJVsLUEzD2C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074981; c=relaxed/simple;
	bh=dCDzYrcNJzBJuJLuKa2AU/ph7mWhPi+5lVeg5Us1GmA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=UknHcnR85XrNOYJ7mqkcIFEnKgsSmBP/UQ5Ne0V3zh6GBvUl1kT0pajEthZtV+xyTlb7xiZZ0bOisuNP2RTQ5xc3i1me5OhrU/cH884UMhcPv7yqHYNNFQ678oOOln00Kh36IFPDy8SOnrb3/Rq5PmRAlQ8YcDt0i2t2pVKo0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EWyA5Ol1; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1771074947; x=1771679747; i=markus.elfring@web.de;
	bh=dCDzYrcNJzBJuJLuKa2AU/ph7mWhPi+5lVeg5Us1GmA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EWyA5Ol1Z4RVq10zkGfW9yCpqtJp3I7s7cNiHacy6sptsQOG+SEZz9+DUylXLfxu
	 +c5CMBYJSmEZnpytOxy1I9dDDXl8r9tnnpvxh9sDPZNAzeATwuFUgOQ2ximsGl4Bj
	 /w9gXj1mp2HAJ+p7/9boYHXu8xwI8js1AsHYDCcQ3RO0/XLxONDjOo7UHv2zmsQY/
	 8Gyyi27RB9xUgTUapyu9bW4TD0dfoJMTj+6nPrL9UIBoUcrt3dwKe4f8EjU96JipB
	 2LSDOCcdmif/t8wgA9e1yVuHqVqVt8889IhAmAsrjARVofJf/fDvE41jboIuKute1
	 WhH489bw3zCdRQhcNw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.241]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwjFg-1vY3vV0Up8-00wYY1; Sat, 14
 Feb 2026 14:15:47 +0100
Message-ID: <756ef661-1da5-4b88-91cb-5b9dfd22915b@web.de>
Date: Sat, 14 Feb 2026 14:15:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Fourier <fourier.thomas@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20260213091330.23431-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH] media: iris: Fix dma_free_attrs() size in
 iris_hfi_queues_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260213091330.23431-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AidlMn1V8tSyXexlUOX9fF4yAzLCCwTbCvM29GeBQiNZr6hOntO
 rWgo6SzG0N5nVAxJC933kQxfXSG2sYRm3s5y8XnaXGvjKE3cU0dn9LjHk9d1sB0e24bROZ5
 YM1TltUkXc90pKV7bckj+e1gHzG/gQP2J+hloITMyZAUMwzNqRRfyxlYvt3LaIQ7rbw4ahg
 QLS2/cLwP46LkwQ8pPvMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SJRszulNY9I=;OD3R6Kdta+D5dDxEghQe0iiSc8q
 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
 mOWr6jRptxPJlq+GRbL79J112r/Iw
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52814-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[web.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38D0713C184
X-Rspamd-Action: no action

> The core->iface_q_table_vaddr buffer is alloc'd with size queue_size
> but freed with sizeof(*q_tbl_hdr) which is different.
=E2=80=A6

* Were any source code analysis tools involved here?

* You should probably specify message recipients not only in the header fi=
eld =E2=80=9CCc=E2=80=9D.


Regards,
Markus

