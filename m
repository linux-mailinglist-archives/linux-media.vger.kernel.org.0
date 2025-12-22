Return-Path: <linux-media+bounces-49342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5705CD5CF6
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 12:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 349243022A9C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 11:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18F2318120;
	Mon, 22 Dec 2025 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dorGyaAK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F7831353E;
	Mon, 22 Dec 2025 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766403004; cv=none; b=P5bGxdgm6C9pw3csNYQoVjSNyIpnYQMrxABoyp4FGc/7fyJ/4K1BvY+23gkmZZ9nbWDDAIgnnFVzI/FKwQYctk/q7oh+FgmfjC37qAKwOg53OXlool4kb4GjhhAK6MASMs6j+z938qI1eR1zZ78Qg/egcYfsHgQYPbNcKDlGkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766403004; c=relaxed/simple;
	bh=dFIGGEqfmsWzdarRQMv07dt5eUZ/Gq5nkb9FVZUG7xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7pFEQunShSbN6BPcYN85wFvv5WSv7IbVhiuwM3yqNfKkN7gUx+9iBSPCG3HmBCt17bCw7Y+laCp1uZ/dxwYP7CziJACgeXM2E+QJTYJy7HAVuL3JkFM63bR5/zgo9XqVLhNVSnNb5mUKQB8J7wRWYYN7wXRQ+LLMnv31s/nH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dorGyaAK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6927EC77;
	Mon, 22 Dec 2025 12:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766402990;
	bh=dFIGGEqfmsWzdarRQMv07dt5eUZ/Gq5nkb9FVZUG7xg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dorGyaAKE93O04w4g/JA/uWHu+DO5wZbjNehfIBrdH7Kaw3Qt5pecD6n6WR0pAY/v
	 bH/+3ZNhJX1+Abdhf7yqlKjtHR1pTZzud2Tguh8aQXAtlSkrTONHTq4e5NHaZr77A7
	 hKDHu2ZEEwg42m1VZzF9/0PRBNyku2K+Ex/emL0o=
Message-ID: <07cef607-365f-4c09-a57e-5ddbdfde7027@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:29:56 +0200
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
In-Reply-To: <20251219122955.2078270-4-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19/12/2025 14:29, Yemike Abhilash Chandra wrote:
> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
> compatible with DS90UB960-Q1. The main difference is that it supports
> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
> port. Therefore, add support for DS90UB954 within the existing bindings.
> 
> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Changelog:
> Changes in v3:
> - Remove the example added for DS90UB954, as it is just a subset of the DS90UB960 example. (Rob)
> 
>  .../bindings/media/i2c/ti,ds90ub960.yaml      | 113 ++++++++++++------
>  1 file changed, 77 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> index cc61604eca37..8e2b82d6dc81 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
> @@ -13,12 +13,10 @@ description:
>    The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
>    forwarding.
>  
> -allOf:
> -  - $ref: /schemas/i2c/i2c-atr.yaml#
> -
>  properties:
>    compatible:
>      enum:
> +      - ti,ds90ub954-q1
>        - ti,ds90ub960-q1
>        - ti,ds90ub9702-q1
>  
> @@ -129,39 +127,6 @@ properties:
>        Ports represent FPD-Link inputs to the deserializer and CSI TX outputs
>        from the deserializer. The number of ports is model-dependent.
>  
> -    properties:
> -      port@0:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 0
> -
> -      port@1:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 1
> -
> -      port@2:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 2
> -
> -      port@3:
> -        $ref: '#/$defs/FPDLink-input-port'
> -        description: FPD-Link input 3
> -
> -      port@4:
> -        $ref: '#/$defs/CSI2-output-port'
> -        description: CSI-2 Output 0
> -
> -      port@5:
> -        $ref: '#/$defs/CSI2-output-port'
> -        description: CSI-2 Output 1
> -
> -    required:
> -      - port@0
> -      - port@1
> -      - port@2
> -      - port@3
> -      - port@4
> -      - port@5
> -
>  required:
>    - compatible
>    - reg
> @@ -204,6 +169,82 @@ $defs:
>            - data-lanes
>            - link-frequencies
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,ds90ub960-q1
> +              - ti,ds90ub9702-q1
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 0
> +
> +            port@1:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 1
> +
> +            port@2:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 2
> +
> +            port@3:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 3
> +
> +            port@4:
> +              $ref: '#/$defs/CSI2-output-port'
> +              description: CSI-2 Output 0
> +
> +            port@5:
> +              $ref: '#/$defs/CSI2-output-port'
> +              description: CSI-2 Output 1
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +            - port@3
> +            - port@4
> +            - port@5
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,ds90ub954-q1
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 0
> +
> +            port@1:
> +              $ref: '#/$defs/FPDLink-input-port'
> +              description: FPD-Link input 1
> +
> +            port@2:
> +              $ref: '#/$defs/CSI2-output-port'
> +              description: CSI-2 Output 0
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +
> +        links:
> +          properties:
> +            link@2: false
> +            link@3: false
I can't help but think if this is good or not. In other words, if we
specifically add ports per compatible, why wouldn't we also add
specifically links per compatible? Or, if we just disable links as
above, why don't we do it the same way for ports?

 Tomi


