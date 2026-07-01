Return-Path: <linux-media+bounces-66199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DaJYMBL4RGr+4AoAu9opvQ
	(envelope-from <linux-media+bounces-66199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:20:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 089A56ECBA9
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:20:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Om6ZEifE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66199-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66199-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3283084DA0
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EA643E4B1;
	Wed,  1 Jul 2026 11:17:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A543DA23
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 11:17:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904621; cv=none; b=V6b5N8kNMc7yA1i5FNLdbtE2pwZ1cOpWZPYhQRoQgC0WI+zzR4f8W/NYscNbAcNJ1dqPJswYKCVlxh6L9mzCTCpfyZYoqyMgjtIrhmrMc/Y60s2Ey5O0DkwUExN1hGXSiowV6HopmMWJl52M7rYDvt0cIY+AZa1OhcHrCdH5hQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904621; c=relaxed/simple;
	bh=cXmXT1FX+Ngr5D3PjGGrKoWnBj3CwH/3E3Kd8Mhrs6s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ihTg+AaJd7DfdKmGU21GNiNU3iC5Un+pnUPlBFQRg/UZHbHO7o6WH3kDFCWEsLc7Mslj4h+0ts/dMPJIqdeLYYa1rpGXCRlumCz4wFA8EUe1GSCsuEKC4Bblb3R2G7uvY+3IewgBsjYdm/DbTukVGmU9KnLSPon3MTdoWzN11bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Om6ZEifE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211CB1F00A3A;
	Wed,  1 Jul 2026 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904620;
	bh=UxHGWs/BHwri2T71jTiI7P9bGBDabFRCO6C5vD8CRJc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Om6ZEifEbBGF2MhQrdnnug1qRKgcBhoVgJmXSNpG4y3BO66CZ/qPw3tVcCAFLt0TZ
	 kAPWBiqxn42pnpgSuGii1C3/yPelUY9bn7yqr61DbDztrXfkGNPK9DBQnA0GQaNI/p
	 QTVKAQPvr0rT8x1+Pad2BDV8Isv/fnPpPT7iakzRtVoVkXd+CVxJhRC4YVrkWbvePN
	 CvlOxykpeAacdMnP4pKSH5Euy0ZMSKuq1kmJU8iFLi+Y1eqEIxGqt3kja7AFo5kWkd
	 RGuBtdYM6SXzJF3Lv+C6UudLPAnFKlhC0saHUYoOQTCGyr28HozEMpm1bfEkHQ8Dxe
	 DRcXXtRKTFsHQ==
Message-ID: <ef33a972-e1dd-4fb5-8b96-ec33522814f0@kernel.org>
Date: Wed, 1 Jul 2026 13:16:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: v4l2-ctrls: document expected validation scope
To: Linus Walleij <linusw@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
 <440e969e-425a-4ed1-9aaa-85addb332278@kernel.org>
 <CAD++jLmzWMWjV4-MThJe+30TqF0f=EmdMka=8eTPOagHWAsXUA@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAD++jLmzWMWjV4-MThJe+30TqF0f=EmdMka=8eTPOagHWAsXUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66199-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:laurent.pinchart@ideasonboard.com,m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:nayden.kanchev@arm.com,m:Konstantin.Babin@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 089A56ECBA9

On 01/07/2026 12:59, Linus Walleij wrote:
> Hi Hans,
> 
> thanks for clarifying!
> 
> On Wed, Jul 1, 2026 at 11:03 AM Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
> 
>> The main change here is that it explicitly states that S_EXT_CTRLS implies
>> a call to TRY_EXT_CTRLS is called. Something that was never clearly stated
>> before, but it's important to know this. Because of this change the TRY_EXT_CTRLS
>> and S_EXT_CTRLS paragraphs are swapped since S_EXT_CTRLS now refers to
>> TRY_EXT_CTRLS.
>>
>> And the TRY_EXT_CTRLS documentation already says that: "It is up to the driver
>> whether wrong values are automatically adjusted to a valid value or if an error is
>> returned."
> 
> This works for me, I missed that because I'm a rookie at this.

No problem!

> 
> For the above diff (I guess you want to send the patch? Else
> I can make it):
> Acked-by: Linus Walleij <linusw@kernel.org>

I posted a clean patch for this with your Acked-by.

> 
>> I just saw Jacopo's reply that the discussion was for parameter buffers, not
>> for extended controls, but the reasoning is the same: the driver must validate
>> at some point (ideally when the buffer is queued up so userspace gets the error
>> immediately), and ensure there are no security or stability issues. But if there
>> are, then that's just a driver bug.
> 
> I get it, thanks!

Regards,

	Hans

