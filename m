Return-Path: <linux-media+bounces-56616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBJ1A2L0vmkslwMAu9opvQ
	(envelope-from <linux-media+bounces-56616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:41:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF22E709D
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66294301F9CB
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC9633F399;
	Sat, 21 Mar 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Dk/3qgBm"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B6303A35;
	Sat, 21 Mar 2026 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774122041; cv=none; b=vErYIJThq4Z6YNfChD2jyamBLmvs6qs3rdbeSr3N9eNNIXEEpsOUneFa4RLGWhtkT9Ke6sWv+umlCsAziUIwfaUH0AcW50XKl3rfhGKCVmLSAQuUIxUn0kC4+fTxznURQ+bKnjJaIRi2I+brtYp9ORRqxE61xDVcTgG94z2b1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774122041; c=relaxed/simple;
	bh=OHZ/ESH6Hj+Hmue65Hm23pZW8NvZetIeH+UDCwzNlrk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=HVuWVkJ4Xl8smndNqYnHbCYMQFoFFzq5IcGunXoP3PO/fyGsIuJCHBePfaXB/IGC+0GyF3LMRn7DGLE/Vdm22M5Wd9rZscmDhIdVN2I0+i4QSXmKKFl59Xu5lIkANgxt7HEbAcVoatM//tvzp4GL23g3NPeKH3zcydsLEkYtwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Dk/3qgBm; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774122015; x=1774726815; i=markus.elfring@web.de;
	bh=OHZ/ESH6Hj+Hmue65Hm23pZW8NvZetIeH+UDCwzNlrk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Dk/3qgBmzFfRPTDoB9Bsvb8EEjv1GYtYjnd1cmjsZc+pZmcOEKg3jLWSh7+G7hnx
	 oiGpSf0dnMpwCKYMghUV1/7djOpedeaMprE20HLfXFvrGET4R4gM9deYXWbF7U28G
	 0DlAgG4VPSKT2tHzZR9YIaYc6mGk/HlJrFslJCY5/mRawdXouapa61JCH8fXHOxEV
	 UOojyOODP/HQxALV5Bn9EhIzaU5NJ71pvMlJEOFqy2yMdgU+gDYRqCV1BJNPfvnma
	 TsJ6WU/CjhJOba3Qnw2InMfa1Fv55+L4+zXH38xUnVzAAHj1/AASaGbNhwewe1qlv
	 Gsgqii+Hiyas9y8USQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJFdB-1wJ6M007LP-00OHK7; Sat, 21
 Mar 2026 20:40:15 +0100
Message-ID: <67fc2039-ff97-48c5-adc5-a0e2aee6e760@web.de>
Date: Sat, 21 Mar 2026 20:40:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-media@vger.kernel.org,
 Benoit Parrot <bparrot@ti.com>, Dale Farnsworth <dale@farnsworth.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sukrut Bellary <sbellary@baylibre.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260321-vip-v2-3-d502c1954817@gmail.com>
Subject: Re: [PATCH v2 3/3] media: ti: vpe: Fix the error code of
 devm_kzalloc() in vip_probe_slice()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260321-vip-v2-3-d502c1954817@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Lvp6t8Q3p61WZ9nt6z/MB/veUdzmrTvYeBJ9Xbpnkl2K7Og3zt1
 8zrgfPrsk3EgOXIH6MPc7akO6AFXXaBZjR+1XqspXxZENhthZRcCS+1GwUkbxy/8DoXk1Ol
 KaGf+KmEERffoGdNRT3OJMM9NslCvkCEmgstCVyU8kKROYfve73FUB3r9QSpyeWnP8fUUjw
 rwQQSDAN1OPV6I2TCCg2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6I5mfJQCK0g=;ZQOE6p2rIFw2nRKWjcnV6/Xle9A
 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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56616-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,ti.com,farnsworth.org,kernel.org,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[web.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67AF22E709D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> In vip_probe_slice(), the error check for devm_kzalloc() incorrectly
> uses PTR_ERR_OR_ZERO() which returns 0 for NULL pointer.
=E2=80=A6

I find such a change description still improvable.
Return statements should be corrected because a corresponding failure pred=
icate
is known already for the called function.
https://elixir.bootlin.com/linux/v7.0-rc4/source/include/linux/device/devr=
es.h#L48-L51
https://elixir.bootlin.com/linux/v7.0-rc4/source/drivers/media/platform/ti=
/vpe/vip.c#L3455-L3527

Regards,
Markus

