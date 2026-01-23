Return-Path: <linux-media+bounces-51414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAnnH0VGc2mfuQAAu9opvQ
	(envelope-from <linux-media+bounces-51414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:58:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A673C98
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D206E301683B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B1A37D111;
	Fri, 23 Jan 2026 09:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="diT94X/q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920137FF64;
	Fri, 23 Jan 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162102; cv=none; b=YL8gGc3w5ZZDUNioUNb1HXyr2SliiVU8xBQkiRLWYn3W55Wgwl7DzfXp4ycuXXzMArw5zmmuwbVTZF6LeE3Flm5sWI1nN9GXLPfiEu/NR/UUBGX4nLPDcOMxiYmPVjwNNbGk5YEeYgBxV1Q47zlTqxdjjv366bYMnd65rAUrExM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162102; c=relaxed/simple;
	bh=AcOU0N8VVIHmmK2CtlSmrb9OytwjwVuYorL9HSQPtAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0B22XD6QzTjsdEwPVT8UVfi0xV7TkjyW/dD9k6UlixgrXI9Plm1SueQb1PJpNUUFmBPgTfup+IMx/+lhLSW75zZhkcXmb7IWHrCbF4InK1XkYdPXfjbEPrjmofPmjIy8Znq43P47HlzEYuECV7N4toXMnLmWFlSx3UEHBZNscI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=diT94X/q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E40698FA;
	Fri, 23 Jan 2026 10:54:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769162055;
	bh=AcOU0N8VVIHmmK2CtlSmrb9OytwjwVuYorL9HSQPtAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=diT94X/qK1IojHFsUk5B7ZSo74iuNqAMpZOTgawgIxhAs3+tuegKEyJqrcaauT/yF
	 V2bNYGgqwGa902/iqdIcjCgp19/Ja+0IjnmeI8AQHs9Xh6D8lONsXlxxP4gOqJ7sAe
	 hkwOs4qa0BDjJTvIIUTJvyGBfG95B6QKjuEAUpEQ=
Message-ID: <64e04392-fc93-4a26-89f2-fc87aa694e91@ideasonboard.com>
Date: Fri, 23 Jan 2026 11:54:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] media: dt-bindings: ti,ds90ub960: Add support for
 DS90UB954-Q1
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: hansg@kernel.org, mehdi.djait@linux.intel.com, ribalda@chromium.org,
 git@apitzsch.eu, vladimir.zapolskiy@linaro.org,
 benjamin.mugnier@foss.st.com, dongcheng.yan@intel.com, u-kumar1@ti.com,
 jai.luthra@linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
 <20251219122955.2078270-4-y-abhilashchandra@ti.com>
 <07cef607-365f-4c09-a57e-5ddbdfde7027@ideasonboard.com>
 <5b6b7c00-1553-45e3-90b9-ddd0da86263b@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <5b6b7c00-1553-45e3-90b9-ddd0da86263b@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51414-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,chromium.org,apitzsch.eu,linaro.org,foss.st.com,intel.com,ti.com,linux.dev,vger.kernel.org,xs4all.nl,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.5:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid,ti.com:url,ti.com:email,0.0.0.1:email,0.0.0.4:email,0.0.0.2:email]
X-Rspamd-Queue-Id: E24A673C98
X-Rspamd-Action: no action

Hi,

On 06/01/2026 12:06, Yemike Abhilash Chandra wrote:
> Hi Tomi,
> 
> Thank you for the review.
> 
> On 22/12/25 16:59, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 19/12/2025 14:29, Yemike Abhilash Chandra wrote:
>>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>>> compatible with DS90UB960-Q1. The main difference is that it supports
>>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>>> port. Therefore, add support for DS90UB954 within the existing bindings.
>>>
>>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>> ---
>>> Changelog:
>>> Changes in v3:
>>> - Remove the example added for DS90UB954, as it is just a subset of
>>> the DS90UB960 example. (Rob)
>>>
>>>   .../bindings/media/i2c/ti,ds90ub960.yaml      | 113 ++++++++++++------
>>>   1 file changed, 77 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/
>>> ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/
>>> ti,ds90ub960.yaml
>>> index cc61604eca37..8e2b82d6dc81 100644
>>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>>> @@ -13,12 +13,10 @@ description:
>>>     The TI DS90UB9XX devices are FPD-Link video deserializers with
>>> I2C and GPIO
>>>     forwarding.
>>>   -allOf:
>>> -  - $ref: /schemas/i2c/i2c-atr.yaml#
>>> -
>>>   properties:
>>>     compatible:
>>>       enum:
>>> +      - ti,ds90ub954-q1
>>>         - ti,ds90ub960-q1
>>>         - ti,ds90ub9702-q1
>>>   @@ -129,39 +127,6 @@ properties:
>>>         Ports represent FPD-Link inputs to the deserializer and CSI
>>> TX outputs
>>>         from the deserializer. The number of ports is model-dependent.
>>>   -    properties:
>>> -      port@0:
>>> -        $ref: '#/$defs/FPDLink-input-port'
>>> -        description: FPD-Link input 0
>>> -
>>> -      port@1:
>>> -        $ref: '#/$defs/FPDLink-input-port'
>>> -        description: FPD-Link input 1
>>> -
>>> -      port@2:
>>> -        $ref: '#/$defs/FPDLink-input-port'
>>> -        description: FPD-Link input 2
>>> -
>>> -      port@3:
>>> -        $ref: '#/$defs/FPDLink-input-port'
>>> -        description: FPD-Link input 3
>>> -
>>> -      port@4:
>>> -        $ref: '#/$defs/CSI2-output-port'
>>> -        description: CSI-2 Output 0
>>> -
>>> -      port@5:
>>> -        $ref: '#/$defs/CSI2-output-port'
>>> -        description: CSI-2 Output 1
>>> -
>>> -    required:
>>> -      - port@0
>>> -      - port@1
>>> -      - port@2
>>> -      - port@3
>>> -      - port@4
>>> -      - port@5
>>> -
>>>   required:
>>>     - compatible
>>>     - reg
>>> @@ -204,6 +169,82 @@ $defs:
>>>             - data-lanes
>>>             - link-frequencies
>>>   +allOf:
>>> +  - $ref: /schemas/i2c/i2c-atr.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - ti,ds90ub960-q1
>>> +              - ti,ds90ub9702-q1
>>> +    then:
>>> +      properties:
>>> +        ports:
>>> +          properties:
>>> +            port@0:
>>> +              $ref: '#/$defs/FPDLink-input-port'
>>> +              description: FPD-Link input 0
>>> +
>>> +            port@1:
>>> +              $ref: '#/$defs/FPDLink-input-port'
>>> +              description: FPD-Link input 1
>>> +
>>> +            port@2:
>>> +              $ref: '#/$defs/FPDLink-input-port'
>>> +              description: FPD-Link input 2
>>> +
>>> +            port@3:
>>> +              $ref: '#/$defs/FPDLink-input-port'
>>> +              description: FPD-Link input 3
>>> +
>>> +            port@4:
>>> +              $ref: '#/$defs/CSI2-output-port'
>>> +              description: CSI-2 Output 0
>>> +
>>> +            port@5:
>>> +              $ref: '#/$defs/CSI2-output-port'
>>> +              description: CSI-2 Output 1
>>> +
>>> +          required:
>>> +            - port@0
>>> +            - port@1
>>> +            - port@2
>>> +            - port@3
>>> +            - port@4
>>> +            - port@5
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: ti,ds90ub954-q1
>>> +    then:
>>> +      properties:
>>> +        ports:
>>> +          properties:
>>> +            port@0:
>>> +              $ref: '#/$defs/FPDLink-input-port'
>>> +              description: FPD-Link input 0
>>> +
>>> +            port@1:
>>> +              $ref: '#/$defs/FPDLink-input-port'
>>> +              description: FPD-Link input 1
>>> +
>>> +            port@2:
>>> +              $ref: '#/$defs/CSI2-output-port'
>>> +              description: CSI-2 Output 0
>>> +
>>> +          required:
>>> +            - port@0
>>> +            - port@1
>>> +            - port@2
>>> +
>>> +        links:
>>> +          properties:
>>> +            link@2: false
>>> +            link@3: false
>> I can't help but think if this is good or not. In other words, if we
>> specifically add ports per compatible, why wouldn't we also add
>> specifically links per compatible? Or, if we just disable links as
>> above, why don't we do it the same way for ports?
>>
> 
> Quoting writing schemas:
> 
> "When bindings cover multiple similar devices that differ in some
> properties,
> those properties should be constrained for each device. This usually means:
> 
>  * In top level 'properties' define the property with the broadest
> constraints.
>  * In 'if:then:' blocks, further narrow the constraints for those
> properties.
>  * Do not define the properties within an 'if:then:' block (note that
>    'additionalItems' also won't allow that)."
> 
> 
> Since new properties cannot be introduced inside allOf / if:then, it is
> not possible to define
> device-specific patternProperties for links directly under each
> condition like below
> 
> - if:
>     properties:
>       compatible:
>         contains:
>           enum:
>             - ti,ds90ub960-q1
>             - ti,ds90ub9702-q1
>   then:
>     properties:
>       links:
>         patternProperties:
>           '^link@[0-3]$':
> 
> - if:
>     properties:
>       compatible:
>         contains:
>           const: ti,ds90ub954-q1
> 
>   then:
>     properties:
>       links:
>     patternProperties:
>       '^link@[0-1]$':
> 
> Therefore, a broad top-level definition such as:
> 
> patternProperties:
>   '^link@[0-3]$':
> 
> is required, with device-specific constraints applied later via
> conditional logic
> 
> This works for ports since we have a
> 
> patternProperties:
>   '^port@[0-9a-f]+$':
> 
> already defined at /schemas/graph.yaml#/properties/ports which we refer
> in the top level schema
> 
> Note that an alternative could also be modeled by explicitly disallowing
> unused ports for ds90ub954,
> namely port 2, port3 and port 5 but that approach would require changes
> in the driver, as it currently
> assumes that TX ports start immediately after RX ports. Hence I
> preferred having ports 0, 1 and 2 for ds90ub954

I see. Yes, if we would just disable ports for ub954, we'd have ports 0,
1 and 4.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

> The approach that was used in this patch was also hinted at in our
> earlier discussion at
> https://lore.kernel.org/all/58b309d9-de03-4818-8d38-
> a27cc68466db@ideasonboard.com/
> 
> Thanks and Regards,
> Yemike Abhilash Chandra
> 
> 
>>   Tomi
>>
> 


