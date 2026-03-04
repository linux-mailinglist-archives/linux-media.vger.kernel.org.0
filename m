Return-Path: <linux-media+bounces-54538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFY5BpCjqGnKwAAAu9opvQ
	(envelope-from <linux-media+bounces-54538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:26:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB0D207F79
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFBE5301C941
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 21:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E757388383;
	Wed,  4 Mar 2026 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hwVg+qqt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5511E386444;
	Wed,  4 Mar 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772659594; cv=none; b=aHtgBOMS8a0HDGicjTjuQmsan23tnKoUTMh30ikK9YrX4fYjs9U86TnyeTjDhuWvxz4NFTK/zRMZq6m2ziIP1zPsMTcON46mv76xdAcMLJ9cak5SEveHe5K/DzF4kVQjB8pkJEfUh8dwfyX8fzsbnycmmeMX815bNy9dAKHzKxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772659594; c=relaxed/simple;
	bh=4Xnncoe1im22Gd++O66NN0sXnUSV5WQx7hFdbwwMeuE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ciEnwR2rQNcmP6pJTdKpY3u5bBDAmz6jKSVebFq1pniIBrpjoGNHKXgeBk9SNOvU7wS+6HehiWNq0FsnZEI0xaYomWxuOf0v/P5QifKrJ9JLNBZU492B22Iy2Yxl6c7k1aeOmvjTaHqCFaU+kU87IZbsLeSSWgP7xiMJXoT6ZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hwVg+qqt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772659591;
	bh=4Xnncoe1im22Gd++O66NN0sXnUSV5WQx7hFdbwwMeuE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=hwVg+qqtO823WxAJrDdekGg0chWwLiX4jglTnkBf8EftMdLJo3X0ERvFktguk0FuT
	 5Myz8LO83G8etw3Kf1o65DY6ajSnktkLk0SVxlNFOV4eXoTEgsyKegFYlrVMaxsqQN
	 ceibHgPOPhD5De4U5ydFOuWo19kTV4oCkD+AjoAwBk52ZNiDYsPmtsel9tz+lv2sD4
	 JUzY1dbGd55uTyFIdCs/RzD+9z9nUCPdFzqO8i0ryksDCvMcOmxENb5hrkUtNYeG5s
	 z6J49eU0YAnrQ9oHoMN1CK934sTfUJGBEpwpCO7DLs8NV4VcVJAwNryRyZggEgMjHA
	 qbTvF6TUanEyQ==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3EFB17E0A2D;
	Wed,  4 Mar 2026 22:26:30 +0100 (CET)
Message-ID: <cce68679-8dcf-4c8d-8a66-df426c037f6c@collabora.com>
Date: Wed, 4 Mar 2026 23:26:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
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
 <1fe5529f-cd9f-4960-b6dd-96a2d02b8d86@kernel.org>
 <59b442c8-da2a-40a8-b9db-1609a8eee744@kernel.org>
 <a70731e8-375a-4ba9-b142-600b92ae1087@collabora.com>
Content-Language: en-US
In-Reply-To: <a70731e8-375a-4ba9-b142-600b92ae1087@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7EB0D207F79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54538-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/3/26 2:26 AM, Cristian Ciocaltea wrote:
> Hi Krzysztof,
> 
> On 2/28/26 11:58 AM, Krzysztof Kozlowski wrote:
>> On 28/02/2026 10:54, Krzysztof Kozlowski wrote:
>>> On 27/02/2026 18:42, Cristian Ciocaltea wrote:
>>>> On 2/27/26 7:13 PM, Conor Dooley wrote:
>>>>> On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
>>>>>> Hi Krzysztof, Conor,
>>>>>>
>>>>>> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>>>>>>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>>>>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>>>>>>> register blocks have been provided for the video decoder unit.
>>>>>>>>
>>>>>>>> However, the binding does not properly describe the new hardware layout,
>>>>>>>
>>>>>>> As you shown me last time with excerpt of address spaces from
>>>>>>> datasheet/manual, the binding correctly describes the hardware and above
>>>>>>> sentence is not true.
>>>>>>>
>>>>>>>> as it breaks the convention expecting the unit address to indicate the
>>>>>>>> start of the first register range, i.e. 'function' block is listed
>>>>>>>
>>>>>>> Imprecise wording. "start of the main or primary register range"
>>>>>>>
>>>>>>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>>>>>>> unit address will be 0x20000000).
>>>>>>>
>>>>>>>> before 'link' instead of the opposite.
>>>>>>>>
>>>>>>>> Since the binding changes have been already released and a fix would
>>>>>>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>>>>>>> deprecated and introduce an alternative 'link,function,cache' listing
>>>>>>>> which follows the address-based ordering according to the TRM.
>>>>>>>>
>>>>>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>>>>>> anymore, while the information they offer is not very relevant anyway.
>>>>>>>
>>>>>>> This is fine for me.
>>>>>>
>>>>>> Thanks for the additional feedback!
>>>>>>
>>>>>> If I'm not mistaken (please correct me), the only remaining (hard)
>>>>>> blocker for the series would be to improve this commit message.
>>>>>
>>>>> No, you also need to fix the problem I pointed out about reg-names being
>>>>> optional on the devices you're relying on reg-names for. 
>>>>
>>>> My only concern is that by marking reg-names as required we would break the ABI,
>>>
>>> You are ALREADY BREAKING the ABI. Really, for absolutely non-important
>>> cosmetic change in unit address, where I asked you repeatedly to fix the
>>> unit address, you change the ABI affecting kernel and DTS users.
> 
> I thought we've already reached consensus to allow extending the binding and
> keep both lists, precisely to avoid breaking the ABI.  At least this was my
> understanding according to your reply [1]:
> 
>   You can have also oneOf with older list "deprecated: true", if want to
>   keep any users unaffected.
> 
> And this patch was meant to do exactly that.  Did I miss something?
> 
>>> This is barely acceptable, but I am just annoyed already explain it to
>>> you multiple times.
> 
> There is no need to explain it again, we've got your point.  We've also brought our
> arguments and I had the impression that we eventually agreed to keep the unit
> address unchanged, based on your comments [2]:
> 
>   Yes, with drop of the oneOf this would be fine.
>   I meant, the "one item option" in oneOf.
> 
> Is this not applicable anymore?
> 
>>> But now you claim, you can break ABI for cosmetic unimportant change,
> 
> No, breaking ABI wasn't our intention here.  If we put the issue with reg-names
> being optional aside for a moment (as that one will be handled separately), is
> there still a problem with the current revision?
> 
>>> but actually doing something meaningful is a no-go?
> 
> Making reg-names mandatory has been already clarified with Conor and agreed [3]
> to be handled in a dedicated patch.  And that one will indeed break the ABI, but
> it's unavoidable, unfortunately. 
> 
>>> At least use correct arguments if you want to discuss.
> 
> Sorry, I'm not sure what do you mean.  I really believed that we managed to
> address all the open topics by now.

I've just submitted v5.  For some reason the link to the cover letter [1]
doesn't seem to work, I'm getting:

  Message-ID <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
  not found

But all the others are just fine, e.g. [2] is the for the 1st patch.  I've never
encountered something similar before.

Regards,
Cristian

[1] https://lore.kernel.org/all/20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com/
[2] https://lore.kernel.org/all/20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com/




