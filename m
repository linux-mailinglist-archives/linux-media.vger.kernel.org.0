Return-Path: <linux-media+bounces-54244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKDwD7YqpmknLgAAu9opvQ
	(envelope-from <linux-media+bounces-54244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 01:26:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE681E71CE
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 01:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 039B930791F5
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 00:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8E820D4FC;
	Tue,  3 Mar 2026 00:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l2TquD5C"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EA1DF26E;
	Tue,  3 Mar 2026 00:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772497570; cv=none; b=Jui7Isf4bwWPcV4sYpc5BcfeEQcspCyAC0y1uFPz432ayk4I4llIjZNWVXirRb+n6Jj2vs+KXQlDo+SBoSuuo8mJweRqqKbhtnpJY+FChfYh6vkZW0IjHSqkqtNBYNU5ducmVRQ7CMUn9Ml9YJUdn88qq9NXvkh9QDem5UgkBBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772497570; c=relaxed/simple;
	bh=nvbePl0CEYS4+L/6FTUnYwtO7w+lj1CwvH0QATF0abw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTfcscFKAU7P2MYBhB+1VCKGm+9+CGhvrQkD6B45daCilcEbjmmQjgYJ6VeQtm/PrqWGr2bG0ATIWZDfeKa/EuhHzxuvYTWgLY6Y1ZEUG8YV46HAkA/z/6pI9J5uQ9RQpx5/zHUpp1XVNyMRVqm/bU2JLpadBY8lmQJWlKyeM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l2TquD5C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772497567;
	bh=nvbePl0CEYS4+L/6FTUnYwtO7w+lj1CwvH0QATF0abw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l2TquD5CV5jD/gLJ3IBBpxsFsPaNM0jbvYXpMcVZB+R6GX2G5hZSDjH1TLO/VvqWh
	 LiLMLOQiXb8Q/7TkVbjWoEUtEEnHZNn+goDvA7scw/ghQfNgkLuC406bTduv7svO2p
	 y84SqoWMUmMtAkfSkOkZM+zI5m+b2Q1QzjzszNV7rf2JOXPr4LTpyicI1y3PCybrF5
	 k31wAmOAY3snxOHJfwiYXA7xYIyaFI0jz8PDnwpCTYWLXEVbFfuFQEBuZtDmeBx1LS
	 QoMS9mHsMi3WvHbYsKJcHZPzriAbinthd0KzI7NeYRRCye7m8DuqZukQ4SWdKrDHi1
	 qvIKnj+ewDlGQ==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B36A17E0EA0;
	Tue,  3 Mar 2026 01:26:06 +0100 (CET)
Message-ID: <a70731e8-375a-4ba9-b142-600b92ae1087@collabora.com>
Date: Tue, 3 Mar 2026 02:26:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <59b442c8-da2a-40a8-b9db-1609a8eee744@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9DE681E71CE
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
	TAGGED_FROM(0.00)[bounces-54244-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Action: no action

Hi Krzysztof,

On 2/28/26 11:58 AM, Krzysztof Kozlowski wrote:
> On 28/02/2026 10:54, Krzysztof Kozlowski wrote:
>> On 27/02/2026 18:42, Cristian Ciocaltea wrote:
>>> On 2/27/26 7:13 PM, Conor Dooley wrote:
>>>> On Fri, Feb 27, 2026 at 01:37:17PM +0200, Cristian Ciocaltea wrote:
>>>>> Hi Krzysztof, Conor,
>>>>>
>>>>> On 2/27/26 9:46 AM, Krzysztof Kozlowski wrote:
>>>>>> On Thu, Feb 26, 2026 at 12:46:53PM +0200, Cristian Ciocaltea wrote:
>>>>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, two more
>>>>>>> register blocks have been provided for the video decoder unit.
>>>>>>>
>>>>>>> However, the binding does not properly describe the new hardware layout,
>>>>>>
>>>>>> As you shown me last time with excerpt of address spaces from
>>>>>> datasheet/manual, the binding correctly describes the hardware and above
>>>>>> sentence is not true.
>>>>>>
>>>>>>> as it breaks the convention expecting the unit address to indicate the
>>>>>>> start of the first register range, i.e. 'function' block is listed
>>>>>>
>>>>>> Imprecise wording. "start of the main or primary register range"
>>>>>>
>>>>>> (if you have 0x1000 with one reg and 0x20000000 with everything, the
>>>>>> unit address will be 0x20000000).
>>>>>>
>>>>>>> before 'link' instead of the opposite.
>>>>>>>
>>>>>>> Since the binding changes have been already released and a fix would
>>>>>>> bring up an ABI break, mark the current 'reg-names' ordering as
>>>>>>> deprecated and introduce an alternative 'link,function,cache' listing
>>>>>>> which follows the address-based ordering according to the TRM.
>>>>>>>
>>>>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>>>>> anymore, while the information they offer is not very relevant anyway.
>>>>>>
>>>>>> This is fine for me.
>>>>>
>>>>> Thanks for the additional feedback!
>>>>>
>>>>> If I'm not mistaken (please correct me), the only remaining (hard)
>>>>> blocker for the series would be to improve this commit message.
>>>>
>>>> No, you also need to fix the problem I pointed out about reg-names being
>>>> optional on the devices you're relying on reg-names for. 
>>>
>>> My only concern is that by marking reg-names as required we would break the ABI,
>>
>> You are ALREADY BREAKING the ABI. Really, for absolutely non-important
>> cosmetic change in unit address, where I asked you repeatedly to fix the
>> unit address, you change the ABI affecting kernel and DTS users.

I thought we've already reached consensus to allow extending the binding and
keep both lists, precisely to avoid breaking the ABI.  At least this was my
understanding according to your reply [1]:

  You can have also oneOf with older list "deprecated: true", if want to
  keep any users unaffected.

And this patch was meant to do exactly that.  Did I miss something?

>> This is barely acceptable, but I am just annoyed already explain it to
>> you multiple times.

There is no need to explain it again, we've got your point.  We've also brought our
arguments and I had the impression that we eventually agreed to keep the unit
address unchanged, based on your comments [2]:

  Yes, with drop of the oneOf this would be fine.
  I meant, the "one item option" in oneOf.

Is this not applicable anymore?

>> But now you claim, you can break ABI for cosmetic unimportant change,

No, breaking ABI wasn't our intention here.  If we put the issue with reg-names
being optional aside for a moment (as that one will be handled separately), is
there still a problem with the current revision?

>> but actually doing something meaningful is a no-go?

Making reg-names mandatory has been already clarified with Conor and agreed [3]
to be handled in a dedicated patch.  And that one will indeed break the ABI, but
it's unavoidable, unfortunately. 

>> At least use correct arguments if you want to discuss.

Sorry, I'm not sure what do you mean.  I really believed that we managed to
address all the open topics by now.

Thanks,
Cristian

[1] https://lore.kernel.org/all/1cdc36f2-6e51-492a-9063-7d0a784f5118@kernel.org/
[2] https://lore.kernel.org/all/12b30229-1c55-429d-8a3c-0d831c4d33ab@kernel.org/
[3] https://lore.kernel.org/all/20260227-urologist-gratitude-7984733f2d41@spud/


