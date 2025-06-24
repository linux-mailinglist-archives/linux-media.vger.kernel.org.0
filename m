Return-Path: <linux-media+bounces-35794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CAAE68A4
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD32F5A7E4A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AFD2DA753;
	Tue, 24 Jun 2025 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rmdx3goE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770262D130A;
	Tue, 24 Jun 2025 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774630; cv=none; b=Zj+VJkJle12sPma4JYcRHBqoQb5CB25uxtznnstvm5PVMOwNfAOVsiI9bOdAPsp4Xd6FZVzZNN9byaXkJHTrESMgxJ/zRCus8LP8YxtxYqhbEiHvZfy52ercoDQfWlzRdSRakCSpGMCJN3fW5fW9U1c5GnbL2R54gPg3/VR1f8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774630; c=relaxed/simple;
	bh=aeBoJ8p54UOKtgfJ5R4VO20RJ4pdixxB9hiwvMp94Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZonyrYYyxwqlRbIQnH0GZCID6sftMdq/nXxvpy9OXvF6U5HKCLUC/lLzr8JKK+jLquNoccvLcMPmPe1IkdOnLuA/QLRVC6dgXmYKLehwxTFt6Vx9LgInWWfEhoZhh0on2wGlOb+bv0979hX9nqfszzIec2tEI29SNfVO0OB/daM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rmdx3goE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CB30EFF;
	Tue, 24 Jun 2025 16:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750774609;
	bh=aeBoJ8p54UOKtgfJ5R4VO20RJ4pdixxB9hiwvMp94Es=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rmdx3goEzUrmIuksFeSxSH7oaLKU4oxoEj4hhWBD3DitmBnOMFj8TdvFA2uBnIVwN
	 05n4Dc8qKUygB1YWABULCpxAVbM9aQaQNQjzcqT1CZYFPlCis5AMm1VZppJKJnpC+M
	 1TqhAQvxoT5PW16F+qD9GGCN4shpC3CqzTuAWboQ=
Message-ID: <c2ab887c-398d-49c4-9ae6-1d0986c32781@ideasonboard.com>
Date: Tue, 24 Jun 2025 15:17:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for the RZ/V2H
 IVC block
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
 <20250624-ivc-v2-1-e4ecdddb0a96@ideasonboard.com>
 <cfc25ba6-753e-41bd-8cb6-f31ba57593a8@kernel.org>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <cfc25ba6-753e-41bd-8cb6-f31ba57593a8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof - thanks for comments

On 24/06/2025 14:16, Krzysztof Kozlowski wrote:
> On 24/06/2025 14:35, Daniel Scally wrote:
>> The RZ/V2H SoC has a block called the Input Video Control block which
>> feeds image data into the Image Signal Processor. Add dt bindings to
>> describe the IVC.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v2:
>>
>> 	- compatible matches filename
> This is not what I asked.


Ah, you meant the other way round. Ok.

>
>> 	- Added power-domains
>> 	- Aligned clock and reset entries on opening "<"
>> 	- Removed status = "okay"; from example
>> ---
>>   .../bindings/media/renesas,rzv2h-ivc.yaml          | 103 +++++++++++++++++++++
>>   1 file changed, 103 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ee0849eeeaba840cf43c81d69449c631ad1c6a6a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
>> @@ -0,0 +1,103 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/renesas,rzv2h-ivc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas RZ/V2H Input Video Control Block
>> +
>> +maintainers:
>> +  - Daniel Scally <dan.scally@ideasonboard.com>
>> +
>> +description:
>> +  The IVC block is a module that takes video frames from memory and feeds them
>> +  to the Image Signal Processor for processing.
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,rzv2h-ivc
> No, you cannot use generic compatibles. See writing bindings (or
> basically every review from DT maintainers).


OK...to throw a spanner into this, I think there's actually two soc codes with the IP; r9a09g057h44 
and r9a09g057h48. renesas,rzg2l-cru.yaml and renesas,rzg2l-csi2.yaml seem to use the 'generic' code 
in a way that suggests this:

compatible:
         items:
             - enum:
                 - renesas,r9a09g057h44-ivc
                 - renesas,r9a09g057h48-ivc
             - const: renesas,rzv2h-ivc


And then the filename stays as it is, but the example-schema.yaml to me suggests this, without the 
'generic' code there at all:


compatible:
         items:
             - enum:
                 - renesas,r9a09g057h48-ivc
             - const: renesas,r9a09g057h44-ivc


Is the latter one right?


>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Input Video Control block register access clock
>> +      - description: Video input data AXI bus clock
>> +      - description: ISP system clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pclk
>> +      - const: vin_aclk
> aclk
>
> vin is redundant. This cannot be anything else than vin.
Fair enough; there's also a clock that the documentation calls "reg_aclk" that goes to the ISP core 
and I've been calling that one just "aclk" so the "vin_" was to distinguish them...but maybe I 
should just stop trying to follow the documentation's names; how about "reg", "axi" and "isp" for 
both the clock and reset names?

>
>> +      - const: sclk
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: Input Video Control block register access reset
>> +      - description: Video input data AXI bus reset
>> +      - description: ISP core reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: presetn
>> +      - const: vin_aresetn
>> +      - const: sresetn
>
> s/reset// because it is redundant... which would point to pretty
> pointless names. Look at your description - one is core or registers,
> second is vin and other is isp-core... although then I wonder why ISP
> input resets ISP core?


The two IP blocks share the ISP system clock / ISP core reset and also Video input data AXI bus 
clock / reset.


Thanks

Dan

>
>
>
> Best regards,
> Krzysztof

