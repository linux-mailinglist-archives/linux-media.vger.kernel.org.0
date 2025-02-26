Return-Path: <linux-media+bounces-26993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D9A454FC
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 06:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4BCB189B733
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 05:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CABC25D55A;
	Wed, 26 Feb 2025 05:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vOOSVL9y"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734887DA73;
	Wed, 26 Feb 2025 05:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740548820; cv=none; b=PVC4TmKZBbfyBp/DiVI8l1EkHiKb/pQPtnLcOdZa5+Fzr6IKT7G9pQ8LKbgTnME4zjiLZROi1V/Xro1A2jfJtzafuJtk8Tlvxzoj8gYnbZ/ziGm47iGhyQmFnJlsK4TjBiKfFRRHTC7m8DHeVoUqlkKliVqtVEEJZxB2WCQPX6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740548820; c=relaxed/simple;
	bh=AZ7O3bxN7sqRLstDWEOPNtsSOprnvKayaUyZiiYaJxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gjUhtX29ZkzOmioOg78Rn3SHtQwfzarSqkSkteu/XXZuAmOXb4qRqHrXX1U94dBNE0OiYIFXWAbweWqzrQqxsUNPS5r9p3Oc/og8er8UUP42parnqW3hxXbgY7eBK0DqOQeaqzvrROt09imd1hIe/OsAy9FmOK0BO5IwPE1NMlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vOOSVL9y; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51Q5kn3Y1374760
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 23:46:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740548809;
	bh=xbRkT+xuVxDxRQSUMfHlXdaittfUN3ZCxDXCGk6mGlg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vOOSVL9yFwKaiD5JqCFiuo0wfjjgpTruAeFOhJTGvQWfyREBZpXpw2IPeDUnGUws2
	 ZCrnen/O7K4mtKFku2xwvCClU36mY3VQUeu+mMxn6+LcTrDZ197r9jqBtoBjhrKSuh
	 wSpI4BbDLLI+vo8WCz+v//uxs8yys2YmOzAucJIE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51Q5knYN102364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Feb 2025 23:46:49 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 23:46:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 23:46:49 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51Q5kjOW030893;
	Tue, 25 Feb 2025 23:46:46 -0600
Message-ID: <ec20238c-1cd1-493b-8df5-5be055576f14@ti.com>
Date: Wed, 26 Feb 2025 11:16:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add optional
 interrupts for cdns-csi2rx
To: Jai Luthra <jai.luthra@linux.dev>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <mripard@kernel.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>
References: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
 <20250221120337.3920874-2-y-abhilashchandra@ti.com>
 <3fzkpcdjsthw5lbajxp6zyiyejo45rcgt3gwjfu2bub3v3acpa@kow5blexev5u>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <3fzkpcdjsthw5lbajxp6zyiyejo45rcgt3gwjfu2bub3v3acpa@kow5blexev5u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jai,
Thanks for the detailed review for the patch series.

On 24/02/25 12:50, Jai Luthra wrote:
> Hi Abhilash,
> 
> Thanks for the patch.
> 
> On Fri, Feb 21, 2025 at 05:33:36PM +0530, Yemike Abhilash Chandra wrote:
>> The Cadence CSI2RX IP exposes 2 interrupts [0] 12.7 camera subsystem.
>> Enabling these interrupts will provide additional information about a CSI
>> packet or an individual frame. So, add support for optional interrupts
>> and interrupt-names properties.
>>
>> [0]: http://www.ti.com/lit/pdf/spruil1
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Changes in v3:
>> - Address Krzysztof's review comment to drop minItems from the bindings.
>> - Collect Acked-by from Krzysztof.
>>
>>   Documentation/devicetree/bindings/media/cdns,csi2rx.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>> index 2008a47c0580..e8d7eaf443d1 100644
>> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>> @@ -24,6 +24,14 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: irq
>> +      - const: error_irq
>> +
> 
> If I test these bindings with only one interrupt (error_irq) defined in the
> device tree, I get these errors:
> 
>    DTC [C] arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb
> /home/darkapex/dev/linux2/out_clang/arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: csi-bridge@30101000: interrupts: [[0, 187, 4]] is too short
>          from schema $id: http://devicetree.org/schemas/media/cdns,csi2rx.yaml#
> /home/darkapex/dev/linux2/out_clang/arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: csi-bridge@30101000: interrupt-names:0: 'irq' was expected
>          from schema $id: http://devicetree.org/schemas/media/cdns,csi2rx.yaml#
> /home/darkapex/dev/linux2/out_clang/arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: csi-bridge@30101000: interrupt-names: ['error_irq'] is too short
>          from schema $id: http://devicetree.org/schemas/media/cdns,csi2rx.yaml#
> make[1]: Leaving directory '/home/darkapex/dev/linux2/out_clang'
> 
> There could be cases where only the error interrupt is integrated by the SoC,
> and the second interrupt is unconnected. IMHO it would make sense to keep the
> other interrupt optional:
> 

Initially, I had the flexibilty, but I removed that based on Krzysztof's
feedback, I was also not clear how these interrupts are integrated by
different vendors at that time.

But since this driver is shared among vendors, I think it is better to
have the flexibility. Since this is a change in dt-bindings I would I 
like to have Krzysztof's view on this discussion.

> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> index e8d7eaf443d1..054ed4b94312 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
> @@ -25,12 +25,14 @@ properties:
>       maxItems: 1
> 
>     interrupts:
> +    minItems: 1
>       maxItems: 2
> 
>     interrupt-names:
> +    minItems: 1
>       items:
> -      - const: irq
>         - const: error_irq
> +      - const: irq
> 

Krzysztof, If you agree to the same I will use the above binidngs in
next version of the series

Thanks and Regards,
Yemike Abhilash Chandra.

>     clocks:
>       items:
> 
>>     clocks:
>>       items:
>>         - description: CSI2Rx system clock
>> -- 
>> 2.34.1
>>

