Return-Path: <linux-media+bounces-65890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q1jZGFRGQmoQ3gkAu9opvQ
	(envelope-from <linux-media+bounces-65890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:17:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A858E6D8CBE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:17:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=r8wcaIQ4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65890-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65890-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E8EE302497C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A8A3DB639;
	Mon, 29 Jun 2026 10:14:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E2433D4FB;
	Mon, 29 Jun 2026 10:14:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728052; cv=none; b=YL3+w4Uz0i6Hhy+FksZO3+Wf6JB1uKvuNsCErZdRkA0ANyfzsPBrzXvAtrOHrRL5F0QA0OmD6eryQulAciyY0xJsk4ZBnltPgzVIAe+yTqa2XmSvbv1jyApjrLrpmdw3lVNcf+QLdZMsO9C/Y1pgockbVcm/XoaRZBDP0WSOhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728052; c=relaxed/simple;
	bh=O11z5Mh7qQ9awlILRJKm3WCGLEwCjrY8Jq73exW41bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJ3vIyJxJCtCNWOGBBkUYtGjChV+A056XouMXAPgg8lEsu1n5cGqLC/XA19B43671O7XYuQ4ETQDYh8PW/y69SZaYjk96WXeF+DscCbAANN4gBkrNrVVG9G5wpIpf7HZ4K0+6Ly9SrENnrCxmyK2jRmbe6MaDOThiW5lVTDPg+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=r8wcaIQ4; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A6721A00;
	Mon, 29 Jun 2026 03:14:05 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214523F836;
	Mon, 29 Jun 2026 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782728049; bh=O11z5Mh7qQ9awlILRJKm3WCGLEwCjrY8Jq73exW41bg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r8wcaIQ4DSAgS2kMFjbihnLhan6yFxXetcNFYE7laiZ/vuwd4252qOe1Rci3wlNh0
	 GAkb8Xumgq++pRZNnLqI6K04xfXBiY+436571oZeoYtR695hWO+GrDEhV4wMUR+ChH
	 VptxFoZ+ik8d+BRbJqnx7+iNNWPpkvCKV9Ux1tsE=
Message-ID: <bbe03963-8b79-4291-9d29-18819fe40440@arm.com>
Date: Mon, 29 Jun 2026 11:14:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: mali-c55: Implement Gamma block validation
Content-Language: en-GB
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 laurent.pinchart@ideasonboard.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-4-113584c05174@ideasonboard.com>
 <79a5548b-39a3-4e64-8c7b-81ed6166a2c5@arm.com> <akI3qTMs_P0aJpWU@zed>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <akI3qTMs_P0aJpWU@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65890-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A858E6D8CBE

Hi Jacopo,

On 29/06/2026 10:19, Jacopo Mondi wrote:
>>> +	/* Check the first and last gamma lut entries match the expectations. */
>>> +	if (gamma->lut[0] != 0 ||
>>> +	    gamma->lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS - 1] != 0xfff) {
>> I am still learning about these things and might be wrong. Should not we also
>> validate that intermediate LUT entries are monotonic and non-decreasing?
>>
> Eh, good question.
> 
> This all new for everyone, as this would be the first user of
> 'block_validate()' in tree.
> 
> Here I checked only the first and last member because it seems like a
> good compromise between performances and correctness. This function
> might potentially run for every frame (where a CCM table is specified
> by userspace), so I'm a bit unsure how far we should go with
> validation.
> 
> I kept these two patches broken out from the ones that introduce the
> uapi specifically to get feedback on this. Maybe I'm overconcerned
> about the additional cost of validation ?

I am not sure either. As a strategy I always prefer to be on the safe side hence
my comment. Is there any way we could come up with a comparative analysis and
check what's the impact of these additional costs? This should answer my
question I guess.

-- 
Regards,
Vincenzo


