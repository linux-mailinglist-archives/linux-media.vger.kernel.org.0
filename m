Return-Path: <linux-media+bounces-53755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAm+CPLYoWlcwgQAu9opvQ
	(envelope-from <linux-media+bounces-53755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:48:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E191BB9CC
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9E7B3061AFE
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C5A44BCB2;
	Fri, 27 Feb 2026 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IdnW9gYr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC85361DC8;
	Fri, 27 Feb 2026 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214177; cv=none; b=NFcb0F7sWTc709BYW+52M5ykFYpEGBgrbyWy9CErKnJnFY4hRmkM8xdKdjlCe2XF6k4EBIHF9wrrS9fXiSCf6dMTZmLNWE8+8MAHcWy016BWDZ+B3BEVq+xH73hgu/cr7vgsUhHCZfxlJ3nZJa3cgDk6mHo7WAnVTNoQLY9i66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214177; c=relaxed/simple;
	bh=aDAKaw20C2di4uN7BXhImcGDLjfd5fyDY9Dh/9GzZsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsniXEqxl25wRuGyhWEl5f6NA4uadm+sFZXsWLwhoHUOoWZGFgp3KWIyudnk7MEvlGVsiPeJgrT4kOB3GRV3Gtc61yiEaxMzOme8ZZeA+cNnlfZboCUzYKiFWkKoM3jOzEP/CSoezBMCChPOSW3wl6VrBB7kG34MbOFNLb3yVVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IdnW9gYr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772214174;
	bh=aDAKaw20C2di4uN7BXhImcGDLjfd5fyDY9Dh/9GzZsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IdnW9gYrbNJfc/RG3EWyuzv7sY7WI/C7ZO2Uvr1qDCKyf8QvO0tjrmFG980Azn9I1
	 JXm4kMMICJ5c17MkWlEpUdsQw40imN+QoZzH+oExhDQXIbON74Ve09LPnqLbLEXal7
	 mMUaDCgzBR/Zd9Xjf3eUmNatNRb9Q8zNAXalmAZ3Kc5ypyQyoZ5K/Acuh5pmRwIvGB
	 ULCQIj+9ZnBZX7h62KIwO8aHTEs8UO+yeW8NsZ77hk1HrfJYU2TUzCjOQVyD3cN3e6
	 u9ciT268ZhvsGdlGkAhv2wyNt/OzUGUWJkx1zP7qgfYmFcIRFN3cqRRJF5sDWzuZiC
	 sFnyxihP3TOSg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23A4817E03E5;
	Fri, 27 Feb 2026 18:42:54 +0100 (CET)
Message-ID: <3ab4f91e-37d0-4950-af88-01920705d31a@collabora.com>
Date: Fri, 27 Feb 2026 19:42:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260227-observant-roaring-ara-ef7eb0@quoll>
 <adbbdbb1-b126-4807-821c-c9850befd695@collabora.com>
 <20260227-omission-stoic-417d7109ad4d@spud>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260227-omission-stoic-417d7109ad4d@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53755-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74E191BB9CC
X-Rspamd-Action: no action

On 2/27/26 7:13 PM, Conor Dooley wrote:
> On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
>> Hi Krzysztof, Conor,
>>
>> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>>> register blocks have been provided for the video decoder unit.
>>>>
>>>> However, the binding does not properly describe the new hardware layout,
>>>
>>> As you shown me last time with excerpt of address spaces from
>>> datasheet/manual, the binding correctly describes the hardware and above
>>> sentence is not true.
>>>
>>>> as it breaks the convention expecting the unit address to indicate the
>>>> start of the first register range, i.e. 'function' block is listed
>>>
>>> Imprecise wording. "start of the main or primary register range"
>>>
>>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>>> unit address will be 0x20000000).
>>>
>>>> before 'link' instead of the opposite.
>>>>
>>>> Since the binding changes have been already released and a fix would
>>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>>> deprecated and introduce an alternative 'link,function,cache' listing
>>>> which follows the address-based ordering according to the TRM.
>>>>
>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>> anymore, while the information they offer is not very relevant anyway.
>>>
>>> This is fine for me.
>>
>> Thanks for the additional feedback!
>>
>> If I'm not mistaken (please correct me), the only remaining (hard)
>> blocker for the series would be to improve this commit message.
> 
> No, you also need to fix the problem I pointed out about reg-names being
> optional on the devices you're relying on reg-names for. 

My only concern is that by marking reg-names as required we would break the ABI,
since the RK3588 related changes in the binding (not the DTS ones) got already
released (i.e. since v6.17). That's also the reason we went with this deprecated
order approach.

> The new commit
> message I am happy with, provided you also add the information Nicolas
> provided about the impact on users.

Nicolas, can you please provide here the statement so that we can agree on the
wording?

Thanks,
Cristian

> 
>>
>> How about the following:
>>
>>     With the introduction of the RK3588 SoC, and RK3576 afterwards, three
>>     register blocks have been provided for the video decoder unit instead of
>>     just one, which are further referenced in the datasheet by 'link table',
>>     'function' and 'cache'.  The former is present at the top of the
>>     listing, starting at video decoder unit base address.
>>
>>     However, while documenting RK3588, the binding broke the convention
>>     expecting the unit address to indicate the start of the primary register
>>     range, i.e. the 'function' block got listed before the 'link' one.
>>
>>     Since the binding changes have been already released and a fix would
>>     bring up an ABI break, mark the current 'reg-names' ordering as
>>     deprecated and introduce an alternative 'link,function,cache' listing
>>     which follows the address-based ordering according to the TRM.
>>
>>     Additionally, drop the 'reg' description items as the order is not fixed
>>     anymore, while the information they offer is not very relevant anyway.
>>
>> Regards,
>> Cristian


