Return-Path: <linux-media+bounces-53424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EYDNCd3n2nScAQAu9opvQ
	(envelope-from <linux-media+bounces-53424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 23:26:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371E19E424
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 23:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B3343023D9E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 22:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11372330B15;
	Wed, 25 Feb 2026 22:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DLPQZ1qK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C9A2C0282;
	Wed, 25 Feb 2026 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058401; cv=none; b=b9PFCHvxBaxqviUlcLqip/VRxjLcobvMHnJp57Wi+s9F2u72p2uazJhO0U6XFZqW8TgGV+hTBee8+eHkThOO7y7gV+HfmjdPHc4wm5Nx2zEydP65lCkOEHmC5WFeHpQf7/PsQXB93ILIPgxv2UE3OMlv05KKElHpyxaS3Grbvkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058401; c=relaxed/simple;
	bh=k0xNHmg+Rg6PlS1Wra/0RI+5j9ZASPAy6uL892tIiMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoi5RaOdgCH2Nd62xUqyfLqeaKNia3YHy33brTCFSGxtlwjgN1BVE93frRRzHOryiymY+vp3OUotMvbDzgH7ZavrYEyYOwG6f7QSdp6npnGs54ipc1TtB7UqwAjfa4iGHTPcZolDc0BII9/eEsy5sBLZTsHAoN/fIYznYaqwxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DLPQZ1qK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772058398;
	bh=k0xNHmg+Rg6PlS1Wra/0RI+5j9ZASPAy6uL892tIiMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DLPQZ1qKtw0UPrCiH2oVW0xmo2GRHB9P+bSqPaE3iHm8F6eBR7XvhpIfEjh3pBidG
	 tmE3bOZ8btb+Vq1Z9DzXcObYLgjLIHlA9tCrVsNQhy886X754qzz6KZogPIQyOFufM
	 fGwKqVnhPWDd7+dt3t3VyHSuXjPXk0G2fyROFV4dgNlNjRmSLxeUReHAOrYF9zWZ0T
	 DbkDx4mCDmCCXHFaIXiDXOXGVu8yaRgEOOEUT5mW0MDS5hbbhQRA7W1cY8674oR0zl
	 VTpL/+73warn2Svdh10gyq2gMHAIcGcpi1r0ep8wCRtPOVWcYlcDsJN9aAmkFvZwY8
	 OSl5n1LiErqKA==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 959D617E03E5;
	Wed, 25 Feb 2026 23:26:37 +0100 (CET)
Message-ID: <72a72c50-4816-47d4-b533-be4b7feee027@collabora.com>
Date: Thu, 26 Feb 2026 00:26:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
 <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
 <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
 <d5a244f3-5f1b-4bcb-8042-646320a47b6c@collabora.com>
 <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <85793250-425d-40da-b382-ada9fc7b50e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-53424-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4371E19E424
X-Rspamd-Action: no action

On 2/25/26 4:11 PM, Krzysztof Kozlowski wrote:
> On 25/02/2026 14:36, Cristian Ciocaltea wrote:
>> On 2/25/26 2:26 PM, Krzysztof Kozlowski wrote:
>>> On 25/02/2026 13:19, Cristian Ciocaltea wrote:
>>>> With the introduction of the RK3588 SoC, and RK3576 afterwards, the
>>>> 'link' and 'cache' register blocks have been provided for the video
>>>> decoder unit in addition to the existing 'function' one, which now shows
>>>> up in between them (from address-based ordering point of view).
>>>>
>>>> However, the binding does not properly describe this hardware layout, as
>>>> the new blocks are listed after the old one.  Therefore it breaks the
>>>> convention expecting the unit address to indicate the first register
>>>> range.
>>>>
>>>> Since the binding changes have been already released and a fix would
>>>> bring up an ABI break, mark the current 'reg-names' listing as
>>>> deprecated and introduce an alternative 'link,function,cache' one.
>>>>
>>>> Additionally, drop the 'reg' description items as the order is not fixed
>>>> anymore, while the information they offer is not very relevant anyway.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
>>>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>>> index 809fda45b3bd..3f6072e8baa5 100644
>>>> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>>>> @@ -28,16 +28,21 @@ properties:
>>>>  
>>>>    reg:
>>>>      minItems: 1
>>>> -    items:
>>>> -      - description: The function configuration registers base
>>>> -      - description: The link table configuration registers base
>>>> -      - description: The cache configuration registers base
>>>> +    maxItems: 3
>>>>  
>>>>    reg-names:
>>>> -    items:
>>>> +    oneOf:
>>>>        - const: function
>>>
>>> This is confusing, I think I missed that in previous patch because it
>>> did not leave that part or I misread the diff hunk - why do you allow
>>> one entry?
>>
>> That's for the older SoCs, e.g. RK3288, RK3399, as the 'link' and 'cache' blocks
>> are only available for RK3576 & RK3588.
> 
> Yeah, I see in the bottom of the binding
> 
>>
>>>
>>> If the first entry is function, then all others MUST built on top, thus
>>> this:
>>>
>>>> +          - const: link
>>>> +          - const: function
>>>> +          - const: cache
>>>
>>> is not correct.
>>>
>>> No, you don't change the orders. So again, if you have such binding,
>>> then you just fix the unit address leaving the binding as is.
>>
>> Changing the unit address would mean it will point inside the register range,
>> rather than at the beginning of it.
> 
> First, not true. If this was one register range, you would have one
> entry. You cannot split entries. Split entries means you have two
> SEPARATE register ranges.
> Second, it does not matter because main rule stays - the unit address
> describes the main address space. The main address space in other device
> was called "function", so I assume the main address space is also here
> the "function". Which makes sense, because link feels secondary to
> functioning of the device.
> 
>>
>> Sorry, but I don't quite get why would this be a better approach than just
>> properly list the items according to the HW layout, i.e. following the
>> address-based ordering?
> 
> We always expect the list to grow, to have common set. That's rule given
> during reviews multiple times. For multiple reasons, also explained
> (consistency, maintenance and actually proper description of hardware
> like the main reg address space).
> 
> Probably this was also given to that binding during discussions when it
> was upstream, so your change reverts previous discussion and to that I
> do not agree.

Thank you for detailing this, I get your point now.

After digging a bit further, it looks like the "function" naming has been
introduced as part of the RK3588 support via commit c6ffb7e1fb90 ("media:
dt-bindings: rockchip: Document RK3588 Video Decoder bindings").

Morever, it also sets `reg-names: false` for all the SoCs other than RK3588 -
sorry for missing this initially.

Hence "function" wasn't used at all in the context of the older SoCs, while on
RK3588 & RK3576 there is no indication that "function" should be treated as the
main address space or anything like that.  E.g. RK3588 TRM clearly shows the
"link" range at the top of the listing, starting at video decoder unit base
address:

--------------------------------------------------------------------------------
Config Register                         |   Base addr
--------------------------------------------------------------------------------
VDPU381 core0/1 link table config base  |   VDPU381_core0/1_base+0x000
VDPU381 core0/1 function config base    |   VDPU381_core0/1_base+0x100
--------------------------------------------------------------------------------
                                        |   VDPU381_core0/1_base+0x600 for Y channel
VDPU381 core0/1 cache config base       |   VDPU381_core0/1_base+0x640 for C channel
                                        |   VDPU381_core0/1_base+0x680 for head channel
--------------------------------------------------------------------------------

Assuming the reasoning above is now good enough to move further with the
proposed approach, I can prepare a new revision dropping the unnecessary
one-entry item from the reg-names, while keeping all the rest in the series as
is.

Regards,
Cristian


