Return-Path: <linux-media+bounces-53050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBvjBie/lWkfUgIAu9opvQ
	(envelope-from <linux-media+bounces-53050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 14:31:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A393C156AD2
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 14:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7107530154A6
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 13:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B682FD7BE;
	Wed, 18 Feb 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQXgmrs1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121031A548;
	Wed, 18 Feb 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421402; cv=none; b=nCCSeLU3vWCc4QYb6Uad64uQNIY5sGnRdv7HRdIYUjyBDLY6soPJkRm5c+wtniDTnsUx90NYNdkSXDDr4qLtdkQV7T/oPn7gkLo/UvZLfE8E8HQPsD+l8H+XPZ93aGxoJ7oWnD9YUbwKNllwTMFRV5fkmaNIDJHpDqVLmHAreuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421402; c=relaxed/simple;
	bh=gN2cljJea4XLY82kVunjPVPH2WX7LYqJDp0lJ1rpnJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6miHnjLTFrjgd4p42d+jbnhvmBbKvvSW5iHq2LyuavhfHOXLhX1bKCZAkMFy2UVmuB3pGFBnuVqPrcVthPliTx9GZ4z9JO83H55myrJ9uRyE8yBh60Pc4m478LWWE2ZKAbuqBIc/aoris6JCRE5bL9LqR6uWv7cdqibVWQm174=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQXgmrs1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D00EC19424;
	Wed, 18 Feb 2026 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771421401;
	bh=gN2cljJea4XLY82kVunjPVPH2WX7LYqJDp0lJ1rpnJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hQXgmrs1Qlib2Iq+e1k/vkhWvMgVnJzznWpXjKLKlL/k+U6Tv2xdc10MIVg/SeCDM
	 A66aqE5wdPpuA5lTlGH60KZ0ZkszhElLCWKFSjtPvfAQkVmYcuhim3wEn+6JjbOJ3S
	 CgqItgBO+/0Zz/5xyOfURJ6rhOX58rpT2RyVXY3PV2l6/m1wkzMcN1gHGt8Wq2oyAk
	 LggaivlXv0p5S8ianw7fhxrVvurLmiSsCQt0MqR7ibOzj5kmVXiosLSTUrFIiv1ULe
	 1h69+BXZAAztSjkxDEOWwl00dfgmEHtRvKxwHhRS6tpZNfNtp4CcSEavVs/fKwledH
	 OtF7zRlwkP7mQ==
Message-ID: <b7adddfc-db7a-466d-a2e8-72bc6a87ae81@kernel.org>
Date: Wed, 18 Feb 2026 14:29:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-linflexuart: add clock
 input properties
To: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com, cosmin.stoica@nxp.com,
 adrian.nitu@freescale.com, stefan-gabriel.mirea@nxp.com,
 Mihaela.Martinas@freescale.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, jkangas@redhat.com,
 Radu Pirea <radu-nicolae.pirea@nxp.com>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
 <20260216150205.212318-9-larisa.grigore@oss.nxp.com>
 <24443e02-886e-48e2-911e-e4093d251155@kernel.org>
 <e9c214be-840a-43fe-b24d-610fe90269b2@oss.nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e9c214be-840a-43fe-b24d-610fe90269b2@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53050-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,401c8000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A393C156AD2
X-Rspamd-Action: no action

On 18/02/2026 14:26, Larisa Ileana Grigore wrote:
> On 2/16/2026 5:10 PM, Krzysztof Kozlowski wrote:
>> On 16/02/2026 16:02, Larisa Grigore wrote:
>>> From: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>>
>>> Add optional support for the two clock inputs used by the LINFlexD UART
>>> controller:
>>> - "lin": LIN_BAUD_CLK
>>> - "ipg": LINFLEXD_CLK
>>>
>>> The clock inputs are kept optional to maintain compatibility with the
>>> S32V234 platform.
>>
>> Does S32V234 have the clocks? I don't understand the "maintain
>> compatibility" in this context. Either you have or you have not clocks,
>> which should be expressed in schema (: false, see example schema).
>>
> Hello Krzysztof,
> 
> Thanks for pointing this out! I will update both the schema and the 
> commit description.
> S32V234 does not expose these clocks in its device tree—on this platform 
> the LINFlexD clocks are set up and enabled by U‑Boot, so they are not 
> available to the kernel.

So there are clocks. DTS is being used by bootloader, so how bootloader
is going to set up clocks for S32V234 if no one provides them?

This looks like buggy/incomplete approach, although I understand that
the original binding had the issue.


> The changes in this patch are intended specifically for S32G2/G3, where 
> the clocks are provided in the DT and required by the driver.
> 
>>>
>>> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
>>> Co-developed-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>>> ---
>>>   .../bindings/serial/fsl,s32-linflexuart.yaml   | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>>> index 4171f524a928..885f0b1b3492 100644
>>> --- a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
>>> @@ -34,6 +34,14 @@ properties:
>>>     interrupts:
>>>       maxItems: 1
>>>   
>>> +  clocks:
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: lin
>>> +      - const: ipg
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>> @@ -48,3 +56,13 @@ examples:
>>>           reg = <0x40053000 0x1000>;
>>>           interrupts = <0 59 4>;
>>>       };
>>> +
>>> +  - |
>>> +    serial@401c8000 {
>>> +        compatible = "nxp,s32g2-linflexuart",
>>> +                     "fsl,s32v234-linflexuart";
>>> +        reg = <0x401C8000 0x3000>;
>>> +        interrupts = <0 82 1>;
>>> +        clocks = <&clks 14>, <&clks 13>;
>>> +        clock-names = "lin", "ipg";
>>
>> Just add the clocks to existing example. No need for new example for
>> each new property.
>>
>>> +    };
> 
> The existing node refers to S32V234 which does not expose any clock 
> properties in its device tree. Because of this, I couldn’t extend that 

You just said S32V234 has clocks...

> example with clocks and clock-names. The additional example is there 
> only to illustrate the S32G2 case, where the clocks are required and 
> actually present in the device tree. Should I remove it?
> 
> Best regards,
> Larisa
>>
>> Best regards,
>> Krzysztof
> 


Best regards,
Krzysztof

