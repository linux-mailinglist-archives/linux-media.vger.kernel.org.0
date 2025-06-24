Return-Path: <linux-media+bounces-35802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACFAE6B86
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 17:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63A827B6D61
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 15:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15AB307482;
	Tue, 24 Jun 2025 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xts1lFyE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558AE307481;
	Tue, 24 Jun 2025 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779691; cv=none; b=qGvpqL2cEtmrThEDGR34TKTyxIF1jijeQZ2JjVGdec7gyxeBc2JKlJOqNx5LK6BY/BVfmsZMcWNTS0ueScwjJmcczM/XakXep5PzQfATWW1DvPVRh6QCnT/OVQpLrn5UAjJ4GMYJDLjPe0r8N2O9UsNwDwNRj2EY5kQSb+ON//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779691; c=relaxed/simple;
	bh=keGri/uI/2tsjgDYI4UKZWr7Dxp+y7p18oSwIMMwSYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kj6flIGaBrBOxMwlEdiRJ4uyFyz1iQfd2hTv5YOIWrtLEcUV7S5FqfGtso5Mh40wTw5YAkMeBB4oZPRa4KEPRAJnIBS66nWC6Hpbj69iMq7s3YwOSprt0NhkGB4G82LG2Oa3U2szrY1mC/l24gs7CXgEm4JTyXMQrfmL/uNr9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xts1lFyE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2DFC4CEE3;
	Tue, 24 Jun 2025 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750779691;
	bh=keGri/uI/2tsjgDYI4UKZWr7Dxp+y7p18oSwIMMwSYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xts1lFyEPrS3v/vgymmNjc9s1BM9p3Q3TdAjk9CKJ9acASgR8El8xqOerV1oUNqJf
	 WCTXU/OUhJjPK02nZtF0WYkDulEqKGIZpK1Sql9wZv6gXAkS99VbI3AVM0oN1eV+Tl
	 JxiGYm2OgaHDsUNhZZWpj4dW+CV0LS8SxfRdr5654cPK+nPGnqL1up+LkMlBXWLS5S
	 bWs5C/CtiNhraQcXXfCCh9mFPoQEE3Ih3K3IlsAK0x/r/PtL6wIvoEK3EiKBsJyR8u
	 mRsK3MT8Nl261NjfLkjjO+rpvYBqMEsfutgyuirLhGNV3RJr5nY9fTW25UG04x+qe6
	 Kv7gquYL01mJw==
Message-ID: <83755309-230f-4a5d-a658-f5f0d8714e9a@kernel.org>
Date: Tue, 24 Jun 2025 17:41:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for the RZ/V2H
 IVC block
To: Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <20250624-ivc-v2-1-e4ecdddb0a96@ideasonboard.com>
 <cfc25ba6-753e-41bd-8cb6-f31ba57593a8@kernel.org>
 <c2ab887c-398d-49c4-9ae6-1d0986c32781@ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <c2ab887c-398d-49c4-9ae6-1d0986c32781@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/06/2025 16:17, Dan Scally wrote:
> 
> OK...to throw a spanner into this, I think there's actually two soc codes with the IP; r9a09g057h44 
> and r9a09g057h48. renesas,rzg2l-cru.yaml and renesas,rzg2l-csi2.yaml seem to use the 'generic' code 
> in a way that suggests this:
> 
> compatible:
>          items:
>              - enum:
>                  - renesas,r9a09g057h44-ivc
>                  - renesas,r9a09g057h48-ivc
>              - const: renesas,rzv2h-ivc

There were several reviews where we or at lest me disagreed with above
and explained, with arguments, that this is less welcomed choice.

> 
> 
> And then the filename stays as it is, but the example-schema.yaml to me suggests this, without the 
> 'generic' code there at all:
> 
> 
> compatible:
>          items:
>              - enum:
>                  - renesas,r9a09g057h48-ivc
>              - const: renesas,r9a09g057h44-ivc
> 
> 
> Is the latter one right?

This is the preferred style, yes.


> 
> 
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Input Video Control block register access clock
>>> +      - description: Video input data AXI bus clock
>>> +      - description: ISP system clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: pclk
>>> +      - const: vin_aclk
>> aclk
>>
>> vin is redundant. This cannot be anything else than vin.
> Fair enough; there's also a clock that the documentation calls "reg_aclk" that goes to the ISP core 
> and I've been calling that one just "aclk" so the "vin_" was to distinguish them...but maybe I 

but there is no other aclk here.

> should just stop trying to follow the documentation's names; how about "reg", "axi" and "isp" for 
> both the clock and reset names?

pclk, aclk and sclk are also acceptable names if this is how they are
called in datasheet, but reg, axi and isp seems better reflect the
purpose of these clocks from this device point of view.

Best regards,
Krzysztof

