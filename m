Return-Path: <linux-media+bounces-56188-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAkhG21xumnRWQIAu9opvQ
	(envelope-from <linux-media+bounces-56188-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:33:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4982B91B5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04BFE30DAF0B
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE8C3B4E96;
	Wed, 18 Mar 2026 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wkMM3Vif"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FF03B4E99;
	Wed, 18 Mar 2026 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825761; cv=none; b=TfhmW8qyC5skzH7iISFi5BqQpv1iY2SbO2mun9/iD+P212tBqFLFsrrGnyYwttewJKfwk/t7N2Ly7b3seDbH/eePt9l59XPCdy+nRcqBMYYrZD+nRg0i4F+egsfBRKuxHdj8Rc6PldapaclArfScjp0s+uABS7k/KA9GEwS7zF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825761; c=relaxed/simple;
	bh=nLLHvjaxrh4ZRpm3hc7ZaF6BY3VkU4esiuZ2AXUFoHM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FZORr2EXKO1Ax6qMbsJUxB+jfxjMJ2wrUapf8KYdsHcc4M4M8vna04V0ePg6iJ66uHkru7a+5AEkf59olgW4oUvgL4CgelffuWia5N9C8oB2L9Ps/e9Il/6zDNaRlFjo3hoiMA1AYvycxJGVH+KoMqd+y1MWBKbVpkKbiCL7RFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wkMM3Vif; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773825751; x=1774430551; i=markus.elfring@web.de;
	bh=nLLHvjaxrh4ZRpm3hc7ZaF6BY3VkU4esiuZ2AXUFoHM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wkMM3Vifcacc+vToyqswtoLgmbvJTZyEBFRJUKWVPvdy1c7yLa8vlTHzBZumLBnO
	 grei3+to6EGxARzKBxpXGz8b3mSVEPioKt9vP3zGsRDlvjYoW7qCppz/4JLQETobH
	 Iw9P1mIPbXj1hoKICPPkUFzF9ShhzMkCRxAtH2Bx/ZLUlJDCrS6cONiosS7XVwHQL
	 fli0xbyc3GlV1RryhI1Yh192I692wixdPKfRT44CcDOjEFd4dBxQAAfYBbycxca4V
	 kqRjc1pHxH99r8I7WYmrlFCQ3h2Pw66xaE/1XBJlzNOX5CzR9mO3dhqy2KDJudZkn
	 QIvvVDAY6WW04lCTlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MhWor-1vP4VA0nv1-00ZJbO; Wed, 18
 Mar 2026 10:22:31 +0100
Message-ID: <43dacf24-123e-4957-97e8-1c9e806ab273@web.de>
Date: Wed, 18 Mar 2026 10:22:27 +0100
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
References: <20260318-vip-v1-3-5fdcdbd01829@gmail.com>
Subject: Re: [PATCH 3/3] media: ti: vpe: Fix the error code of devm_kzalloc()
 in vip_probe_slice()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260318-vip-v1-3-5fdcdbd01829@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mKztdfv7GtUmmfpWsI9eFW5XjFb+J782A6jy71XBwJSkzez2ey3
 9V6yRzUcjLYuCm/oejt9oqDQEMrgRFCFjAaKKQsiLFokvWyyWTGpS7bhFANbRZo95V/jGUz
 kcRD5CtGblTdSbv92n4q/yKWW3R88f+gb9/HMX6jbTDc6UFV63NzupwpvxcbqGpf1u+l8K0
 hmNSw7XYWptf7klYnrmnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7riMJHrCI+M=;xakqhr6MHsSc8Yocc3QmFPhA0RF
 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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56188-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,ti.com,farnsworth.org,kernel.org,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: DF4982B91B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> In vip_probe_slice(), the error check for devm_kzalloc() incorrectly
> uses PTR_ERR_OR_ZERO() which returns 0 for NULL pointer.
=E2=80=A6

I find such a change description improvable.
Return statements should be corrected because a corresponding failure pred=
icate
is known already for the called function.
https://elixir.bootlin.com/linux/v7.0-rc4/source/include/linux/device/devr=
es.h#L48-L51
https://elixir.bootlin.com/linux/v7.0-rc4/source/drivers/media/platform/ti=
/vpe/vip.c#L3455-L3527

Regards,
Markus

