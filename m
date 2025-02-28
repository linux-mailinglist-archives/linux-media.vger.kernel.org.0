Return-Path: <linux-media+bounces-27198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 213DCA4932D
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474A03B4D5E
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564B5242928;
	Fri, 28 Feb 2025 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JcYTfhE6"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89168241C8C;
	Fri, 28 Feb 2025 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730680; cv=none; b=MCM8YH9gEdC97LPBBrkYQRW5oUkrJbpnQPlwhIPsY72Pc5JiOXbNwbdCx7qy9HWsB4/gjnI254Hz/T6jHRo0CDo5efRT3QeTzvsOgmm3mGeubb1J9sRykA1jdKWEMRKgpAYCh0BRybiRRtwalxmdysjIr7YYSze/h3hpBtUFU6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730680; c=relaxed/simple;
	bh=d1+/Gr624dcwgvhxrb15dfxs168a9hSODpY6CPieY3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aDSVHCqTr/584mOP7aopTEu95JpCwQaq76zYUhEmb8z5IHoILnypccvfLUa8t3wl7bH8XT/0GEDJ8nfqYOgGWEsGBQHuYHHdasZ8DRBU1zUmX8Phm2gC+NJ0BAmwyMW6Fqt93Ec5h7KG9adoPEjnMAlpKOPqSF0BlWSl+qXRN1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JcYTfhE6; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51S8HdtC2600433
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Feb 2025 02:17:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740730659;
	bh=WdZHP572Rh9pNFP6JZgEg9+TLw9B8b1SKcBPxjkgHgE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JcYTfhE6kMM887ZQWGlfXBrFTnLkcSNoDcH6XoxJuS00kQFnuQqEj03QamM8cnYNy
	 PzFHtQAsxw75tap8t8GwRpHK+lkHwTVftAo2BgO2iS/Rcnlc5LIHZJ89nMHWHxbC8r
	 8Ett4PUhJTjrT/f23ji5/cVQT7wy9drONJV8LZ+E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51S8HdNc002235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Feb 2025 02:17:39 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 02:17:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 02:17:38 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51S8HYV9126373;
	Fri, 28 Feb 2025 02:17:34 -0600
Message-ID: <a79884b1-660a-4e17-9a10-f22652e4683b@ti.com>
Date: Fri, 28 Feb 2025 13:47:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHY0IDEvMl0gZHQtYmluZGluZ3M6IG1l?=
 =?UTF-8?Q?dia=3A_cdns=2Ccsi2rx=2Eyaml=3A_Add_optional_interrupts_for_cdns-c?=
 =?UTF-8?Q?si2rx?=
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
        Jai Luthra
	<jai.luthra@linux.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "mchehab@kernel.org"
	<mchehab@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "devarsht@ti.com" <devarsht@ti.com>,
        "vaishnav.a@ti.com" <vaishnav.a@ti.com>,
        "r-donadkar@ti.com"
	<r-donadkar@ti.com>,
        "u-kumar1@ti.com" <u-kumar1@ti.com>
References: <20250227082920.744908-1-y-abhilashchandra@ti.com>
 <20250227082920.744908-2-y-abhilashchandra@ti.com>
 <20250228-sandy-nightingale-of-improvement-6eef5a@krzk-bin>
 <24y6ggufmhmjkfxymhhxslthpbrsthfp67hkvq36dmnewpnv5c@dbs3hhhpme4w>
 <ZQ0PR01MB1302A225A08A120789EC318DF2CCA@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <ZQ0PR01MB1302A225A08A120789EC318DF2CCA@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Krzysztof, Jai and Changhuang

Thank you for the quick confirmation.

On 28/02/25 13:43, Changhuang Liang wrote:
> Hi, Jai
> 
>> Hi Krzysztof,
>>
>> On Fri, Feb 28, 2025 at 08:34:22AM +0100, Krzysztof Kozlowski wrote:
>>> On Thu, Feb 27, 2025 at 01:59:19PM +0530, Yemike Abhilash Chandra
>> wrote:
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> index 2008a47c0580..054ed4b94312 100644
>>>> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
>>>> @@ -24,6 +24,16 @@ properties:
>>>>     reg:
>>>>       maxItems: 1
>>>>
>>>> +  interrupts:
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>> +
>>>> +  interrupt-names:
>>>> +    minItems: 1
>>>> +    items:
>>>> +      - const: error_irq
>>>> +      - const: irq
>>>
>>> And how is this second interrupt in existing integrations?
>>>
>>
>> TI SoCs integrate both of these if I understood the TRM correctly.
> 
> StarFive JH7110 SoC also integrates both of these too.

If that is the case, I will send the next version with both the
interrupts set as non-optional.

Thanks and Regards
Yemike Abhilash Chandra

> 
> Best Regards,
> Changhuang

