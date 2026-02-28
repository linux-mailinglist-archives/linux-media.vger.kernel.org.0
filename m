Return-Path: <linux-media+bounces-53834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFsQF2e7omkE5QQAu9opvQ
	(envelope-from <linux-media+bounces-53834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:54:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F611C1D47
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 142DB302C5D9
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748163EBF04;
	Sat, 28 Feb 2026 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLr0iciQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78E3270552;
	Sat, 28 Feb 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772272475; cv=none; b=C9vJDJqWLEtb8vP7QbD+aPErrMpST5Hche0zFk9tvXzDXS8pDsZ/XIB0sieBc/kHGwBYckOYewzVHCIVMRsELxla/nz9WGZQf6VNCzOkoPTDjcGCxISz2b0PwKkUPMnL966ENQ6ogVav5zi66iOgwDUQ6Z5sjy5SCWp5Y8/58Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772272475; c=relaxed/simple;
	bh=YouXqvnP0taKGHklJH5cIaDhX7R1/igobBji1f49w58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9cqaCZxmKRhh7DdlQWj+OUtcIKJ5VXnu8tdxhu5dWEOLTxzdrXpP6lQhlre1RmhQn3w2Sai6+xklZHoHN5G87wSAPJm1PnxkSQBiiKrYA8ZwJwtyJk33k1kJRJVxyh3s5VjqkKUBTjbsY1WLvvY94HQpEF4Pyrvb3++Sl1nvsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLr0iciQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A02C116D0;
	Sat, 28 Feb 2026 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772272475;
	bh=YouXqvnP0taKGHklJH5cIaDhX7R1/igobBji1f49w58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eLr0iciQqYzyeJegC9ou3JYzCPQGiRD6iyZk/FvAPJn7LjWxoZCtM9mZr+ncM/IW/
	 LSnEl+FRkXITDqIyh9SAOPbl9xIV1MhTl6JHOZ/Y16XydHloEF/vqe4/qieBsfx8wE
	 Ta9hdkqnPNzXNldxX2Rut8glRmPPoF/Nvo8TFkfURHkH+pam8Nm2TMgcEOwV2RQQlo
	 0rVWcx05ELDSSA0FDwZD6aglEUC65FLDa42tIqHqIZ8iOq2mEU1leUp3TCLVmKshfI
	 WRodMOJvn8/UeHbzi1v6FWPd1rRBW9qr+AIGBBG9Q8rxs2pxGu3OSGNjPbc1+z+M4r
	 yp2ft605pTPuw==
Message-ID: <1fe5529f-cd9f-4960-b6dd-96a2d02b8d86@kernel.org>
Date: Sat, 28 Feb 2026 10:54:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
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
 <3ab4f91e-37d0-4950-af88-01920705d31a@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3ab4f91e-37d0-4950-af88-01920705d31a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53834-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2F611C1D47
X-Rspamd-Action: no action

On 27/02/2026 18:42, Cristian Ciocaltea wrote:
> On 2/27/26 7:13 PM, Conor Dooley wrote:
>> On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
>>> Hi Krzysztof, Conor,
>>>
>>> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>>>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>>>> register blocks have been provided for the video decoder unit.
>>>>>
>>>>> However, the binding does not properly describe the new hardware layout,
>>>>
>>>> As you shown me last time with excerpt of address spaces from
>>>> datasheet/manual, the binding correctly describes the hardware and above
>>>> sentence is not true.
>>>>
>>>>> as it breaks the convention expecting the unit address to indicate the
>>>>> start of the first register range, i.e. 'function' block is listed
>>>>
>>>> Imprecise wording. "start of the main or primary register range"
>>>>
>>>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>>>> unit address will be 0x20000000).
>>>>
>>>>> before 'link' instead of the opposite.
>>>>>
>>>>> Since the binding changes have been already released and a fix would
>>>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>>>> deprecated and introduce an alternative 'link,function,cache' listing
>>>>> which follows the address-based ordering according to the TRM.
>>>>>
>>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>>> anymore, while the information they offer is not very relevant anyway.
>>>>
>>>> This is fine for me.
>>>
>>> Thanks for the additional feedback!
>>>
>>> If I'm not mistaken (please correct me), the only remaining (hard)
>>> blocker for the series would be to improve this commit message.
>>
>> No, you also need to fix the problem I pointed out about reg-names being
>> optional on the devices you're relying on reg-names for. 
> 
> My only concern is that by marking reg-names as required we would break the ABI,

You are ALREADY BREAKING the ABI. Really, for absolutely non-important
cosmetic change in unit address, where I asked you repeatedly to fix the
unit address, you change the ABI affecting kernel and DTS users.

This is barely acceptable, but I am just annoyed already explain it to
you multiple times.

But now you claim, you can break ABI for cosmetic unimportant change,
but actually doing something meaningful is a no-go?

At least use correct arguments if you want to discuss.

> since the RK3588 related changes in the binding (not the DTS ones) got already
> released (i.e. since v6.17). That's also the reason we went with this deprecated
> order approach.
> 
>> The new commit
>> message I am happy with, provided you also add the information Nicolas
>> provided about the impact on users.
> 
> Nicolas, can you please provide here the statement so that we can agree on the
> wording?
> 
> Thanks,
> Cristian
> 
>>
>>>
>>> How about the following:
>>>
>>>     With the introduction of the RK3588 SoC, and RK3576 afterwards, three
>>>     register blocks have been provided for the video decoder unit instead of
>>>     just one, which are further referenced in the datasheet by 'link table',
>>>     'function' and 'cache'.  The former is present at the top of the
>>>     listing, starting at video decoder unit base address.
>>>
>>>     However, while documenting RK3588, the binding broke the convention
>>>     expecting the unit address to indicate the start of the primary register
>>>     range, i.e. the 'function' block got listed before the 'link' one.
>>>
>>>     Since the binding changes have been already released and a fix would
>>>     bring up an ABI break, mark the current 'reg-names' ordering as
>>>     deprecated and introduce an alternative 'link,function,cache' listing
>>>     which follows the address-based ordering according to the TRM.
>>>
>>>     Additionally, drop the 'reg' description items as the order is not fixed
>>>     anymore, while the information they offer is not very relevant anyway.
>>>
>>> Regards,
>>> Cristian
> 


Best regards,
Krzysztof

