Return-Path: <linux-media+bounces-53338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMMLKqz7nmm+YAQAu9opvQ
	(envelope-from <linux-media+bounces-53338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:39:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23734198384
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24C1A3077502
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B8D3B95FA;
	Wed, 25 Feb 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bTjVLuxd"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E022C237C;
	Wed, 25 Feb 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026585; cv=none; b=HGhEFhJNZ/vllIH5Sinnw/iZ3BgSS4DdR5l2NDpzEoB8saOCEg9oH6mNVbK1pRNxxrqhO2OPcZ4nxmUxXk4QqJVcNjRFY6T1CFdMC4MXbbK7A/41HDocn2Nvk1xU0GL7BTnWQ4S65hkMjY9/ZV6Y/pHoto7MoM9ed5znC96sLnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026585; c=relaxed/simple;
	bh=LL4ZOGnPWc2hAcsIaVPBMhFQys9LOPURRwJVpf6n/Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ks2nh8sOvtgTdEwtchcDX0RicSLDFwZG97QLG5T6erGAgG0S/cJZ2zF8CnA9/3ZK6Iy2wQucYSNCz/CPlsDS30XPC2W8uzzg8yk/zHs+EzFNPKOr4KIGssYEAbzYtl9FS0BsAwclYFbz0Ey5404LfMKveXDLxQHZbbcSK0ajedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bTjVLuxd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772026582;
	bh=LL4ZOGnPWc2hAcsIaVPBMhFQys9LOPURRwJVpf6n/Pw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bTjVLuxdNmDer6Vg9iTxCZJWTufcRZQ8LRxQLpwsdB1mkyUFmAI4hDziIxw47c+gH
	 5UAwNQGgLYQRO7LEN2k7hVlqb3CPW1ShoRu8fEncJgvo35pS6A9QF8T7OiknOQDE+F
	 1ZGm+nN9hQTmDkA/hk1pGZXVPKmytdO1+CDf8FSbarbiFIkVhdvom2JF2w74DKSYT7
	 OiA5oDv2MsEMrDirg9E0UIol8lR9QCtyP64W18O7q2UlPdUzNNGHkSynwrvWDhaQVP
	 K1KQp+cr/Q4ZZGoAZNp05LdzVvwGyVDm6EO5YMzEWdrQS6ah7lRN6g4EtRlX8d43go
	 S3FvhtbwaX48w==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C73717E03E6;
	Wed, 25 Feb 2026 14:36:21 +0100 (CET)
Message-ID: <d5a244f3-5f1b-4bcb-8042-646320a47b6c@collabora.com>
Date: Wed, 25 Feb 2026 15:36:20 +0200
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
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <9bb74438-e759-46a7-9fa1-2c6b1fced76b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53338-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23734198384
X-Rspamd-Action: no action

On 2/25/26 2:26 PM, Krzysztof Kozlowski wrote:
> On 25/02/2026 13:19, Cristian Ciocaltea wrote:
>> With the introduction of the RK3588 SoC, and RK3576 afterwards, the
>> 'link' and 'cache' register blocks have been provided for the video
>> decoder unit in addition to the existing 'function' one, which now shows
>> up in between them (from address-based ordering point of view).
>>
>> However, the binding does not properly describe this hardware layout, as
>> the new blocks are listed after the old one.  Therefore it breaks the
>> convention expecting the unit address to indicate the first register
>> range.
>>
>> Since the binding changes have been already released and a fix would
>> bring up an ABI break, mark the current 'reg-names' listing as
>> deprecated and introduce an alternative 'link,function,cache' one.
>>
>> Additionally, drop the 'reg' description items as the order is not fixed
>> anymore, while the information they offer is not very relevant anyway.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>> index 809fda45b3bd..3f6072e8baa5 100644
>> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>> @@ -28,16 +28,21 @@ properties:
>>  
>>    reg:
>>      minItems: 1
>> -    items:
>> -      - description: The function configuration registers base
>> -      - description: The link table configuration registers base
>> -      - description: The cache configuration registers base
>> +    maxItems: 3
>>  
>>    reg-names:
>> -    items:
>> +    oneOf:
>>        - const: function
> 
> This is confusing, I think I missed that in previous patch because it
> did not leave that part or I misread the diff hunk - why do you allow
> one entry?

That's for the older SoCs, e.g. RK3288, RK3399, as the 'link' and 'cache' blocks
are only available for RK3576 & RK3588.

> 
> If the first entry is function, then all others MUST built on top, thus
> this:
> 
>> +          - const: link
>> +          - const: function
>> +          - const: cache
> 
> is not correct.
> 
> No, you don't change the orders. So again, if you have such binding,
> then you just fix the unit address leaving the binding as is.

Changing the unit address would mean it will point inside the register range,
rather than at the beginning of it.

Sorry, but I don't quite get why would this be a better approach than just
properly list the items according to the HW layout, i.e. following the
address-based ordering?

Thanks,
Cristian

